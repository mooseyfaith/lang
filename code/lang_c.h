#pragma once

#include "lang.h"

struct lang_c_compile_settings
{
    string prefix;
    bool use_default_types;
};

struct lang_c_buffer
{
    lang_c_compile_settings settings;
    FILE *file;
    u32 indent;
    bool previous_was_newline;
};

void print_raw_va(lang_c_buffer *buffer, cstring format, va_list va_arguments)
{
    vfprintf(buffer->file, format, va_arguments);
    buffer->previous_was_newline = false;
}

void print_raw(lang_c_buffer *buffer, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_raw_va(buffer, format, va_arguments);
    
    va_end(va_arguments);
}

void print_va(lang_c_buffer *buffer, cstring format, va_list va_arguments)
{
    if (buffer->previous_was_newline && buffer->indent)
        print_raw(buffer, "%*c", buffer->indent * 4 - 1, ' ');

    vfprintf(buffer->file, format, va_arguments);
    buffer->previous_was_newline = false;
}

void print(lang_c_buffer *buffer, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_va(buffer, format, va_arguments);
    
    va_end(va_arguments);
}

// TODO: make sure newlines are not part of format in regular print
void print_newline(lang_c_buffer *buffer)
{
    print_raw(buffer, "\n");
    buffer->previous_was_newline = true;
}

void print_line(lang_c_buffer *buffer, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_va(buffer, format, va_arguments);
    
    va_end(va_arguments);
    
    print_newline(buffer);
}

void print_scope_open(lang_c_buffer *buffer)
{
    if (!buffer->previous_was_newline)
        print_newline(buffer);
    
    print(buffer, "{");
    buffer->indent++;
    print_newline(buffer);
}

void print_scope_close(lang_c_buffer *buffer, bool with_newline = true)
{
    assert(buffer->indent);
    
    --buffer->indent;
    
    if (!buffer->previous_was_newline)
        print_newline(buffer);
        
    print(buffer, "}");
    
    if (with_newline)
        print_newline(buffer);
}

bool print_next(ast_node **out_node, ast_queue *queue)
{
    if (!queue->count)
        return false;

    auto node = queue->entries[--queue->count].node;
    
    switch (node->node_type)
    {
        case ast_node_type_file:
        {
            local_node_type(file, node);
            
            if (file->first_statement)
                enqueue(queue, file->first_statement);
        } break;
    }
    
    *out_node = node;
    
    return true;
}

void print_type(lang_c_buffer *buffer, ast_type type)
{
    assert(type.name.count);
        
    print(buffer, "%.*s%.*s", fs(buffer->settings.prefix), fs(type.name));
    
    // some space for formating, since the * is considered part of the name, not the type in C
    if (type.indirection_count)
        print(buffer, " ");
        
    for (u32 i = 0; i < type.indirection_count; i++)
        print(buffer, "*");
}

void print_expression(lang_c_buffer *buffer, ast_node *node)
{
    switch (node->node_type)
    {
        cases_complete;
        
        case ast_node_type_number:
        {
            local_node_type(number, node);
            print(buffer, "%llu", number->u64_value);
        } break;
        
        case ast_node_type_string:
        {
            local_node_type(string, node);
            print(buffer, "\"%.*s\"", fs(string->text));
        } break;
        
        case ast_node_type_variable_reference:
        {
            local_node_type(variable_reference, node);
            print(buffer, "%.*s", fs(variable_reference->variable->name));
        } break;
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            print(buffer, "%.*s", fs(name_reference->name));
        } break;
                    
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);
        
            print_expression(buffer, function_call->expression);
            print(buffer, "(");
            
            bool is_not_first = false;
            for (auto argument = function_call->first_argument; argument; argument = argument->next_sibling)
            {
                if (is_not_first)
                    print(buffer, ", ");
                    
                print_expression(buffer, argument);
                is_not_first = true;
            }
            print(buffer, ")");
        } break;
        
        case ast_node_type_field_reference:
        {
            local_node_type(field_reference, node);
            
            print(buffer, "(");
            
            print_expression(buffer, field_reference->expression);
            
            auto type = get_expression_type(field_reference->expression);
            if (type.indirection_count)
                print(buffer, ")->");
            else
                print(buffer, ").");
            
            print(buffer, "%.*s", fs(field_reference->field_name));
        } break;
        
        case ast_node_type_cast:
        {
            local_node_type(cast, node);
            
            print(buffer, "((");
            print_type(buffer, cast->type);
            print(buffer, ") ");
            print_expression(buffer, cast->expression);
            print(buffer, ")");
        } break;
        
        case ast_node_type_take_reference:
        {
            local_node_type(take_reference, node);
            
            print(buffer, "&");
            print_expression(buffer, take_reference->expression);
        } break;
        
        case ast_node_type_not:
        {
            local_node_type(not, node);
            
            print(buffer, "!");
            print_expression(buffer, not->expression);
        } break;
    }
}

