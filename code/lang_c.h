#pragma once

#include "lang.h"

struct lang_c_compile_settings
{
    string prefix;
    bool use_default_types;
};


struct u32_list_entry
{
    u32_list_entry *next;
    u32 value;
};

struct dependency_node
{
    ast_node       *node;
    u32_list_entry *children;
    bool is_root, is_required;
};

buffer_type(dependency_node_buffer, dependency_node_array, dependency_node);

bucket_array_type(u32_list_entry_bucket, u32_list_entry, 1024);

struct dependency_graph
{
    lang_parser *parser;
    dependency_node_buffer nodes;
    u32_list_entry_bucket_array index_buckets;
    
    ast_array_type_bucket_array    unique_array_type_buckets;
    ast_compound_type_bucket_array unique_compound_type_buckets;
    ast_function_type_bucket_array unique_function_type_buckets;
    
    u32_buffer sorted_dependencies;
};

struct lang_c_buffer
{
    lang_parser *parser;
    lang_c_compile_settings settings;
    dependency_graph graph;
    string_builder builder;
    u32 comment_depth;
};

// since C/C++ don't support nested comments

void print_comment_begin(lang_c_buffer *buffer)
{
    if (!buffer->comment_depth)
        print(&buffer->builder, "/* ");
    
    buffer->comment_depth++;
}

void print_comment_end(lang_c_buffer *buffer)
{
    assert(buffer->comment_depth);
    buffer->comment_depth--;
    
    if (!buffer->comment_depth)
        print(&buffer->builder, " */ ");
}

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

#define print_expression_declaration void print_expression(lang_c_buffer *buffer, ast_node *node, ast_node_table *expression_to_local_map, bool is_inside_array_literal)
print_expression_declaration;

#define print_statements_declaration void print_statements(lang_c_buffer *buffer, ast_node *first_statement)
print_statements_declaration;

void print_type(lang_c_buffer *buffer, complete_type_info type, string variable_name = {})
{
    auto builder = &buffer->builder;
    
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
            
            case ast_node_type_alias_type:
            {
                local_node_type(alias_type, name_type.node);
                print(builder, "%.*s", fs(alias_type->name));
            } break;
            
            case ast_node_type_expression_reference_type:
            {
                local_node_type(expression_reference_type, name_type.node);
                
                print_comment_begin(buffer);
                print(builder, "type_of(");
                print_expression(buffer, expression_reference_type->expression, null, false);
                print(builder, ")");
                print_comment_end(buffer);
                
                print_type(buffer, expression_reference_type->type);
            } break;
            
            case ast_node_type_array_type:
            {
                local_node_type(array_type, name_type.node);
                
                if (array_type->item_count_expression)
                {
                /*
                    print(builder, "struct");
                    print_scope_open(builder);
                    print_type(buffer, array_type->item_type, s("base["));
                    print_expression(buffer, array_type->count_expression);
                    print(builder, "];");
                    print_scope_close(builder, false);
                */
                    
                    print_type(buffer, array_type->item_type);
                    print(builder, "_array_type_%i", get_array_item_count(array_type));
                }
                else
                {
                    print_type(buffer, array_type->item_type);
                    print(builder, "_array_type", name_type.node->index);
                }
            } break;
            
            case ast_node_type_compound_type:
            {
                print(builder, "_compound_type_%x", name_type.node->index);
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
        print_comment_begin(buffer);
        print(builder, "not resolved", fs(type.name));
        print_comment_end(buffer);
        
        print(builder, " %.*s", fs(type.name));
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

void print_array_literal(lang_c_buffer *buffer, ast_array_literal *array_literal, ast_node_table *expression_to_local_map)
{
    auto builder = &buffer->builder;
    
    local_node_type(array_type, array_literal->type.base_type.node);
    
    // open two scopes since we wrap arrays into struct
    print_scope_open(builder);
    print_scope_open(builder);
    
    if (array_literal->first_expression)
    {
        print_expression(buffer, array_literal->first_expression, expression_to_local_map, true);
        for (auto expression = array_literal->first_expression->next; expression; expression = expression->next)
        {
            print_line(builder, ",");
            print_expression(buffer,  expression, expression_to_local_map, true);
        }
        
        pending_newline(builder);
    }
    
    print_scope_close(builder);
    print_scope_close(builder, false);
}

void print_compound_literal(lang_c_buffer *buffer, ast_compound_literal *compound_literal, ast_node_table *expression_to_local_map, bool is_inside_array_literal)
{
    auto builder = &buffer->builder;
    
    print_scope_open(builder, false);
    
    if (compound_literal->first_field)
    {
        // print(builder, "%.*s: ", fs(compound_literal->first_field->name)); C could do this
        print(builder, " ");
        print_expression(buffer, compound_literal->first_field->expression, expression_to_local_map, is_inside_array_literal);
        for (auto field = (ast_compound_literal_field *) compound_literal->first_field->node.next; field; field = (ast_compound_literal_field *) field->node.next)
        {
            print(builder, ", ");
            // print(builder, "%.*s: ", fs(field->name)); C could do this
            print_expression(buffer, field->expression, expression_to_local_map, is_inside_array_literal);
        }
        
        //print_newline(builder);
        print(builder, " ");
    }

    print_scope_close(builder, false);
}

void print_declaration(lang_c_buffer *buffer, ast_variable *variable)
{
    auto builder = &buffer->builder;
    print_type(buffer, variable->type, variable->name);
}

usize get_string_c_count(string text)
{
    usize count = 0;
    while (text.count)
    {
        // skip escaped character
        if (text.base[0] == '\\' && text.count > 1)
        {
            text.base++;
            text.count--;
        }
        
        text.base++;
        text.count--;
        count++;
    }
    
    return count;
}

ast_node * get_unique_node(dependency_graph *graph, ast_node *node)
{
    auto parser = graph->parser;
    
    switch (node->node_type)
    {
        case ast_node_type_number_type:
        case ast_node_type_enumeration_type:
        case ast_node_type_expression_reference_type:
        case ast_node_type_alias_type:
        default:
        {
            return node;
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, node);
            
            ast_node *input = null;
            if (function_type->input.name_type.node)
                input = get_unique_node(graph, function_type->input.name_type.node);
                
            ast_node *output = null;
            if (function_type->output.name_type.node)
                output = get_unique_node(graph, function_type->output.name_type.node);
            
            ast_function_type *unique_function_type = null;
            for_bucket_item(bucket, index, graph->unique_function_type_buckets)
            {
                auto other_function_type = &bucket->base[index];
                
                if ((input == other_function_type->input.name_type.node) && (output == other_function_type->output.name_type.node))
                {
                    unique_function_type = other_function_type;
                    break;
                }
            }
            
            if (!unique_function_type)
            {
                unique_function_type = new_bucket_item(&graph->unique_function_type_buckets);
                *unique_function_type = *function_type;
                unique_function_type->node.type_index = graph->unique_function_type_buckets.item_count - 1;
                
                unique_function_type->input = {};
                unique_function_type->input.name_type.node  = input;
                resolve_complete_type(parser, &unique_function_type->input);
                
                unique_function_type->output = {};
                unique_function_type->output.name_type.node  = output;
                resolve_complete_type(parser, &unique_function_type->output);
            }
            
            return get_base_node(unique_function_type);
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, node);
            
            ast_compound_type *unique_compound_type = null;
            for_bucket_item(bucket, index, graph->unique_compound_type_buckets)
            {
                auto other_compound_type = &bucket->base[index];
                
                if (compound_type->field_count != other_compound_type->field_count)
                    continue;
                
                bool do_match = true;
                
                auto right_field = compound_type->first_field;
                for (auto left_field = other_compound_type->first_field; left_field; left_field = (ast_variable *) left_field->node.next)
                {
                    if (left_field->name != right_field->name)
                    {
                        do_match = false;
                        break;
                    }
                        
                    auto unique_right_type = get_unique_node(graph, right_field->type.name_type.node);
                    
                    if (left_field->type.name_type.node != unique_right_type)
                    {
                        do_match = false;
                        break;
                    }
                    
                    right_field = (ast_variable *) right_field->node.next;
                }
                
                if (do_match)
                {
                    unique_compound_type = other_compound_type;
                    break;
                }
            }
            
            if (!unique_compound_type)
            {
                unique_compound_type = new_bucket_item(&graph->unique_compound_type_buckets);
                *unique_compound_type = *compound_type;
                unique_compound_type->node.type_index = graph->unique_compound_type_buckets.item_count -1;
                
                unique_compound_type->first_field = null;
                auto tail_next = make_tail_next(&unique_compound_type->first_field);
                
                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                {
                    new_local_leaf_node(variable, parser->node_locations.base[field->node.index].text);
                    *variable = *field;
                    variable->node.parent = get_base_node(unique_compound_type);
                    
                    variable->type.name_type.node = get_unique_node(graph, field->type.name_type.node);
                    resolve_complete_type(parser, &variable->type);
                    
                    variable->node.next = null;
                    append_tail_next(&tail_next, &variable->node);
                }
            }
            
            return get_base_node(unique_compound_type);
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, node);
            
            auto unique_item_type = get_unique_node(graph, array_type->item_type.name_type.node);
            
            u64 item_count = 0;
            if (array_type->item_count_expression)
                item_count = get_array_item_count(array_type);
            
            ast_array_type *unique_array_type = null;
            for_bucket_item(bucket, index, graph->unique_array_type_buckets)
            {
                auto other_array_type = &bucket->base[index];
                
                if (unique_item_type != other_array_type->item_type.name_type.node)
                    continue;
                
                if (!array_type->item_count_expression != !other_array_type->item_count_expression)
                    continue;
                
                if (array_type->item_count_expression && (item_count != get_array_item_count(other_array_type)))
                    continue;
                
                unique_array_type = other_array_type;
                break;
            }
            
            if (!unique_array_type)
            {
                unique_array_type = new_bucket_item(&graph->unique_array_type_buckets);
                *unique_array_type = *array_type;
                unique_array_type->node.type_index = graph->unique_array_type_buckets.item_count -1;
                unique_array_type->item_type.name                        = array_type->item_type.name;
                unique_array_type->item_type.name_type.node              = unique_item_type;
                unique_array_type->item_type.name_type.indirection_count = array_type->item_type.name_type.indirection_count;
                
                if (array_type->item_type.base_type.node == array_type->item_type.name_type.node)
                    unique_array_type->item_type.base_type = unique_array_type->item_type.name_type;
                else
                    unique_array_type->item_type.base_type = array_type->item_type.base_type;
            }
            
            return get_base_node(unique_array_type);
        } break;
    }
}

