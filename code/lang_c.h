#pragma once

#include "lang.h"

struct lang_c_compile_settings
{
    string prefix;
    bool use_default_types;
};

struct unique_type_info
{
    ast_node *node;
};

buffer_type(unique_type_buffer, unique_type_array, unique_type_info);

struct lang_c_buffer
{
    lang_parser *parser;
    lang_c_compile_settings settings;
    string_builder builder;
    
    unique_type_buffer unique_types;
};

bool print_next(ast_node **out_node, ast_queue *queue)
{
    if (!queue->count)
        return false;

    auto node = *queue->base[--queue->count].node_field;
    
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

#define print_statements_declaration void print_statements(lang_c_buffer *buffer, ast_node *first_statement)
print_statements_declaration;

#define get_unique_type_declaration complete_type_info get_unique_type(lang_c_buffer *buffer, complete_type_info type)
get_unique_type_declaration;

void print_type(lang_c_buffer *buffer, complete_type_info type, string variable_name = {})
{
    auto builder = &buffer->builder;
    
    // TEMP
    //type = get_unique_type(buffer, type);
    
    auto name_type = type.name_type;
    if (name_type.node)
    {
        switch (name_type.node->node_type)
        {
            cases_complete;
            
            case ast_node_type_function_type:
            {
                print(builder, "_function_type_%x", name_type.node->index);
            } break;
            
            case ast_node_type_enumeration_type:
            {
                print(builder, "_enumeration_%x", name_type.node->index);
            } break;
            
            case ast_node_type_type_alias:
            {
                local_node_type(type_alias, name_type.node);
                print(builder, "%.*s", fs(type_alias->name));
            } break;
            
            case ast_node_type_array_type:
            {
                local_node_type(array_type, name_type.node);
                
                if (array_type->count_expression)
                {
                    auto item_type = array_type->item_type;
                    while (item_type.base_type.node && is_node_type(item_type.base_type.node, array_type))
                    {
                        local_node_type(array_type, item_type.base_type.node);
                        item_type = array_type->item_type;
                    }
                
                    print_type(buffer, item_type, variable_name);
                
                    while (type.base_type.node && is_node_type(type.base_type.node, array_type))
                    {
                        local_node_type(array_type, type.base_type.node);
                        
                        print(builder, "[");
                        print_expression(buffer, array_type->count_expression);
                        print(builder, "]");
                        
                        type = array_type->item_type;
                    }
                    
                    return;
                }
                else
                {
                    print(builder, "struct _array_type_%x", name_type.node->index);
                }
            } break;
            
            case ast_node_type_compound_type:
            {
                print(builder, "struct _compound_type_%x", name_type.node->index);
            } break;
            
            case ast_node_type_number_type:
            {
                local_node_type(number_type, name_type.node);
                print(builder, "%.*s", fs(number_type->name));
            } break;
            
        }
    }
    else
    {
        auto parser = buffer->parser;
        lang_require_return_value(type.name.count, , parser->iterator, "unresolved type needs to have at least a name");
        print(builder, "/* not resolved */ %.*s", fs(type.name));
    }
    
    // some space for formating, since the * is considered part of the name, not the type in C
    if (variable_name.count || name_type.indirection_count)
        print(builder, " ");
        
    for (u32 i = 0; i < name_type.indirection_count; i++)
        print(builder, "*");
    
    if (variable_name.count)
        print(builder, "%.*s", fs(variable_name));
}

void print_type(lang_c_buffer *buffer, ast_node *base_type, string variable_name = {})
{
    complete_type_info type = {};
    type.base_type.node = base_type;
    type.name_type = type.base_type;
    
    print_type(buffer, type, variable_name);
}

bool try_print_literal_assignment(lang_c_buffer *buffer, ast_node *expression)
{
    if (!is_node_type(expression, compound_literal) && !is_node_type(expression, array_literal))
        return false;
        
    auto parser = buffer->parser;
    auto builder = &buffer->builder;
    
    print(builder, " = ");
    print_scope_open(builder);
    
    if (is_node_type(expression, compound_literal))
    {
        local_node_type(compound_literal, expression);
        
        if (compound_literal->first_field)
        {
            // print(builder, "%.*s: ", fs(compound_literal->first_field->name)); C could do this
            print_expression(buffer, compound_literal->first_field->expression);
            for (auto field = (ast_compound_literal_field *) compound_literal->first_field->node.next; field; field = (ast_compound_literal_field *) field->node.next)
            {
                print_line(builder, ",");
                // print(builder, "%.*s: ", fs(field->name)); C could do this
                print_expression(buffer, field->expression);
            }
            
            print_newline(builder);
         }
    }
    else
    {
        local_node_type(array_literal, expression)
        local_node_type(array_type, array_literal->type.base_type.node);
        
        if (array_literal->first_expression)
        {
            print_expression(buffer, array_literal->first_expression);
            for (auto expression = array_literal->first_expression->next; expression; expression = expression->next)
            {
                print_line(builder, ",");
                print_expression(buffer,  expression);
            }
            
            pending_newline(builder);
        }
    }
    
    print_scope_close(builder, false);
    print_line(builder, ";");
    
    return true;
}

void print_declaration(lang_c_buffer *buffer, ast_variable *variable)
{
    auto builder = &buffer->builder;
    print_type(buffer, variable->type, variable->name);
}

print_expression_declaration
{
    auto parser = buffer->parser;
    auto builder = &buffer->builder;
    
    switch (node->node_type)
    {
        case ast_node_type_number:
        {
            local_node_type(number, node);
            if (number->value.is_float)
            {
                if (number->value.bit_count_power_of_two == 32)
                    print(builder, "%ff", number->value.f64_value);
                else
                    print(builder, "%f", number->value.f64_value);
            }
            else if (number->value.is_signed)
            {
                print(builder, "%lli", number->value.s64_value);
            }
            else
            {
                print(builder, "%llu", number->value.u64_value);
            }
        } break;
        
        case ast_node_type_string:
        {
            local_node_type(string, node);
            print(builder, "\"%.*s\"", fs(string->text));
        } break;
        
        case ast_node_type_array_literal:
        {
            local_node_type(array_literal, node);
            print(builder, "_array_literal_%x", node->index);
        } break;
        
        case ast_node_type_compound_literal:
        {
            local_node_type(compound_literal, node);
            
            print_type(buffer, compound_literal->type);
            print(builder, " { ");
            
            // TODO: sort by field name
            for (auto it = compound_literal->first_field; it; it = (ast_compound_literal_field *) it->node.next)
            {
                print_expression(buffer, it->expression);
                print(builder, ", ");
            }
            print(builder, "}");
        } break;
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            
            if (!name_reference->reference)
                print(builder, "/* not resolved */ ");
                
            print(builder, "%.*s", fs(name_reference->name));
        } break;
                    
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);

            print_expression(buffer, function_call->expression);
            print(builder, "(");
            
            bool is_not_first = false;
            for (auto argument = function_call->first_argument; argument; argument = argument->next)
            {
                if (is_not_first)
                    print(builder, ", ");
                    
                print_expression(buffer, argument);
                is_not_first = true;
            }
            print(builder, ")");
        } break;
        
        case ast_node_type_field_reference:
        {
            local_node_type(field_reference, node);
            
            auto type = get_expression_type(buffer->parser, field_reference->expression).base_type;
            
            if (!type.indirection_count && type.node)
            {
                if (is_node_type(type.node, enumeration_type))
                {
                    if (field_reference->name == s("count"))
                    {
                        local_node_type(enumeration_type, type.node);
                        
                        print(builder, "/* ");
                        print_expression(buffer, field_reference->expression);
                        print(builder, "_%.*s */ %i", fs(field_reference->name), enumeration_type->item_count);
                    }
                    else
                    {
                        print_expression(buffer, field_reference->expression);
                        print(builder, "_%.*s", fs(field_reference->name));
                    }
                    
                    break;
                }
                else if (is_node_type(type.node, array_type))
                {
                    local_node_type(array_type, type.node);
                    
                #if 0
                    print_expression(buffer, field_reference->expression);
                    print(builder, ".%.*s", fs(field_reference->name));
                #else
                    if (field_reference->name == s("count"))
                    {
                        if (array_type->count_expression)
                        {
                            print(builder, "/* ");
                            print_expression(buffer, field_reference->expression);
                            print(builder, ".count */ ");
                            print_expression(buffer, array_type->count_expression);
                        }
                        else
                        {
                            print_expression(buffer, field_reference->expression);
                            print(builder, ".count");
                        }
                    }
                    else if (field_reference->name == s("base"))
                    {
                        if (is_node_type(field_reference->expression, array_literal)) //array_type->count_expression)
                        {
                            local_node_type(array_literal, field_reference->expression);
                            
                            print(builder, "/* ");
                            print_expression(buffer, field_reference->expression);
                            print(builder, ".base */ _array_literal_base_%x", array_literal->node.index);
                            //print_expression(buffer, array_type->count_expression);
                        }
                        else
                        {
                            print_expression(buffer, field_reference->expression);
                            print(builder, ".base");
                        }
                    }
                    else
                    {
                        unreachable_codepath;
                    }
                #endif
                    
                    break;
                }
            }
            
            if (type.indirection_count == 1)
            {
                print_expression(buffer, field_reference->expression);
                print(builder, "->");
                print(builder, "%.*s", fs(field_reference->name));
            }
            else if (type.indirection_count == 0)
            {
                print_expression(buffer, field_reference->expression);
                print(builder, ".");
                print(builder, "%.*s", fs(field_reference->name));
            }
            else
            {
                print(builder, "/* too many indirections %.*s */", fs(field_reference->name));
            }
            
            if (!field_reference->reference)
            {
                print(builder, " /* unresolved */");
            }
        } break;
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            
            auto base_type = get_expression_type(parser, array_index->array_expression).base_type.node;
            local_node_type(array_type, base_type);
            
            print_expression(buffer, array_index->array_expression);
            
            if (!array_type->count_expression)
            {
                print(builder, ".base");
            }
            
            print(builder, "[");
            print_expression(buffer, array_index->index_expression);
            print(builder, "]");
        } break;
        
        case ast_node_type_cast:
        {
            local_node_type(cast, node);
            
            print(builder, "((");
            print_type(buffer, cast->type);
            print(builder, ") ");
            print_expression(buffer, cast->expression);
            print(builder, ")");
        } break;
        
        case ast_node_type_take_reference:
        {
            local_node_type(take_reference, node);
            
            print(builder, "&");
            print_expression(buffer, take_reference->expression);
        } break;
        
        case ast_node_type_not:
        {
            local_node_type(not, node);
            
            print(builder, "!");
            print_expression(buffer, not->expression);
        } break;
        
        default:
        {
            if (is_unary_operator(node))
            {
            }
            else if (is_binary_operator(node))
            {
                string c_symbols[] =
                {
                    s("||"),
                    s("&&"),
                
                    s("=="),
                    s("!="),
                    
                    s("<"),
                    s("<="),
                    s(">"),
                    s(">="),
                    
                    s("~"),
                    s("|"),
                    s("&"),
                    
                    s("+"),
                    s("-"),
                    s("*"),
                    s("/"),
                };
                
                u32 c_symbol_index = node->node_type - ast_node_type_binary_operator - 1;
                assert(c_symbol_index < carray_count(c_symbols));
                
                auto binary_operator = (ast_binary_operator *) node;
            
                print(builder, "(");
                print_expression(buffer, binary_operator->left);
                print(builder, " %.*s ", fs(c_symbols[c_symbol_index]));
                print_expression(buffer, binary_operator->right);
                print(builder, ")");
            }
            else
            {
                assert(false, "unhandled expression type %.*s", fnode_type_name(node));
            }
        }
    }
}

