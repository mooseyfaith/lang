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
    
    type = get_unique_type(buffer, type);
    
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

void print_declaration(lang_c_buffer *buffer, ast_variable *variable)
{
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
                    print(builder, "%.*s", fs(variable->name));
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node_reference->reference);
                    print(builder, "%.*s", fs(function->name));
                } break;
            }
        } break;
        */
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
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
                        if (array_type->count_expression)
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
            if (is_prefix_operator(node))
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
            auto comment = buffer->parser->node_comment_buffer.base[node->index];
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
                    continue;
                
                print_declaration(buffer, variable);
                print_line(builder, " = {};");
            } break;
            
            case ast_node_type_assignment:
            {
                local_node_type(assignment, node);
                
            #if 0
                if (is_node_type(assignment->right, compound_literal) || is_node_type(assignment->right, array_literal))
                {
                    u32 byte_count;
                    
                    if (is_node_type(assignment->right, compound_literal))
                    {
                        local_node_type(compound_literal, assignment->right)
                        byte_count = get_type_byte_count(compound_literal->type).byte_count;
                    }
                    else
                    {
                        local_node_type(array_literal, assignment->right)
                        local_node_type(array_type, array_literal->type.base_type.node);
                        
                        byte_count = get_type_byte_count(array_type->item_type).byte_count * array_literal->item_count;
                    }
                
                    print(builder, "memcpy((u8 *) &(");
                    print_expression(buffer, assignment->left);
                    print(builder, "), (u8 *) (");
                    print_expression(buffer, assignment->right);
                    print(builder, ").base, %llu)", byte_count);
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
                print_statements(buffer, loop_with_counter->first_counter_statement);
                
                string counter_name = get_name(loop_with_counter->first_counter_statement);
                assert(counter_name.count);
                
                print(builder, "%.*s <", fs(counter_name));
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
            auto variable = compound_type->first_field->variable;
            print_type(buffer, variable->type);
        }
    }
    else
    {
        print(builder, "void");
    }
}

void print_function_type(lang_c_buffer *buffer, ast_function_type *function_type, string name)
{    
    auto builder = &buffer->builder;

    print_function_return_type(buffer, function_type);
    
    if (name.count)
        print(builder, " %.*s(", fs(name));
    else
    {
        print(builder, " (*");
        print_type(buffer, get_base_node(function_type));
        print(builder, ")(");
    }
    
    bool is_not_first = false;
    
    if (function_type->input.base_type.node)
    {
        local_node_type(compound_type, function_type->input.base_type.node);
        
        for (auto argument = compound_type->first_field; argument; argument = (ast_compound_type_field *) argument->node.next)
        {
            auto variable = argument->variable;
            
            if (is_not_first)
                print(builder, ", ");
                    
            print_declaration(buffer, variable);
                
            is_not_first = true;
        }
    }
    
    print(builder, ")");
}

struct node_dependency
{
    u32_buffer children; // dependencies
    ast_node     *node;
    bool is_root;
};

buffer_type(node_dependency_buffer, node_dependency_array, node_dependency);

u32 insert(node_dependency_buffer *buffer, ast_node *node)
{
    for (u32 i = 0; i < buffer->count; i++)
    {
        if (buffer->base[i].node == node)
            return i;
    }
    
    resize_buffer(buffer, buffer->count + 1);
    buffer->base[buffer->count - 1] = {};
    buffer->base[buffer->count - 1].node = node;
    buffer->base[buffer->count - 1].is_root = true;
    
    return buffer->count - 1;
}

bool is_ancestor_of(node_dependency_buffer dependencies, u32 ancestor_index, u32 decendent_index)
{
    assert(ancestor_index < dependencies.count);
    assert(decendent_index < dependencies.count);

    auto ancestor_entry = &dependencies.base[ancestor_index];
    for (u32 i = 0; i < ancestor_entry->children.count; i++)
    {
        auto child_index = ancestor_entry->children.base[i];
        if (child_index == decendent_index)
            return true;
    }
    
    for (u32 i = 0; i < ancestor_entry->children.count; i++)
    {
        auto child_index = ancestor_entry->children.base[i];
        if (is_ancestor_of(dependencies, child_index, decendent_index))
            return true;
    }
    
    return false;
}