struct find_node_result
{
    ast_node *unique_node;
    u32 index;
};

find_node_result find_node(dependency_graph *graph, ast_node *node)
{
    find_node_result result = {};
    result.index = -1;
    result.unique_node = get_unique_node(graph, node);
    
    for (u32 i = 0; i < graph->nodes.count; i++)
    {
        if (graph->nodes.base[i].node == result.unique_node)
        {
            result.index = i;
            return result;
        }
    }
    
    return result;
}

void set_is_required(dependency_graph *graph, u32 index)
{
    assert(index < graph->nodes.count);
    
    auto node = &graph->nodes.base[index];
    if (!node->is_required)
    {
        node->is_required = true;
        
        for (u32 parent_index = 0; parent_index < graph->nodes.count; parent_index++)
        {
            auto parent = &graph->nodes.base[parent_index];
            if ((parent != node) && !parent->is_required)
            {
                for (auto child = parent->children; child; child = child->next)
                {
                    if (child->value == index)
                    {
                        set_is_required(graph, parent_index);
                        break;
                    }
                }
            }
        }
    }
}

void print_type_info(lang_c_buffer *buffer, complete_type_info type)
{
    auto builder = &buffer->builder;
    
    if (!type.base_type.node)
    {
        print(builder, "lang_type_info {}");
        return;
    }

    auto base_type = find_node(&buffer->graph, type.base_type.node).unique_node;
    auto type_index = base_type->type_index;
    
    auto count_and_alignment = get_type_byte_count(type);
    
    /*
    if (is_node_type(base_type, function_type))
    {
        print_comment_begin(buffer);
        print(builder, "function type table not implemented");
        print_comment_end(buffer);
        print(builder, "lang_type_info {}");
    }
    else
    */
    {
    #if 0
        // cast const away
        print(builder, "lang_type_info { (lang_type_info_type *) &lang_type_table.%.*ss.base[%u].base_type, string { %llu, (u8 *) \"%.*s\" }, %u, %u, %u }", fnode_type_name(base_type), type_index, type.name.count, fs(type.name), type.base_type.indirection_count, count_and_alignment.byte_count, count_and_alignment.byte_alignment);
    #else
        // cast const away
        print(builder, "lang_type_info { (lang_type_info_type *) &lang_type_table.%.*ss[%u].base_type, string { %llu, (u8 *) \"%.*s\" }, %u, %u, %u }", fnode_type_name(base_type), type_index, type.name.count, fs(type.name), type.base_type.indirection_count, count_and_alignment.byte_count, count_and_alignment.byte_alignment);
    #endif
    }
}

void print_c_string(string_builder *builder, string text, bool is_raw)
{
    if (!is_raw)
    {
        print(builder, "%.*s", fs(text));
        return;
    }
    
    for (usize i = 0; i < text.count; i++)
    {
        switch (text.base[i])
        {
            case '\0':
            {
                print(builder, "\\0");
            } break;
            
            case '\\':
            {
                print(builder, "\\\\");
            } break;
            
            case '\r':
            {
                print(builder, "\\r");
            } break;
                
            case '\n':
            {
                print(builder, "\\n");
            } break;
            
            default:
            {
                if (text.base[i] < ' ')
                    print(builder, "\\x%x", text.base[i]);
                else
                    print(builder, "%c", text.base[i]);
            }
        }
    }
}