void print_statement(lang_c_buffer *buffer, ast_node *node)
{
    auto builder = &buffer->builder;
    
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

        case ast_node_type_base_node:
        break;
    
        case ast_node_type_variable:
        {
            local_node_type(variable, node);
            if (variable->is_global)
                return;
            
            print_declaration(buffer, variable);
            
            if (variable->default_expression)
            {
                if (!try_print_literal_assignment(buffer, variable->default_expression))
                {
                    print(builder, " = ");
                    print_expression(buffer, variable->default_expression);
                }
            }
            else
            {
                print(builder, " = {}");
            }
            
            print_line(builder, ";");
        } break;
        
        case ast_node_type_assignment:
        {
            local_node_type(assignment, node);
            
        #if 0
            if (is_node_type(assignment->right, compound_literal) || is_node_type(assignment->right, array_literal))
            {
                u32 byte_count;
                
                print_expression(buffer, assignment->left);
                print(builder, " = ");
                print_scope_open(builder);
                
                if (is_node_type(assignment->right, compound_literal))
                {
                    local_node_type(compound_literal, assignment->right)
                    byte_count = get_type_byte_count(compound_literal->type).byte_count;
                    
                    if (compound_literal->first_field)
                    {
                        // print(builder, "%.*s: ", fs(compound_literal->first_field->name)); C could do this
                        print_expression(buffer, compound_literal->first_field->expression);
                        for (auto field = (ast_compound_literal_field *) compound_literal->first_field->node.next; field; field = (ast_compound_literal_field *) field->node.next)
                        {
                            print_line(builder, ",");
                            // print(builder, "%.*s: ", fs(field->name)); C could do this
                            print_expression(buffer, field->expression);
                        }
                        
                        pending_newline(builder);
                     }
                }
                else
                {
                    local_node_type(array_literal, assignment->right)
                    local_node_type(array_type, array_literal->type.base_type.node);
                    
                    byte_count = get_type_byte_count(array_type->item_type).byte_count * array_literal->item_count;
                    
                    if (array_literal->first_expression)
                    {
                        print_expression(buffer, array_literal->first_expression);
                        for (auto expression = array_literal->first_expression->next; expression; expression = expression->next)
                        {
                            print_line(builder, ",");
                            print_expression(buffer,  expression);
                        }
                        
                        pending_newline(builder);
                    }
                }
                
                print_scope_close(builder);
            
            #if 0
                print(builder, "memcpy((u8 *) &(");
                print_expression(buffer, assignment->left);
                print(builder, "), (u8 *) (");
                print_expression(buffer, assignment->right);
                print(builder, ").base, %llu)", byte_count);
            #endif
            }
            else
        #endif
            {
                print_expression(buffer, assignment->left);
                print(builder, " = ");
                print_expression(buffer, assignment->right);
            }
            
            print_line(builder, ";");
        } break;
        
        case ast_node_type_branch:
        {
            local_node_type(branch, node);
        
            maybe_print_blank_line(builder);
            
            print(builder, "if (");
            print_expression(buffer, branch->condition);
            print(builder, ")");
            
            print_scope_open(builder);
            
            if (branch->first_true_statement)
                print_statements(buffer, branch->first_true_statement);
                
            print_scope_close(builder);
            
            if (branch->first_false_statement)
            {
                print(builder, "else");
                print_scope_open(builder);
                print_statements(buffer, branch->first_false_statement);
                print_scope_close(builder);
            }
            
            pending_newline(builder);
        } break;
        
        case ast_node_type_loop:
        {
            local_node_type(loop, node);
        
            maybe_print_blank_line(builder);
            
            print(builder, "while (");
            print_expression(buffer, loop->condition);
            print(builder, ")");
            
            print_scope_open(builder);
            
            if (loop->first_statement)
                print_statements(buffer, loop->first_statement);
                
            print_scope_close(builder);
            
            pending_newline(builder);
        } break;
        
        case ast_node_type_loop_with_counter:
        {
            local_node_type(loop_with_counter, node);
        
            maybe_print_blank_line(builder);
            
            print(builder, "for (");
            print_statement(buffer, loop_with_counter->first_counter_statement);
            
            string counter_name = get_name(loop_with_counter->first_counter_statement);
            assert(counter_name.count);
            
            print(builder, " %.*s < ", fs(counter_name));
            print_expression(buffer, loop_with_counter->end_condition);
            print(builder, "; %.*s++)", fs(counter_name));
            
            print_scope_open(builder);
            
            if (loop_with_counter->first_statement)
                print_statements(buffer, loop_with_counter->first_statement);
                
            print_scope_close(builder);
            
            pending_newline(builder);
        } break;
        
        case ast_node_type_branch_switch:
        {
            local_node_type(branch_switch, node);
        
            maybe_print_blank_line(builder);
            
            print(builder, "switch (");
            print_expression(buffer, branch_switch->expression);
            print(builder, ")");
            
            print_scope_open(builder);
            
            for (auto branch_case = branch_switch->first_case; branch_case; branch_case = (ast_branch_switch_case *) branch_case->node.next)
            {
                print(builder, "case ");
                print_expression(buffer, branch_case->expression);
                print(builder, ":");
                
                print_scope_open(builder);
                print_statements(buffer, branch_case->first_statement);
                print_scope_close(builder, false);
                print_line(builder, " break;");
                
                if (branch_switch->first_default_case_statement || branch_case->node.next)
                    print_newline(builder);
            }
            
            if (branch_switch->first_default_case_statement)
            {
                print(builder, "default:");
                print_scope_open(builder);
                print_statements(buffer, branch_switch->first_default_case_statement);
                print_scope_close(builder);
            }
                
            print_scope_close(builder);
            
            pending_newline(builder);
        } break;
        
        case ast_node_type_function_return:
        {
            local_node_type(function_return, node);
            
            maybe_print_blank_line(builder);
            
            if (function_return->first_expression)
            {
                // TODO: specify result type depending on the current function
                if (function_return->first_expression->next)
                    print(builder, "return { ");
                else
                    print(builder, "return ");
            }
            else
            {
                print(builder, "return");
            }
            
            for (auto expression = function_return->first_expression; expression; expression = expression->next)
            {
                print_expression(buffer, expression);
                
                if (expression->next)
                    print(builder, ", ");
            }
            
            if (function_return->first_expression && function_return->first_expression->next)
                print(builder, " }");
            
            print(builder, ";");
        } break;
        
        // try expressions
        default:
        {
            print_expression(buffer, node);
            print_line(builder, ";");
        } break;
    }
}

