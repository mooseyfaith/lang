#pragma once

#include "lang.h"

struct lang_c_compile_settings
{
    string prefix;
    bool use_default_types;
};

struct lang_c_buffer
{
    lang_parser *parser;
    lang_c_compile_settings settings;
    
    u8_buffer memory;
    
    u32 indent;
    bool previous_was_newline;
    bool previous_was_blank_line;
    bool previous_was_scope_open;
    bool previous_was_scope_close;
    bool pending_newline;
};

void print_raw_va(lang_c_buffer *buffer, cstring format, va_list va_arguments)
{
    usize count = _vscprintf_p(format, va_arguments) + 1;

    auto offset = buffer->memory.count;
    resize_buffer(&buffer->memory, buffer->memory.count + count);

    _vsprintf_p((char *) buffer->memory.base + offset, count, format, va_arguments);
    resize_buffer(&buffer->memory, buffer->memory.count - 1); // without \0 terminal character
    
    buffer->previous_was_newline    = false;
    buffer->previous_was_blank_line = false;
}

void print_raw(lang_c_buffer *buffer, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_raw_va(buffer, format, va_arguments);
    
    va_end(va_arguments);
}

void print_newline(lang_c_buffer *buffer)
{
    print_raw(buffer, "\r\n");
    buffer->previous_was_blank_line = buffer->previous_was_newline;
    buffer->previous_was_newline = true;
    buffer->pending_newline = false;
}

void print_va(lang_c_buffer *buffer, cstring format, va_list va_arguments)
{
    if (buffer->pending_newline)
        print_newline(buffer);

    if (buffer->previous_was_newline && buffer->indent)
        print_raw(buffer, "%*c", buffer->indent * 4 - 1, ' ');

    auto debug_offset = buffer->memory.count;
    print_raw_va(buffer, format, va_arguments);
    
    // make sure no newline in format
    for (u32 i = debug_offset; i < buffer->memory.count; i++)
    {
        u8 head = buffer->memory.base[i];
        assert((head != '\r') && (head != '\n'));
    }
    
    buffer->previous_was_newline    = false;
    buffer->previous_was_blank_line = false;
    buffer->previous_was_scope_open = false;
    buffer->previous_was_scope_close = false;
}

void print(lang_c_buffer *buffer, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    print_va(buffer, format, va_arguments);
    
    va_end(va_arguments);
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
    
    buffer->previous_was_scope_open = true;
}

void maybe_print_newline(lang_c_buffer *buffer)
{
    if (!buffer->previous_was_newline)
        print_newline(buffer);
}

void maybe_print_blank_line(lang_c_buffer *buffer)
{
    if (!buffer->previous_was_scope_open && !buffer->previous_was_blank_line)
        print_newline(buffer);
}

void pending_newline(lang_c_buffer *buffer)
{
    buffer->pending_newline = true;
}

void print_scope_close(lang_c_buffer *buffer, bool with_newline = true)
{
    assert(buffer->indent);
    
    --buffer->indent;
    
    maybe_print_newline(buffer);
    
    buffer->pending_newline = false;
        
    print(buffer, "}");
    
    if (with_newline)
        print_newline(buffer);
        
    buffer->previous_was_scope_close = true;
}

bool print_next(ast_node **out_node, ast_queue *queue)
{
    if (!queue->used_count)
        return false;

    auto node = *queue->entries[--queue->used_count].node_field;
    
    switch (node->node_type)
    {
        case ast_node_type_file:
        {
            local_node_type(file, node);
            
            if (file->first_statement)
                enqueue(queue, &file->first_statement);
        } break;
    }
    
    *out_node = node;
    
    return true;
}

#define print_expression_declaration void print_expression(lang_c_buffer *buffer, ast_node *node)
print_expression_declaration;

