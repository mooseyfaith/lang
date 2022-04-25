#pragma once

#include "utf8_string.h"

#define ast_node_type_list(macro, ...) \
    macro(none, __VA_ARGS__) \
    macro(variable, __VA_ARGS__) \
    macro(function, __VA_ARGS__) \
    macro(compound_type, __VA_ARGS__) \
    macro(assignment, __VA_ARGS__) \
    macro(number, __VA_ARGS__) \
    macro(string, __VA_ARGS__) \
    macro(variable_reference, __VA_ARGS__) \
    macro(name_reference, __VA_ARGS__) \
    macro(branch, __VA_ARGS__) \
    macro(loop, __VA_ARGS__) \
    macro(branch_switch, __VA_ARGS__) \
    macro(branch_switch_case, __VA_ARGS__) \
    macro(function_call, __VA_ARGS__) \
    macro(cast, __VA_ARGS__) \
    macro(field_reference, __VA_ARGS__) \
    macro(take_reference, __VA_ARGS__) \
    macro(prefix_operator, __VA_ARGS__) \
    macro(not, __VA_ARGS__) \
    
    
#define menum(entry, prefix) \
    prefix ## entry,

enum ast_node_type
{
    ast_node_type_list(menum, ast_node_type_)
    
    ast_node_type_count,
};