print_statements_declaration
{
    auto builder = &buffer->builder;

    local_buffer(queue, ast_queue);
    
    enqueue(&queue, &first_statement);
    
    ast_node *node;
    while (print_next(&node, &queue))
    {
        //print_buffer(buffer, "#line %i",
        
        {
            auto comment = buffer->parser->node_comments.base[node->index];
            auto lines = comment;
            
            while (lines.count)
            {
                auto line = skip_until_set_or_all(&lines, s("\r\n"));
                bool ok = try_skip(&lines, s("\r"));
                try_skip(&lines, s("\n"));
                if (!ok)
                    try_skip(&lines, s("\r"));
                    
                try_skip_set(&lines, s(" \t"));
                
                print_line(builder, "// %.*s", fs(line));
            }
        }
        
        print_statement(buffer, node);
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
    s("unsigned long long"),
    
    s("signed char"),
    s("signed short"),
    s("signed int"),
    s("signed long long"),
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
    if (!function_type->output.name_type.node)
        return false;
        
    local_node_type(compound_type, function_type->output.name_type.node);

    return (compound_type->first_field && compound_type->first_field->node.next);
}

void print_function_return_type(lang_c_buffer *buffer, ast_function_type *function_type)
{
    auto builder = &buffer->builder;
    
    auto output = function_type->output;
    if (output.base_type.node)
    {
        local_node_type(compound_type, output.base_type.node);
    
        if (is_function_return_type_compound(function_type))
        {
            print_type(buffer, output);
        }
        else
        {
            auto variable = compound_type->first_field;
            print_type(buffer, variable->type);
        }
    }
    else
    {
        print(builder, "void");
    }
}

void print_function_type(lang_c_buffer *buffer, ast_function_type *function_type, string name, bool is_function_pointer)
{    
    auto builder = &buffer->builder;

    print_function_return_type(buffer, function_type);
    
    if (!is_function_pointer)
    {
        if (function_type->calling_convention.count)
            print(builder, " %.*s", fs(function_type->calling_convention));
        
        print(builder, " %.*s(", fs(name));
    }
    else
    {
        print(builder, " (");
        
        if (function_type->calling_convention.count)
            print(builder, " %.*s", fs(function_type->calling_convention));
        
        print(builder, "*%.*s)(", fs(name));
    }
    
    bool is_not_first = false;
    
    if (function_type->input.base_type.node)
    {
        local_node_type(compound_type, function_type->input.base_type.node);
        
        for (auto argument = compound_type->first_field; argument; argument = (ast_variable *) argument->node.next)
        {
            if (is_not_first)
                print(builder, ", ");
                    
            print_declaration(buffer, argument);
                
            is_not_first = true;
        }
    }
    
    print(builder, ")");
}

bool unique_declarations_match(lang_c_buffer *buffer, ast_variable *first_unique_field, ast_variable *first_field)
{
    auto unique_field = first_unique_field;
    
    for (auto field = first_field; field; field = (ast_variable *) field->node.next)
    {
        if (!unique_field)
            return false;
    
        if (field->name != unique_field->name)
            return false;
        
        auto field_type = get_unique_type(buffer, field->type);
        auto unique_field_type = unique_field->type;
        
        if ((field_type.name_type.node && (field_type.name_type.node != unique_field_type.name_type.node)) || (!field_type.name_type.node && (field_type.name != unique_field_type.name)) || (field_type.name_type.indirection_count != unique_field_type.name_type.indirection_count))
           return false;
        
        unique_field = (ast_variable *) unique_field->node.next;
    }
    
    return (unique_field == null);
}

ast_variable * add_unique_declarations(lang_c_buffer *buffer, ast_variable *first_field)
{
    auto parser = buffer->parser;
    
    base_single_list unique_field_list;
    begin_list(&unique_field_list);
    
    for (auto field = first_field; field; field = (ast_variable *) field->node.next)
    {
        auto field_type = get_unique_type(buffer, field->type);
    
        auto unique_field = new_leaf_node(variable, parser->node_locations.base[field->node.index].text);
        unique_field->name = field->name;
        unique_field->type = field_type;
        
        append_list(&unique_field_list, &unique_field->node);
    }
    
    return (ast_variable *) unique_field_list.first;
}


// TODO: add cycle check
get_unique_type_declaration
{
    if (type.name_type.node && is_node_type(type.name_type.node, type_alias))
    {
        auto unique_base_type = type;
        unique_base_type.name_type = {};
        
        unique_base_type = get_unique_type(buffer, unique_base_type);
        unique_base_type.name_type = type.name_type;
        
        return unique_base_type;
    }

    auto base_type = type.base_type.node;
    if (!base_type)
        return type;

    auto parser       = buffer->parser;
    auto unique_types = &buffer->unique_types;

    switch (base_type->node_type)
    {
        cases_complete;
    
        // enums and number types are unique enough
        case ast_node_type_number_type:
        case ast_node_type_enumeration_type:
        {
            return type;
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, base_type);
            
            auto item_type = get_unique_type(buffer, array_type->item_type);
            
            bool found = false;
            for (u32 i = 0; i < unique_types->count; i++)
            {
                auto unique_type = unique_types->base[i].node;
                if (is_node_type(unique_type, array_type))
                {
                    auto unique_array_type = get_node_type(array_type, unique_type);
                    
                    if ((unique_array_type->item_type.name_type.node == item_type.name_type.node) &&
                        (unique_array_type->item_type.name_type.indirection_count == array_type->item_type.name_type.indirection_count))
                    {
                        base_type = get_base_node(unique_array_type);
                        found = true;
                        break;
                    }
                }
            }
            
            if (!found)
            {
                auto unique_array_type = new_leaf_node(array_type, parser->node_locations.base[array_type->node.index].text);
                unique_array_type->item_type = item_type;
            
                resize_buffer(unique_types, unique_types->count + 1);
                auto unique_type = &unique_types->base[unique_types->count - 1];
                *unique_type = {};
                unique_type->node = get_base_node(unique_array_type);
                
                base_type = unique_type->node;
            }
            
            if (array_type->count_expression)
                return type;
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, base_type);
            
            bool found = false;
            for (u32 i = 0; i < unique_types->count; i++)
            {
                auto unique_type = unique_types->base[i].node;
                if (is_node_type(unique_type, compound_type))
                {
                    auto unique_compound_type = get_node_type(compound_type, unique_type);
                    
                    if (unique_declarations_match(buffer, unique_compound_type->first_field, compound_type->first_field))
                    {
                        base_type = get_base_node(unique_compound_type);
                        found = true;
                        break;
                    }
                }
            }
            
            if (found)
                break;
            
            auto unique_compound_type = new_leaf_node(compound_type, parser->node_locations.base[compound_type->node.index].text);
            
            unique_compound_type->first_field = add_unique_declarations(buffer, compound_type->first_field);
            
            resize_buffer(unique_types, unique_types->count + 1);
            auto unique_type = &unique_types->base[unique_types->count - 1];
            *unique_type = {};
            unique_type->node = get_base_node(unique_compound_type);
            
            base_type = unique_type->node;
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, base_type);
            
            auto unique_input = get_unique_type(buffer, function_type->input);
            auto unique_output = get_unique_type(buffer, function_type->output);
            
            bool found = false;
            for (u32 i = 0; i < unique_types->count; i++)
            {
                auto unique_type = unique_types->base[i].node;
                if (is_node_type(unique_type, function_type))
                {
                    auto unique_function_type = get_node_type(function_type, unique_type);
                    
                    if ((unique_input.name_type.node == unique_function_type->input.name_type.node) &&
                        (unique_output.name_type.node == unique_function_type->output.name_type.node))
                    {
                        base_type = get_base_node(unique_function_type);
                        found = true;
                        break;
                    }
                }
            }
            
            if (found)
                break;
            
            auto unique_function_type = new_leaf_node(function_type, parser->node_locations.base[function_type->node.index].text);
            
            unique_function_type->input  = unique_input;
            unique_function_type->output = unique_output;
            
            resize_buffer(unique_types, unique_types->count + 1);
            auto unique_type = &unique_types->base[unique_types->count - 1];
            *unique_type = {};
            unique_type->node = get_base_node(unique_function_type);
            
            base_type = unique_type->node;
        } break;
    }
    
    type.base_type.node = base_type;
    type.name_type = type.base_type;
    
    return type;
}