void print_type(lang_c_buffer *buffer, complete_type_info type, string variable_name = s(""))
{
    //type_modifier modifiers[64];
    //u32 modifiers.count = 0;
    
    //for (u32 i = 0; i < type.modifiers.count; i++)
    //{
//        assert(modifiers.count < carray_count(modifiers));
//        modifiers[modifiers.count++] = type.modifiers[i];
//    }
    
    string name = s("_type_not_found_");
    auto name_type = type.name_type.node;
    /*
    if (name_type)
    {
        switch (name_type->node_type)
        {
            cases_complete_message("%.*s", fs(ast_node_type_names[name_type->node_type]));
            
            case ast_node_type_type_alias:
            {
                local_node_type(type_alias, name_type);
                name = type_alias->name;
            } break;
            
            case ast_node_type_number_type:
            {
                local_node_type(number_type, name_type);
                name = number_type->name;
            } break;
            
            case ast_node_type_compound_type:
            {
                local_node_type(compound_type, name_type);
                name = compound_type->name;
            } break;
            
            case ast_node_type_function_type:
            {
                local_node_type(function_type, name_type);
                name = function_type->name;
            } break;
        }
    }
    else
    */
    {
        name = type.name;
    }
        
    assert(name.count);
    
    bool is_dynamic_array = false;
    for (u32 i = 0; i < type.name_type.modifiers.count; i++)
    {
        auto modifier = type.name_type.modifiers.base[i];
        if (modifier.modifier_type == type_modifier_type_dynamic_array)
        {
            auto dynamic_array_type = type;
            dynamic_array_type.name_type.modifiers.count = i;
            
            print(buffer, "struct { usize count; ");
            print_type(buffer, dynamic_array_type, s("*base"));
            print(buffer, "; }");
            
            //if (variable_name.count)
                //print(buffer, " %.*s", fs(variable_name));
            
            type.name_type.modifiers.base  += i + 1;
            type.name_type.modifiers.count -= i + 1;
            is_dynamic_array = true;
            break;
        }
    }
    
    if (!is_dynamic_array)
        print(buffer, "%.*s%.*s", fs(buffer->settings.prefix), fs(name));
    
    for (u32 i = 0; i < type.name_type.modifiers.count; i++)
    {
        auto modifier = type.name_type.modifiers.base[i];
        switch (modifier.modifier_type)
        {
            cases_complete_message("%.*s", fs(type_modifier_type_names[modifier.modifier_type]));

            case type_modifier_type_indirection:
            {
                if (modifier.indirection_count)
                    print(buffer, " ");
                    
                for (u32 i = 0; i < modifier.indirection_count; i++)
                    print(buffer, "*");
                
                if (i == 0)
                    print(buffer, "%.*s", fs(variable_name));
            } break;
            
            case type_modifier_type_constant_array:
            {
                if (variable_name.count && (i == 0))
                    print(buffer, " %.*s", fs(variable_name));
                    
                print(buffer, "[");
                print_expression(buffer, modifier.constant_array_count_expression);
                print(buffer, "]");
            } break;
            
            /*
            case type_modifier_type_dynamic_array:
            {
                print(buffer, "[");
                print_expression(buffer, modifier.constant_array_count_expression);
                print(buffer, "]");
            } break;
            */
        }
    }
    
    if (variable_name.count && (type.name_type.modifiers.count == 0))
        print(buffer, " %.*s", fs(variable_name));
    
    // some space for formating, since the * is considered part of the name, not the type in C
}

print_expression_declaration
{
    switch (node->node_type)
    {
        cases_complete_message("%.*s", fs(ast_node_type_names[node->node_type]));
        
        case ast_node_type_number:
        {
            local_node_type(number, node);
            if (number->value.is_signed)
                print(buffer, "%lli", number->value.s64_value);
            else
                print(buffer, "%llu", number->value.u64_value);
        } break;
        
        case ast_node_type_string:
        {
            local_node_type(string, node);
            print(buffer, "\"%.*s\"", fs(string->text));
        } break;
        
        /*
        case ast_node_type_node_reference:
        {
            local_node_type(node_reference, node);
            
            switch (node_reference->reference->node_type)
            {
                cases_complete;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, node_reference->reference);
                    print(buffer, "%.*s", fs(variable->name));
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node_reference->reference);
                    print(buffer, "%.*s", fs(function->name));
                } break;
            }
        } break;
        */
        
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
            for (auto argument = function_call->first_argument; argument; argument = argument->next)
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
            
            print_expression(buffer, field_reference->expression);
            
            auto type = get_expression_type(buffer->parser, field_reference->expression).base_type;
            if (type.modifiers.count && (type.modifiers.base[type.modifiers.count - 1].modifier_type == type_modifier_type_indirection))
                print(buffer, "->");
            else
                print(buffer, ".");
            
            print(buffer, "%.*s", fs(field_reference->name));
        } break;
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            
            print_expression(buffer, array_index->array_expression);
            
            print(buffer, "[");
            print_expression(buffer, array_index->index_expression);
            print(buffer, "]");
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
        
        case ast_node_type_is:
        {
            local_node_type(is, node);
            
            print(buffer, "(");
            print_expression(buffer, is->left);
            print(buffer, " == ");
            print_expression(buffer, is->right);
            print(buffer, ")");
        } break;
        
        case ast_node_type_is_not:
        {
            local_node_type(is_not, node);
            
            print(buffer, "(");
            print_expression(buffer, is_not->left);
            print(buffer, " != ");
            print_expression(buffer, is_not->right);
            print(buffer, ")");
        } break;
        
        case ast_node_type_bit_or:
        {
            local_node_type(bit_or, node);
            
            print(buffer, "(");
            print_expression(buffer, bit_or->left);
            print(buffer, " | ");
            print_expression(buffer, bit_or->right);
            print(buffer, ")");
        } break;
        
        case ast_node_type_add:
        {
            local_node_type(add, node);
            
            print(buffer, "(");
            print_expression(buffer, add->left);
            print(buffer, " + ");
            print_expression(buffer, add->right);
            print(buffer, ")");
        } break;
        
        case ast_node_type_subtract:
        {
            local_node_type(subtract, node);
            
            print(buffer, "(");
            print_expression(buffer, subtract->left);
            print(buffer, " - ");
            print_expression(buffer, subtract->right);
            print(buffer, ")");
        } break;
    }
}