#define menum_name(entry, ...) \
    s(# entry),

string ast_node_type_names[] = {
    ast_node_type_list(menum_name)
};

struct ast_node
{
    ast_node *next_sibling;
    ast_node_type node_type;
};

// not an ast_node
struct ast_type
{
    string name;
    u32 indirection_count;
};

struct ast_variable
{
    ast_node node;
    ast_type type;
    string name;
};

struct ast_function
{
    ast_node node;
    ast_type type;
    string name;
    ast_node *first_argument;
    ast_node *first_result_value;
    ast_node *first_statement;
};

struct ast_compound_type
{
    ast_node node;
    ast_type type;
    string name;
    ast_node *first_statement;
};

struct ast_variable_reference
{
    ast_node node;
    
    union
    {
        string       name;
        ast_variable *variable;
    };
};

typedef ast_variable_reference ast_name_reference;

struct ast_field_reference
{
    ast_node node;
    ast_node *expression;
    string field_name;
};

struct ast_assignment
{
    ast_node node;
    ast_node *left, *right;
};

struct ast_number
{
    ast_node node;
    
    union
    {
        u64 u64_value;
    };
};

struct ast_string
{
    ast_node node;
    string text;
};

struct ast_branch
{
    ast_node node;
    ast_node *condition;
    ast_node *first_true_statement;
    ast_node *first_false_statement;
};

struct ast_loop
{
    ast_node node;
    ast_node *condition;
    ast_node *first_statement;
};

struct ast_branch_switch_case
{
    ast_node node;
    ast_node *expression;
    ast_node *first_statement;
};

struct ast_branch_switch
{
    ast_node node;
    ast_node *expression;
    ast_branch_switch_case *first_case;
    ast_node               *first_default_case_statement;
};

struct ast_function_call
{
    ast_node node;
    ast_node *expression;
    ast_node *first_argument;
};

struct ast_cast
{
    ast_node node;
    ast_node *expression;
    ast_type type;
};

struct ast_take_reference
{
    ast_node node;
    ast_node *expression;
};

struct ast_prefix_operator
{
    ast_node node;
    ast_node *expression;
};

typedef ast_prefix_operator ast_not;

#define new_node(node_type) ( (ast_ ## node_type *) init((ast_node *) new ast_ ## node_type, sizeof(ast_ ## node_type), ast_node_type_ ## node_type) )
#define new_local_node(node_type) ast_ ## node_type *node_type = new_node(node_type)

ast_node * init(ast_node *node, u32 byte_count, ast_node_type node_type)
{
    memset(node, 0, byte_count);
    node->node_type = node_type;
    
    return node;
}

void append(ast_node ***tail_next, ast_node *node)
{
    **tail_next = node;
    *tail_next  = &node->next_sibling;
}

#define local_node_type(type, node) ast_ ## type *type = (ast_ ## type *) (node); assert((node)->node_type == ast_node_type_ ## type)

struct lang_parser
{
    string source_name;
    string source;
    
    string iterator;
    
    bool error;
};

bool try_consume(lang_parser *parser, string pattern)
{
    if (try_skip(&parser->iterator, pattern))
    {
        skip_white(&parser->iterator);
        
        return true;
    }
    else
    {
        return false;
    }
}

bool try_consume_keyword(lang_parser *parser, string keyword)
{
    auto backup = parser->iterator;
    
    if (try_skip(&parser->iterator, keyword))
    {
        if (!parser->iterator.count || (!is_letter(parser->iterator.base[0]) && !is_digit(parser->iterator.base[0])))
        {
            skip_white(&parser->iterator);
            return true;
        }
    }
    
    parser->iterator = backup;
    return false;
}

void parse_message_va(lang_parser *parser, string token, cstring format, va_list va_arguments)
{
    string left = parser->source;
    
    u32 line_count = 0;
    u32 column_count = 0;
    string line = left;
    
    while (left.base <= token.base)
    {
        u8 head = left.base[0];
        advance(&left);
        
        if (head == '\n')
        {
            line_count++;
            column_count = 0;
            line = left;
        }
        else
        {
            column_count++;
        }
    }
    
    while (left.count)
    {
        u8 head = left.base[0];
        if ((head == '\n') || (head == '\r'))
            break;
            
        advance(&left);
    }
    
    line.count = left.base - line.base;
    
    printf("\n%.*s(%i,%i):  ", fs(parser->source_name), line_count + 1, column_count + 1);
    vprintf(format, va_arguments);
    printf("\n%.*s(%i,%i):  %.*s\n", fs(parser->source_name), line_count + 1, column_count + 1, fs(line));
    printf("%.*s(%i,%i):  %*c\n", fs(parser->source_name), line_count + 1, column_count + 1, column_count, '^');
}

void parse_message(lang_parser *parser, string token, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    parse_message_va(parser, token, format, va_arguments);
    
    va_end(va_arguments);
}

// assumes lang_parser *parser in local scope
#define lang_require_return_value(condition, return_value, token, message, ...) \
    if (!(condition)) \
    { \
        parser->error = true; \
        parse_message(parser, token, "ERROR: " message, __VA_ARGS__); \
        assert(0); \
        return return_value; \
    }

#define lang_require(condition, token, message, ...) lang_require_return_value(condition, null, token, message, __VA_ARGS__) 

#define lang_abort_return_value(return_value) if (parser->error) return return_value
#define lang_abort() lang_abort_return_value(null);

#define lang_call(call) call; lang_abort()

ast_number * parse_number(lang_parser *parser)
{
    usize count = 0;
    u64 value = 0;
    while (count < parser->iterator.count)
    {
        u8 head = parser->iterator.base[count];
        if (!is_digit(head))
            break;
        
        auto previous = value;
        value *= 10;
        value += head - '0';
        lang_require(previous <= value, parser->iterator, "number to big for 64bit representation");
        
        count++;
    }
    
    if (count)
    {
        string token = skip(&parser->iterator, count);

        new_local_node(number);
        number->u64_value = value;

        return number;
    }
    else
    {
        return null;
    }
}

ast_string * parse_string_literal(lang_parser *parser)
{
    if (!parser->iterator.count || (parser->iterator.base[0] != '"'))
        return null;
    
    string text;
    text.base = parser->iterator.base + 1;
    
    usize count = 1;
    bool ok = false;
    while (count < parser->iterator.count)
    {
        u8 head = parser->iterator.base[count];
        
        // skip next character
        if (head == '\\')
        {
            lang_require(count + 1 < parser->iterator.count, parser->iterator, "unexpected end of source after '\\' in string literal");
            count++;
        }
        else if (head == '"')
        {
            ok = true;
            break;
        }
        
        count++;
    }
    
    lang_require(ok, parser->iterator, "expected '\"' after string literal");
    
    text.count = count - 1;
    advance(&parser->iterator, count + 1);
    
    new_local_node(string);
    string->text = text;
    
    return string;
}

ast_type parse_type(lang_parser *parser)
{
    ast_type result = {};
    result.name = skip_name(&parser->iterator);
    if (result.name.count)
    {
        while (try_consume_keyword(parser, s("ref")))
        {
            result.indirection_count++;
        }
    }
    
    return result;
}

ast_node * parse_expression(lang_parser *parser)
{
    ast_node *parent = null;
    ast_node **parent_expression = &parent;
    
    while (true)
    {
        auto backup = *parser;
        
        auto keyword = skip_name(&parser->iterator);
        if (keyword == s("not"))
        {
            new_local_node(not);
            
            *parent_expression = &not->node;
            parent_expression = &not->expression;
            continue;
        }
        
        *parser = backup;
        break;
    }

    auto expression = lang_call(&parse_number(parser)->node);
    if (!expression)
    {
        expression = lang_call(&parse_string_literal(parser)->node);
    }
    
    if (!expression)
    {
        auto name = skip_name(&parser->iterator);
        if (name.count)
        {
            new_local_node(name_reference);
            name_reference->name = name;
            expression = &name_reference->node;
            
            // function call
            if (try_consume(parser, s("(")))
            {
                ast_node *first_argument = null;
                auto argument_tail_next = &first_argument;
            
                bool is_first = true;
                while (!try_consume(parser, s(")")))
                {
                    lang_require(is_first || try_consume(parser, s(",")), parser->iterator, "expected expression after ','");
                    
                    auto argument = lang_call(parse_expression(parser));
                    lang_require(argument, parser->iterator, "expected expression or ')' in function call");
                
                    append(&argument_tail_next, argument);
                
                    is_first = false;
                }
                
                new_local_node(function_call);
                function_call->expression = expression;
                function_call->first_argument = first_argument;
                
                expression = &function_call->node;
            }
        }
    }
    
    while (expression)
    {
        skip_white(&parser->iterator);
        
        if (try_consume(parser, s(".")))
        {
            auto field = skip_name(&parser->iterator);
            lang_require(field.count, parser->iterator, "expected field name after '.'");
            
            new_local_node(field_reference);
            field_reference->expression = expression;
            field_reference->field_name = field;
            
            expression = &field_reference->node;
            continue;
        }
        else
        {
            auto backup = *parser;
            
            auto keyword = skip_name(&parser->iterator);
            if (keyword == s("cast"))
            {
                lang_require(try_consume(parser, s("(")), parser->iterator, "expected '(' after 'cast'");
                auto type = lang_call(parse_type(parser));
                lang_require(type.name.count, parser->iterator, "expected type expression for cast");
                lang_require(try_consume(parser, s(")")), parser->iterator, "expected ')' at the end of cast");
                
                new_local_node(cast);
                cast->type = type;
                cast->expression = expression;
                
                expression = &cast->node;
                continue;
            }
            else if (keyword == s("ref"))
            {
                new_local_node(take_reference);
                take_reference->expression = expression;
                
                expression = &take_reference->node;
                continue;
            }
            else
            {
                *parser = backup;
            }
        }
        
        break;
    }
    
    *parent_expression = expression;
    
    return parent;
}

// parses '=' right
ast_assignment * parse_assignment(lang_parser *parser)
{
    if (!try_consume(parser, s("=")))
        return null;
        
    auto right = lang_call(parse_expression(parser));
    lang_require(right, parser->iterator, "expected expression after '=' in assignment");
    
    new_local_node(assignment);
    assignment->right = right;
    
    return assignment;
}

ast_node * parse_declaration(ast_node ***tail_next, lang_parser *parser)
{
    auto name = skip_name(&parser->iterator);
                
    ast_node *expression = null;
    
    new_local_node(variable);
    variable->name = name;
    variable->type = lang_call(parse_type(parser));
    
    if (!variable->type.name.count)
        variable->type.name = { s("s32") };
    
    append(tail_next, &variable->node);
    
    auto assignment = lang_call(parse_assignment(parser));
    if (assignment)
    {
        new_local_node(variable_reference);
        variable_reference->variable = variable;
        
        assignment->left = &variable_reference->node;
        append(tail_next, &assignment->node);
    }
    
    return &variable->node;
}

ast_node * parse_statements(lang_parser *parser)
{
    ast_node *first_statement = null;
    auto tail_next = &first_statement;
    
    while (parser->iterator.count)
    {
        auto backup = parser->iterator;

        auto token = skip_name(&parser->iterator);
        if (token.count)
        {
            if (token == s("var"))
            {
                lang_call(parse_declaration(&tail_next, parser));
                lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");
            }
            else if (token == s("if"))
            {
                new_local_node(branch);
                branch->condition = lang_call(parse_expression(parser));
                lang_require(branch->condition, parser->iterator, "expected condition expression after 'if'");
                
                lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after branch condition");
                branch->first_true_statement = lang_call(parse_statements(parser));
                lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after if branch statements");
                
                if (try_consume(parser, s("else")))
                {
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after 'else'");
                    branch->first_false_statement = lang_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after else branch statements");
                }
                
                append(&tail_next, &branch->node);
            }
            else if (token == s("while"))
            {
                new_local_node(loop);
                loop->condition = lang_call(parse_expression(parser));
                lang_require(loop->condition, parser->iterator, "expected condition expression after 'while'");
                
                lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after loop condition");
                loop->first_statement = lang_call(parse_statements(parser));
                lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after loop statements");
                
                append(&tail_next, &loop->node);
            }
            else if (token == s("switch"))
            {
                new_local_node(branch_switch);
                branch_switch->expression = lang_call(parse_expression(parser));
                lang_require(branch_switch->expression, parser->iterator, "expected expression after 'switch'");

                lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after switch condition");
                auto case_tail_next = (ast_node **) &branch_switch->first_case;

                while (!try_consume(parser, s("}")))
                {
                    ast_node **first_statement = null;
                    
                    if (!branch_switch->first_default_case_statement && try_consume(parser, s("?")))
                    {
                        first_statement = &branch_switch->first_default_case_statement;
                    }
                    else
                    {
                        new_local_node(branch_switch_case);
                        
                        branch_switch_case->expression = lang_call(parse_expression(parser));
                        
                        first_statement = &branch_switch_case->first_statement;
                        append(&case_tail_next, &branch_switch_case->node);
                    }

                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after case expression");
                    *first_statement = lang_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after case statement block");
                }
                
                append(&tail_next, &branch_switch->node);
            }
            else if (token == s("def"))
            {
                auto name = skip_name(&parser->iterator);
                
                if (try_consume_keyword(parser, s("func")))
                {
                    lang_require(try_consume(parser, s("(")), parser->iterator, "expected '(' after function name");
                    
                    new_local_node(function);
                    function->name = name;
                    
                    auto arugments_tail_next = &function->first_argument;
                    
                    {
                        bool is_first_argument = true;
                        while (!try_consume(parser, s(")")))
                        {
                            lang_require(is_first_argument || try_consume(parser, s(";")), parser->iterator, "expected ';' or ')' after function argument");
                            
                            lang_call(parse_declaration(&arugments_tail_next, parser));
                            
                            is_first_argument = false;
                        }
                    }
                    
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after function declaration");
                    function->first_statement = lang_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after function declaration");
                    
                    append(&tail_next, &function->node);
                }
                else if (try_consume_keyword(parser, s("struct")))
                {
                    new_local_node(compound_type);
                    compound_type->name = name;
                    
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after structure declaration");
                    compound_type->first_statement = lang_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after structure declaration");
                    
                    for (auto statement = compound_type->first_statement; statement; statement = statement->next_sibling)
                    {
                        lang_require((statement->node_type == ast_node_type_variable) || (statement->node_type == ast_node_type_assignment), parser->iterator, "unexpected %.*s statement in structure declaration", fs(ast_node_type_names[statement->node_type]));
                    }
                    
                    append(&tail_next, &compound_type->node);
                }
                else
                {
                    lang_require(false, parser->iterator, "expected function declaration ('func') or structure declaration ('struct') after definition name");
                }
            }
            else
            {
                // revert parse
                parser->iterator = backup;

                auto expression = lang_call(parse_expression(parser));
                if (expression)
                {
                    auto assignment = lang_call(parse_assignment(parser));
                    if (assignment)
                    {
                        assignment->left = expression;
                        expression = &assignment->node;
                    }

                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");

                    append(&tail_next, expression);
                }
            }
        }
        else
        {
            break;
        }
    }
    
    return first_statement;
}

struct ast_queue_entry
{
    ast_node *scope;
    ast_node *node;
};

struct ast_queue
{
    ast_queue_entry entries[4096];
    u32 count;
};

void enqueue(ast_queue *queue, ast_node *scope, ast_node *node)
{
    assert(node);
    
    usize count = 0;
    for (auto it = node; it; it = it->next_sibling)
        count++;

    assert(queue->count + count <= carray_count(queue->entries));
    queue->count += count;
    
    count = 0;
    for (auto it = node; it; it = it->next_sibling)
    {
        queue->entries[queue->count - 1 - count].scope = scope;
        queue->entries[queue->count - 1 - count].node  = it;
        count++;
    }
}

void enqueue(ast_queue *queue, ast_node *node)
{
    enqueue(queue, null, node);
}

bool next(ast_queue_entry *out_entry, ast_queue *queue)
{
    if (!queue->count)
        return false;

    auto entry = queue->entries[--queue->count];
    auto scope = entry.scope;
    auto node  = entry.node;
    //memcpy(queue->entries, queue->entries + 1, queue->count * sizeof(queue->entries[0]));
    
    switch (node->node_type)
    {
        cases_complete;
        
        case ast_node_type_number:
        case ast_node_type_string:
        case ast_node_type_variable_reference:
        case ast_node_type_name_reference:
        case ast_node_type_variable:
        {
        } break;
        
        case ast_node_type_not:
        {
            local_node_type(not, node);
            
            enqueue(queue, node, not->expression);
        } break;
        
        case ast_node_type_assignment:
        {
            local_node_type(assignment, node);
            
            enqueue(queue, node, assignment->right);
            enqueue(queue, node, assignment->left);
        } break;
        
        case ast_node_type_function:
        {
            local_node_type(function, node);
            
            if (function->first_statement)
                enqueue(queue, node, function->first_statement);
                
            if (function->first_argument)
                enqueue(queue, node, function->first_argument);
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, node);
            
            if (compound_type->first_statement)
                enqueue(queue, node, compound_type->first_statement);
        } break;
        
        case ast_node_type_branch:
        {
            local_node_type(branch, node);
                        
            if (branch->first_false_statement)
                enqueue(queue, node, branch->first_false_statement);
                
            if (branch->first_true_statement)
                enqueue(queue, node, branch->first_true_statement);
                
            enqueue(queue, node, branch->condition);
        } break;
        
        case ast_node_type_loop:
        {
            local_node_type(loop, node);
            
            if (loop->first_statement)
                enqueue(queue, node, loop->first_statement);
                
            enqueue(queue, node, loop->condition);
        } break;
        
        case ast_node_type_branch_switch:
        {
            local_node_type(branch_switch, node);
            
            if (branch_switch->first_case)
                enqueue(queue, node, &branch_switch->first_case->node);
                
            if (branch_switch->first_default_case_statement)
                enqueue(queue, node, branch_switch->first_default_case_statement);
            
            enqueue(queue, node, branch_switch->expression);
        } break;
        
        case ast_node_type_branch_switch_case:
        {
            local_node_type(branch_switch_case, node);
            
            if (branch_switch_case->first_statement)
                enqueue(queue, node, branch_switch_case->first_statement);
            
            enqueue(queue, node, branch_switch_case->expression);
        } break;
        
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);
            
            if (function_call->first_argument)
                enqueue(queue, node, function_call->first_argument);
                
            enqueue(queue, node, function_call->expression);
        } break;
        
        case ast_node_type_cast:
        {
            local_node_type(cast, node);
            
            enqueue(queue, node, cast->expression);
        } break;
        
        case ast_node_type_take_reference:
        {
            local_node_type(take_reference, node);
            
            enqueue(queue, node, take_reference->expression);
        } break;
        
        case ast_node_type_field_reference:
        {
            local_node_type(field_reference, node);
            
            enqueue(queue, node, field_reference->expression);
        } break;
    }
    
    *out_entry = entry;
    
    return true;
}