print_expression_declaration
{
    auto parser = buffer->parser;
    auto builder = &buffer->builder;
    
    if (expression_to_local_map)
    {
        auto value = try_get_value(expression_to_local_map, node);
        if (value.ok)
        {
            auto index = *(u32 *) value.value;
            print(builder, "__local_%u", index);
            return;
        }
    }
    
    switch (node->node_type)
    {
        cases_complete_message("unhandled expression type %.*s", fnode_type_name(node));
        
        // nothing to do
        case ast_node_type_base_node:
        break;
        
        case ast_node_type_number:
        {
            local_node_type(number, node);
            if (number->value.is_character)
            {
                assert(!number->value.is_float && !number->value.is_signed && !number->value.is_hex);
                
                print_comment_begin(buffer);
                print(builder, "%c", (u8) number->value.u64_value);
                print_comment_end(buffer);
                
                print(builder, "%llu", number->value.u64_value);
            }
            else 
            if (number->value.is_float)
            {
                if (number->value.bit_count_power_of_two == 5)
                    print(builder, "%ff", number->value.f64_value);
                else
                    print(builder, "%f", number->value.f64_value);
            }
            else if (number->value.is_signed)
            {
                if (number->value.is_hex)
                {
                    if (number->value.s64_value < 0)
                        print(builder, "-0x%llx", number->value.s64_value);
                    else
                        print(builder, "0x%llx", number->value.s64_value);
                }
                else
                    print(builder, "%lli", number->value.s64_value);
            }
            else
            {
                if (number->value.is_hex)
                    print(builder, "0x%llx", number->value.u64_value);
                else
                    print(builder, "%llu", number->value.u64_value);
            }
        } break;
        
        case ast_node_type_string_literal:
        {
            local_node_type(string_literal, node);
            print(builder, "string{ %llu, (u8 *) \"", get_string_c_count(string_literal->text));
            print_c_string(builder, string_literal->text, string_literal->is_raw);
            print(builder, "\" }");
        } break;
        
        case ast_node_type_array_literal:
        {
            local_node_type(array_literal, node);
            
            //if (is_inside_array_literal)
            print_array_literal(buffer, array_literal, expression_to_local_map);
        } break;
        
        case ast_node_type_compound_literal:
        {
            local_node_type(compound_literal, node);
            print_compound_literal(buffer, compound_literal, expression_to_local_map, is_inside_array_literal);
        } break;
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            
            if (!name_reference->reference)
            {
                print_comment_begin(buffer);
                print(builder, "not resolved");
                print_comment_end(buffer);
            }
                
            print(builder, "%.*s", fs(name_reference->name));
        } break;
                    
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);

            print_expression(buffer, function_call->expression, expression_to_local_map, is_inside_array_literal);
            print(builder, "(");
            
            bool is_not_first = false;
            for (auto argument = function_call->first_argument; argument; argument = argument->next)
            {
                if (is_not_first)
                    print(builder, ", ");
                    
                print_expression(buffer, argument, expression_to_local_map, is_inside_array_literal);
                is_not_first = true;
            }
            print(builder, ")");
        } break;
        
        case ast_node_type_dereference:
        {
            local_node_type(dereference, node);
            
            print(builder, "*");
            print_expression(buffer, dereference->expression, expression_to_local_map, is_inside_array_literal);
        } break;
        
        case ast_node_type_field_dereference:
        {
            local_node_type(field_dereference, node);
            
            auto type = get_expression_type(buffer->parser, field_dereference->expression).base_type;
            
            if (!type.indirection_count && type.node)
            {
                if (is_node_type(type.node, enumeration_type))
                {
                    if (field_dereference->name == s("count"))
                    {
                        local_node_type(enumeration_type, type.node);
                        
                        print_comment_begin(buffer);
                        
                        print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
                        print(builder, "_%.*s", fs(field_dereference->name));
                        
                        print_comment_end(buffer);
                        
                        print(builder, " %i", enumeration_type->item_count);
                    }
                    else
                    {
                        print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
                        print(builder, "_%.*s", fs(field_dereference->name));
                    }
                    
                    break;
                }
                else if (is_node_type(type.node, array_type))
                {
                    local_node_type(array_type, type.node);
                    
                #if 0
                    print_expression(buffer, field_dereference->expression);
                    print(builder, ".%.*s", fs(field_dereference->name));
                #else
                    if (field_dereference->name == s("count"))
                    {
                        if (array_type->item_count_expression)
                        {
                            print_comment_begin(buffer);
                            print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
                            print(builder, ".count");
                            
                            print_comment_end(buffer);
                            
                            print_expression(buffer, array_type->item_count_expression, expression_to_local_map, is_inside_array_literal);
                        }
                        else
                        {
                            print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
                            print(builder, ".count");
                        }
                    }
                    else if (field_dereference->name == s("base"))
                    {
                    #if 0
                        if (is_node_type(field_dereference->expression, array_literal)) //array_type->count_expression)
                        {
                            local_node_type(array_literal, field_dereference->expression);
                            
                            print_comment_begin(buffer);
                            
                            auto local_index = *local_variable_index; // don't increment comment indices
                            print_expression(buffer, field_dereference->expression, local_index);
                            print(builder, ".base");
                            
                            print_comment_end(buffer);
                            
                            print_
                            print(builder, "_array_literal_base_%x", array_literal->node.index);
                            //print_expression(buffer, array_type->item_count_expression);
                        }
                        else
                    #endif
                        {
                            print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
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
                print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
                print(builder, "->");
                print(builder, "%.*s", fs(field_dereference->name));
            }
            else if (type.indirection_count == 0)
            {
                print_expression(buffer, field_dereference->expression, expression_to_local_map, is_inside_array_literal);
                print(builder, ".");
                print(builder, "%.*s", fs(field_dereference->name));
            }
            else
            {
                print_comment_begin(buffer);
                print(builder, "too many indirections %.*s", fs(field_dereference->name));
                print_comment_end(buffer);
            }
            
            if (!field_dereference->reference)
            {
                print_comment_begin(buffer);
                print(builder, "not resolved");
                print_comment_end(buffer);
            }
        } break;
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            
            auto base_type = get_expression_type(parser, array_index->array_expression).base_type.node;
            local_node_type(array_type, base_type);
            
            print_expression(buffer, array_index->array_expression, expression_to_local_map, is_inside_array_literal);
            
            // consant bounds check are done in resolve
            if (!array_type->item_count_expression || !array_index->index.is_constant)
            {
                print(builder, ".base[assert_array_bounds(");
                print_expression(buffer, array_index->index_expression, expression_to_local_map, is_inside_array_literal);
                
                if (array_type->item_count_expression)
                {
                    print(builder, ", %llu)]", get_array_item_count(array_type));
                }
                else
                {
                    print(builder, ", (");
                    print_expression(buffer, array_index->array_expression, expression_to_local_map, is_inside_array_literal);
                    print(builder, ").count)]");
                }
            }
            else
            {
                print(builder, ".base[");
                print_expression(buffer, array_index->index_expression, expression_to_local_map, is_inside_array_literal);
                print(builder, "]");
            }
        
    #if 0
            
        #if 1
            print(builder, ".base[");
            print_expression(buffer, array_index->index_expression);
            print(builder, "]");
        #else
            print(builder, ".base[_array_index%x]", array_index->node.index);
        #endif
    #endif
        } break;
        
        case ast_node_type_unary_operator:
        {
            local_node_type(unary_operator, node);
        
            switch (unary_operator->operator_type)
            {
                case ast_unary_operator_type_cast:
                {
                    print(builder, "((");
                    print_type(buffer, unary_operator->type);
                    print(builder, ") ");
                    print_expression(buffer, unary_operator->expression, expression_to_local_map, is_inside_array_literal);
                    print(builder, ")");
                } break;
                
                default:
                {
                    if (unary_operator->function)
                    {
                        print(builder, "%.*s(", fs(ast_unary_operator_names[unary_operator->operator_type]));
                        print_expression(buffer, unary_operator->expression, expression_to_local_map, is_inside_array_literal);
                        print(builder, ")");
                    }
                    else
                    {
                        string c_symbols[] =
                        {
                            s("!"),
                            s("-"),
                            s("&"),
                        };
                        
                        assert(unary_operator->operator_type < carray_count(c_symbols));
                
                        // TODO get if its a const value and add cast to remove const
                        if (unary_operator->operator_type == ast_unary_operator_type_take_reference)
                        {
                        }
                
                        print(builder, "%.*s", fs(c_symbols[unary_operator->operator_type]));
                        print_expression(buffer, unary_operator->expression, expression_to_local_map, is_inside_array_literal);
                    }
                }
            }
        } break;
        
        case ast_node_type_get_function_reference:
        {
            local_node_type(get_function_reference, node);
            print(builder, "%.*s", fs(get_function_reference->name));
        } break;
        
        case ast_node_type_get_type_info:
        {
            local_node_type(get_type_info, node);
            
            print_comment_begin(buffer);
            
            print(builder, "get_type_info(");
            print_type(buffer, get_type_info->type);
            print(builder, ")");
            
            print_comment_end(buffer);
            
#define NORMAL_CONST_ARRAY

            print_type_info(buffer, get_type_info->type);
        } break;
        
        case ast_node_type_type_byte_count:
        {
            local_node_type(type_byte_count, node);
            
            auto count_and_alignment = get_type_byte_count(type_byte_count->type);
            
            print_comment_begin(buffer);
            
            print(builder, "type_byte_count(");
            print_type(buffer, type_byte_count->type);
            print(builder, ")");
            
            print_comment_end(buffer);
            
            print(builder, "%llu", count_and_alignment.byte_count);
        } break;
        
        case ast_node_type_binary_operator:
        {
            local_node_type(binary_operator, node);
        
            if (binary_operator->function)
            {
                print(builder, "%.*s(", fs(ast_binary_operator_names[binary_operator->operator_type]));
                print_expression(buffer, binary_operator->left, expression_to_local_map, is_inside_array_literal);
                print(builder, ", ");
                print_expression(buffer, binary_operator->left->next, expression_to_local_map, is_inside_array_literal);
                print(builder, ")");
            }
            else
            {
                string c_symbols[] =
                {
                    s("||"),
                    s("&&"),
                    s("^^"),
                
                    s("=="),
                    s("!="),
                    
                    s("<"),
                    s("<="),
                    s(">"),
                    s(">="),
                    
                    s("~"),
                    s("|"),
                    s("&"),
                    s("^"),
                    s(">>"),
                    s("<<"),
                    
                    s("+"),
                    s("-"),
                    s("*"),
                    s("/"),
                    s("%"),
                };
                
                assert(binary_operator->operator_type < carray_count(c_symbols));
                
                print(builder, "(");
                print_expression(buffer, binary_operator->left, expression_to_local_map, is_inside_array_literal);
                print(builder, " %.*s ", fs(c_symbols[binary_operator->operator_type]));
                print_expression(buffer, binary_operator->left->next, expression_to_local_map, is_inside_array_literal);
                print(builder, ")");
            }
        } break;
    }
}

void print_constant_declaration(lang_c_buffer *buffer, ast_constant *constant, ast_node_table *expression_to_local_map)
{
    auto type = get_expression_type(buffer->parser, constant->expression);
    
    auto builder = &buffer->builder;
    
    print(builder, "const ");
    print_type(buffer, type, constant->name);
    
    print(builder, " = ");
    print_expression(buffer, constant->expression, expression_to_local_map, true);
    
    print_line(builder, ";");
}

void print_variable_statement(lang_c_buffer *buffer, ast_variable *variable, ast_node_table *expression_to_local_map)
{
    auto builder = &buffer->builder;
    
    print_declaration(buffer, variable);
    
    if (variable->default_expression)
    {
        print(builder, " = ");
        print_expression(buffer, variable->default_expression, expression_to_local_map, true);
    }
    else
    {
        if (variable->type.base_type.indirection_count || is_node_type(variable->type.base_type.node, function_type))
            print(builder, " = null");
        else if (is_node_type(variable->type.base_type.node, number_type))
            print(builder, " = 0");
        else
            print(builder, " = {}");
    }
    
    print(builder, ";");
}