struct u32_list_entry
{
    u32_list_entry *next;
    u32 value;
};

struct dependency_node
{
    ast_node       *node;
    u32_list_entry *children;
    bool is_root;
};

buffer_type(dependency_node_buffer, dependency_node_array, dependency_node);

bucket_type(u32_list_entry_bucket, u32_list_entry, 1024);

struct dependency_graph
{
    dependency_node_buffer nodes;
    u32_list_entry_bucket *index_buckets;
};

u32 insert_node(dependency_graph *graph, ast_node *node)
{
    for (u32 i = 0; i < graph->nodes.count; i++)
    {
        if (graph->nodes.base[i].node == node)
            return i;
    }
    
    resize_buffer(&graph->nodes, graph->nodes.count + 1);
    auto entry = &graph->nodes.base[graph->nodes.count - 1];
    *entry = {};
    entry->node    = node;
    entry->is_root = true;
    
    return graph->nodes.count - 1;
}

bool is_ancestor_of(dependency_graph graph, u32 ancestor_index, u32 decendant_index)
{
    assert(ancestor_index < graph.nodes.count);
    assert(decendant_index < graph.nodes.count);
    assert(ancestor_index != decendant_index);
    
    auto ancestor = &graph.nodes.base[ancestor_index];
    for (auto child = ancestor->children; child; child = child->next)
    {
        if (child->value == decendant_index)
            return true;
    }
    
    for (auto child = ancestor->children; child; child = child->next)
    {
        if (is_ancestor_of(graph, child->value, decendant_index))
            return true;
    }
    
    return false;
}