// TODO: add cycle check
void insert_child(node_dependency_buffer *dependencies, ast_node *parent, ast_node *child)
{
    assert(child);
    
    u32 child_index = insert(dependencies, child);
    
    if (parent)
    {
        u32 parent_index = insert(dependencies, parent);
        assert(parent_index != child_index);
        
        assert(!is_ancestor_of(*dependencies, child_index, parent_index), "cycle");
        
        auto parent_entry = &dependencies->base[parent_index];
        
        for (u32 i = 0; i < parent_entry->children.count; i++)
        {
            if (parent_entry->children.base[i] == child_index)
                return;
        }
            
        resize_buffer(&parent_entry->children, parent_entry->children.count + 1);
        parent_entry->children.base[parent_entry->children.count - 1] = child_index;
        
        auto child_entry = &dependencies->base[child_index];
        child_entry->is_root = false;
        
        //printf("n%x%.*s -> n%x%.*s\n", parent->index, fs(get_name(parent)), child->index, fs(get_name(child)));
        
        //printf("[%p] '%.*s' %.*s depends on [%p] '%.*s' %.*s\n", child, fs(get_name(child)), fnode_type_name(child), parent, fs(get_name(parent)), fnode_type_name(parent));
    }
}

#define insert_type_child_declaration void insert_type_child(lang_c_buffer *buffer, node_dependency_buffer *dependencies, complete_type_info type, ast_node *node)
insert_type_child_declaration;

void insert_declarations(lang_c_buffer *buffer, node_dependency_buffer *dependencies, ast_compound_type *compound_type)
{
    complete_type_info type = {};
    type.base_type.node = get_base_node(compound_type);
    type = get_unique_type(buffer, type);
    
    compound_type = get_node_type(compound_type, type.name_type.node);

    for (auto it = compound_type->first_field; it; it = (ast_compound_type_field *) it->node.next)
    {
        auto variable = it->variable;
        
        insert_type_child(buffer, dependencies, variable->type, get_base_node(compound_type));
    }
}

void insert_function_type_dependencies(lang_c_buffer *buffer, node_dependency_buffer *dependencies, ast_function_type *function_type)
{
    complete_type_info type = {};
    type.name_type.node = get_base_node(function_type);
    type.base_type = type.name_type;
    type = get_unique_type(buffer, type);
    
    function_type = get_node_type(function_type, type.name_type.node);

    insert_type_child(buffer, dependencies, function_type->input,  get_base_node(function_type));
    insert_type_child(buffer, dependencies, function_type->output, get_base_node(function_type));
}

// node depends on type
insert_type_child_declaration
{
    type = get_unique_type(buffer, type);
    insert_child(dependencies, type.name_type.node, node);
}

bool unique_declarations_match(lang_c_buffer *buffer, ast_compound_type_field *first_unique_field, ast_compound_type_field *first_field)
{
    auto unique_field = first_unique_field;
    
    for (auto field = first_field; field; field = (ast_compound_type_field *) field->node.next)
    {
        if (!unique_field)
            return false;
    
        auto variable = field->variable;
        
        auto unique_variable = unique_field->variable;
        
        if (variable->name != unique_variable->name)
            return false;
        
        auto field_type = get_unique_type(buffer, variable->type);
        auto unique_field_type = unique_variable->type;
        
        if ((field_type.name_type.node && (field_type.name_type.node != unique_field_type.name_type.node)) || (!field_type.name_type.node && (field_type.name != unique_field_type.name)) || (field_type.name_type.indirection_count != unique_field_type.name_type.indirection_count))
           return false;
        
        unique_field = (ast_compound_type_field *) unique_field->node.next;
    }
    
    return (unique_field == null);
}