void print_declaration(lang_c_buffer *buffer, ast_variable *variable)
{
    print_type(buffer, variable->type, variable->name);
}

void print_statements(lang_c_buffer *buffer, ast_node *first_statement)
{
    local_ast_queue(queue);
    
    enqueue(&queue, &first_statement);
    
    ast_node *node;
    while (print_next(&node, &queue))
    {
        switch (node->node_type)
        {
            // skip global declarations
            case ast_node_type_enumeration_type:
            case ast_node_type_type_alias:
            case ast_node_type_function:
            case ast_node_type_number_type:
            case ast_node_type_function_type:
            case ast_node_type_compound_type:
            case ast_node_type_constant:
            break;
            
            case ast_node_type_comment:
            {
                local_node_type(comment, node);
                
                auto lines = comment->text;
                while (lines.count)
                {
                    auto line = skip_until_set_or_all(&lines, s("\n\r"));
                    try_skip(&lines, s("\n\r"));
                    try_skip_set(&lines, s(" \t"));
                    
                    print_line(buffer, "// %.*s", fs(line));
                }
            } break;
        
            case ast_node_type_variable:
            {
                local_node_type(variable, node);
                if (variable->is_global)
                    continue;
                
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
            
                maybe_print_blank_line(buffer);
                
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
                
                pending_newline(buffer);
            } break;
            
            case ast_node_type_loop:
            {
                local_node_type(loop, node);
            
                maybe_print_blank_line(buffer);
                
                print(buffer, "while (");
                print_expression(buffer, loop->condition);
                print(buffer, ")");
                
                print_scope_open(buffer);
                
                if (loop->first_statement)
                    print_statements(buffer, loop->first_statement);
                    
                print_scope_close(buffer);
                
                pending_newline(buffer);
            } break;
            
            case ast_node_type_branch_switch:
            {
                local_node_type(branch_switch, node);
            
                maybe_print_blank_line(buffer);
                
                print(buffer, "switch (");
                print_expression(buffer, branch_switch->expression);
                print(buffer, ")");
                
                print_scope_open(buffer);
                
                for (auto branch_case = branch_switch->first_case; branch_case; branch_case = (ast_branch_switch_case *) branch_case->node.next)
                {
                    print(buffer, "case ");
                    print_expression(buffer, branch_case->expression);
                    print(buffer, ":");
                    
                    print_scope_open(buffer);
                    print_statements(buffer, branch_case->first_statement);
                    print_scope_close(buffer, false);
                    print_line(buffer, " break;");
                    
                    if (branch_switch->first_default_case_statement || branch_case->node.next)
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
                
                pending_newline(buffer);
            } break;
            
            case ast_node_type_function_return:
            {
                local_node_type(function_return, node);
                
                maybe_print_blank_line(buffer);
                
                if (function_return->first_expression)
                {
                    // TODO: specify result type depending on the current function
                    if (function_return->first_expression->next)
                        print(buffer, "return { ");
                    else
                        print(buffer, "return ");
                }
                else
                {
                    print(buffer, "return");
                }
                
                for (auto expression = function_return->first_expression; expression; expression = expression->next)
                {
                    print_expression(buffer, expression);
                    
                    if (expression->next)
                        print(buffer, ", ");
                }
                
                if (function_return->first_expression && function_return->first_expression->next)
                    print(buffer, " }");
                
                print(buffer, ";");
            } break;
            
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

bool is_function_return_type_compound(ast_function_type *function_type)
{
    return (function_type->first_output && function_type->first_output->next);
}

void print_function_return_type(lang_c_buffer *buffer, ast_function_type *function_type, string name)
{
    if (function_type->first_output)
    {
        if (function_type->first_output->next)
        {
            print(buffer, "%.*s_result", fs(name));
        }
        else
        {
            local_node_type(variable, function_type->first_output);
            print_type(buffer, variable->type);
        }
    }
    else
    {
        print(buffer, "void");
    }
}

void print_function_type(lang_c_buffer *buffer, ast_function_type *function_type, string name, bool is_pointer)
{    
    print_function_return_type(buffer, function_type, name);
    
    if (is_pointer)
        print(buffer, " (*%.*s)(", fs(name));
    else
        print(buffer, " %.*s(", fs(name));
    
    bool is_not_first = false;
    for (auto argument = function_type->first_input; argument; argument = argument->next)
    {
        if (argument->node_type == ast_node_type_variable)
        {
            if (is_not_first)
                print(buffer, ", ");
                
            local_node_type(variable, argument);
            print_declaration(buffer, variable);
            
            is_not_first = true;
        }
    }
    
    print(buffer, ")");
}

buffer_type(index_buffer, u32);

struct node_dependency
{
    index_buffer children; // dependencies
    ast_node     *node;
    bool is_root;
};

buffer_type(node_dependency_buffer, node_dependency);

u32 insert(node_dependency_buffer *buffer, ast_node *node)
{
    for (u32 i = 0; i < buffer->count; i++)
    {
        if (buffer->base[i].node == node)
            return i;
    }
    
    resize_buffer(buffer, buffer->count + 1);
    buffer_type(node_dependency_buffer, node_dependency);
    buffer->base[buffer->count - 1] = {};
    buffer->base[buffer->count - 1].node = node;
    buffer->base[buffer->count - 1].is_root = true;
    
    return buffer->count - 1;
}


// TODO: add cycle check
void insert_child(node_dependency_buffer *buffer, ast_node *parent, ast_node *child)
{
    assert(child);
    
    u32 child_index = insert(buffer, child);
    
    if (parent)
    {
        u32 parent_index = insert(buffer, parent);
        assert(parent_index != child_index);
        
        auto parent_entry = &buffer->base[parent_index];
        
        for (u32 i = 0; i < parent_entry->children.count; i++)
        {
            if (parent_entry->children.base[i] == child_index)
                return;
        }
            
        resize_buffer(&parent_entry->children, parent_entry->children.count + 1);
        parent_entry->children.base[parent_entry->children.count - 1] = child_index;
        
        auto child_entry = &buffer->base[child_index];
        child_entry->is_root = false;
        
        printf("[%p] '%.*s' %.*s depends on [%p] '%.*s' %.*s\n", child, fs(get_name(child)), fnode_type_name(child), parent, fs(get_name(parent)), fnode_type_name(parent));
    }
}

#define insert_type_child_declaration void insert_type_child(node_dependency_buffer *buffer, complete_type_info type, ast_node *node)
insert_type_child_declaration;

void insert_declarations(node_dependency_buffer *buffer, ast_node *first_statement, ast_node *child)
{
    for (auto it = first_statement; it; it = it->next)
    {
        local_node_type(variable, it);
        
        insert_type_child(buffer, variable->type, child);
        
        while (it->next && (it->next->node_type != ast_node_type_variable))
            it = it->next;
    }
}

void insert_function_type_dependencies(node_dependency_buffer *buffer, ast_node *node, ast_function_type *function_type)
{
    insert_declarations(buffer, function_type->first_input, node);
    insert_declarations(buffer, function_type->first_output, node);
}

// node depends on type
insert_type_child_declaration
{
    // structs can be forward declared, so a * to struct is not a dependency
    // constant arrays are also dependent on the type
    auto name_node = type.name_type.node;
    //if (name_node && ((!type.name_type.modifiers.count || (type.name_type.modifiers.base[0].modifier_type != type_modifier_type_constant_array)) && is_node_type(type.base_type.node, compound_type)))
        //name_node = null;
    
    if (type.base_type.node && is_node_type(type.base_type.node, compound_type) && (type.name_type.modifiers.count && (type.name_type.modifiers.base[0].modifier_type != type_modifier_type_constant_array)))
        name_node = null;
    
    insert_child(buffer, name_node, node);
}

void compile(lang_parser *parser, lang_c_compile_settings settings = {})
{
    auto file = fopen("test.cpp","w");

    lang_c_buffer buffer = {};
    buffer.settings = settings;
    buffer.parser = parser;

    if (!buffer.settings.use_default_types)
    {
    
    }

    print_line(&buffer, "// generated with lang_c compiler");
    print_newline(&buffer);
    print_line(&buffer, "#include <stdio.h>");
    print_line(&buffer, "#include <windows.h>");    
    print_newline(&buffer);
    print_line(&buffer, "#pragma comment(lib, \"user32\")");
    print_line(&buffer, "#pragma comment(lib, \"gdi32\")");
    
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
        
        print_newline(&buffer);
        print_line(&buffer, "typedef char * %.*scstring;", fs(buffer.settings.prefix));
        
        // HACK: compiler should resolve this call internally an generate proper expressions
        print_newline(&buffer);
        print_line(&buffer, "#define get_call_location code_location{ \"\", __FILE__, __FUNCTION__, __LINE__, 0 }");
    }
    
    auto root = &parser->first_file->node;
    
    ast_list_entry *first_external_binding = null;
    auto external_binding_tail_next = &first_external_binding;
    
    // collect and print all external bindings
    {
        maybe_print_blank_line(&buffer);
        
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (node->node_type == ast_node_type_function)
            {
                local_node_type(function, node);
                
                if (function->first_statement && (function->first_statement->node_type == ast_node_type_external_binding))
                {
                    local_node_type(external_binding, function->first_statement);
                    string library_name = external_binding->library_name;
                
                    bool found = false;
                    for (auto it = first_external_binding; it; it = it->next)
                    {
                        local_node_type(external_binding, it->node);
                        
                        if (library_name == external_binding->library_name)
                        {
                            found = true;
                            break;
                        }
                    }
                    
                    if (!found)
                    {
                        auto new_entry = new ast_list_entry;
                        *new_entry = {};
                        new_entry->node  = &external_binding->node;
                        
                        *external_binding_tail_next = new_entry;
                        external_binding_tail_next = &new_entry->next;
                        
                        print_line(&buffer, "#pragma comment(lib, \"%.*s\")", fs(external_binding->library_name));
                    }
                }
            }
        }
    }
    
    // forward declare all structs
    {
        maybe_print_blank_line(&buffer);
        
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (is_node_type(node, type_alias))
            {
                local_node_type(type_alias, node);
                
                auto name_node = type_alias->type.name_type.node;
                switch (name_node->node_type)
                {
                    case ast_node_type_compound_type:
                    {
                        local_node_type(compound_type, name_node);
                        
                        if (type_alias->type.base_type.modifiers.count == 0)
                            print_line(&buffer, "struct %.*s;", fs(type_alias->name));
                    } break;
                    
                    case ast_node_type_function_type:
                    {
                        local_node_type(function_type, name_node);
                        
                        if (is_function_return_type_compound(function_type))
                        {
                            print(&buffer, "struct ");
                            print_function_return_type(&buffer, function_type, type_alias->name);
                            print_line(&buffer, ";");
                        }
                    } break;
                }
            }
        }
    }
    
    // declare typedefs, structs and functions in order of dependency
    {
        node_dependency_buffer dependencies = {};
        defer
        {
            for (u32 i = 0; i < dependencies.count; i++)
                resize_buffer(&dependencies.base[i].children, 0);
        
            resize_buffer(&dependencies, 0);
        };
    
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            switch (node->node_type)
            {
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                                        
                    insert_type_child(&dependencies, type_alias->type, &type_alias->node);
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    
                    //auto function_type = get_function_type(parser, function);
                    insert_type_child(&dependencies, function->type, &function->node);
                    //insert_function_type_dependencies(&dependencies, node, function_type);
                } break;
                
                case ast_node_type_function_type:
                {
                    local_node_type(function_type, node);
                    insert_function_type_dependencies(&dependencies, node, function_type);
                } break;
                
                case ast_node_type_compound_type:
                {
                    local_node_type(compound_type, node);
                    
                    insert_declarations(&dependencies, compound_type->first_statement, node);
                } break;
                
                case ast_node_type_enumeration_type:
                {
                    local_node_type(enumeration_type, node);
                    
                    insert_type_child(&dependencies, enumeration_type->item_type, &enumeration_type->node);
                } break;
            }
        }
        
        
        index_buffer stack = {};
        defer { resize_buffer(&stack, 0); };
        
        u8_buffer node_is_visited = {};
        resize_buffer(&node_is_visited, dependencies.count);
        defer { resize_buffer(&node_is_visited, 0); };
        
        u8_buffer node_depths = {};
        resize_buffer(&node_depths, dependencies.count);
        defer { resize_buffer(&node_depths, 0); };
        
        // set all depths to 0
        memset(node_depths.base, 0, sizeof(node_depths.base[0]) * node_depths.count);
        
        u32 max_depth = 0;
        for (u32 root_index = 0; root_index < dependencies.count; root_index++)
        {
            auto root = &dependencies.base[root_index];
            if (!root->is_root)
                continue;
            
            // depth first search per root
            
            // clear visited flags
            memset(node_is_visited.base, 0, sizeof(node_is_visited.base[0]) * node_is_visited.count);
            
            printf("dependency root [0x%p] '%.*s' %.*s\n", root->node, fs(get_name(root->node)), fs(ast_node_type_names[root->node->node_type]));
            
            resize_buffer(&stack, 1);
            stack.base[0] = root_index;
            node_is_visited.base[root_index] = true;
            assert(node_depths.base[root_index] == 0);
            
            while (stack.count)
            {
                auto index = stack.base[--stack.count];
                auto entry = dependencies.base[index];
            
                for (u32 i = 0; i < entry.children.count; i++)
                {
                    auto child_index = entry.children.base[entry.children.count - 1 - i];
                    auto child = &dependencies.base[child_index];
                    
                    if (!node_is_visited.base[child_index])
                    {
                        node_is_visited.base[child_index] = true;
                        
                        resize_buffer(&stack, stack.count + 1);
                        stack.base[stack.count - 1] = child_index;
                    }
                    
                    node_depths.base[child_index] = maximum(node_depths.base[child_index], node_depths.base[index] + 1);
                    
                    max_depth = maximum(max_depth, node_depths.base[child_index]);
                }
            }
        }
        
        ast_node_buffer ordered_dependencies = {};
        defer { resize_buffer(&ordered_dependencies, 0); };
        
        for (u32 depth = 0; depth <= max_depth; depth++)
        {
            for (u32 i = 0; i < dependencies.count; i++)
            {
                if (node_depths.base[i] == depth)
                {
                    auto entry = dependencies.base[i];
                    resize_buffer(&ordered_dependencies, ordered_dependencies.count + 1);
                    ordered_dependencies.base[ordered_dependencies.count - 1] = entry.node;
                }
            }
        }
        
        assert(dependencies.count == ordered_dependencies.count);
        
        // check if ordered_dependencies are correct
        for (u32 i = 0; i < dependencies.count; i++)
        {
            // children depend on parent
            // so all its chilren must be inserted before the parent
            
            auto entry = dependencies.base[i];
            auto parent = entry.node;
            
            u32 ordered_parent_index = 0;
            for (; ordered_parent_index <= ordered_dependencies.count; ordered_parent_index++)
            {
                if (ordered_dependencies.base[ordered_parent_index] == parent)
                    break;
            }
            
            assert(ordered_parent_index < ordered_dependencies.count);
            
            for (u32 child_slot = 0; child_slot < entry.children.count; child_slot++)
            {
                auto child = dependencies.base[entry.children.base[child_slot]].node;
                
                // child must come after the parent
                u32 ordered_child_index = ordered_parent_index + 1;
                for (; ordered_child_index < ordered_dependencies.count; ordered_child_index++)
                {
                    if (ordered_dependencies.base[ordered_child_index] == child)
                        break;
                }
                
                assert(ordered_child_index < ordered_dependencies.count);
            }
        }
        
        maybe_print_blank_line(&buffer);
        
        for (u32 i = 0; i < ordered_dependencies.count; i++)
        {
            // in reverse order
            auto node = ordered_dependencies.base[i]; //ordered_dependencies.count - 1 - i];

            printf("dependency [0x%p] '%.*s' %.*s\n", node, fs(get_name(node)), fs(ast_node_type_names[node->node_type]));
                
            switch (node->node_type)
            {
                cases_complete_message("%.*s", fs(ast_node_type_names[node->node_type]));
                
                case ast_node_type_number_type:
                case ast_node_type_compound_type:
                case ast_node_type_function_type:
                case ast_node_type_enumeration_type:
                break;
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    
                    auto name = type_alias->name;
                    auto base_type = type_alias->type.base_type.node;
                    
                    if ((type_alias->type.base_type.modifiers.count == 0) && !is_node_type(base_type, number_type))
                    {
                        switch (base_type->node_type)
                        {
                            cases_complete_message("%.*s", fs(ast_node_type_names[base_type->node_type]));
                            
                            case ast_node_type_enumeration_type:
                            {
                                local_node_type(enumeration_type, base_type);
                                
                                maybe_print_blank_line(&buffer);
                                print(&buffer, "typedef ");
                                print_type(&buffer, enumeration_type->item_type, name);
                                print_line(&buffer, ";");

                                //print_scope_open(&buffer);
                                
                                bool is_not_first = false;
                                
                                ast_enumeration_item *last_item_with_expression = null;
                                u32 value = 0;
                                
                                for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                                {
                                    print(&buffer, "const %.*s %.*s_%.*s = ", fs(name), fs(name), fs(item->name));
                                    
                                    if (item->expression)
                                    {
                                        print_expression(&buffer, item->expression);
                                        last_item_with_expression = item;
                                        value = 0;
                                    }
                                    else if (last_item_with_expression)
                                    {
                                        print(&buffer, "%.*s_%.*s + %i", fs(name), fs(last_item_with_expression->name), value);
                                    }
                                    else
                                    {
                                        print(&buffer, "%i", value);
                                    }
                                    
                                    value++;
                                    
                                    print_line(&buffer, ";");
                                }
                            } break;
                            
                            case ast_node_type_function_type:
                            {
                                local_node_type(function_type, base_type);
                                
                                if (function_type->first_output && function_type->first_output->next)
                                {
                                    maybe_print_blank_line(&buffer);
                                    print_line(&buffer, "struct %.*s_result", fs(name));
                                    
                                    print_scope_open(&buffer);
                
                                    print_statements(&buffer, function_type->first_output);
                    
                                    print_scope_close(&buffer, false);
                                    print_line(&buffer, ";");
                                }
                                
                                print(&buffer, "typedef ");
                                print_function_type(&buffer, function_type, name, true);
                                
                                print_line(&buffer, ";");
                            } break;
                            
                            case ast_node_type_compound_type:
                            {
                                local_node_type(compound_type, base_type);
                                
                                maybe_print_blank_line(&buffer);
                                print_line(&buffer, "struct %.*s", fs(name));
                                
                                print_scope_open(&buffer);
                
                                print_statements(&buffer, compound_type->first_statement);
                    
                                print_scope_close(&buffer, false);
                                print_line(&buffer, ";");
                            } break;
                        }
                    }
                    else
                    {
                        print(&buffer, "typedef ");
                        print_type(&buffer, type_alias->type, type_alias->name);
                        print_line(&buffer, ";");
                    }
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    
                    auto function_type = get_function_type(parser, function);
                    
                    if (function_type->first_output && function_type->first_output->next)
                    {
                        maybe_print_blank_line(&buffer);
                        print_line(&buffer, "struct %.*s_result", fs(function->name));
                        
                        print_scope_open(&buffer);
    
                        print_statements(&buffer, function_type->first_output);
        
                        print_scope_close(&buffer, false);
                        print_line(&buffer, ";");
                    }
                    
                    if (function->first_statement && (function->first_statement->node_type == ast_node_type_external_binding))
                    {
                        local_node_type(external_binding, function->first_statement);
                        
                        print(&buffer, "extern \"C\" ");
                        
                        if (external_binding->is_dll)
                            print(&buffer, "__declspec(dllimport) ");
                    }
                    
                    print_function_type(&buffer, function_type, function->name, false);
                    
                    print_line(&buffer, ";");
                } break;                
            }
        }
    }
    