void print_declaration(lang_c_buffer *buffer, ast_variable *variable)
{
    print_type(buffer, variable->type);
                
    // add space for formatting, since * is part of the name in C
    if (!variable->type.indirection_count)
        print(buffer, " ");
    
    print(buffer, "%.*s", fs(variable->name)); 
}

void print_statements(lang_c_buffer *buffer, ast_node *first_statement)
{
    ast_queue queue = {};
    enqueue(&queue, first_statement);
    
    ast_node *node;
    while (print_next(&node, &queue))
    {
        switch (node->node_type)
        {
            case ast_node_type_variable:
            {
                local_node_type(variable, node);
                
                print_declaration(buffer, variable);
                print_line(buffer, " = {};");
            } break;
            
            case ast_node_type_assignment:
            {
                local_node_type(assignment, node);
                
                print_expression(buffer, assignment->left);
                print(buffer, " = ");
                print_expression(buffer, assignment->right);
                print_line(buffer, ";");
            } break;
            
            case ast_node_type_branch:
            {
                local_node_type(branch, node);
            
                print_newline(buffer);
                
                print(buffer, "if (");
                print_expression(buffer, branch->condition);
                print(buffer, ")");
                
                print_scope_open(buffer);
                
                if (branch->first_true_statement)
                    print_statements(buffer, branch->first_true_statement);
                    
                print_scope_close(buffer);
                
                if (branch->first_false_statement)
                {
                    print(buffer, "else");
                    print_scope_open(buffer);
                    print_statements(buffer, branch->first_false_statement);
                    print_scope_close(buffer);
                }
                
                print_newline(buffer);
            } break;
            
            case ast_node_type_loop:
            {
                local_node_type(loop, node);
            
                print_newline(buffer);
                print(buffer, "while (");
                print_expression(buffer, loop->condition);
                print(buffer, ")");
                
                print_scope_open(buffer);
                
                if (loop->first_statement)
                    print_statements(buffer, loop->first_statement);
                    
                print_scope_close(buffer);
            } break;
            
             case ast_node_type_branch_switch:
            {
                local_node_type(branch_switch, node);
            
                print_newline(buffer);
                
                print(buffer, "switch (");
                print_expression(buffer, branch_switch->expression);
                print(buffer, ")");
                
                print_scope_open(buffer);
                
                for (auto branch_case = branch_switch->first_case; branch_case; branch_case = (ast_branch_switch_case *) branch_case->node.next_sibling)
                {
                    print(buffer, "case ");
                    print_expression(buffer, branch_case->expression);
                    print(buffer, ":");
                    
                    print_scope_open(buffer);
                    print_statements(buffer, branch_case->first_statement);
                    print_scope_close(buffer, false);
                    print_line(buffer, " break;");
                    print_newline(buffer);
                }
                
                if (branch_switch->first_default_case_statement)
                {
                    print(buffer, "default:");
                    print_scope_open(buffer);
                    print_statements(buffer, branch_switch->first_default_case_statement);
                    print_scope_close(buffer);
                }
                    
                print_scope_close(buffer);
                print_newline(buffer);
            } break;
            
            // skip function
            case ast_node_type_function:
            case ast_node_type_compound_type:
            break;
            
            // try expressions
            default:
            {
                print_expression(buffer, node);
                print_line(buffer, ";");
            } break;
        }
    }
}

