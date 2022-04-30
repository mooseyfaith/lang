#pragma once

#include "utf8_string.h"
#include "hash_table.h"

#define ast_node_type_list(macro, ...) \
    macro(node, __VA_ARGS__) \
    macro(comment, __VA_ARGS__) \
    macro(module, __VA_ARGS__) \
    macro(module_reference, __VA_ARGS__) \
    macro(file, __VA_ARGS__) \
    macro(file_reference, __VA_ARGS__) \
    macro(variable, __VA_ARGS__) \
    macro(enumeration, __VA_ARGS__) \
    macro(enumeration_item, __VA_ARGS__) \
    macro(external_binding, __VA_ARGS__) \
    macro(function, __VA_ARGS__) \
    macro(constant, __VA_ARGS__) \
    macro(type_alias, __VA_ARGS__) \
    macro(function_type, __VA_ARGS__) \
    macro(compound_type, __VA_ARGS__) \
    macro(assignment, __VA_ARGS__) \
    macro(number, __VA_ARGS__) \
    macro(string, __VA_ARGS__) \
    macro(name_reference, __VA_ARGS__) \
    macro(branch, __VA_ARGS__) \
    macro(loop, __VA_ARGS__) \
    macro(branch_switch, __VA_ARGS__) \
    macro(branch_switch_case, __VA_ARGS__) \
    macro(function_return, __VA_ARGS__) \
    macro(function_call, __VA_ARGS__) \
    macro(cast, __VA_ARGS__) \
    macro(field_reference, __VA_ARGS__) \
    macro(take_reference, __VA_ARGS__) \
    macro(prefix_operator, __VA_ARGS__) \
    macro(not, __VA_ARGS__) \
    macro(binary_operator, __VA_ARGS__) \
    macro(is, __VA_ARGS__) \
    macro(is_not, __VA_ARGS__) \
    macro(bit_or, __VA_ARGS__) \
    
    
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
    ast_node *next;
    ast_node_type node_type;
};

// not an ast_node
struct ast_type
{
    string name;
    u32 indirection_count;
};

struct ast_comment
{
    ast_node node;
    string text;
};

struct ast_module;

struct ast_module_reference
{
    ast_node node;
    ast_module *module;
};

struct ast_file
{
    ast_node node;
    ast_module *module;
    ast_node   *first_statement;
    ast_module_reference *first_module_dependency;
    string path;
    string text;
};

struct ast_file_reference
{
    ast_node node;
    ast_file *file;
};

struct ast_module
{
    ast_node node;
    ast_file_reference *first_file;
    string name;
};

struct ast_variable
{
    ast_node node;
    ast_type type;
    string name;
    bool is_global;
};

struct ast_enumeration_item
{
    ast_node node;
    ast_node *expression;
    string name;
};

struct ast_enumeration
{
    ast_node node;
    ast_type type;
    string name;
    ast_enumeration_item *first_item;
};

struct ast_external_binding
{
    ast_node node;
    string library_name;
    bool is_dll;
};

struct ast_constant
{
    ast_node node;
    string   name;
    ast_node *expression;
};

struct ast_type_alias
{
    ast_node node;
    string name;
    ast_type type;
};

struct ast_function_type
{
    ast_node node;
    string name;
    // list of variables, each possibly followed by an assignment
    ast_node *first_input;
    ast_node *first_output;
};

struct ast_function
{
    ast_node node;
    ast_node *type;
    string name;
    ast_node *first_statement;
};

struct ast_compound_type
{
    ast_node node;
    //ast_type type;
    string name;
    ast_node *first_statement;
};