#if 0    
    // declare all type aliases
    // right now we declare them as const values, instead of C enums for maximum expressivenes
    {
        maybe_print_blank_line(&buffer);
        
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            switch (node->node_type)
            {
            #if 0
                case ast_node_type_number_type:
                {
                    local_node_type(number_type, node);
                    
                    print(&buffer, "typedef ");
                    
                    if (number_type->is_float)
                    {
                        if (number_type->bit_count_power_of_two == 3)
                            print(&buffer, "float ");
                        else
                            print(&buffer, "double ");
                    }
                    else if (number_type->is_signed)
                    {
                        print(&buffer, "signed ");
                    }
                    else 
                    {
                        print(&buffer, "unsigned ");
                    }
                    
                    print_line(&buffer, " %.*s;", fs(number_type->name));
                } break;
            #endif
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    
                    print(&buffer, "typedef ");
                    print_type(&buffer, type_alias->type, type_alias->name);
                    print_line(&buffer, ";");
                } break;
                
                case ast_node_type_function_type:
                {
                    local_node_type(function_type, node);
                    
                    if (!function_type->name.count)
                        continue;
                    
                    print(&buffer, "typedef ");
                    print_function_type(&buffer, function_type, function_type->name, true);
                    
                    print_line(&buffer, ";");
                } break;
            }
        }
    }

    // declare all enums
    // right now we declare them as const values, instead of C enums for maximum expressivenes
    {
        maybe_print_blank_line(&buffer);
        
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (node->node_type == ast_node_type_enumeration_type)
            {
                local_node_type(enumeration_type, node);
                
                maybe_print_blank_line(&buffer);
                print(&buffer, "typedef ");
                print_type(&buffer, enumeration_type->type, enumeration_type->name);
                print_line(&buffer, ";");
                
                //print_scope_open(&buffer);
                
                bool is_not_first = false;
                
                ast_enumeration_item *last_item_with_expression = null;
                u32 value = 0;
                
                for (auto item = enumeration->first_item; item; item = (ast_enumeration_item *) item->node.next)
                {
                    print(&buffer, "const %.*s %.*s_%.*s = ", fs(enumeration_type->name), fs(enumeration_type->name), fs(item->name));
                    
                    if (item->expression)
                    {
                        print_expression(&buffer, item->expression);
                        last_item_with_expression = item;
                        value = 0;
                    }
                    else if (last_item_with_expression)
                    {
                        print(&buffer, "%.*s_%.*s + %i", fs(enumeration_type->name), fs(last_item_with_expression->name), value);
                    }
                    else
                    {
                        print(&buffer, "%i", value);
                    }
                    
                    value++;
                    
                    print_line(&buffer, ";");
                }
                
                //print_scope_close(&buffer, false);
                //print_line(&buffer, ";");
            }
        }
    }

    // declare all structs
    {
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (node->node_type == ast_node_type_compound_type)
            {
                local_node_type(compound_type, node);
                
                maybe_print_blank_line(&buffer);
                print_line(&buffer, "struct %.*s", fs(compound_type->name));
                
                print_scope_open(&buffer);

                print_statements(&buffer, compound_type->first_statement);
    
                print_scope_close(&buffer, false);
                print_line(&buffer, ";");
            }
            else if (node->node_type == ast_node_type_function)
            {
                local_node_type(function, node);
                auto function_type = get_function_type(parser, function);
                
                if (function_type->first_output && function_type->first_output->next)
                {
                    // TODO: add unique result identifier
                    maybe_print_blank_line(&buffer);
                    print_line(&buffer, "struct %.*s_result", fs(function->name));
                    
                    print_scope_open(&buffer);

                    print_statements(&buffer, function_type->first_output);
    
                    print_scope_close(&buffer, false);
                    print_line(&buffer, ";");
                }
            }
        }
    }