struct single_static_assignments
{
    u32 index, count;
};

void print_statement(lang_c_buffer *buffer, ast_node *node, single_static_assignments *local_assignments, bool allow_globals)
{
    bool add_local_array_literals = true;
    switch (node->node_type)
    {
        // skip global declarations
        case ast_node_type_enumeration_type:
        case ast_node_type_alias_type:
        case ast_node_type_function:
        case ast_node_type_number_type:
        case ast_node_type_function_type:
        case ast_node_type_compound_type:
        return;
        
        case ast_node_type_variable:
        {
            local_node_type(variable, node);
            if (!allow_globals && variable->is_global)
                return;
            
            add_local_array_literals = false;
        } break;
        
        case ast_node_type_constant:
        {
            if (!allow_globals && is_node_type(node->parent, file))
                return;
        
            add_local_array_literals = false;
        } break;
    }

    auto builder = &buffer->builder;
    
    auto local_variable_index = local_assignments->index;
    local_assignments->index = local_assignments->count;
    defer { local_assignments->index = local_variable_index; };
    
    ast_node_table table = make_node_table(1024, sizeof(u32)); defer { free_table(&table); };
    
    {
        local_buffer(nodes, ast_node_buffer);
    
        local_buffer(queue, ast_queue);
        enqueue_one(&queue, &node);
        
        ast_node *it;
        while (next(&it, &queue))
        {
            assert(local_assignments->index <= local_assignments->count);
        
            switch (it->node_type)
            {
                // don't go into sub scopes
                case ast_node_type_scope:
                case ast_node_type_branch_switch_case:
                {
                    skip_children(&queue, it);
                } break;
                
                case ast_node_type_branch:
                {
                    local_node_type(branch, it);
                    skip_children(&queue, it);
                    
                    enqueue(&queue, it, &branch->condition);
                } break;
                
                case ast_node_type_loop_with_counter:
                {
                    local_node_type(loop_with_counter, it);
                    skip_children(&queue, it);
                    
                    enqueue(&queue, it, &loop_with_counter->end_condition);
                    enqueue(&queue, it, &loop_with_counter->counter_statement);
                } break;
            
                case ast_node_type_loop:
                {
                    local_node_type(loop, it);
                    skip_children(&queue, it);
                    
                    enqueue(&queue, it, &loop->condition);
                } break;
            
                case ast_node_type_branch_switch:
                {
                    local_node_type(branch_switch, it);
                    skip_children(&queue, it);
                    
                    enqueue(&queue, it, &branch_switch->condition);
                } break;
            
                case ast_node_type_array_index:
                {
                    local_node_type(array_index, it);
                    
                    auto type = get_expression_type(buffer->parser, array_index->array_expression);
                    local_node_type(array_type, type.base_type.node);
                    
                    // consant bounds check are done in resolve
                    if (array_type->item_count_expression && array_index->index.is_constant)
                        break;
                    
                    resize_buffer(&nodes, nodes.count + 1);
                    nodes.base[nodes.count - 1] = it;
                } break;
                
                case ast_node_type_array_literal:
                {
                    if (!add_local_array_literals)
                        break;
                    
                    resize_buffer(&nodes, nodes.count + 1);
                    nodes.base[nodes.count - 1] = it;
                } break;
            }
        }
        
        local_assignments->count += nodes.count;
        
        for (u32 i = 0; i < nodes.count; i++)
        {
            auto it = nodes.base[nodes.count - 1 - i];
        
            auto index = local_assignments->count - i - 1;
            maybe_print_newline(builder);
            
            switch (it->node_type)
            {
                case ast_node_type_array_literal:
                {
                    local_node_type(array_literal, it);
                    local_node_type(array_type, array_literal->type.base_type.node);
                    
                    print_type(buffer, array_literal->type);
                    print(builder, " __local_%u = ", index);
                    
                    local_assignments->index = index;
                    print_array_literal(buffer, array_literal, &table);
                    print_line(builder, ";");
                    
                    *(u32 *) insert(&table, it) = index;
                } break;
            
                case ast_node_type_array_index:
                {
                    local_node_type(array_index, it);
                    
                #if 0
                    print(builder, "usize __local_%u = ", index);
                    print_expression(buffer, array_index->index_expression, &table, true);
                    print(builder, "; ");
                    
                    print(builder, "assert_array_bounds(__local_%u < ", index);
                    
                    auto type = get_expression_type(buffer->parser, array_index->array_expression);
                    local_node_type(array_type, type.base_type.node);
                    
                    local_assignments->index = index;
                    
                    if (array_type->item_count_expression)
                    {
                        print_comment_begin(buffer);
                        print(builder, "(");
                        print_expression(buffer, array_index->array_expression, &table, true);
                        print(builder, ").count");
                        print_comment_end(buffer);
                        
                        print_expression(buffer, array_type->item_count_expression, &table, true);
                    }
                    else
                    {
                        print(builder, "(");
                        print_expression(buffer, array_index->array_expression, &table, true);
                        print(builder, ").count");
                    }
                    
                    print_line(builder, ");"); //string { x, (u8 *) \"array index %llu out of bound, should be less then %llu\" }, {}, {})");
                    
                    // insert after we assigned
                    *(u32 *) insert(&table, array_index->index_expression) = index;
                #endif
                } break;
            }
        }
        
        local_assignments->index = local_assignments->count - nodes.count;
    }

    switch (node->node_type)
    {
        case ast_node_type_scope:
        {
            local_node_type(scope, node);
            print_scope_open(builder);
            
            if (scope->first_statement)
                print_statements(buffer, scope->first_statement);
            
            print_scope_close(builder);
        } break;
        
        case ast_node_type_constant:
        {
            local_node_type(constant, node);
            print_constant_declaration(buffer, constant, &table);
        } break;

        case ast_node_type_variable:
        {
            local_node_type(variable, node);
            
            print_variable_statement(buffer, variable, &table);
            print_newline(builder);
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
                print_expression(buffer, assignment->left, &table, false);
                print(builder, " = ");
                print_expression(buffer, assignment->right, &table, false);
            }
            
            print_line(builder, ";");
        } break;
        
        case ast_node_type_branch:
        {
            local_node_type(branch, node);
        
            maybe_print_blank_line(builder);
            
            print(builder, "if (");
            print_expression(buffer, branch->condition, &table, false);
            print(builder, ")");
            
            print_scope_open(builder);
            
            if (branch->first_true_statement)
                print_statements(buffer, branch->first_true_statement);
                
            print_scope_close(builder);
            
            if (branch->false_scope)
            {
                print(builder, "else");
                print_scope_open(builder);
                print_statements(buffer, branch->false_scope->first_statement);
                print_scope_close(builder);
            }
            
            pending_newline(builder);
        } break;
        
        case ast_node_type_loop:
        {
            local_node_type(loop, node);
        
            maybe_print_blank_line(builder);
            
            print(builder, "while (");
            print_expression(buffer, loop->condition, &table, false);
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
            
            if (is_node_type(loop_with_counter->counter_statement, variable))
            {
                local_node_type(variable, loop_with_counter->counter_statement);
                print_variable_statement(buffer, variable, &table);
            }
            else
            {
                print_expression(buffer, loop_with_counter->counter_statement, &table, false);
                print(builder, ";");
            }
            
            //print_statement(buffer, loop_with_counter->first_counter_statement);
            
            string counter_name = get_name(loop_with_counter->counter_statement);
            assert(counter_name.count);
            
            print(builder, " %.*s < ", fs(counter_name));
            print_expression(buffer, loop_with_counter->end_condition, &table, false);
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
            print_expression(buffer, branch_switch->condition, &table, false);
            print(builder, ")");
            
            print_scope_open(builder);
            
            for (auto branch_case = branch_switch->first_case; branch_case; branch_case = (ast_branch_switch_case *) branch_case->node.next)
            {
                print(builder, "case ");
                print_expression(buffer, branch_case->expression, &table, false);
                print(builder, ":");
                
                print_scope_open(builder);
                
                if (branch_case->first_statement)
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
                print_expression(buffer, expression, &table, false);
                
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
            print_expression(buffer, node, &table, false);
            print_line(builder, ";");
        } break;
    }
}