string lang_c_base_type_names[] =
{
    s("NULL"),
    s("char *"),
    
    s("unsigned char"),
    s("unsigned short"),
    s("unsigned int"),
    s("unsigned long long"),
    
    s("signed char"),
    s("signed short"),
    s("signed int"),
    s("signed long long"),
    
    s("float"),
    s("double"),
};

enum lang_c_base_type
{
    lang_c_base_type_null,
    lang_c_base_type_cstring,
    
    lang_c_base_type_u8,
    lang_c_base_type_u16,
    lang_c_base_type_u32,
    lang_c_base_type_u64,
    lang_c_base_type_usize,
    
    lang_c_base_type_s8,
    lang_c_base_type_s16,
    lang_c_base_type_s32,
    lang_c_base_type_s64,
    lang_c_base_type_ssize,
    
    lang_c_base_type_f32,
    lang_c_base_type_f64,
};

u8 _lang_c_base_type_name_buffer[2048];

string write_va(string *memory, cstring format, va_list va_arguments)
{
    usize count = _vsprintf_p((char *) memory->base, memory->count, format, va_arguments);
    
    string result = { count, memory->base };
    advance(memory, count);
    
    return result;
}

string write(string *memory, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    auto result = write_va(memory, format, va_arguments);
    
    va_end(va_arguments);
    
    return result;
}