bool next(ast_node **out_node, ast_queue *queue)
{
    ast_queue_entry out_entry;
    bool ok = next(&out_entry, queue);
    *out_node = out_entry.node;
    
    return ok;
}

ast_type get_expression_type(ast_node *node)
{
    switch (node->node_type)
    {
        cases_complete;
        
        case ast_node_type_not:
        {
            return { s("bool") };
        } break;
        
        case ast_node_type_number:
        {
            return { s("s32") };
        } break;
        
        case ast_node_type_string:
        {
            return { s("cstring") };
        } break;
        
        case ast_node_type_variable_reference:
        {
            local_node_type(variable_reference, node);
            return variable_reference->variable->type;
        } break;
        
        case ast_node_type_name_reference:
        {
            assert(0, "name reference was not resolved");
        } break;
    }
    
    return {};
}

struct ast_list_entry
{
    ast_list_entry *next;
    ast_node *scope;
    ast_node *node;
};

ast_node * parse(string source, string source_name = s("(internal)"))
{
    lang_parser parser = {};
    parser.source_name = source_name;
    parser.source = source;
    parser.iterator = parser.source;
    
    skip_white(&parser.iterator);
    
    auto first_statement = parse_statements(&parser);

#if 1
    // print ast
    {
        ast_queue queue = {};
        
        if (first_statement)
            enqueue(&queue, first_statement);
        
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            printf("%.*s 0x%p\n", fs(ast_node_type_names[entry.node->node_type]), entry.node);
        }
    }