print_statements_declaration
{
    auto builder = &buffer->builder;

    single_static_assignments local_assignments = {};

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
        
        print_statement(buffer, node, &local_assignments, false);
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
            print(builder, "%.*s ", fs(function_type->calling_convention));
        
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

u32 insert_node(dependency_graph *graph, ast_node *node)
{
    auto result = find_node(graph, node);
    if (result.index != -1)
        return result.index;
        
    resize_buffer(&graph->nodes, graph->nodes.count + 1);
    auto entry = &graph->nodes.base[graph->nodes.count - 1];
    *entry = {};
    entry->node    = result.unique_node;
    entry->is_root = true;
    
    return graph->nodes.count - 1;
}

void print_dependency(lang_parser *parser, string_builder *builder, ast_node *child, ast_node *parent)
{
    print_name(parser, builder, child);
    print(builder, " depends on ");
    print_name(parser, builder, parent);
    print_newline(builder);
}

bool is_ancestor_of(dependency_graph *graph, u32 ancestor_index, u32 decendant_index, u32 depth = 0)
{
    assert(ancestor_index < graph->nodes.count);
    assert(decendant_index < graph->nodes.count);
    assert(ancestor_index != decendant_index);
    
    auto ancestor = &graph->nodes.base[ancestor_index];
    for (auto child = ancestor->children; child; child = child->next)
    {
        if (child->value == decendant_index)
        {
            auto decendent = graph->nodes.base[decendant_index].node;
            graph->parser->error = true;
            print_dependency(graph->parser, &graph->parser->error_messages, decendent, ancestor->node);
            return true;
        }
    }
    
    for (auto child = ancestor->children; child; child = child->next)
    {
        if (is_ancestor_of(graph, child->value, decendant_index, depth + 1))
        {
            auto decendent = graph->nodes.base[child->value].node;
            graph->parser->error = true;
            print_dependency(graph->parser, &graph->parser->error_messages, decendent, ancestor->node);
            return true;
        }
    }
    
    return false;
}

void add_child(dependency_graph *graph, u32 parent_index, u32 child_index)
{
    assert(parent_index < graph->nodes.count);
    assert(child_index < graph->nodes.count);
    assert(parent_index != child_index);
    
    auto parent = &graph->nodes.base[parent_index];
    
    if (is_ancestor_of(graph, child_index, parent_index))
    {
        auto ancestor = &graph->nodes.base[child_index];
        auto decendent = parent->node;
        
        graph->parser->error = true;
        print(&graph->parser->error_messages, "cycle dependency with: ");
        print_dependency(graph->parser, &graph->parser->error_messages, decendent, ancestor->node);
        return;
    }
    
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
        default:
        {
            auto type = get_expression_type(graph->parser, expression);
            insert_type_dependency(graph, child, type);
        } break;
    
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
                //insert_expression_dependency(graph, child, item_expression);
            }
        } break;
        
        case ast_node_type_unary_operator:
        {
            local_node_type(unary_operator, expression);
            
            insert_expression_dependency(graph, child, unary_operator->expression);
        } break;
        
        case ast_node_type_binary_operator:
        {
            local_node_type(binary_operator, expression);
            
            insert_expression_dependency(graph, child, binary_operator->left);
            insert_expression_dependency(graph, child, binary_operator->left->next);
        } break;
    }
}

void insert_compound_dependency(dependency_graph *graph, ast_node *child, ast_compound_type *compound_type)
{
    insert_dependency(graph, child, get_base_node(compound_type));
    
    for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
    {
        insert_type_dependency(graph, get_base_node(compound_type), field->type);
        //insert_type_dependency(graph, child, field->type);
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
        case ast_node_type_alias_type:
        {
            insert_dependency(graph, child, name_type);
        } break;
        
        case ast_node_type_enumeration_type:
        {
            local_node_type(enumeration_type, name_type);
            insert_type_dependency(graph, child, enumeration_type->item_type);
            
            //for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                //insert_expression_dependency(graph, child, item->expression);
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, name_type);
    
            insert_dependency(graph, child, name_type);
    
            if (function_type->input.base_type.node)
            {
                auto input = get_node_type(compound_type, function_type->input.base_type.node);
                //insert_compound_dependency(graph, child, input);
                
                insert_compound_dependency(graph, name_type, input);
            }
            
            if (function_type->output.base_type.node)
            {
                auto output  = get_node_type(compound_type, function_type->output.base_type.node);
                //insert_compound_dependency(graph, child, output);
                
                insert_compound_dependency(graph, name_type, output);
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
        #if 1
            if (false && array_type->item_count_expression)
            {
                insert_type_dependency(graph, child, array_type->item_type);
            }
            else
            {
                insert_type_dependency(graph, name_type, array_type->item_type);
                insert_dependency(graph, child, name_type);
            }
        #else
            insert_type_dependency(graph, child, array_type->item_type);
        #endif
        } break;
    }
}

void free_graph(dependency_graph *graph)
{
    free_buffer(&graph->nodes);
        
    while (graph->index_buckets.first)
    {
        auto bucket = graph->index_buckets.first;
        graph->index_buckets.first = graph->index_buckets.first->next;
        platform_free_bytes((u8 *) bucket);
    }
    
    while (graph->unique_array_type_buckets.first)
    {
        auto bucket = graph->unique_array_type_buckets.first;
        graph->unique_array_type_buckets.first = graph->unique_array_type_buckets.first->next;
        platform_free_bytes((u8 *) bucket);
    }
    
    while (graph->unique_compound_type_buckets.first)
    {
        auto bucket = graph->unique_compound_type_buckets.first;
        graph->unique_compound_type_buckets.first = graph->unique_compound_type_buckets.first->next;
        platform_free_bytes((u8 *) bucket);
    }
    
    while (graph->unique_function_type_buckets.first)
    {
        auto bucket = graph->unique_function_type_buckets.first;
        graph->unique_function_type_buckets.first = graph->unique_function_type_buckets.first->next;
        platform_free_bytes((u8 *) bucket);
    }
    
    free_buffer(&graph->sorted_dependencies);
}