void add_child(dependency_graph *graph, u32 parent_index, u32 child_index)
{
    assert(parent_index < graph->nodes.count);
    assert(child_index < graph->nodes.count);
    assert(parent_index != child_index);
    
    auto parent = &graph->nodes.base[parent_index];
    
    assert(!is_ancestor_of(*graph, child_index, parent_index), "cycle");
    
    for (auto child = parent->children; child; child = child->next)
    {
        if (child->value == child_index)
            return;
    }
    
    auto child = &graph->nodes.base[child_index];
    child->is_root = false;
    
    auto index_entry = new_bucket_item(&graph->index_buckets);
    index_entry->value = child_index;
    index_entry->next = parent->children;
    parent->children = index_entry;
}

void insert_dependency(dependency_graph *graph, ast_node *child, ast_node *parent)
{
    assert(child);
    u32 child_index = insert_node(graph, child);
    
    if (parent)
    {
        u32 parent_index = insert_node(graph, parent);
        add_child(graph, parent_index, child_index);
    }
}

#define insert_type_dependency_declaration void insert_type_dependency(dependency_graph *graph, ast_node *child, complete_type_info type)
insert_type_dependency_declaration;

void insert_expression_dependency(dependency_graph *graph, ast_node *child, ast_node *expression)
{
    switch (expression->node_type)
    {
        case ast_node_type_number:
        break;
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, expression);
            insert_dependency(graph, child, name_reference->reference);
        } break;
        
        case ast_node_type_compound_literal:
        {
            local_node_type(compound_literal, expression);
            
            for (auto field = compound_literal->first_field; field; field = (ast_compound_literal_field *) field->node.next)
            {
                insert_expression_dependency(graph, child, field->expression);
            }
        } break;
        
        case ast_node_type_array_literal:
        {
            local_node_type(array_literal, expression);
            
            for (auto item_expression = array_literal->first_expression; item_expression; item_expression = item_expression->next)
            {
                insert_expression_dependency(graph, child, item_expression);
            }
        } break;
    
        default:
        {
            if (is_unary_operator(expression))
            {
                auto unary_operator = (ast_unary_operator *) expression;
                insert_expression_dependency(graph, child, unary_operator->expression);
            }
            else if (is_binary_operator(expression))
            {
                auto binary_operator = (ast_binary_operator *) expression;
                insert_expression_dependency(graph, child, binary_operator->left);
                insert_expression_dependency(graph, child, binary_operator->right);
            }
            else
            {
                assert(0, "cases_complete");
            }
        }
    }
}

void insert_compound_dependency(dependency_graph *graph, ast_node *child, ast_compound_type *compound_type)
{
    for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
    {
        insert_type_dependency(graph, child, field->type);
    }
}

insert_type_dependency_declaration
{
    auto name_type = type.name_type.node;
    if (!name_type)
    {
        insert_node(graph, child);
        return;
    }
        
    switch (name_type->node_type)
    {
        cases_complete;
    
        case ast_node_type_number_type:
        case ast_node_type_type_alias:
        {
            insert_dependency(graph, child, name_type);
        } break;
        
        case ast_node_type_enumeration_type:
        {
            local_node_type(enumeration_type, name_type);
            insert_type_dependency(graph, get_base_node(enumeration_type), enumeration_type->item_type);
            
            for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                insert_expression_dependency(graph, child, item->expression);
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, name_type);
    
            if (function_type->input.base_type.node)
            {
                auto input = get_node_type(compound_type, function_type->input.base_type.node);
                insert_compound_dependency(graph, child, input);
                
                //insert_compound_dependency(graph, name_type, input);
            }
            
            if (function_type->output.base_type.node)
            {
                auto output  = get_node_type(compound_type, function_type->output.base_type.node);
                insert_compound_dependency(graph, child, output);
                
                //insert_compound_dependency(graph, name_type, output);
            }
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, name_type);
            insert_compound_dependency(graph, child, compound_type);
            
            // we compound_type depends on its children
            //insert_compound_dependency(graph, name_type, compound_type);
        } break;

        case ast_node_type_array_type:
        {
            local_node_type(array_type, name_type);
            insert_type_dependency(graph, child, array_type->item_type);
        } break;
    }
}

#define for_bucket_item(bucket, index, bucket_array) \
for (auto bucket = bucket_array; bucket; bucket = bucket->next) \
    for (u32 index = 0; index < bucket->count; index++) 