ast_compound_type_field * add_unique_declarations(lang_c_buffer *buffer, ast_compound_type_field *first_field)
{
    auto parser = buffer->parser;
    
    base_single_list unique_field_list;
    begin_list(&unique_field_list);
    
    for (auto field = first_field; field; field = (ast_compound_type_field *) field->node.next)
    {
        auto variable = field->variable;
        auto field_type = get_unique_type(buffer, variable->type);
    
        auto unique_field = new_leaf_node(compound_type_field);
    
        auto unique_variable = new_leaf_node(variable);
        unique_variable->name = variable->name;
        unique_variable->type = field_type;
        
        unique_field->variable = unique_variable;
        
        append_list(&unique_field_list, &unique_field->node);
    }
    
    return (ast_compound_type_field *) unique_field_list.first;
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
                auto unique_array_type = new_leaf_node(array_type);
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
            
            auto unique_compound_type = new_leaf_node(compound_type);
            
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
            
            auto unique_function_type = new_leaf_node(function_type);
            
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

void add_dependencies(lang_c_buffer *buffer, node_dependency_buffer *dependencies, ast_node *node, ast_node *parent = null)
{
    switch (node->node_type)
    {
        case ast_node_type_type_alias:
        {
            local_node_type(type_alias, node);
                                
            insert_type_child(buffer, dependencies, type_alias->type, node);
        } break;
        
        case ast_node_type_function:
        {
            local_node_type(function, node);
            
            insert_type_child(buffer, dependencies, function->type, node);
        } break;
        
        case ast_node_type_array_literal:
        {
            local_node_type(array_literal, node);
            insert_type_child(buffer, dependencies, array_literal->type, node);
            
            for (auto it = array_literal->first_expression; it; it = it->next)
            {
                add_dependencies(buffer, dependencies, it, node);
            }
        } break;
        
        case ast_node_type_compound_literal:
        {
            local_node_type(compound_literal, node);
            insert_type_child(buffer, dependencies, compound_literal->type, node);
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, node);
            insert_function_type_dependencies(buffer, dependencies, function_type);
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, node);
            insert_declarations(buffer, dependencies, compound_type);
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, node);
            
            auto array_type_without_count = *array_type;
            array_type_without_count.count_expression = null;
            
            complete_type_info type = {};
            type.name_type.node = get_base_node(&array_type_without_count);
            type.base_type = type.name_type;
            type = get_unique_type(buffer, type);
            
            auto unique_array_type_without_count = get_node_type(array_type, type.name_type.node);
            
            auto item_type = unique_array_type_without_count->item_type;
            item_type.name_type.indirection_count++;
            if (item_type.name_type.node == item_type.base_type.node)
                item_type.base_type.indirection_count++;
            
            insert_type_child(buffer, dependencies, item_type, get_base_node(unique_array_type_without_count));
            
            if (array_type->count_expression)
                insert_type_child(buffer, dependencies, item_type, get_base_node(array_type));
        } break;
    
        // allways assumed to be preceded by a type alias
    #if 1
        case ast_node_type_enumeration_type:
        break;
    #else
        case ast_node_type_enumeration_type:
        {
            local_node_type(enumeration_type, node);
            
            insert_type_child(buffer, dependencies, enumeration_type->item_type, &enumeration_type->node);
        } break;
    #endif
    
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            
            if (parent)
                insert_child(dependencies, name_reference->reference, parent);
        } break;
    
        case ast_node_type_constant:
        {
            local_node_type(constant, node);
            
            insert_child(dependencies, parent, node);
            add_dependencies(buffer, dependencies, constant->expression, node);
        } break;
    }
}