void sort_declaration_dependencies(lang_c_buffer *buffer)
{
    auto parser = buffer->parser;
    auto graph = &buffer->graph;
    graph->index_buckets.tail_next                = &graph->index_buckets.first;
    graph->unique_array_type_buckets.tail_next    = &graph->unique_array_type_buckets.first;
    graph->unique_compound_type_buckets.tail_next = &graph->unique_compound_type_buckets.first;
    graph->unique_function_type_buckets.tail_next = &graph->unique_function_type_buckets.first;
    graph->parser = parser;
    
    // collect
    {
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            if (variable->is_global)
            {
                insert_type_dependency(graph, get_base_node(variable), variable->type);
                //insert_expression_dependency(graph, get_base_node(constant), variable->default_expression);
            }
            else
            {
                auto parent = variable->node.parent;
                while (parent->parent)
                    parent = parent->parent;
            
                assert(parent && is_node_type(parent, file));
                local_node_type(file, parent);
                insert_type_dependency(graph, get_base_node(file->module), variable->type);
            }
        }
        
        for_bucket_item(bucket, index, parser->constant_buckets)
        {
            auto constant = &bucket->base[index];
            
            if (!is_node_type(constant->node.parent, file))
                continue;
                
            if (constant->node.parent == get_base_node(parser->lang_file))
                continue;
            
            auto type = get_expression_type(parser, constant->expression);
            insert_type_dependency(graph, get_base_node(constant), type);
            //insert_expression_dependency(graph, get_base_node(constant), constant->expression);
        }
        
        for_bucket_item(bucket, index, parser->array_type_buckets)
        {
            auto array_type = &bucket->base[index];
            insert_type_dependency(graph, get_base_node(array_type), array_type->item_type);
        }
        
    #if 0
        for_bucket_item(bucket, index, parser->enumeration_type_buckets)
        {
            auto enumeration_type = &bucket->base[index];
            insert_type_dependency(graph, get_base_node(enumeration_type), enumeration_type->item_type);
            
            for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                insert_expression_dependency(graph, get_base_node(enumeration_type), item->expression);
        }
    #endif
        
        for_bucket_item(bucket, index, parser->alias_type_buckets)
        {
            auto alias_type = &bucket->base[index];
            
        #if 0
            if (!alias_type->type.name_type.indirection_count)
            {
                auto name_type = alias_type->type.name_type.node;
                switch(name_type->node_type)
                {
                    case ast_node_type_function_type:
                    case ast_node_type_compound_type:
                    {
                        insert_dependency(graph, get_base_node(alias_type), name_type);
                    } break;
                    
                    case ast_node_type_array_type:
                    {
                        local_node_type(array_type, name_type);
                        //// skip dependency on array type
                        insert_type_dependency(graph, get_base_node(alias_type), array_type->item_type);
                    } break;
                }
            }
        #endif
        
            if (alias_type->type.name_type.indirection_count)
            {
                insert_node(graph, get_base_node(alias_type));
                insert_node(graph, alias_type->type.name_type.node);
            }
            else
            {
                insert_type_dependency(graph, get_base_node(alias_type), alias_type->type);
            }
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
                insert_compound_dependency(graph, get_base_node(function), input);
            }
            
            if (function_type->output.base_type.node)
            {
                auto output = get_node_type(compound_type, function_type->output.base_type.node);
                insert_compound_dependency(graph, get_base_node(function), output);
            }
            
            // add functions with no input and output as nodes, otherweise they won't be forward declared
            if (!function_type->input.base_type.node && !function_type->output.base_type.node)
                insert_node(graph, get_base_node(function));
        }
    }
    
    if (parser->error)
        return;
    
    // sort
    u32_buffer sorted_dependencies = {};
    {
        local_buffer(stack, u32_buffer);
        
        local_buffer(node_depths, u8_buffer);
        resize_buffer(&node_depths, graph->nodes.count);
        
        // set all depths to 0
        memset(node_depths.base, 0, sizeof(node_depths.base[0]) * node_depths.count);
        
        u32 max_depth = 0;
        for (u32 root_index = 0; root_index < graph->nodes.count; root_index++)
        {
            auto root = &graph->nodes.base[root_index];
            if (!root->is_root)
                continue;
            
            // depth first search per root
            
            //printf("dependency root [0x%p] '%.*s' %.*s\n", root->node, fs(get_name(root->node)), fs(ast_node_type_names[root->node->node_type]));
            
            resize_buffer(&stack, 1);
            stack.base[0] = root_index;
            assert(node_depths.base[root_index] == 0);
            
            while (stack.count)
            {
                auto index = stack.base[--stack.count];
                auto entry = graph->nodes.base[index];
            
                for (auto child_entry = entry.children; child_entry; child_entry = child_entry->next)
                {
                    auto child_index = child_entry->value;
                    auto child = &graph->nodes.base[child_index];
                    
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
            for (u32 i = 0; i < graph->nodes.count; i++)
            {
                if (node_depths.base[i] == depth)
                {
                    resize_buffer(&sorted_dependencies, sorted_dependencies.count + 1);
                    sorted_dependencies.base[sorted_dependencies.count - 1] = i;
                }
            }
        }
    
        // check if sorted_dependencies are correct
        {
            assert(graph->nodes.count == sorted_dependencies.count);
        
            string_builder print_builder = {};
            defer { free_buffer(&print_builder.memory); };
        
            for (u32 parent_index = 0; parent_index < graph->nodes.count; parent_index++)
            {
                // children depend on parent
                // so all its chilren must be inserted before the parent
                
                auto entry = graph->nodes.base[parent_index];
                auto parent = entry.node;
                
                u32 ordered_parent_index = 0;
                for (; ordered_parent_index < sorted_dependencies.count; ordered_parent_index++)
                {
                    if (sorted_dependencies.base[ordered_parent_index] == parent_index)
                        break;
                }
                
                assert(ordered_parent_index < sorted_dependencies.count);
                
                for (auto child_entry = entry.children; child_entry; child_entry = child_entry->next)
                {
                    auto child_index = child_entry->value;
                    auto child = graph->nodes.base[child_index].node;
                    
                    // child must come after the parent
                    u32 ordered_child_index = ordered_parent_index + 1;
                    for (; ordered_child_index < sorted_dependencies.count; ordered_child_index++)
                    {
                        if (sorted_dependencies.base[ordered_child_index] == child_index)
                            break;
                    }
                    
                #if 0
                    clear(&print_builder);
                    print_dependency(parser, &print_builder, child, parent);
                    printf("%.*s", fs(print_builder.memory.array));
                #endif
                    
                    assert(ordered_parent_index < ordered_child_index,"'%.*s' (%.*s) [%i] depends on '%.*s' (%.*s) [%i], but is in wrong order", fs(get_name(child)), fnode_type_name(child), node_depths.base[child_index], fs(get_name(parent)), fnode_type_name(parent), node_depths.base[parent_index]);
                }
            }
        }
    }
    
    {
        local_buffer(required_functions, ast_node_buffer);
        
        for (auto file = parser->file_list.first; file; file = (ast_file *) file->node.next)
        {
            resize_buffer(&required_functions, required_functions.count + 1);
            required_functions.base[required_functions.count - 1] = get_base_node(file);
        }
        
        while (required_functions.count)
        {
            auto scope = required_functions.base[required_functions.count - 1];
            resize_buffer(&required_functions, required_functions.count - 1);
            
            local_buffer(queue, ast_queue);
            
            enqueue(&queue, &scope);
            
            // ignore scope node
            ast_node *node;
            if (!next(&node, &queue))
                continue;
            
            while (next(&node, &queue))
            {
                u32 node_index = -1;
                
                switch (node->node_type)
                {
                    // skip global declarations
                    case ast_node_type_enumeration_type:
                    case ast_node_type_alias_type:
                    case ast_node_type_number_type:
                    case ast_node_type_function_type:
                    case ast_node_type_array_type:
                    case ast_node_type_compound_type:
                    {
                        continue;
                    } break;
                    
                    case ast_node_type_function:
                    {
                        skip_children(&queue, node);
                        
                        local_node_type(function, node);
                        
                        if (function->type.base_type.node->parent == node)
                            enqueue(&queue, node, &function->type.base_type.node);
                        
                        continue;
                    } break;
                    
                    case ast_node_type_name_reference:
                    {
                        local_node_type(name_reference, node);
                        
                        if (name_reference->reference)
                            node_index = find_node(graph, name_reference->reference).index;
                    } break;
                    
                    case ast_node_type_variable:
                    {
                        local_node_type(variable, node);
                        
                        if (variable->is_global)
                            continue;
                            
                        if (variable->type.name_type.node)
                            node_index = find_node(graph, variable->type.name_type.node).index;
                    } break;
                    
                    case ast_node_type_constant:
                    {
                        local_node_type(constant, node);
                        
                        auto type = get_expression_type(parser, constant->expression);
                        if (type.name_type.node)
                            node_index = find_node(graph, type.name_type.node).index;
                    } break;
                    
                    case ast_node_type_array_literal:
                    {
                        local_node_type(array_literal, node);
                        if (array_literal->type.name_type.node)
                            node_index = find_node(graph, array_literal->type.name_type.node).index;
                    } break;
                    
                    case ast_node_type_compound_literal:
                    {
                        local_node_type(compound_literal, node);
                        if (compound_literal->type.name_type.node)
                            node_index = find_node(graph, compound_literal->type.name_type.node).index;
                    } break;
                    
                    case ast_node_type_get_function_reference:
                    {
                        local_node_type(get_function_reference, node);
                        
                        if (get_function_reference->function)
                            node_index = find_node(graph, get_base_node(get_function_reference->function)).index;
                    } break;
                    
                    case ast_node_type_unary_operator:
                    {
                        local_node_type(unary_operator, node);
                        if (unary_operator->function)
                            node_index = find_node(graph, get_base_node(unary_operator->function)).index;
                    } break;
                    
                    case ast_node_type_binary_operator:
                    {
                        local_node_type(binary_operator, node);
                        if (binary_operator->function)
                            node_index = find_node(graph, get_base_node(binary_operator->function)).index;
                    } break;
                    
                    case ast_node_type_get_type_info:
                    {
                        local_node_type(get_type_info, node);
                        
                        auto type = get_type_info->type;
                        if (type.name_type.node)
                            node_index = find_node(graph, type.name_type.node).index;
                    } break;
                    
                    default:
                    {
                        node_index = find_node(graph, node).index;
                    }
                }
                
                if (node_index != -1)
                {
                    if (!graph->nodes.base[node_index].is_required && is_node_type(graph->nodes.base[node_index].node, function))
                    {
                        resize_buffer(&required_functions, required_functions.count + 1);
                        required_functions.base[required_functions.count - 1] = graph->nodes.base[node_index].node;
                    }
                    
                    set_is_required(graph, node_index);
                }
            }
        }
    }
    
    graph->sorted_dependencies = sorted_dependencies;
    
    {
        auto type_index = 0;
        for_bucket_item(bucket, index, graph->unique_array_type_buckets)
        {
            auto array_type = &bucket->base[index];
            auto graph_index = find_node(graph, get_base_node(array_type)).index;
            assert(graph_index != -1);
            if (graph->nodes.base[graph_index].is_required)
            {
                array_type->node.type_index = type_index;
                type_index++;
            }
            else
            {
                array_type->node.type_index = -1;
            }
        }
        graph->unique_array_type_buckets.item_count = type_index;
    }
    
    {
        auto type_index = 0;
        for_bucket_item(bucket, index, graph->unique_compound_type_buckets)
        {
            auto compound_type = &bucket->base[index];
            auto graph_index = find_node(graph, get_base_node(compound_type)).index;
            assert(graph_index != -1);
            if (graph->nodes.base[graph_index].is_required)
            {
                compound_type->node.type_index = type_index;
                type_index++;
            }
            else
            {
                compound_type->node.type_index = -1;
            }
        }
        graph->unique_compound_type_buckets.item_count = type_index;
    }
    
    {
        auto type_index = 0;
        for_bucket_item(bucket, index, graph->unique_function_type_buckets)
        {
            auto function_type = &bucket->base[index];
            auto graph_index = find_node(graph, get_base_node(function_type)).index;
            assert(graph_index != -1);
            if (graph->nodes.base[graph_index].is_required)
            {
                function_type->node.type_index = type_index;
                type_index++;
            }
            else
            {
                function_type->node.type_index = -1;
            }
        }
        graph->unique_function_type_buckets.item_count = type_index;
    }
    
    return;
}

void print_type_declaration(lang_c_buffer *buffer, complete_type_info type, string name = {})
{
    auto builder = &buffer->builder;
    auto name_type = type.name_type.node;
    
    if (!name_type || type.name_type.indirection_count || is_node_type(name_type, number_type))
    {
        print(builder, "typedef ");
        print_type(buffer, type, name);
                
        print_line(builder, ";");
        
        return;
    } 
        
    switch (name_type->node_type)
    {
        default:
        {
            print(builder, "typedef ");
            print_type(buffer, type, name);
                    
            print_line(builder, ";");
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, name_type);
            
            print(builder, "typedef ");
            print_function_type(buffer, function_type, name, true);
            print_line(builder, ";");
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, name_type);
            
            print_line(builder, "typedef struct");
            print_scope_open(builder);
        
            for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
            {
                print_declaration(buffer, field);
                print_line(builder, ";");
            }
            
            print_scope_close(builder, false);
            
            if (name.count)
                print_line(builder, " %.*s;", fs(name));
            else
            {
                print(builder, " ");
                print_type(buffer, type);
                print_line(builder, ";");
            }
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, name_type);
            
            print_line(builder, "typedef struct");
            print_scope_open(builder);
            
            if (array_type->item_count_expression)
            {
                auto item_count = get_array_item_count(array_type);
                print_type(buffer, array_type->item_type, s("base["));
                print_line(builder, "%llu];", item_count);
            }
            else
            {
                print_line(builder, "usize count;");
            
                print_type(buffer, array_type->item_type, s("*base"));
                print_line(builder, ";");
            }
            
            print_scope_close(builder, false);
            if (name.count)
                print_line(builder, " %.*s;", fs(name));
            else
            {
                print(builder, " ");
                print_type(buffer, type);
                print_line(builder, ";");
            }
        } break;
        
        case ast_node_type_enumeration_type:
        {
            local_node_type(enumeration_type, name_type);
            
            print(builder, "typedef ");
            print_type(buffer, enumeration_type->item_type, name);
            print_line(builder, ";");

            //print_scope_open(builder);
            
            bool is_not_first = false;
            
            ast_enumeration_item *last_item_with_expression = null;
            u32 value = 0;
            
            for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
            {
                print(builder, "const %.*s %.*s_%.*s = ", fs(name), fs(name), fs(item->name));
                
                assert(item->expression);
                
                print_comment_begin(buffer);
                print_expression(buffer, item->expression, null, false);
                print_comment_end(buffer);
                print_line(builder, " %llu;", get_enumeration_item_value(item));
                
                // TEMP
            #if 0
                if (item->expression)
                {
                    print_expression(buffer, item->expression);
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
            #endif
            }
        } break;
    }
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
    
    // HACK:
    print_newline(builder);
    print_line(builder, "#include <stdio.h>"); // for printf
    print_line(builder, "#include <stdlib.h>"); // for exit
    
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
        
        print_newline(builder);
        //print_line(builder, "void assert_array_bounds(bool condition) { if (!condition) { printf(\"array index out of bound\"); __debugbreak(); exit(0); } }");
        print_line(builder, "usize assert_array_bounds(usize index, usize count) { if (index >= count) { printf(\"array bounds check failed: array index %llu out of bound, should be < %llu.\", index, count); __debugbreak(); exit(0); } return index; }");
    }
    
    auto root = get_base_node(parser->file_list.first);
    
    ast_list_entry *first_external_binding = null;
    auto external_binding_tail_next = &first_external_binding;
    
    // collect and print all external bindings
    {
        maybe_print_blank_line(builder);
        
        for_bucket_item(bucket, index, parser->function_buckets)
        {
            auto function = &bucket->base[index];
            
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
    
    lang_require_call_return_value(sort_declaration_dependencies(&buffer), buffer);
    auto graph = &buffer.graph;
    auto sorted_dependencies = graph->sorted_dependencies;
    defer { free_graph(graph); };
    
    // compute and set global variable count for lang_global_variables
    u32 global_variable_count = 0;
    {
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            if (!variable->is_global)
                continue;
            
            auto graph_index = find_node(graph, get_base_node(variable)).index;
            assert(graph_index != null);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
            
            global_variable_count++;
        }
        
        auto global_variables = parser->base_constants[lang_base_constant_lang_global_variables];
        auto type = get_expression_type(parser, global_variables->expression);
        local_node_type(array_type, type.base_type.node);
        array_type->item_count_expression = get_base_node(new_number_u64(parser, parser->node_locations.base[array_type->node.index].text, global_variable_count));
        array_type->item_count_expression->parent = get_base_node(array_type);
    }
    
    {
    #if 0
        for (u32 i = 0; i < sorted_dependencies.count; i++)
        {
            auto node = sorted_dependencies.base[i];
            printf("dependency [0x%p] '%.*s' %.*s", node, fnode_name(node), fnode_type_name(node));
            if (node->parent)
                printf(", parent [0x%p] '%.*s' %.*s\n", node->parent, fnode_name(node->parent), fnode_type_name(node->parent));
        }
    #endif
    
    
        // declare typedefs, structs and functions in order of dependency
        
        // printf("ordered dependencies\n");
        
        string_builder print_builder = {};
        defer { free_buffer(&print_builder.memory); };
        
        u32 previous_type = -1;
        for (u32 i = 0; i < sorted_dependencies.count; i++)
        {
            auto node_index = sorted_dependencies.base[i]; //sorted_dependencies.count - 1 - i];
            if (!graph->nodes.base[node_index].is_required)
                continue;
            
            auto node = graph->nodes.base[node_index].node;
            
        #if 0
            clear(&print_builder);
            print(&print_builder, "%u %u ", i, node_index);
            print_name(parser, &print_builder, node);
            printf("%.*s\n", fs(print_builder.memory.array));
        
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
            
            if (previous_type != node->node_type)
                print_newline(builder);
            
            previous_type = node->node_type;
            
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
                case ast_node_type_constant:
                {
                    single_static_assignments local_assingments = {};
                    print_statement(&buffer, node, &local_assingments, true);
                    assert(local_assingments.count == 0);
                } break;
            
                case ast_node_type_array_type:
                {
                    complete_type_info type = {};
                    type.base_type.node = node;
                    type.name_type      = type.base_type;
                    print_type_declaration(&buffer, type);
                    
                    previous_type = -1; // force newline
                } break;
                
                case ast_node_type_alias_type:
                {
                    local_node_type(alias_type, node);
                    
                    if (is_node_type(alias_type->type.base_type.node, array_type))
                    {
                        print(builder, "typedef ");
                        print_type(&buffer, alias_type->type, alias_type->name);
                        print_line(builder, ";");
                    }
                    else
                    {
                        print_type_declaration(&buffer, alias_type->type, alias_type->name);
                    }
                    
                    if (is_node_type(alias_type->type.base_type.node, array_type) || is_node_type(alias_type->type.base_type.node, compound_type) || is_node_type(alias_type->type.base_type.node, enumeration_type))
                        previous_type = -1; // force newline
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
            }
        }
    }
    
    // declare type table
    {
        u32 compound_field_count = 0;
        for_bucket_item(bucket, index, graph->unique_compound_type_buckets)
        {
            auto compound_type = &bucket->base[index];
            
            auto graph_index = find_node(graph, get_base_node(compound_type)).index;
            assert(graph_index != -1);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
                
            compound_field_count += compound_type->field_count;
        }
        
        u32 enumeration_item_count = 0;
        for_bucket_item(bucket, index, parser->enumeration_type_buckets)
        {
            auto enumeration_type = &bucket->base[index];
            enumeration_item_count += enumeration_type->item_count;
        }
    
        print(builder, "const struct");
        print_scope_open(builder);
        print_line(builder, "lang_type_info_number           number_types[%u];", parser->number_type_buckets.item_count);
        print_line(builder, "lang_type_info_enumeration      enumeration_types[%u];", parser->enumeration_type_buckets.item_count);
        print_line(builder, "lang_type_info_enumeration_item enumeration_items[%u];", enumeration_item_count);
        print_line(builder, "lang_type_info_array            array_types[%u];", graph->unique_array_type_buckets.item_count);
        print_line(builder, "lang_type_info_compound         compound_types[%u];", graph->unique_compound_type_buckets.item_count);
        print_line(builder, "lang_type_info_compound_field   compound_fields[%u];", compound_field_count);
        print_line(builder, "lang_type_info_function         function_types[%u];",  graph->unique_function_type_buckets.item_count);
        
        print_scope_close(builder, false);
        
        print_line(builder, " lang_type_table =");
        
        print_scope_open(builder);
        
        string bool_names[] =
        {
            s("false"),
            s("true"),
        };
        
        // number types
        print_scope_open(builder);
        for_bucket_item(bucket, index, parser->number_type_buckets)
        {
            auto number_type = &bucket->base[index];
            print_line(builder, "{ lang_type_info_type_number, lang_type_info_number_type_%.*s, %u, %.*s, %.*s },", fs(number_type->name), 1 << (number_type->bit_count_power_of_two - 3), fs(bool_names[number_type->is_float]), fs(bool_names[number_type->is_signed]));
        }
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        // enumeration types
        u32 enumeration_item_offset = 0;
        print_scope_open(builder);
        for_bucket_item(bucket, index, parser->enumeration_type_buckets)
        {
            auto enumeration_type = &bucket->base[index];
            print_line(builder, "{ lang_type_info_type_enumeration, ");
            print_type_info(&buffer, enumeration_type->item_type);
            print_line(builder, ", { %u, (lang_type_info_enumeration_item *) &lang_type_table.enumeration_items[%u] } },", enumeration_type->item_count, enumeration_item_offset);
            enumeration_item_offset += enumeration_type->item_count;
        }
        assert(enumeration_item_offset = enumeration_item_count);
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        // enumeration items
        print_scope_open(builder);
        for_bucket_item(bucket, index, parser->enumeration_type_buckets)
        {
            auto enumeration_type = &bucket->base[index];
            for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
            {
                print_line(builder, "{ lang_type_info_type_enumeration_item, { %llu, (u8 *) \"%.*s\" }, %llu },", item->name.count, fs(item->name), get_enumeration_item_value(item));
            }
        }
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        // array types
        print_scope_open(builder);
        for_bucket_item(bucket, index, graph->unique_array_type_buckets)
        {
            auto array_type = &bucket->base[index];
            
            auto graph_index = find_node(graph, get_base_node(array_type)).index;
            assert(graph_index != -1);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
            
            print(builder, "{ lang_type_info_type_array, ");
            print_type_info(&buffer, array_type->item_type);
            
            usize item_count = 0;
            if (array_type->item_count_expression)
                item_count = get_array_item_count(array_type);
            
            print_line(builder, ", %llu, %llu },", item_count, item_count * get_type_byte_count(array_type->item_type).byte_count);
        }
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        // compound types
        u32 compound_field_offset = 0;
        print_scope_open(builder);
        for_bucket_item(bucket, index, graph->unique_compound_type_buckets)
        {
            auto compound_type = &bucket->base[index];
            
            auto graph_index = find_node(graph, get_base_node(compound_type)).index;
            assert(graph_index != -1);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
            
            // update byte count and alignment
            get_type_byte_count(to_type(parser, get_base_node(compound_type)));
            
            print_line(builder, "{ lang_type_info_type_compound, { %u, (lang_type_info_compound_field *) &lang_type_table.compound_fields[%u] }, %u, %u },", compound_type->field_count, compound_field_offset, compound_type->byte_count, compound_type->byte_alignment);
            compound_field_offset += compound_type->field_count;
        }
        assert(compound_field_offset == compound_field_count);
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        // compound fields
        print_scope_open(builder);
        for_bucket_item(bucket, index, graph->unique_compound_type_buckets)
        {
            auto compound_type = &bucket->base[index];
            
            auto graph_index = find_node(graph, get_base_node(compound_type)).index;
            assert(graph_index != -1);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
            
            for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
            {
                print(builder, "{ lang_type_info_type_compound_field, ");
                print_type_info(&buffer, field->type);
            
                print_line(builder, ", { %llu, (u8 *) \"%.*s\" }, %u },", field->name.count, fs(field->name), field->field_byte_offset);
            }
        }
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        // function types
        print_scope_open(builder);
        for_bucket_item(bucket, index,  graph->unique_function_type_buckets)
        {
            auto function_type = &bucket->base[index];
            
            auto graph_index = find_node(graph, get_base_node(function_type)).index;
            assert(graph_index != -1);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
            
            print(builder, "{ lang_type_info_type_function, ");
            
            if (function_type->input.base_type.node)
            {
                auto base_type = find_node(&buffer.graph, function_type->input.base_type.node).unique_node;
                print(builder, "(lang_type_info_compound *) &lang_type_table.compound_types[%u], ", base_type->type_index);
            }
            else
                print(builder, "null, ");
                
            if (function_type->output.base_type.node)
            {
                auto base_type = find_node(&buffer.graph, function_type->output.base_type.node).unique_node;
                print_line(builder, "(lang_type_info_compound *) &lang_type_table.compound_types[%u] },", base_type->type_index);
            }
            else
                print_line(builder, "null },");
        }
        print_scope_close(builder, false);
        print_line(builder, ",");
        
        print_scope_close(builder, false);
        print_line(builder, ";");
        
        print_newline(builder);
    }
    
    // declare global variable table
    {
        maybe_print_blank_line(builder);
            
        if (!global_variable_count)
            global_variable_count = 1;
            
        print(builder, "const struct { lang_variable_info base[%u]; } lang_global_variables = ", global_variable_count);
        print_scope_open(builder);
        print_scope_open(builder);
            
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            if (!variable->is_global)
                continue;
            
            auto graph_index = find_node(graph, get_base_node(variable)).index;
            assert(graph_index != null);
            if (!graph->nodes.base[graph_index].is_required)
                continue;
            
            print(builder, "{ ");
            print_type_info(&buffer, variable->type);
            print_line(builder, ", { %llu, (u8 *) \"%.*s\" }, (u8 *) &%.*s },", variable->name.count, fs(variable->name), fs(variable->name));
        }
        
        print_scope_close(builder);
        print_scope_close(builder, false);
        print_line(builder, ";");
        
        print_newline(builder);
    }
    
    // HACK: some print functions
    {
        print_newline(builder);
        print_line(builder, "void print(string text) { printf(\"%%.*s\", (s32) text.count, (cstring) text.base); }");
        print_newline(builder);
        print_line(builder, "void print_u64(u64 value) { printf(\"%%llu\", value); }");
        print_newline(builder);
        print_line(builder, "void print_s64(s64 value) { printf(\"%%lli\", value); }");
        print_newline(builder);
        print_line(builder, "void print_f64(f64 value) { printf(\"%%f\", value); }");
        print_newline(builder);
        print_line(builder, "void print_hex(u64 value) { printf(\"%%llx\", value); }");
    }
    
    // declare all functions
    for_bucket_item(bucket, index, parser->function_buckets)
    {
        auto function = &bucket->base[index];
                
        if (function->first_statement && (function->first_statement->node_type == ast_node_type_external_binding))
            continue;
        
        auto graph_index = find_node(graph, get_base_node(function)).index;
        assert(graph_index != null);
        if (!graph->nodes.base[graph_index].is_required)
            continue;
    
        auto function_type = get_function_type(parser, function);
        
        maybe_print_blank_line(builder);
        
        print_function_type(&buffer, function_type, function->name, false);
        
        print_scope_open(builder);

        if (function->first_statement)
            print_statements(&buffer, function->first_statement);

        print_scope_close(builder);
    }

    {
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
    }
    
    // using extern forward declaration of arrays is super slow on c compile time
#if 0
    // declare all global arrays with content
    
    for_bucket_item(bucket, index, parser->constant_buckets)
    {
        auto constant = &bucket->base[index];
        
        if (!is_node_type(constant->node.parent, file))
            continue;
        
        auto type = get_expression_type(parser, constant->expression);
            
        if (!is_node_type(type.base_type.node, array_type))
            continue;
        
    #if defined NORMAL_CONST_ARRAY
        print_constant_declaration(&buffer, constant);
    #else
        
        maybe_print_blank_line(builder);
        print(builder, "const ");
        local_node_type(array_type, type.base_type.node);
        print_type(&buffer, array_type->item_type);
        print(builder, " %.*s[]", fs(constant->name));
                        
        if (!try_print_literal_assignment(&buffer, constant->expression))
        {
            print(builder, " = ");
            print_expression(&buffer, constant->expression);
        }
        
        print_line(builder, ";");
    #endif
    }
#endif
    
    return buffer;
}

void clear(lang_c_buffer *buffer)
{
    free_buffer(&buffer->builder.memory);
}