ast_node_buffer sort_declaration_dependencies(lang_parser *parser)
{
    dependency_graph graph = {};
    defer
    {
        free_buffer(&graph.nodes);
        
        while(graph.index_buckets)
        {
            auto bucket = graph.index_buckets;
            graph.index_buckets = graph.index_buckets->next;
            platform_free_bytes((u8 *) bucket);
        }
    };
    
    // collect
    {
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            if (variable->is_global)
            {
                insert_type_dependency(&graph, get_base_node(variable), variable->type);
                //insert_expression_dependency(&graph, get_base_node(constant), variable->default_expression);
            }
        }
        
        for_bucket_item(bucket, index, parser->constant_buckets)
        {
            auto constant = &bucket->base[index];
            auto type = get_expression_type(parser, constant->expression);
            insert_type_dependency(&graph, get_base_node(constant), type);
            insert_expression_dependency(&graph, get_base_node(constant), constant->expression);
        }
        
    #if 0
        for_bucket_item(bucket, index, parser->enumeration_type_buckets)
        {
            auto enumeration_type = &bucket->base[index];
            insert_type_dependency(&graph, get_base_node(enumeration_type), enumeration_type->item_type);
            
            for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                insert_expression_dependency(&graph, get_base_node(enumeration_type), item->expression);
        }
    #endif
        
        for_bucket_item(bucket, index, parser->type_alias_buckets)
        {
            auto type_alias = &bucket->base[index];
            
            if (!type_alias->type.name_type.indirection_count)
            {
                auto name_type = type_alias->type.name_type.node;
                switch(name_type->node_type)
                {
                    case ast_node_type_function_type:
                    case ast_node_type_compound_type:
                    {
                        insert_dependency(&graph, get_base_node(type_alias), name_type);
                    } break;
                }
            }
            
            insert_type_dependency(&graph, get_base_node(type_alias), type_alias->type);
        }
        
        for_bucket_item(bucket, index, parser->function_buckets)
        {
            auto function = &bucket->base[index];
            
            if (!function->type.base_type.node)
                continue;
                
            local_node_type(function_type, function->type.base_type.node);
            
            if (function_type->input.base_type.node)
            {
                auto input = get_node_type(compound_type, function_type->input.base_type.node);
                insert_compound_dependency(&graph, get_base_node(function), input);
            }
            
            if (function_type->output.base_type.node)
            {
                auto output  = get_node_type(compound_type, function_type->output.base_type.node);
                insert_compound_dependency(&graph, get_base_node(function), output);
            }
            
            // add functions with no input and output as nodes, otherweise they won't be forward declared
            if (!function_type->input.base_type.node && !function_type->output.base_type.node)
                insert_node(&graph, get_base_node(function));
        }
    }
    
    //local_buffer(stack, u32_buffer);
    
    // sort
    ast_node_buffer ordered_dependencies = {};
    {
        local_buffer(stack, u32_buffer);
        
        local_buffer(node_depths, u8_buffer);
        resize_buffer(&node_depths, graph.nodes.count);
        
        // set all depths to 0
        memset(node_depths.base, 0, sizeof(node_depths.base[0]) * node_depths.count);
        
        u32 max_depth = 0;
        for (u32 root_index = 0; root_index < graph.nodes.count; root_index++)
        {
            auto root = &graph.nodes.base[root_index];
            if (!root->is_root)
                continue;
            
            // depth first search per root
            
            // printf("dependency root [0x%p] '%.*s' %.*s\n", root->node, fs(get_name(root->node)), fs(ast_node_type_names[root->node->node_type]));
            
            resize_buffer(&stack, 1);
            stack.base[0] = root_index;
            assert(node_depths.base[root_index] == 0);
            
            while (stack.count)
            {
                auto index = stack.base[--stack.count];
                auto entry = graph.nodes.base[index];
            
                for (auto child_entry = entry.children; child_entry; child_entry = child_entry->next)
                {
                    auto child_index = child_entry->value;
                    auto child = &graph.nodes.base[child_index];
                    
                    assert(!child->is_root);
                    
                    if (node_depths.base[child_index] < node_depths.base[index] + 1)
                    {
                        resize_buffer(&stack, stack.count + 1);
                        stack.base[stack.count - 1] = child_index;
                        
                        node_depths.base[child_index] = node_depths.base[index] + 1;
                        max_depth = maximum(max_depth, node_depths.base[child_index]);
                    }
                }
            }
        }
        
        for (u32 depth = 0; depth <= max_depth; depth++)
        {
            for (u32 i = 0; i < graph.nodes.count; i++)
            {
                if (node_depths.base[i] == depth)
                {
                    auto entry = graph.nodes.base[i];
                    resize_buffer(&ordered_dependencies, ordered_dependencies.count + 1);
                    ordered_dependencies.base[ordered_dependencies.count - 1] = entry.node;
                }
            }
        }
    
        // check if ordered_dependencies are correct
        {
            assert(graph.nodes.count == ordered_dependencies.count);
        
            for (u32 i = 0; i < graph.nodes.count; i++)
            {
                // children depend on parent
                // so all its chilren must be inserted before the parent
                
                auto entry = graph.nodes.base[i];
                auto parent = entry.node;
                
                u32 ordered_parent_index = 0;
                for (; ordered_parent_index < ordered_dependencies.count; ordered_parent_index++)
                {
                    if (ordered_dependencies.base[ordered_parent_index] == parent)
                        break;
                }
                
                assert(ordered_parent_index < ordered_dependencies.count);
                
                for (auto child_entry = entry.children; child_entry; child_entry = child_entry->next)
                {
                    auto child_index = child_entry->value;
                    auto child = graph.nodes.base[child_index].node;
                    
                    // child must come after the parent
                    u32 ordered_child_index = ordered_parent_index + 1;
                    for (; ordered_child_index < ordered_dependencies.count; ordered_child_index++)
                    {
                        if (ordered_dependencies.base[ordered_child_index] == child)
                            break;
                    }
                    
                    assert(ordered_parent_index < ordered_child_index,"'%.*s' (%.*s) [%i] depends on '%.*s' (%.*s) [%i], but is in wrong order", fs(get_name(child)), fnode_type_name(child), node_depths.base[child_index], fs(get_name(parent)), fnode_type_name(parent), node_depths.base[i]);
                }
            }
        }
    }
    
    return ordered_dependencies;
}