void compile(lang_parser *parser, lang_c_compile_settings settings = {})
{
    auto file = fopen("test.cpp","w");

    lang_c_buffer buffer = {};
    buffer.file = file;
    buffer.settings = settings;

    if (!buffer.settings.use_default_types)
    {
    
    }

    print(&buffer, R"CODE(
// generated with lang_c compiler

#include <stdio.h>
#include <windows.h>    

#pragma comment(lib, "user32"))CODE");
    
    string name_buffer = { carray_count(_lang_c_base_type_name_buffer), _lang_c_base_type_name_buffer };
    
    if (!buffer.settings.use_default_types)
    {
        print_newline(&buffer);
        lang_c_base_type_names[lang_c_base_type_null]    = write(&name_buffer, "%.*snull", fs(buffer.settings.prefix));
        lang_c_base_type_names[lang_c_base_type_cstring] = write(&name_buffer, "%.*scstring", fs(buffer.settings.prefix));
    
        print_newline(&buffer);
    
        for (u32 i = 0; i < 4; i++)
        {
            u32 bit_count = (8 << i);
            
            lang_c_base_type_names[lang_c_base_type_u8 + i] = write(&name_buffer, "%.*su%i", fs(buffer.settings.prefix), bit_count);
            lang_c_base_type_names[lang_c_base_type_s8 + i] = write(&name_buffer, "%.*ss%i", fs(buffer.settings.prefix), bit_count);
            
            print_line(&buffer, "typedef unsigned __int%i %.*su%i;", bit_count, fs(buffer.settings.prefix), bit_count);
            print_line(&buffer, "typedef   signed __int%i %.*ss%i;", bit_count, fs(buffer.settings.prefix), bit_count);
        }
        
        lang_c_base_type_names[lang_c_base_type_usize] = write(&name_buffer, "%.*susize", fs(buffer.settings.prefix));
        lang_c_base_type_names[lang_c_base_type_ssize] = write(&name_buffer, "%.*sssize", fs(buffer.settings.prefix));
        
        lang_c_base_type_names[lang_c_base_type_f32] = write(&name_buffer, "%.*sf32", fs(buffer.settings.prefix));
        lang_c_base_type_names[lang_c_base_type_f64] = write(&name_buffer, "%.*sf64", fs(buffer.settings.prefix));
        
        print_newline(&buffer);
        print_line(&buffer, "typedef %.*su64 %.*susize;", fs(buffer.settings.prefix), fs(buffer.settings.prefix));
        print_line(&buffer, "typedef %.*ss64 %.*sssize;", fs(buffer.settings.prefix), fs(buffer.settings.prefix));
        
        print_newline(&buffer);
        print_line(&buffer, "typedef float  %.*sf32;", fs(buffer.settings.prefix));
        print_line(&buffer, "typedef double %.*sf64;", fs(buffer.settings.prefix));
        
        print_newline(&buffer);
        print_line(&buffer, "#define %.*snull 0", fs(buffer.settings.prefix));
        print_line(&buffer, "typedef char * %.*scstring;", fs(buffer.settings.prefix));
    }
    
    auto root = &parser->first_file->node;
    
    // forward declare all structs
    {
        print_newline(&buffer);
        
        ast_queue queue = {};
        enqueue(&queue, root);
        
        ast_node *node;
        while (print_next(&node, &queue))
        {
            if (node->node_type == ast_node_type_compound_type)
            {
                local_node_type(compound_type, node);
                
                print_line(&buffer, "struct %.*s;", fs(compound_type->name));
            }
        }
    }

    // forward declare all functions
    // TODO: add default values
    {
        print_newline(&buffer);
        
        ast_queue queue = {};
        enqueue(&queue, root);
        
        ast_node *node;
        while (print_next(&node, &queue))
        {
            if (node->node_type == ast_node_type_function)
            {
                local_node_type(function, node);
                
                print(&buffer, "void %.*s(", fs(function->name));
                
                bool is_not_first = false;
                for (auto argument = function->first_argument; argument; argument = argument->next_sibling)
                {
                    if (argument->node_type == ast_node_type_variable)
                    {
                        if (is_not_first)
                            print(&buffer, ", ");
                            
                        local_node_type(variable, argument);
                        print_declaration(&buffer, variable);
                        
                        is_not_first = true;
                    }
                }
                
                print_line(&buffer, ");", fs(function->name));
            }
        }
    }

    // declare all structs
    {
        ast_queue queue = {};
        enqueue(&queue, root);
        
        ast_node *node;
        while (print_next(&node, &queue))
        {
            if (node->node_type == ast_node_type_compound_type)
            {
                local_node_type(compound_type, node);
                
                print_newline(&buffer);
                print_line(&buffer, "struct %.*s", fs(compound_type->name));
                
                print_scope_open(&buffer);

                print_statements(&buffer, compound_type->first_statement);
    
                print_scope_close(&buffer, false);
                print_line(&buffer, ";");
            }
        }
    }

    // declare all functions
    {
        ast_queue queue = {};
        enqueue(&queue, root);
        
        ast_node *node;
        while (print_next(&node, &queue))
        {
            if (node->node_type == ast_node_type_function)
            {
                local_node_type(function, node);
                
                print_newline(&buffer);
                print(&buffer, "void %.*s(", fs(function->name));
                
                bool is_not_first = false;
                for (auto argument = function->first_argument; argument; argument = argument->next_sibling)
                {
                    if (argument->node_type == ast_node_type_variable)
                    {
                        if (is_not_first)
                            print(&buffer, ", ");
                            
                        local_node_type(variable, argument);
                        print_declaration(&buffer, variable);
                        
                        is_not_first = true;
                    }
                }
                
                print_line(&buffer, ")", fs(function->name));
            
                print_scope_open(&buffer);

                print_statements(&buffer, function->first_statement);
    
                print_scope_close(&buffer);
            }
        }
    }

    print_newline(&buffer);
    print_line(&buffer, "void main(%.*s argument_count, %.*s arguments[])", fs(lang_c_base_type_names[lang_c_base_type_s32]), fs(lang_c_base_type_names[lang_c_base_type_cstring]));

    print_scope_open(&buffer);

    for (auto file = parser->first_file; file; file = (ast_file *) file->node.next_sibling)
    {
        print_statements(&buffer, file->first_statement);
    }
    
    print_scope_close(&buffer);
    
    fclose(file);
}