struct ast_name_reference
{
    ast_node node;
    string   name;
    ast_node *reference;
};

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
    
    bool is_signed;
    
    union
    {
        u64 u64_value;
        s64 s64_value;
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

struct ast_function_return
{
    ast_node node;
    ast_node *first_expression;
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

struct ast_binary_operator
{
    ast_node node;
    ast_node *left, *right;
};

typedef ast_binary_operator ast_is;
typedef ast_binary_operator ast_is_not;
typedef ast_binary_operator ast_bit_or;

#define menum_ast_type_byte_count(entry, ...) \
    sizeof(ast_ ## entry),

u32 ast_node_type_byte_counts[] = {
    ast_node_type_list(menum_ast_type_byte_count)
};

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
    *tail_next  = &node->next;
}

#define get_node_type(type, node)   (ast_ ## type *) (node); assert((node)->node_type == ast_node_type_ ## type)
#define local_node_type(type, node) ast_ ## type *type = get_node_type(type, node)

struct lang_parser
{
    string source_name;
    string source;
    
    string iterator;
    
    bool error;
    
    ast_module *first_module;
    ast_module **module_tail_next;
    
    ast_file   *first_file;
    ast_file   **file_tail_next;
    
    ast_file   *current_file;
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
    ast_file *file = null;
    for (auto it = parser->first_file; it; it = (ast_file *) it->node.next)
    {
        if ((it->text.base <= token.base) && (token.base + token.count <= it->text.base + it->text.count))
        {
            file = it;
            break;
        }
    }
    assert(file);

    string left = file->text;
    
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
    
    printf("\n%.*s(%i,%i):  ", fs(file->path), line_count + 1, column_count + 1);
    vprintf(format, va_arguments);
    printf("\n%.*s(%i,%i):  %.*s\n", fs(file->path), line_count + 1, column_count + 1, fs(line));
    printf("%.*s(%i,%i):  %*c\n", fs(file->path), line_count + 1, column_count + 1, column_count, '^');
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

#define lang_require_call(call) call; lang_abort()

ast_number * parse_number(lang_parser *parser)
{
    bool is_signed = try_skip(&parser->iterator, s("-"));
    if (!is_signed)
        try_skip(&parser->iterator, s("+")); // ignore + sign

    bool is_hex = try_skip(&parser->iterator, s("0x"));
    
    u64 base = 10;
    
    if (is_hex)
        base = 16;

    usize count = 0;
    u64 value = 0;
    while (count < parser->iterator.count)
    {
        u8 head = parser->iterator.base[count];
        u8 digit = head - '0';
        
        if (digit > 9)
        {
            if (!is_hex)
                break;
                
            u8 digit = head - 'a';
            if (digit >= 6)
                digit = head - 'A';
             
            if (digit >= 6)
                break;
            
            digit += 10;
        }
        
        auto previous = value;
        value *= base;
        value += digit;
        lang_require(previous <= value, parser->iterator, "number to big for 64bit representation");
        
        count++;
    }
    
    if (count)
    {
        string token = skip(&parser->iterator, count);

        new_local_node(number);
        number->is_signed = is_signed;
        
        if (is_signed)
            number->s64_value = -(s64) value;
        else
            number->u64_value = value;

        return number;
    }
    else
    {
        lang_require(!is_hex, parser->iterator, "expected hexadecimal value after '0x'");
        return null;
    }
}

bool parse_quoted_string(string *out_text, lang_parser *parser)
{
    if (!parser->iterator.count || (parser->iterator.base[0] != '"'))
        return false;
    
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
    
    lang_require_return_value(ok, false, parser->iterator, "expected '\"' after string literal");
    
    text.count = count - 1;
    advance(&parser->iterator, count + 1);
    
    *out_text = text;
    
    return true;
}

ast_string * parse_string_literal(lang_parser *parser)
{
    string text;
    bool ok = lang_require_call(parse_quoted_string(&text, parser));
    
    if (ok)
    {
        new_local_node(string);
        string->text = text;
    
        return string;
    }
    else
    {
        return null;
    }
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

#define parse_expression_declaration ast_node * parse_expression(lang_parser *parser)

parse_expression_declaration;

ast_node * parse_base_expression(lang_parser *parser)
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

    auto expression = lang_require_call(&parse_number(parser)->node);
    if (!expression)
    {
        expression = lang_require_call(&parse_string_literal(parser)->node);
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
                    
                    auto argument = lang_require_call(parse_expression(parser));
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
                auto type = lang_require_call(parse_type(parser));
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

parse_expression_declaration
{
    auto left = lang_require_call(parse_base_expression(parser));
    
    while (true)
    {
        if (try_consume_keyword(parser, s("is")))
        {
            new_local_node(is);
            is->left = left;
            is->right = lang_require_call(parse_base_expression(parser));
            lang_require(is->right, parser->iterator, "expected expression after 'is' (equal opeator)");
            
            left = &is->node;
            continue;
        }
        else if (try_consume_keyword(parser, s("is_not")))
        {
            new_local_node(is_not);
            is_not->left = left;
            is_not->right = lang_require_call(parse_base_expression(parser));
            lang_require(is_not->right, parser->iterator, "expected expression after 'is_not' (equal opeator)");
            
            left = &is_not->node;
            continue;
        }
        else if (try_consume_keyword(parser, s("bit_or")))
        {
            new_local_node(bit_or);
            bit_or->left = left;
            bit_or->right = lang_require_call(parse_base_expression(parser));
            lang_require(bit_or->right, parser->iterator, "expected expression after 'bit_or'");
            
            left = &bit_or->node;
            continue;
        }
        
        break;
    }
    
    return left;
}

// parses '=' right
ast_assignment * parse_assignment(lang_parser *parser)
{
    if (!try_consume(parser, s("=")))
        return null;
        
    auto right = lang_require_call(parse_expression(parser));
    lang_require(right, parser->iterator, "expected expression after '=' in assignment");
    
    new_local_node(assignment);
    assignment->right = right;
    
    return assignment;
}

ast_variable * parse_declaration(ast_node ***tail_next, lang_parser *parser)
{
    auto name = skip_name(&parser->iterator);
                
    ast_node *expression = null;
    
    new_local_node(variable);
    variable->name = name;
    variable->type = lang_require_call(parse_type(parser));
    
    if (!variable->type.name.count)
        variable->type.name = { s("s32") };
    
    append(tail_next, &variable->node);
    
    auto assignment = lang_require_call(parse_assignment(parser));
    if (assignment)
    {
        new_local_node(name_reference);
        name_reference->name      = name;
        name_reference->reference = &variable->node;
        
        assignment->left = &name_reference->node;
        append(tail_next, &assignment->node);
    }
    
    return variable;
}

// assumes '(' was allready parsed
ast_node * parse_arguments(ast_node **first_argument, lang_parser *parser)
{
    assert(*first_argument == null);

    bool is_first_argument = true;
    while (!try_consume(parser, s(")")))
    {
        lang_require(is_first_argument || try_consume(parser, s(";")), parser->iterator, "expected ';' or ')' after function argument");
        
        lang_require_call(parse_declaration(&first_argument, parser));
        
        is_first_argument = false;
    }
    
    // HACK: because all parse function return a pointer
    return null;
}

ast_node * parse_statements(lang_parser *parser)
{
    ast_node *first_statement = null;
    auto tail_next = &first_statement;
    
    while (parser->iterator.count)
    {
        if (try_consume(parser, s("//")))
        {
            new_local_node(comment);
            comment->text = skip_until_set_or_all(&parser->iterator, s("\n\r"), true);
            skip_white(&parser->iterator);
            
            append(&tail_next, &comment->node);
            continue;
        }
    
        auto backup = parser->iterator;

        auto token = skip_name(&parser->iterator);
        if (token.count)
        {
            if (token == s("var"))
            {
                bool is_global = try_consume_keyword(parser, s("global"));
                
                auto variable = lang_require_call(parse_declaration(&tail_next, parser));
                variable->is_global = is_global;
                
                lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");
            }
            else if (token == s("if"))
            {
                new_local_node(branch);
                branch->condition = lang_require_call(parse_expression(parser));
                lang_require(branch->condition, parser->iterator, "expected condition expression after 'if'");
                
                lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after branch condition");
                branch->first_true_statement = lang_require_call(parse_statements(parser));
                lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after if branch statements");
                
                if (try_consume(parser, s("else")))
                {
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after 'else'");
                    branch->first_false_statement = lang_require_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after else branch statements");
                }
                
                append(&tail_next, &branch->node);
            }
            else if (token == s("while"))
            {
                new_local_node(loop);
                loop->condition = lang_require_call(parse_expression(parser));
                lang_require(loop->condition, parser->iterator, "expected condition expression after 'while'");
                
                lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after loop condition");
                loop->first_statement = lang_require_call(parse_statements(parser));
                lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after loop statements");
                
                append(&tail_next, &loop->node);
            }
            else if (token == s("switch"))
            {
                new_local_node(branch_switch);
                branch_switch->expression = lang_require_call(parse_expression(parser));
                lang_require(branch_switch->expression, parser->iterator, "expected expression after 'switch'");

                //lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after switch condition");
                auto case_tail_next = (ast_node **) &branch_switch->first_case;

                while (try_consume_keyword(parser, s("case")))
                {
                    new_local_node(branch_switch_case);
                    branch_switch_case->expression = lang_require_call(parse_expression(parser));
                    lang_require(branch_switch_case->expression, parser->iterator, "expected expression after 'case'");
                    
                    append(&case_tail_next, &branch_switch_case->node);

                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after case expression");
                    branch_switch_case->first_statement = lang_require_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after case statements");
                }
                
                if (try_consume_keyword(parser, s("else")))
                {
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after switch else");
                    branch_switch->first_default_case_statement = lang_require_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after switch else statements");
                }
                
                lang_require(branch_switch->first_case || branch_switch->first_default_case_statement, parser->iterator, "expected 'case' or 'else' after switch expression");
                
                append(&tail_next, &branch_switch->node);
            }
            else if (token == s("return"))
            {
                new_local_node(function_return);
                
                auto expression_tail_next = &function_return->first_expression;
                
                bool is_first = true;
                while (!try_consume(parser, s(";")))
                {
                    lang_require(is_first || try_consume(parser, s(",")), parser->iterator, "expected ',' or ';' after return expression");
                    is_first = false;
                    
                    auto expression = lang_require_call(parse_expression(parser));
                    append(&expression_tail_next, expression);
                }
                
                append(&tail_next, &function_return->node);
            }
            else if (token == s("def"))
            {
                auto name = skip_name(&parser->iterator);
                
                if (try_consume(parser, s("=")))
                {
                    new_local_node(constant);
                    constant->name = name;
                    constant->expression = lang_require_call(parse_expression(parser));
                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' after constant definition");
                    
                    append(&tail_next, &constant->node);
                }
                else if (try_consume_keyword(parser, s("func")))
                {
                    ast_node *type = null;
                
                    if (try_consume(parser, s("(")))
                    {
                        new_local_node(function_type);
                        
                        parse_arguments(&function_type->first_input, parser);
                        
                        if (try_consume(parser, s("(")))
                            parse_arguments(&function_type->first_output, parser);
                        
                        type = &function_type->node;
                    }
                    else
                    {
                        auto function_type_name = skip_name(&parser->iterator);
                        lang_require(function_type_name.count, parser->iterator, "expected explicit function type starting with '(' or function type name after function name");
                        
                        new_local_node(name_reference);
                        name_reference->name = function_type_name;
                        
                        type = &name_reference->node;
                    }
                    
                    if (try_consume_keyword(parser, s("extern_binding")))
                    {
                        new_local_node(function);
                        function->name = name;
                        function->type = type;
                        
                        lang_require(try_consume(parser, s("(")), parser->iterator, "expected '(' after 'extern_binding_lib'");
                        
                        string library_name;
                        bool ok = lang_require_call(parse_quoted_string(&library_name, parser));
                        lang_require(ok && library_name.count, parser->iterator, "expected library name after 'extern_binding_lib'");
                        
                        bool is_dll = false;
                        if (try_consume(parser, s(",")))
                        {
                            if (try_consume_keyword(parser, s("true")))
                                is_dll = true;
                            else 
                            {
                                lang_require(try_consume_keyword(parser, s("false")), parser->iterator, "expected external binding is dynamic arguemnt after ',' ('true' or 'false')");
                            }
                        }
                        
                        lang_require(try_consume(parser, s(")")), parser->iterator, "expected ')' after 'extern_binding_lib' arguments");
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' after 'extern_binding_lib' statement");
                        
                        new_local_node(external_binding);
                        external_binding->library_name = library_name;
                        external_binding->is_dll = is_dll;
                        
                        function->first_statement = &external_binding->node;
                        
                        append(&tail_next, &function->node);
                    }
                    else if (try_consume(parser, s("{")))
                    {
                        new_local_node(function);
                        function->name = name;
                        function->type = type;
                        
                        function->first_statement = lang_require_call(parse_statements(parser));
                        lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after function declaration");
                        
                        append(&tail_next, &function->node);
                    }
                    else
                    {
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' after function type");
                        
                        if (type->node_type == ast_node_type_function_type)
                        {
                            local_node_type(function_type, type);
                            function_type->name = name;
                        }
                        
                        // add function signature
                        append(&tail_next, type);
                    }
                }
                else if (try_consume_keyword(parser, s("struct")))
                {
                    new_local_node(compound_type);
                    compound_type->name = name;
                    
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after structure declaration");
                    compound_type->first_statement = lang_require_call(parse_statements(parser));
                    lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after structure declaration");
                    
                    for (auto statement = compound_type->first_statement; statement; statement = statement->next)
                    {
                        lang_require((statement->node_type == ast_node_type_variable) || (statement->node_type == ast_node_type_assignment) || (statement->node_type == ast_node_type_comment), parser->iterator, "unexpected %.*s statement in structure declaration", fs(ast_node_type_names[statement->node_type]));
                    }
                    
                    append(&tail_next, &compound_type->node);
                }
                else if (try_consume_keyword(parser, s("enum")))
                {
                    new_local_node(enumeration);
                    enumeration->name = name;
                    
                    enumeration->type = parse_type(parser);
                    if (!enumeration->type.name.count)
                        enumeration->type = { s("u32") };
                        
                    lang_require(enumeration->type.indirection_count == 0, enumeration->type.name, "enumeration can only be of integer number types");
                    
                    auto item_tail_next = &(ast_node *) enumeration->first_item;
                    
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after enumeration declaration");
                    
                    while (!try_consume(parser, s("}")))
                    {
                        new_local_node(enumeration_item);
                        enumeration_item->name = skip_name(&parser->iterator);
                        
                        if (try_consume(parser, s("=")))
                        {
                            enumeration_item->expression = lang_require_call(parse_expression(parser));
                        }
                        
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of enumeration item");
                        
                        append(&item_tail_next, &enumeration_item->node);
                    }
                    
                    append(&tail_next, &enumeration->node);
                }
                else if (try_consume_keyword(parser, s("type")))
                {
                    new_local_node(type_alias);
                    type_alias->name = name;
                    type_alias->type = parse_type(parser);
                    lang_require(type_alias->type.name.count, parser->iterator, "expected type expression after 'type' in type alias definition");
                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of type alias definition");
                    
                    append(&tail_next, &type_alias->node);
                }
                else
                {
                    lang_require(false, parser->iterator, "expected function declaration or type ('func'), structure declaration ('struct'), type alias ('type'), enumeration declaration ('enum') or constant definition ('=') after definition name");
                }
            }
            else if (token == s("module"))
            {
                lang_require(!parser->current_file->module, parser->iterator, "file allready assigned to a module");
                auto name = skip_name(&parser->iterator);
                
                ast_module *module = null;
                for (auto it = parser->first_module; it; it = (ast_module *) it->node.next)
                {
                    if (it->name == name)
                    {
                        module = it;
                        break;
                    }
                }
                
                if (!module)
                {
                    module = new_node(module);
                    module->name = name;
                    *parser->module_tail_next = module;
                    parser->module_tail_next = &(ast_module *) module->node.next;
                }
                
                auto file_tail_next = (ast_node **) &module->first_file;
                bool found = false;
                for (auto it = module->first_file; it; it = (ast_file_reference *) it->node.next)
                {
                    if (it->file == parser->current_file)
                    {
                        found = true;
                        break;
                    }
                    
                    file_tail_next = &it->node.next;
                }
                
                if (!found)
                {
                    new_local_node(file_reference);
                    file_reference->file = parser->current_file;
                    *file_tail_next = &file_reference->node;
                }
                
                lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");
            }
            else if (token == s("import"))
            {
                auto name = skip_name(&parser->iterator);
                lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");
                
                auto file = parser->current_file;
                
                ast_module_reference *module_reference = null;
                auto dependency_tail_next = &file->first_module_dependency;
                
                for (auto it = file->first_module_dependency; it; it = (ast_module_reference *) it->node.next)
                {
                    if (it->module->name == name)
                    {
                        module_reference = it;
                        break;
                    }
                    
                    dependency_tail_next = &(ast_module_reference *) it->node.next;
                }
                
                if (!module_reference)
                {
                    ast_module *module = null;
                    for (auto it = parser->first_module; it; it = (ast_module *) it->node.next)
                    {
                        if (it->name == name)
                        {
                            module_reference = new_node(module_reference);
                            module_reference->module = it;
                            *dependency_tail_next = module_reference;
                            break;
                        }
                    }
                    
                    if (!module_reference)
                    {
                        new_local_node(module);
                        module->name = name;
                        *parser->module_tail_next = module;
                        parser->module_tail_next = &(ast_module *) module->node.next;
                    
                        module_reference = new_node(module_reference);
                        module_reference->module = module;
                        *dependency_tail_next = module_reference;
                    }
                }
            }
            else
            {
                // revert parse
                parser->iterator = backup;

                auto expression = lang_require_call(parse_expression(parser));
                if (expression)
                {
                    auto assignment = lang_require_call(parse_assignment(parser));
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
    ast_node **node_field; // pointer to where the node is stored, so we can also replace it in the parent
};

struct ast_queue
{
    ast_queue_entry *entries;
    u32 count;
    u32 used_count;
};

#define local_ast_queue(name) ast_queue name = {}; defer { platform_free_bytes((u8 *) name.entries); };

void enqueue(ast_queue *queue, ast_node *scope, ast_node **node)
{
    assert(node && *node);
    
    usize count = 0;
    for (auto it = *node; it; it = it->next)
        count++;

    if (queue->used_count + count > queue->count)
    {
        queue->count = maximum(maximum(queue->count, queue->used_count + count) * 2, 1024);
        auto new_entries = (ast_queue_entry *) platform_allocate_bytes(sizeof(ast_queue_entry) * queue->count).base;
        memcpy(new_entries, queue->entries, sizeof(ast_queue_entry) * queue->used_count);
        
        platform_free_bytes((u8 *) queue->entries);
        queue->entries = new_entries;
    }
    
    queue->used_count += count;
    
    count = 0;
    for (auto it = node; *it; it = &(*it)->next)
    {
        queue->entries[queue->used_count - 1 - count].scope       = scope;
        queue->entries[queue->used_count - 1 - count].node_field  = it;
        count++;
    }
}

void enqueue(ast_queue *queue, ast_node **node)
{
    enqueue(queue, null, node);
}

bool next(ast_queue_entry *out_entry, ast_queue *queue)
{
    if (!queue->used_count)
        return false;

    auto entry = queue->entries[--queue->used_count];
    auto scope = entry.scope;
    auto node  = *entry.node_field;
    
    switch (node->node_type)
    {
        cases_complete_message("%.*s", fs(ast_node_type_names[node->node_type]));
        
        case ast_node_type_type_alias:
        case ast_node_type_comment:
        case ast_node_type_number:
        case ast_node_type_string:
        case ast_node_type_name_reference:
        case ast_node_type_variable:
        case ast_node_type_external_binding:
        {
        } break;
        
        case ast_node_type_constant:
        {
            local_node_type(constant, node);
            
            enqueue(queue, node, &constant->expression);
        } break;
        
        case ast_node_type_file:
        {
            local_node_type(file, node);
            
            if (file->first_statement)
                enqueue(queue, node, &file->first_statement);
        } break;
        
        case ast_node_type_not:
        {
            local_node_type(not, node);
            
            enqueue(queue, node, &not->expression);
        } break;
        
        // case ast_node_type_binary_operator:
        case ast_node_type_is:
        case ast_node_type_is_not:
        case ast_node_type_bit_or:
        {
            // HACK: set type to base type, so we can avoid assert
            scope_push(node->node_type, ast_node_type_binary_operator);
            local_node_type(binary_operator, node);
            
            enqueue(queue, node, &binary_operator->right);
            enqueue(queue, node, &binary_operator->left);
        } break;
        
        case ast_node_type_assignment:
        {
            local_node_type(assignment, node);
            
            enqueue(queue, node, &assignment->right);
            enqueue(queue, node, &assignment->left);
        } break;
        
        case ast_node_type_enumeration:
        {
            local_node_type(enumeration, node);
            
            if (enumeration->first_item)
                enqueue(queue, node, &(ast_node *) enumeration->first_item);
        } break;
        
        case ast_node_type_enumeration_item:
        {
            local_node_type(enumeration_item, node);
            
            if (enumeration_item->expression)
                enqueue(queue, node, &enumeration_item->expression);
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, node);
            
            if (function_type->first_output)
                enqueue(queue, node, &function_type->first_output);
            
            if (function_type->first_input)
                enqueue(queue, node, &function_type->first_input);
        } break;
        
        case ast_node_type_function:
        {
            local_node_type(function, node);
            
            // HACK:
            // parent is function->type, so that statements can see input and output declarations
            if (function->first_statement)
                enqueue(queue, function->type, &function->first_statement);
            
            if (function->type)
                enqueue(queue, node, &function->type);
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, node);
            
            if (compound_type->first_statement)
                enqueue(queue, node, &compound_type->first_statement);
        } break;
        
        case ast_node_type_branch:
        {
            local_node_type(branch, node);
                        
            if (branch->first_false_statement)
                enqueue(queue, node, &branch->first_false_statement);
                
            if (branch->first_true_statement)
                enqueue(queue, node, &branch->first_true_statement);
                
            enqueue(queue, node, &branch->condition);
        } break;
        
        case ast_node_type_loop:
        {
            local_node_type(loop, node);
            
            if (loop->first_statement)
                enqueue(queue, node, &loop->first_statement);
                
            enqueue(queue, node, &loop->condition);
        } break;
        
        case ast_node_type_branch_switch:
        {
            local_node_type(branch_switch, node);
            
            if (branch_switch->first_case)
                enqueue(queue, node, &(ast_node *) branch_switch->first_case);
                
            if (branch_switch->first_default_case_statement)
                enqueue(queue, node, &branch_switch->first_default_case_statement);
            
            enqueue(queue, node, &branch_switch->expression);
        } break;
        
        case ast_node_type_branch_switch_case:
        {
            local_node_type(branch_switch_case, node);
            
            if (branch_switch_case->first_statement)
                enqueue(queue, node, &branch_switch_case->first_statement);
            
            enqueue(queue, node, &branch_switch_case->expression);
        } break;
        
        case ast_node_type_function_return:
        {
            local_node_type(function_return, node);
            
            if (function_return->first_expression)
                enqueue(queue, node, &function_return->first_expression);
        } break;
        
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);
            
            if (function_call->first_argument)
                enqueue(queue, node, &function_call->first_argument);
                
            enqueue(queue, node, &function_call->expression);
        } break;
        
        case ast_node_type_cast:
        {
            local_node_type(cast, node);
            
            enqueue(queue, node, &cast->expression);
        } break;
        
        case ast_node_type_take_reference:
        {
            local_node_type(take_reference, node);
            
            enqueue(queue, node, &take_reference->expression);
        } break;
        
        case ast_node_type_field_reference:
        {
            local_node_type(field_reference, node);
            
            enqueue(queue, node, &field_reference->expression);
        } break;
    }
    
    *out_entry = entry;
    
    return true;
}

bool next(ast_node **out_node, ast_queue *queue)
{
    ast_queue_entry out_entry = {};
    bool ok = next(&out_entry, queue);
    
    if (ok)
        *out_node = *out_entry.node_field;
    
    return ok;
}

ast_node * clone(lang_parser *parser, ast_node *root)
{
    ast_node *keys[1024] = {};
    ast_node *clones[carray_count(keys)];
    
    hash_table_pointers table = {};
    table.count = carray_count(keys);
    table.keys = (u8 **) keys;

    // clone all nodes and hash node to clone
    {
        local_ast_queue(queue);
        enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            u32 byte_count = ast_node_type_byte_counts[node->node_type];
            
            u8 *new_node = new u8[byte_count];
            memcpy(new_node, node, byte_count);
            
            u32 slot = get_or_add(&table, (u8 *) node).slot;
            assert(slot != -1);
            clones[slot] = (ast_node *)new_node;
        }
    }
    
    auto cloned_root = (ast_node *) get(&table, (u8 *) root);
    
    // replace all cloned nodes
    {
        local_ast_queue(queue);
        enqueue(&queue, &cloned_root);
        
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node_field = entry.node_field;
            
            auto cloned_node = (ast_node *) try_get(&table, (u8 *) *node_field);
            
            if (cloned_node)
                *node_field = cloned_node;
        }
    }
    
    return cloned_root;
}

#if 0
ast_node * clone_recursive(ast_node *node)
{
    ast_node *result = null;

    switch (node->node_type)
    {
        cases_complete;
        
        case ast_node_type_comment:
        case ast_node_type_number:
        case ast_node_type_string:
        case ast_node_type_name_reference:
        case ast_node_type_variable:
        {
        } break;
        
        case ast_node_type_file:
        {
            local_node_type(file, node);
            
            auto cloned_node = new ast_file;
            *cloned_node = *file;
            
            if (file->first_statement)
                cloned_node->first_statement = clone_recursive(file->first_statement);
            
            result = &cloned_node->node;
        } break;
        
        case ast_node_type_not:
        {
            local_node_type(not, node);
            
            auto cloned_node = new ast_not;
            *cloned_node = *not;
            
            cloned_node->expression = clone_recursive(not->expression);
            
            result = &cloned_node->node;
        } break;
        
        // case ast_node_type_binary_operator:
        case ast_node_type_is:
        case ast_node_type_is_not:
        {
            auto cloned_node = new ast_binary_operator;
            *cloned_node = *(ast_binary_operator *) node;
            
            // HACK: set type to base type, so we can avoid assert
            scope_push(node->node_type, ast_node_type_binary_operator);
            local_node_type(binary_operator, node);
            
            cloned_node->right = clone_recursive(binary_operator->right);
            cloned_node->left  = clone_recursive(binary_operator->left);
            
            result = &cloned_node->node;
        } break;
        
        case ast_node_type_assignment:
        {
            local_node_type(assignment, node);
            
            auto cloned_node = new ast_assignment;
            *cloned_node = *assignment;
            
            cloned_node->right = clone_recursive(assignment->right);
            cloned_node->left  = clone_recursive(assignment->left);
            
            result = &cloned_node->node;
        } break;
        
        case ast_node_type_enumeration:
        {
            local_node_type(enumeration, node);
            
            auto cloned_node = new ast_enumeration;
            *cloned_node = *enumeration;
            
            if (enumeration->first_item)
                cloned_node->first_item = (ast_enumeration_item *) clone_recursive(&enumeration->first_item->node);
                
            result = &cloned_node->node;
        } break;
        
        case ast_node_type_enumeration_item:
        {
            local_node_type(enumeration_item, node);
            
            if (enumeration_item->expression)
                enqueue(queue, node, enumeration_item->expression);
        } break;
        
        case ast_node_type_function:
        {
            local_node_type(function, node);
            
            if (function->first_statement)
                enqueue(queue, node, function->first_statement);
            
            if (function->first_output)
                enqueue(queue, node, function->first_output);
            
            if (function->first_input)
                enqueue(queue, node, function->first_input);
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
        
        case ast_node_type_function_return:
        {
            local_node_type(function_return, node);
            
            if (function_return->first_expression)
                enqueue(queue, node, function_return->first_expression);
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

    cloned_node->next = clone_recursive(node->next);
    
    return cloned_node;
}
#endif

ast_function_type * get_function_type(ast_function *function)
{
    ast_function_type *function_type = null;
    if (function->type->node_type == ast_node_type_function_type)
    {
        function_type = get_node_type(function_type, function->type);
    }
    else 
    {
        local_node_type(name_reference, function->type);
        function_type = get_node_type(function_type, name_reference->reference);
    }
    
    return function_type;
}

ast_type get_expression_type(lang_parser *parser, ast_node *node)
{
    switch (node->node_type)
    {
        cases_complete;
        
        // TEMP
        case ast_node_type_field_reference:
        {
            return {};
        } break;
        
        case ast_node_type_take_reference:
        {
            local_node_type(take_reference, node);
            
            auto type = get_expression_type(parser, take_reference->expression);
            type.indirection_count++;
            
            return type;
        } break;
        
        case ast_node_type_not:
        case ast_node_type_is:
        case ast_node_type_is_not:
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
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            
            lang_require_return_value(name_reference->reference, {}, name_reference->name, "name reference '%.*s' was not resolved", fs(name_reference->name));
            
            switch (name_reference->reference->node_type)
            {
                cases_complete;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, name_reference->reference);
                    return variable->type;
                } break;
            }
        } break;
        
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);
            
            local_node_type(name_reference, function_call->expression);
            
            if (!name_reference->reference)
                return {};
            
            local_node_type(function, name_reference->reference);
            
            auto function_type = get_function_type(function);
            assert(function_type->first_output && !function_type->first_output->next);
            
            return get_expression_type(parser, function_type->first_output);
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

bool parse(lang_parser *parser, string source, string source_name = s("(internal)"))
{
    new_local_node(file);
    file->path = source_name;
    file->text = source;

    parser->source_name = source_name;
    parser->source = source;
    parser->iterator = parser->source;
    parser->current_file = file;
    
    *parser->file_tail_next = file;
    parser->file_tail_next = (ast_file **) &file->node.next;
    
    skip_white(&parser->iterator);
    file->first_statement = parse_statements(parser);
    
    lang_require_return_value(parser->iterator.count == 0, false, parser->iterator, "expected statements, unexpected '%c'", parser->iterator.base[0]);
    
    return !parser->error;
}

void begin(lang_parser *parser)
{
    *parser = {};
    parser->module_tail_next = &parser->first_module;
    parser->file_tail_next   = &parser->first_file;
    
    string source = s(R"CODE(
module lang;
    
def code_location struct
{
    var module   cstring;
    var file     cstring;
    var function cstring;
    var line     u32;
    var column   u32;
}
)CODE");

    lang_require_return_value(parse(parser, source, s("lang_internal")), , source, "internal compiler error");
}

struct lang_resolver
{
    ast_list_entry *variable_list;
    ast_list_entry *function_list;
    
    ast_node *scope_stack[64];
    u32 scope_stack_count;
};

ast_node * find_node(lang_resolver *resolver, string name)
{
    for (u32 i = 0; i < resolver->scope_stack_count; i++)
    {
        auto scope = resolver->scope_stack[resolver->scope_stack_count - 1 - i];
    
        for (auto it = resolver->variable_list; it; it = it->next)
        {
            local_node_type(variable, it->node);
            
            if ((it->scope == scope) && (variable->name == name))
                return &variable->node;
        }
        
        for (auto it = resolver->function_list; it; it = it->next)
        {
            local_node_type(function, it->node);
            
            if ((it->scope == scope) && (function->name == name))
                return &function->node;
        }
    }
    
    if (resolver->scope_stack_count >= 2)
    {
        local_node_type(file, resolver->scope_stack[1]);
        
        for (auto module_it = file->first_module_dependency; module_it; module_it = (ast_module_reference *) module_it->node.next)
        {
            auto module = module_it->module;
            
            for (auto file_it = module->first_file; file_it; file_it = (ast_file_reference *) file_it->node.next)
            {
                if (file == file_it->file)
                    continue;
            
                auto scope = &file_it->file->node;
                
                for (auto it = resolver->variable_list; it; it = it->next)
                {
                    local_node_type(variable, it->node);
                    
                    if ((it->scope == scope) && (variable->name == name))
                        return &variable->node;
                }
                
                for (auto it = resolver->function_list; it; it = it->next)
                {
                    local_node_type(function, it->node);
                    
                    if ((it->scope == scope) && (function->name == name))
                        return &function->node;
                }
            }
        }
    }
    
    return null;
}

void resolve(lang_parser *parser)
{
    auto root = &parser->first_file->node;
    
#if 0
    // print ast
    {
        local_ast_queue(queue);
        
        if (root)
            enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            printf("%.*s 0x%p\n", fs(ast_node_type_names[node->node_type]), node);
        }
    }
#endif
    
    lang_resolver resolver = {};
    
    // collect declarations
    {
        local_ast_queue(queue);
        
        auto variable_tail_next = &resolver.variable_list;
        auto function_tail_next = &resolver.function_list;
        
        if (root)
            enqueue(&queue, &root);
        
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = *entry.node_field;
            
            switch (node->node_type)
            {
                case ast_node_type_variable:
                {
                    auto new_entry = new ast_list_entry;
                    *new_entry = {};
                    new_entry->node  = node;
                    new_entry->scope = entry.scope;
                    
                    *variable_tail_next = new_entry;
                    variable_tail_next = &new_entry->next;
                    
                #if 0
                    local_node_type(variable, node);
                    if (entry.scope)
                        printf("scope [0x%p] %.*s: ", entry.scope, fs(ast_node_type_names[entry.scope->node_type]));
                    else
                        printf("scope [0x%p] root: ", entry.scope);
                    
                    printf("var %.*s\n", fs(variable->name));
                #endif
                } break;
                
                case ast_node_type_function:
                {
                    auto new_entry = new ast_list_entry;
                    *new_entry = {};
                    new_entry->node  = node;
                    new_entry->scope = entry.scope;
                    
                    *function_tail_next = new_entry;
                    function_tail_next = &new_entry->next;
                    
                #if 0
                    local_node_type(function, node);
                    if (entry.scope)
                        printf("scope [0x%p] %.*s: ", entry.scope, fs(ast_node_type_names[entry.scope->node_type]));
                    else
                        printf("scope [0x%p] root: ", entry.scope);
                    
                    printf("func [0x%p] %.*s\n", function, fs(function->name));
                #endif
                } break;
            }
        }
    }
    
    // resolve name references
    {
        local_ast_queue(queue);
        
        resolver.scope_stack_count = 0;
        
        if (root)
            enqueue(&queue, &root);
            
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = *entry.node_field;
            
            {
                bool found = false;
                for (u32 i = 0; i < resolver.scope_stack_count; i++)
                {
                    if (resolver.scope_stack[i] == entry.scope)
                    {
                        resolver.scope_stack_count = i + 1;
                        found = true;
                        break;
                    }
                }
                
                if (!found)
                {
                    assert(resolver.scope_stack_count < carray_count(resolver.scope_stack));
                    resolver.scope_stack[resolver.scope_stack_count++] = entry.scope;
                }
            }
            
            switch (node->node_type)
            {
                case ast_node_type_name_reference:
                {
                    local_node_type(name_reference, node);
                
                    if (!name_reference->reference)
                        name_reference->reference = find_node(&resolver, name_reference->name);
                } break;
            }
        }
    }
    
    // check function calls
    {
        local_ast_queue(queue);
        
        if (root)
            enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            switch (node->node_type)
            {
                case ast_node_type_function_call:
                {
                    local_node_type(function_call, node);
                    
                    if (function_call->expression->node_type == ast_node_type_name_reference)
                    {
                        local_node_type(name_reference, function_call->expression);
                        
                        if (!name_reference->reference)
                        {
                            printf("unresolved function name '%.*s'\n", fs(name_reference->name));
                        }
                        else
                        {
                            local_node_type(function, name_reference->reference);
                            auto function_type = get_function_type(function);
                            
                            auto input = function_type->first_input;
                            
                            auto argument_tail_next = &function_call->first_argument;
                            auto argument = *argument_tail_next;
                            
                            while (argument && input)
                            {
                                auto argument_type = get_expression_type(parser, argument);
                                
                                local_node_type(variable, input);
                                auto input_type = variable->type;
                                
                                if (argument_type.name.count && input->next && input->next->node_type == ast_node_type_assignment)
                                {
                                    local_node_type(assignment, input->next);
                                    
                                    // skip assignment
                                    input = input->next;
                                    
                                    // default argument skipped on type missmatch
                                    if ((argument_type.name != input_type.name) || (argument_type.indirection_count != input_type.indirection_count))
                                    {
                                        local_node_type(assignment, input->next);
                                        
                                        auto default_expression = clone(parser, assignment->right);
                                        
                                        // add new argument with default value
                                        default_expression->next = argument;
                                        *argument_tail_next = default_expression;
                                        argument_tail_next = &default_expression->next;
                                        // argument stays the same
                                    
                                        input = input->next;
                                        continue;
                                    }
                                }
                                
                                argument_tail_next = &argument->next;
                                argument = *argument_tail_next;
                                input = input->next;
                            }
                            
                            lang_require_return_value(!argument, , function->name, "too many arguments too function '%.*s'", fs(function->name));
                            
                            while (input)
                            {
                                local_node_type(variable, input);
                                lang_require_return_value(input->next && (input->next->node_type == ast_node_type_assignment), , function->name, "expected argument '%.*' in function '%.*s'", fs(variable->name), fs(function->name));
                                
                                local_node_type(assignment, input->next);
                                        
                                auto default_expression = clone(parser, assignment->right);
                                
                                *argument_tail_next = default_expression;
                                argument_tail_next = &default_expression->next;
                                // argument stays the same
                                
                                // skip assignment
                                input = input->next;
                                
                                input = input->next;
                            }
                        }
                    }
                } break;
            }
        }
    }
}