lang_c_buffer compile(lang_parser *parser, lang_c_compile_settings settings = {})
{
    lang_c_buffer buffer = {};
    buffer.settings = settings;
    buffer.parser = parser;

    if (!buffer.settings.use_default_types)
    {
    
    }

    auto builder = &buffer.builder;

    print_line(builder, "// generated with lang_c compiler");
    print_newline(builder);
    print_line(builder, "#include <stdio.h>");
    print_line(builder, "#include <windows.h>");    
    print_newline(builder);
    print_line(builder, "#pragma comment(lib, \"user32\")");
    print_line(builder, "#pragma comment(lib, \"gdi32\")");
    
    string name_buffer = { carray_count(_lang_c_base_type_name_buffer), _lang_c_base_type_name_buffer };
    
    if (!buffer.settings.use_default_types)
    {
        print_newline(builder);
        lang_c_base_type_names[lang_c_base_type_null]    = write(&name_buffer, "%.*snull", fs(buffer.settings.prefix));
        lang_c_base_type_names[lang_c_base_type_cstring] = write(&name_buffer, "%.*scstring", fs(buffer.settings.prefix));
    
        print_newline(builder);
    
        for (u32 i = 0; i < 4; i++)
        {
            u32 bit_count = (8 << i);
            
            lang_c_base_type_names[lang_c_base_type_u8 + i] = write(&name_buffer, "%.*su%i", fs(buffer.settings.prefix), bit_count);
            lang_c_base_type_names[lang_c_base_type_s8 + i] = write(&name_buffer, "%.*ss%i", fs(buffer.settings.prefix), bit_count);
            
            print_line(builder, "typedef unsigned __int%i %.*su%i;", bit_count, fs(buffer.settings.prefix), bit_count);
            print_line(builder, "typedef   signed __int%i %.*ss%i;", bit_count, fs(buffer.settings.prefix), bit_count);
        }
        
        lang_c_base_type_names[lang_c_base_type_usize] = write(&name_buffer, "%.*susize", fs(buffer.settings.prefix));
        lang_c_base_type_names[lang_c_base_type_ssize] = write(&name_buffer, "%.*sssize", fs(buffer.settings.prefix));
        
        lang_c_base_type_names[lang_c_base_type_f32] = write(&name_buffer, "%.*sf32", fs(buffer.settings.prefix));
        lang_c_base_type_names[lang_c_base_type_f64] = write(&name_buffer, "%.*sf64", fs(buffer.settings.prefix));
        
        print_newline(builder);
        print_line(builder, "typedef %.*su64 %.*susize;", fs(buffer.settings.prefix), fs(buffer.settings.prefix));
        print_line(builder, "typedef %.*ss64 %.*sssize;", fs(buffer.settings.prefix), fs(buffer.settings.prefix));
        
        print_newline(builder);
        print_line(builder, "typedef float  %.*sf32;", fs(buffer.settings.prefix));
        print_line(builder, "typedef double %.*sf64;", fs(buffer.settings.prefix));
        
        // since char and unsgined char and signed char are not the same according to C ...
        print_newline(builder);
        print_line(builder, "typedef char *%.*scstring;", fs(buffer.settings.prefix));
        
        print_newline(builder);
        print_line(builder, "#define %.*snull 0", fs(buffer.settings.prefix));
    }
    
    auto root = get_base_node(parser->file_list.first);
    
    ast_list_entry *first_external_binding = null;
    auto external_binding_tail_next = &first_external_binding;
    
    // collect and print all external bindings
    {
        maybe_print_blank_line(builder);
        
        for (auto bucket = parser->function_buckets; bucket; bucket = bucket->next)
        {
            for (u32 i = 0; i < bucket->count; i++)
            {
                auto function = &bucket->base[i];
                
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
                        new_entry->node  = get_base_node(external_binding);
                        
                        *external_binding_tail_next = new_entry;
                        external_binding_tail_next = &new_entry->next;
                        
                        print_line(builder, "#pragma comment(lib, \"%.*s\")", fs(external_binding->library_name));
                    }
                }
            }
        }
    }
    
    local_buffer(unique_types, unique_type_buffer);
    
    {
        auto ordered_dependencies = sort_declaration_dependencies(parser);
        defer { free_buffer(&ordered_dependencies); };
        
    #if 0
        for (u32 i = 0; i < ordered_dependencies.count; i++)
        {
            auto node = ordered_dependencies.base[i];
            printf("dependency [0x%p] '%.*s' %.*s", node, fnode_name(node), fnode_type_name(node));
            if (node->parent)
                printf(", parent [0x%p] '%.*s' %.*s\n", node->parent, fnode_name(node->parent), fnode_type_name(node->parent));
        }
    #endif
    
    
    // declare typedefs, structs and functions in order of dependency
        maybe_print_blank_line(builder);
        
        // forward declare unique types (structs, arrays and functions)
        for (u32 i = 0; i < buffer.unique_types.count; i++)
        {
            auto node = buffer.unique_types.base[i].node;
            
            switch (node->node_type)
            {
                case ast_node_type_compound_type:
                case ast_node_type_array_type:
                {
                    print_type(&buffer, node);
                    print_line(builder, ";");
                } break;
            }
            
            //printf("unique type [0x%p] %x %.*s '%.*s'\n", node, node->index, fnode_type_name(node), fs(get_name(node)));
        }
        
        // printf("ordered dependencies\n");
        
        for (u32 i = 0; i < ordered_dependencies.count; i++)
        {
            auto node = ordered_dependencies.base[i]; //ordered_dependencies.count - 1 - i];

        #if 0
            printf("dependency [0x%p] '%.*s' %.*s", node, fnode_name(node), fnode_type_name(node));
            if (node->parent)
                printf(" ,parent [0x%p] '%.*s' %.*s\n", node->parent, fnode_name(node->parent), fnode_type_name(node->parent));
        #endif
            
            // filter some declarations that would clash with C
            {
                bool do_skip = false;
                
                string skip_list[] =
                {
                    lang_base_type_names[lang_base_type_cstring],
                    lang_base_constant_names[lang_base_constant_null],
                    lang_base_constant_names[lang_base_constant_false],
                    lang_base_constant_names[lang_base_constant_true],
                };
                
                auto node_name = get_name(node);
                for (u32 i = 0; i < carray_count(skip_list); i++)
                {
                    if (node_name == skip_list[i])
                    {
                        do_skip = true;
                        break;
                    }
                }
                
                if (do_skip)
                    continue;
            }
            
            switch (node->node_type)
            {
                cases_complete_message("%.*s", fs(ast_node_type_names[node->node_type]));
                                
                case ast_node_type_module:
                case ast_node_type_number_type:
                 // assumed to be part of type alias
                case ast_node_type_enumeration_type:
                case ast_node_type_function_type:
                case ast_node_type_compound_type:
                break;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, node);
                    assert(variable->is_global);
                
                    print_statement(&buffer, node);
                } break;
                
            #if 0
                case ast_node_type_compound_type:
                {
                    local_node_type(compound_type, node);
                    
                    maybe_print_blank_line(builder);
                    
                    print_type(&buffer, node);
                    
                    print_scope_open(builder);
                
                    for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                    {
                        print_declaration(&buffer, field);
                        print_line(builder, ";");
                    }
                    
                    print_scope_close(builder, false);
                    print_line(builder, ";");
                    print_newline(builder);
                } break;
                
                case ast_node_type_function_type:
                {
                    local_node_type(function_type, node);
                    
                    print(builder, "typedef ");
                    print_function_type(&buffer, function_type, {});
                    print_line(builder, ";");
                } break;
                
            #endif
            
                case ast_node_type_array_type:
                {
                    local_node_type(array_type, node);
                    
                    if (array_type->count_expression)
                        break;
                    
                    maybe_print_blank_line(builder);
                    
                    print_type(&buffer, node);
                    
                    print_scope_open(builder);
                
                    print_line(builder, "usize count;");
                    
                    print_type(&buffer, array_type->item_type, s("*base"));
                    print_line(builder, ";");
                    
                    print_scope_close(builder, false);
                    print_line(builder, ";");
                    print_newline(builder);
                } break;
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    
                    auto name = type_alias->name;
                    auto base_type = type_alias->type.base_type.node;
                    
                    if (type_alias->type.base_type.node && !type_alias->type.base_type.indirection_count && !is_node_type(base_type, number_type))
                    {
                        switch (base_type->node_type)
                        {
                            default:
                            {
                                print(builder, "typedef ");
                                print_type(&buffer, type_alias->type, name);
                                        
                                print_line(builder, ";");
                            } break;
                            
                            case ast_node_type_function_type:
                            {
                                local_node_type(function_type, base_type);
                                
                                print(builder, "typedef ");
                                print_function_type(&buffer, function_type, type_alias->name, true);
                                print_line(builder, ";");
                            } break;
                            
                            case ast_node_type_compound_type:
                            {
                                local_node_type(compound_type, base_type);
                                
                                maybe_print_blank_line(builder);
                                
                                print_line(builder, "typedef struct");
                                print_scope_open(builder);
                            
                                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                                {
                                    print_declaration(&buffer, field);
                                    print_line(builder, ";");
                                }
                                
                                print_scope_close(builder, false);
                                print_line(builder, " %.*s;", fs(type_alias->name));
                                print_newline(builder);
                            } break;
                            
                            case ast_node_type_array_type:
                            {
                                local_node_type(array_type, base_type);
                                
                                if (array_type->count_expression)
                                    break;
                                
                                maybe_print_blank_line(builder);
                                
                                print_line(builder, "typedef struct");
                                print_scope_open(builder);
                            
                                print_line(builder, "usize count;");
                                
                                print_type(&buffer, array_type->item_type, s("*base"));
                                print_line(builder, ";");
                                
                                print_scope_close(builder, false);
                                print_line(builder, " %.*s;", fs(type_alias->name));
                                print_newline(builder);
                            } break;
                            
                            case ast_node_type_enumeration_type:
                            {
                                local_node_type(enumeration_type, base_type);
                                
                                maybe_print_blank_line(builder);
                                print(builder, "typedef ");
                                print_type(&buffer, enumeration_type->item_type, name);
                                print_line(builder, ";");

                                //print_scope_open(builder);
                                
                                bool is_not_first = false;
                                
                                ast_enumeration_item *last_item_with_expression = null;
                                u32 value = 0;
                                
                                for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                                {
                                    print(builder, "const %.*s %.*s_%.*s = ", fs(name), fs(name), fs(item->name));
                                    
                                    if (item->expression)
                                    {
                                        print_expression(&buffer, item->expression);
                                        last_item_with_expression = item;
                                        value = 0;
                                    }
                                    else if (last_item_with_expression)
                                    {
                                        print(builder, "%.*s_%.*s + %i", fs(name), fs(last_item_with_expression->name), value);
                                    }
                                    else
                                    {
                                        print(builder, "%i", value);
                                    }
                                    
                                    value++;
                                    
                                    print_line(builder, ";");
                                }
                                
                                print_newline(builder);
                            } break;
                        }
                    }
                    else
                    {
                        print(builder, "typedef ");
                        print_type(&buffer, type_alias->type, type_alias->name);
                        print_line(builder, ";");
                    }
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    
                    auto function_type = get_function_type(parser, function);
          
                    if (function->first_statement && (function->first_statement->node_type == ast_node_type_external_binding))
                    {
                        local_node_type(external_binding, function->first_statement);
                        
                        print(builder, "extern \"C\" ");
                        
                        if (external_binding->is_dll)
                            print(builder, "__declspec(dllimport) ");
                    }
                    
                    print_function_type(&buffer, function_type, function->name, false);
                    
                    print_line(builder, ";");
                } break;                
                
                case ast_node_type_array_literal:
                {
                    maybe_print_blank_line(builder);
                    
                    local_node_type(array_literal, node);
                    
                    local_node_type(array_type, array_literal->type.name_type.node);
                    
                    maybe_print_blank_line(builder);
                    print_type(&buffer, array_type->item_type);
                    print(builder, " _array_literal_%x_base[%llu] =", node->index, array_literal->item_count);
                    
                    print_scope_open(builder);
    
                    for (auto it = array_literal->first_expression; it; it = it->next)
                    {
                        print_expression(&buffer, it);
                        print_line(builder, ",");
                    }
        
                    print_scope_close(builder, false);
                    print_line(builder, ";");
                    
                    auto type_without_count = *array_type;
                    type_without_count.count_expression = null;
                    print_type(&buffer, get_base_node(&type_without_count));
                    print_line(builder, " _array_literal_%x = { %llu, _array_literal_%x_base };", node->index, array_literal->item_count, node->index);
                    print_newline(builder);
                } break;
                
                case ast_node_type_compound_literal:
                {
                    maybe_print_blank_line(builder);
                    
                    local_node_type(compound_literal, node);
                    
                    local_node_type(compound_type, compound_literal->type.base_type.node);
                    
                    maybe_print_blank_line(builder);
                    print_type(&buffer, compound_literal->type);
                    print_line(builder, " _compound_literal_%x =", node->index);
                    
                    print_scope_open(builder);
    
                    // TODO: make sure order is correct
                    for (auto field = compound_literal->first_field; field; field = (ast_compound_literal_field *) field->node.next)
                    {
                        print_expression(&buffer, field->expression);
                        print_line(builder, ",");
                    }
        
                    print_scope_close(builder, false);
                    print_line(builder, ";");
                    
                    print_newline(builder);
                } break;
                
                case ast_node_type_constant:
                {
                    local_node_type(constant, node);
                    
                    auto type = get_expression_type(parser, constant->expression);
                    print(builder, "const ");
                    print_type(&buffer, type, constant->name);
                    
                    if (!try_print_literal_assignment(&buffer, constant->expression))
                    {
                        print(builder, " = ");
                        print_expression(&buffer, constant->expression);
                        print_line(builder, ";");
                    }
                } break;
            }
        }
    }
    
    // declare all global variables
    {
        maybe_print_blank_line(builder);
    
        local_buffer(queue, ast_queue);
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
                print_line(builder, ";");
            }
        }
    }

    // declare all functions
    {
        local_buffer(queue, ast_queue);
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
                
                maybe_print_blank_line(builder);
                
                print_function_type(&buffer, function_type, function->name, false);
                
                print_scope_open(builder);
    
                if (function->first_statement)
                    print_statements(&buffer, function->first_statement);
    
                print_scope_close(builder);
            }
        }
    }

    maybe_print_blank_line(builder);
    print_line(builder, "void main(%.*s argument_count, %.*s arguments[])", fs(lang_c_base_type_names[lang_c_base_type_s32]), fs(lang_c_base_type_names[lang_c_base_type_cstring]));

    print_scope_open(builder);

    for (auto file = parser->file_list.first; file; file = (ast_file *) file->node.next)
    {
        maybe_print_blank_line(builder);
        print_line(builder, "// file: %.*s", fs(file->path));
        //print_line(builder, "#line 1 \"%.*s\"", fs(file->path));
        print_newline(builder);

        if (file->first_statement)
            print_statements(&buffer, file->first_statement);
    }
    
    print_scope_close(builder);
    
    return buffer;
}

void clear(lang_c_buffer *buffer)
{
    free_buffer(&buffer->builder.memory);
    free_buffer(&buffer->unique_types);
}