#endif
    
    ast_list_entry *variable_list = null;
    
    // collect variable declarations
    {
        ast_queue queue = {};
        
        auto tail_next = &variable_list;
        
        if (first_statement)
            enqueue(&queue, first_statement);
        
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = entry.node;
            
            if (node->node_type == ast_node_type_variable)
            {
                auto new_entry = new ast_list_entry;
                *new_entry = {};
                new_entry->node  = node;
                new_entry->scope = entry.scope;
                
                *tail_next = new_entry;
                tail_next = &new_entry->next;
                
                printf("var %.*s\n", fs(((ast_variable *) node)->name));
            }
        }
    }
    
    {
        ast_queue queue = {};
        
        ast_node *scope_stack[64];
        u32 scope_stack_count = 0;
        
        assert(scope_stack_count < carray_count(scope_stack));
        scope_stack[scope_stack_count++] = null;
        
        if (first_statement)
            enqueue(&queue, first_statement);
            
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = entry.node;
            
            {
                bool found = false;
                for (u32 i = 0; i < scope_stack_count; i++)
                {
                    if (scope_stack[i] == entry.scope)
                    {
                        scope_stack_count = i + 1;
                        found = true;
                        break;
                    }
                }
                
                if (!found)
                {
                    assert(scope_stack_count < carray_count(scope_stack));
                    scope_stack[scope_stack_count++] = entry.scope;
                }
            }
            
            if (node->node_type == ast_node_type_name_reference)
            {
                local_node_type(name_reference, node);
            
                for (u32 i = 0; i < scope_stack_count; i++)
                {
                    auto scope = scope_stack[scope_stack_count - 1 - i];
                
                    for (auto it = variable_list; it; it = it->next)
                    {
                        local_node_type(variable, it->node);
                        
                        if ((it->scope == scope) && (variable->name == name_reference->name))
                        {
                            name_reference->node.node_type =  ast_node_type_variable_reference;
                            name_reference->variable = variable;
                            
                            i = scope_stack_count; // break from outer loop
                            break;
                        }
                    }
                }
            }
        }
    }
    
    return first_statement;
}