#endif

    // declare all constants
    {
        maybe_print_blank_line(&buffer);
    
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (node->node_type == ast_node_type_constant)
            {
                local_node_type(constant, node);
                
                auto type = get_expression_type(parser, constant->expression);
                print(&buffer, "const ");
                print_type(&buffer, type, constant->name);
                print(&buffer, " = ");
                print_expression(&buffer, constant->expression);
                print_line(&buffer, ";");
            }
        }
    }
    
    // declare all global variables
    {
        maybe_print_blank_line(&buffer);
    
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (node->node_type == ast_node_type_variable)
            {
                local_node_type(variable, node);
                if (!variable->is_global)
                    continue;
                
                print_declaration(&buffer, variable);
                print_line(&buffer, ";");
            }
        }
    }

    // declare all functions
    {
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            if (node->node_type == ast_node_type_function)
            {
                local_node_type(function, node);
                
                if (function->first_statement && (function->first_statement->node_type == ast_node_type_external_binding))
                    continue;
                
                auto function_type = get_function_type(parser, function);
                
                maybe_print_blank_line(&buffer);
                
                print_function_return_type(&buffer, function_type, function->name);
                
                print(&buffer, " %.*s(", fs(function->name));
                
                bool is_not_first = false;
                for (auto argument = function_type->first_input; argument; argument = argument->next)
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
    
                if (function->first_statement)
                    print_statements(&buffer, function->first_statement);
    
                print_scope_close(&buffer);
            }
        }
    }

    maybe_print_blank_line(&buffer);
    print_line(&buffer, "void main(%.*s argument_count, %.*s arguments[])", fs(lang_c_base_type_names[lang_c_base_type_s32]), fs(lang_c_base_type_names[lang_c_base_type_cstring]));

    print_scope_open(&buffer);

    for (auto file = parser->first_file; file; file = (ast_file *) file->node.next)
    {
        maybe_print_blank_line(&buffer);
        print_line(&buffer, "// file: %.*s", fs(file->path));
        print_newline(&buffer);
        print_statements(&buffer, file->first_statement);
    }
    
    print_scope_close(&buffer);
    
    u8_array data = buffer_to_array(buffer.memory);
    platform_write_entire_file("lang_output.cpp", data);
}