string compile(lang_parser *parser, lang_c_compile_settings settings = {})
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
        
        print_newline(builder);
        print_line(builder, "#define %.*snull 0", fs(buffer.settings.prefix));
        
        // since unsigned char, signed char and char are different for c++, IDIOTS!
        print_newline(builder);
        print_line(builder, "typedef char * %.*scstring;", fs(buffer.settings.prefix));
        
        // HACK: compiler should resolve this call internally an generate proper expressions
        print_newline(builder);
        print_line(builder, "#define get_call_location() code_location{ \"\", __FILE__, __FUNCTION__, __LINE__, 0 }");
    }
    
    auto root = get_base_node(parser->file_list.first);
    
    ast_list_entry *first_external_binding = null;
    auto external_binding_tail_next = &first_external_binding;
    
    // collect and print all external bindings
    {
        maybe_print_blank_line(builder);
        
        local_buffer(queue, ast_queue);
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
    
    // declare typedefs, structs and functions in order of dependency
    {
        local_buffer(dependencies, node_dependency_buffer);
        defer
        {
            for (u32 i = 0; i < dependencies.count; i++)
                free_buffer(&dependencies.base[i].children);
        };
    
        local_buffer(queue, ast_queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            add_dependencies(&buffer, &dependencies, node);
        }
        
        local_buffer(stack, u32_buffer);
        
        local_buffer(node_depths, u8_buffer);
        resize_buffer(&node_depths, dependencies.count);
        
        // set all depths to 0
        memset(node_depths.base, 0, sizeof(node_depths.base[0]) * node_depths.count);
        
        u32 max_depth = 0;
        for (u32 root_index = 0; root_index < dependencies.count; root_index++)
        {
            auto root = &dependencies.base[root_index];
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
                auto entry = dependencies.base[index];
            
                for (u32 i = 0; i < entry.children.count; i++)
                {
                    auto child_index = entry.children.base[entry.children.count - 1 - i];
                    auto child = &dependencies.base[child_index];
                    
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
        
        local_buffer(ordered_dependencies, ast_node_buffer);
        
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
    
        // check if ordered_dependencies are correct
        {
            assert(dependencies.count == ordered_dependencies.count);
        
            for (u32 i = 0; i < dependencies.count; i++)
            {
                // children depend on parent
                // so all its chilren must be inserted before the parent
                
                auto entry = dependencies.base[i];
                auto parent = entry.node;
                
                u32 ordered_parent_index = 0;
                for (; ordered_parent_index < ordered_dependencies.count; ordered_parent_index++)
                {
                    if (ordered_dependencies.base[ordered_parent_index] == parent)
                        break;
                }
                
                assert(ordered_parent_index < ordered_dependencies.count);
                
                for (u32 child_slot = 0; child_slot < entry.children.count; child_slot++)
                {
                    u32 child_index = entry.children.base[child_slot];
                    auto child = dependencies.base[child_index].node;
                    
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
        
        for (u32 i = 0; i < ordered_dependencies.count; i++)
        {
            auto node = ordered_dependencies.base[i]; //ordered_dependencies.count - 1 - i];

            //printf("dependency [0x%p] '%.*s' %.*s\n", node, fs(get_name(node)), fs(ast_node_type_names[node->node_type]));
                
            switch (node->node_type)
            {
                cases_complete_message("%.*s", fs(ast_node_type_names[node->node_type]));
                                
                case ast_node_type_number_type:
                case ast_node_type_enumeration_type: // assumed to be part of type alias
                break;
                
                case ast_node_type_compound_type:
                {
                    local_node_type(compound_type, node);
                    
                    maybe_print_blank_line(builder);
                    
                    print_type(&buffer, node);
                    
                    print_scope_open(builder);
                
                    for (auto field = compound_type->first_field; field; field = (ast_compound_type_field *) field->node.next)
                    {
                        print_declaration(&buffer, field->variable);
                        print_line(builder, ";");
                    }
                    
                    print_scope_close(builder, false);
                    print_line(builder, ";");
                    print_newline(builder);
                } break;
                
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
                
                case ast_node_type_function_type:
                {
                    local_node_type(function_type, node);
                    
                    print(builder, "typedef ");
                    print_function_type(&buffer, function_type, {});
                    print_line(builder, ";");
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
                    
                    print_function_type(&buffer, function_type, function->name);
                    
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
                    print(builder, " = ");
                    print_expression(&buffer, constant->expression);
                    print_line(builder, ";");
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
                
                print_function_type(&buffer, function_type, function->name);
                
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
    
    string data = builder->memory.array;
    return data;
}