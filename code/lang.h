#pragma once

#if defined LANG_ASSERT_ON_ERROR
#define lang_maybe_break() assert(0)
#else
#define lang_maybe_break()
#endif

#include <utf8_string.h>
#include "hash_string.h"
#include "hash_table.h"

#define ast_node_list(macro, ...) \
    macro(base_node, __VA_ARGS__) \
    macro(module, __VA_ARGS__) \
    macro(module_reference, __VA_ARGS__) \
    macro(file, __VA_ARGS__) \
    macro(file_reference, __VA_ARGS__) \
    macro(array_index, __VA_ARGS__) \
    macro(variable, __VA_ARGS__) \
    macro(enumeration_item, __VA_ARGS__) \
    macro(external_binding, __VA_ARGS__) \
    macro(function, __VA_ARGS__) \
    macro(compound_literal, __VA_ARGS__) \
    macro(compound_literal_field, __VA_ARGS__) \
    macro(array_literal, __VA_ARGS__) \
    macro(compound_type_field, __VA_ARGS__) \
    macro(constant, __VA_ARGS__) \
    macro(assignment, __VA_ARGS__) \
    macro(number, __VA_ARGS__) \
    macro(string, __VA_ARGS__) \
    macro(name_reference, __VA_ARGS__) \
    macro(branch, __VA_ARGS__) \
    macro(loop, __VA_ARGS__) \
    macro(loop_with_counter, __VA_ARGS__) \
    macro(branch_switch, __VA_ARGS__) \
    macro(branch_switch_case, __VA_ARGS__) \
    macro(function_return, __VA_ARGS__) \
    macro(function_call, __VA_ARGS__) \
    macro(cast, __VA_ARGS__) \
    macro(field_reference, __VA_ARGS__) \
    macro(take_reference, __VA_ARGS__) \
    \
    \
    macro(prefix_operator, __VA_ARGS__) \
    \
    macro(not, __VA_ARGS__) \
    \
    \
    macro(binary_operator, __VA_ARGS__) \
    \
    macro(or, __VA_ARGS__) \
    macro(and, __VA_ARGS__) \
    \
    macro(is, __VA_ARGS__) \
    macro(is_not, __VA_ARGS__) \
    macro(is_less, __VA_ARGS__) \
    macro(is_less_equal, __VA_ARGS__) \
    macro(is_greater, __VA_ARGS__) \
    macro(is_greater_equal, __VA_ARGS__) \
    \
    macro(bit_not, __VA_ARGS__) \
    macro(bit_or, __VA_ARGS__) \
    macro(bit_and, __VA_ARGS__) \
    \
    macro(add, __VA_ARGS__) \
    macro(subtract, __VA_ARGS__) \
    macro(multiply, __VA_ARGS__) \
    macro(divide, __VA_ARGS__) \

#define ast_type_list(macro, ...) \
    macro(number_type, __VA_ARGS__) \
    macro(enumeration_type, __VA_ARGS__) \
    macro(function_type, __VA_ARGS__) \
    macro(compound_type, __VA_ARGS__) \
    macro(array_type, __VA_ARGS__) \
    macro(type_alias, __VA_ARGS__) \
    
#define menum(entry, prefix) \
    prefix ## entry,

#define menum_name(entry, ...) \
    s(# entry),
    
#define menum_field(entry, ...) \
    ast_ ## entry entry;

enum ast_node_type
{
    ast_type_list(menum, ast_node_type_)
    ast_node_list(menum, ast_node_type_)
    
    ast_node_type_count,
};

string ast_node_type_names[] =
{
    ast_type_list(menum_name)
    ast_node_list(menum_name)
};

#define lang_base_type_list(macro, ...) \
    macro(u8, __VA_ARGS__) \
    macro(u16, __VA_ARGS__) \
    macro(u32, __VA_ARGS__) \
    macro(u64, __VA_ARGS__) \
    macro(s8, __VA_ARGS__) \
    macro(s16, __VA_ARGS__) \
    macro(s32, __VA_ARGS__) \
    macro(s64, __VA_ARGS__) \
    macro(f32, __VA_ARGS__) \
    macro(f64, __VA_ARGS__) \
    macro(string, __VA_ARGS__) \
    //macro(usize, __VA_ARGS__) \
    //macro(ssize, __VA_ARGS__) \
    //macro(bool, __VA_ARGS__) \
    

enum lang_base_type
{
    lang_base_type_list(menum, lang_base_type_)
    
    lang_base_type_count,
};

string lang_base_type_names[] = 
{
    lang_base_type_list(menum_name)
};

#define fnode_type_name(node) fs(ast_node_type_names[(node)->node_type])
#define fnode_name(node)      fs(get_name(node))

union ast_node;

struct ast_base_node
{
    ast_node      *next; // needs to be first, to properly work with base lists
    ast_node      *parent;
    u32           index;
    ast_node_type node_type;
};

buffer_type(ast_node_buffer, ast_node_array, ast_node *);

struct simple_type_info
{
    ast_node *node;
    u32      indirection_count;
};

struct complete_type_info
{
    simple_type_info base_type;
    simple_type_info name_type;
    string           name;
};

struct ast_module;

struct ast_module_reference
{
    ast_base_node node;
    ast_module *module;
};

struct ast_file
{
    ast_base_node node;
    ast_module *module;
    ast_node   *first_statement;
    ast_module_reference *first_module_dependency;
    string path;
    string text;
};

struct ast_file_reference
{
    ast_base_node node;
    ast_file *file;
};

struct ast_module
{
    ast_base_node node;
    ast_file_reference *first_file;
    string name;
};

struct ast_variable
{
    ast_base_node node;
    complete_type_info type;
    string name;
    bool is_global;
};

struct ast_enumeration_type;

struct ast_enumeration_item
{
    ast_base_node node;
    ast_enumeration_type *enumeration_type;
    ast_node *expression;
    string name;
};

struct parsed_number
{
    bool is_signed;
    bool is_float;
    
    u8 bit_count_power_of_two;
    
    union
    {
        u64 u64_value;
        s64 s64_value;
        f64 f64_value;
    };
};

struct ast_number
{
    ast_base_node node;
    parsed_number value;
};

struct ast_array_type
{
    ast_base_node      node;
    complete_type_info item_type;
    ast_node           *count_expression; // is constant array
};

struct ast_enumeration_type
{
    ast_base_node node;
    complete_type_info   item_type;
    u32                  item_count;
    ast_enumeration_item *first_item;
};

struct ast_external_binding
{
    ast_base_node node;
    string library_name;
    bool is_dll;
};

struct ast_constant
{
    ast_base_node node;
    string   name;
    ast_node *expression;
};

struct ast_type_alias
{
    ast_base_node node;
    string name;
    complete_type_info type;
};

struct ast_number_type
{
    ast_base_node node;
    string name;
    
    bool is_signed, is_float;
    u8 bit_count_power_of_two;
};

struct ast_function_type
{
    ast_base_node node;
    //string name;
    // list of variables, each possibly followed by an assignment
    
    complete_type_info input;
    complete_type_info output;
    
    //ast_node *first_input;
    //ast_node *first_output;
};

struct ast_function
{
    ast_base_node node;
    complete_type_info type;
    string name;
    ast_node *first_statement;
};

struct ast_compound_type_field
{
    ast_base_node node;
    ast_variable *variable;
    ast_node     *default_value_expression;
};

struct ast_compound_type
{
    ast_base_node node;
    ast_compound_type_field *first_field;
    u32 byte_count;
    u32 byte_alignment;
};

struct ast_compound_literal_field
{
    ast_base_node node;
    string   name;
    ast_node *expression;
};

struct ast_compound_literal
{
    ast_base_node              node;
    complete_type_info         type;
    ast_compound_literal_field *first_field;
};

struct ast_array_literal
{
    ast_base_node      node;
    complete_type_info type;
    ast_node           *first_expression;
    usize              item_count;
};

struct ast_name_reference
{
    ast_base_node node;
    string   name;
    ast_node *reference;
};

#if 0
enum field_reference_type
{
    field_reference_type_none,
    field_reference_type_variable,
    field_reference_type_enumeration_item,
    field_reference_type_array_count_expression,
    field_reference_type_count,
};
#endif

struct ast_field_reference
{
    ast_base_node node;
    string   name;
    ast_node           *expression;
    ast_node           *reference;
    complete_type_info expression_type;
    
#if 0
    field_reference_type reference_type;
    union
    {
        ast_node             *reference;
        ast_variable         *variable;
        ast_enumeration_item *enumeration_item;
        ast_node             *array_count_expression;
    };
#endif
};

struct ast_array_index
{
    ast_base_node node;
    ast_node *array_expression;
    ast_node *index_expression;
};

struct ast_assignment
{
    ast_base_node node;
    ast_node *left, *right;
};

struct ast_string
{
    ast_base_node node;
    string text;
};

struct ast_branch
{
    ast_base_node node;
    ast_node *condition;
    ast_node *first_true_statement;
    ast_node *first_false_statement;
};

struct ast_loop
{
    ast_base_node node;
    ast_node *condition;
    ast_node *first_statement;
};

struct ast_loop_with_counter
{
    ast_base_node node;
    ast_node *first_counter_statement;
    ast_node *end_condition;
    ast_node *first_statement;
};

struct ast_branch_switch_case
{
    ast_base_node node;
    ast_node *expression;
    ast_node *first_statement;
};

struct ast_branch_switch
{
    ast_base_node node;
    ast_node *expression;
    ast_branch_switch_case *first_case;
    ast_node               *first_default_case_statement;
};

struct ast_function_return
{
    ast_base_node node;
    ast_node *first_expression;
};

struct ast_function_call
{
    ast_base_node node;
    ast_node *expression;
    ast_node *first_argument;
};

struct ast_cast
{
    ast_base_node node;
    ast_node *expression;
    complete_type_info type;
};

struct ast_take_reference
{
    ast_base_node node;
    ast_node *expression;
    complete_type_info type;
};

struct ast_prefix_operator
{
    ast_base_node node;
    ast_node *expression;
};

typedef ast_prefix_operator ast_not;

struct ast_binary_operator
{
    ast_base_node node;
    complete_type_info type;
    ast_node *left, *right;
};

typedef ast_binary_operator ast_or;
typedef ast_binary_operator ast_and;

typedef ast_binary_operator ast_is;
typedef ast_binary_operator ast_is_not;

typedef ast_binary_operator ast_is_less;
typedef ast_binary_operator ast_is_less_equal;
typedef ast_binary_operator ast_is_greater;
typedef ast_binary_operator ast_is_greater_equal;

typedef ast_binary_operator ast_bit_not;
typedef ast_binary_operator ast_bit_or;
typedef ast_binary_operator ast_bit_and;

typedef ast_binary_operator ast_add;
typedef ast_binary_operator ast_subtract;
typedef ast_binary_operator ast_multiply;
typedef ast_binary_operator ast_divide;

union ast_node
{
    // copy from ast_base_node
    struct
    {
        ast_node      *next; // needs to be first, to properly work with base lists
        ast_node      *parent;
        u32           index;
        ast_node_type node_type;
    };

    ast_type_list(menum_field)
    ast_node_list(menum_field)
};

bool is_prefix_operator(ast_node *node)
{
    return ((ast_node_type_prefix_operator <= node->node_type) && (node->node_type < ast_node_type_binary_operator));
}

bool is_binary_operator(ast_node *node)
{
    return ((ast_node_type_binary_operator <= node->node_type) && (node->node_type < ast_node_type_count));
}

#define menum_ast_type_byte_count(entry, ...) \
    sizeof(ast_ ## entry),

u32 ast_node_type_byte_counts[] = {
    ast_node_list(menum_ast_type_byte_count)
    ast_type_list(menum_ast_type_byte_count)
};

struct source_location
{
    string text;
    u32 file_index;
    u32 line;
    u32 line_count;
    u32 start_column, end_column;
};

buffer_type(source_location_buffer, source_location_array, source_location);

#if 0
ast_node_list(menum_buffer_type)

union ast_index
{
    struct
    {
        u32 type       :  8; // ast_node_type
        u32 type_index : 24;
    };
    
    u32 value;
};

struct array_range
{
    u32 offset;
    u32 count;
};

typedef array_range ast_index_list;

struct ast_binary_op
{
    ast_index  parent;
    ast_index  left, right;
    type_index type;
    u32        operation;
};

struct ast_type_compound
{
    ast_index_list fields;
    u32            byte_count;
    u32            byte_alignment;
};

{
    
    ast_index index;
    while (dequeue(&index))
    {
        switch (index.type)
        {
            case ast_type_binary_op:
            {
                local_node(binary_op, index);
                
                enque(binary_op.left);
                enque(binary_op.right);
            } break;
            
        }
    }

    
    new_node(variable);
    new_type(type);
    variable.type = index_of(type;

}
#endif

single_list_type(ast_file_list,   ast_file);
single_list_type(ast_module_list, ast_module);

#define bucket_type(name, type, capacity) \
struct name \
{ \
    name  *next; \
    usize count; \
    type  base[capacity]; \
};

bucket_type(base_bucket_type, u8, 1);

const u32 ast_bucket_item_count = 1024;

#define menum_bucket_type(entry, ...) \
    bucket_type(ast_ ## entry ## _bucket, ast_ ## entry, ast_bucket_item_count);
    
#define menum_bucket_array_field(entry, ...) \
    ast_ ## entry ## _bucket *entry ## _bucket_array;

#define menum_bucket_type_byte_count(entry, ...) \
    sizeof(ast_ ## entry ## _bucket),

ast_node_list(menum_bucket_type);
ast_type_list(menum_bucket_type);

u32 ast_node_bucket_byte_counts[] = {
    ast_node_list(menum_bucket_type_byte_count)
    ast_type_list(menum_bucket_type_byte_count)
};

struct lang_parser
{
    // memory
    
    union
    {
        struct
        {
            ast_node_list(menum_bucket_array_field);
            ast_type_list(menum_bucket_array_field);
        };
    
        ast_base_node_bucket *bucket_arrays[ast_node_type_count];
    };
    
    // one source location per node
    string_buffer          node_comment_buffer;
    source_location_buffer node_location_buffer;
    
    string_builder error_messages;
    
    // can be reset
    
    string source_name;
    string source;
    
    string iterator;
    
    string pending_comment;
    
    string tested_patterns[32];
    u32 tested_pattern_count;
    
    bool error;
    
    union
    {
        ast_number_type *base_number_types[10]; // first types are numbers
        ast_node        *base_types[lang_base_type_count];
    };
    
    u8 *node_source_base;
    ast_node *current_parent;
    
    u32 next_node_index;
    
    ast_module_list module_list;
    ast_file_list   file_list;
    
    ast_module *lang_module;
    ast_module *unnamed_module;
    
    ast_file   *current_file;
};

#define begin_new_node(node_type) \
( (ast_ ## node_type *) begin_node(parser, (ast_node *) new_base_bucket_item((base_bucket_type **) &parser->node_type ## _bucket_array, sizeof(ast_ ## node_type ## _bucket), carray_count(parser->node_type ## _bucket_array->base), sizeof(ast_ ## node_type)), ast_node_type_ ## node_type) )

#define new_leaf_node(node_type) ( (ast_ ## node_type *) end_node(parser, (ast_node *) begin_new_node(node_type)) )

#define begin_new_local_node(node_type) ast_ ## node_type *node_type = begin_new_node(node_type)
#define new_local_leaf_node(node_type)  ast_ ## node_type *node_type = new_leaf_node(node_type)

// in same scope, declare parents before children
// e.g:
//   new_local_node(a);
//   new_local_node(b);
//   new_local_node(c);
// -> a is parent of b is parent of c
//
//   new_local_node(a);
//   new_local_lead_node(b);
//   new_local_node(c);
// -> a is parent of b, a is parent of c
#define new_local_node(node_type) ast_ ## node_type *node_type = begin_new_node(node_type); defer { end_node(parser, (ast_node *) node_type); }

u8 * new_base_bucket_item(base_bucket_type **bucket_array, usize bucket_byte_count, usize item_capacity, usize item_byte_count)
{
    auto bucket_tail_next = bucket_array;
    while (*bucket_tail_next)
    {
        auto bucket = *bucket_tail_next;
        if (bucket->count < item_capacity)
            break;
        
        bucket_tail_next = &bucket->next;
    }
    
    if (!*bucket_tail_next)
    {
        auto bucket = (base_bucket_type *) platform_allocate_bytes(bucket_byte_count).base;
        memset(bucket, 0, bucket_byte_count);
        
        *bucket_tail_next = bucket;
    }
    
    auto bucket = *bucket_tail_next;
    bucket->count++;
    auto item = (bucket->base + bucket->count * item_byte_count);
    // no need to clear, since the whole bucket will be cleared on creation
    
    return item;
}

ast_node * begin_node(lang_parser *parser, ast_node *node, ast_node_type node_type)
{
    assert(parser->node_location_buffer.count == parser->next_node_index);
    resize_buffer(&parser->node_location_buffer, parser->node_location_buffer.count + 1);
    
    assert(parser->node_comment_buffer.count == parser->next_node_index);
    resize_buffer(&parser->node_comment_buffer, parser->node_comment_buffer.count + 1);
    auto comment = &parser->node_comment_buffer.base[parser->node_comment_buffer.count - 1];
    *comment = parser->pending_comment;
    parser->pending_comment = {};
    
    node->index  = parser->next_node_index++;
    node->node_type = node_type;

    node->parent = parser->current_parent;
    parser->current_parent = node;
    
    auto location = &parser->node_location_buffer.base[node->index];
    location->text.base = parser->node_source_base;
    location->text.count = 0;
    
    return node;
}

ast_node * end_node(lang_parser *parser, ast_node *node)
{
    assert(parser->error || node == parser->current_parent, "call end_node on parent");
    
    parser->current_parent = parser->current_parent->parent;
    
    auto location = &parser->node_location_buffer.base[node->index];
    location->text.count = parser->iterator.base - location->text.base;
    
    // remove trailing white space
    while (location->text.count)
    {
        u8 tail = location->text.base[location->text.count - 1];
        if (!contains(s(" \t\n\r"), tail))
            break;
        
        --location->text.count;
    }
    
    parser->node_source_base = parser->iterator.base;
    
    return node;
}

#define get_node_type(type, node)   (ast_ ## type *) (node); assert((node)->node_type == ast_node_type_ ## type)
#define local_node_type(type, node) ast_ ## type *type = get_node_type(type, node)

#define is_node_type(node, type) ((node)->node_type == ast_node_type_ ## type)

#define get_base_node(super_node) ((ast_node *) (super_node))

#define consume_white_or_comment_declaration void consume_white_or_comment(lang_parser *parser)
consume_white_or_comment_declaration;

string consume_name(lang_parser *parser)
{
    string name = skip_name(&parser->iterator);
    
    if (name.count)
    {
        parser->tested_pattern_count = 0;
    }
    else
    {
        parser->tested_patterns[++parser->tested_pattern_count] = s("name");
    }
    
    return name;
}

bool try_consume(lang_parser *parser, string pattern)
{
    if (try_skip(&parser->iterator, pattern))
    {
        consume_white_or_comment(parser);
        parser->tested_pattern_count = 0;
        
        return true;
    }
    else
    {
        assert(parser->tested_pattern_count < carray_count(parser->tested_patterns));
        parser->tested_patterns[++parser->tested_pattern_count] = pattern;
    
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
            consume_white_or_comment(parser);
            
            parser->tested_pattern_count = 0;
            
            return true;
        }
    }
    
    assert(parser->tested_pattern_count < carray_count(parser->tested_patterns));
    parser->tested_patterns[++parser->tested_pattern_count] = keyword;
    
    parser->iterator = backup;
    return false;
}

void consume_white_or_comment(lang_parser *parser)
{
    while (true)
    {
        if (try_consume(parser, s("//")))
        {
            auto comment = skip_until_or_all(&parser->iterator, s("\n"), true);
            skip_white(&parser->iterator);
            
            if (parser->pending_comment.count)
                parser->pending_comment.count = comment.base + comment.count - parser->pending_comment.base;
            else
                parser->pending_comment = comment;
            
            continue;
        }
        
        if (skip_white(&parser->iterator))
            continue;
            
        break;
    }
}

void parse_message_va(lang_parser *parser, string token, cstring format, va_list va_arguments)
{
    ast_file *file = null;
    for (auto it = parser->file_list.first; it; it = (ast_file *) it->node.next)
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
    
    while (left.base < token.base)
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
    
    auto error_messages = &parser->error_messages;
    print(error_messages, "%.*s(%i,%i):  ", fs(file->path), line_count + 1, column_count + 1);
    print_va(error_messages, format, va_arguments);
    print_newline(error_messages);
    print_line(error_messages, "%.*s(%i,%i):  %.*s", fs(file->path), line_count + 1, column_count + 1, fs(line));
    print_line(error_messages, "%.*s(%i,%i):  %*c", fs(file->path), line_count + 1, column_count + 1, column_count, '^');
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
        lang_maybe_break(); \
        return return_value; \
    }

#define lang_require(condition, token, message, ...) lang_require_return_value(condition, null, token, message, __VA_ARGS__) 

#define lang_abort_return_value(...) if (parser->error) return __VA_ARGS__
#define lang_abort() lang_abort_return_value(null);

#define lang_require_call_return_value(call, return_value) call; lang_abort_return_value(return_value)
#define lang_require_call(call)                            lang_require_call_return_value(call, null)

#define lang_require_consume_return_value(pattern, return_value, message, ...) lang_require_return_value(try_consume(parser, s(pattern)), return_value, parser->iterator, "expected " pattern message, __VA_ARGS__)

#define lang_require_consume(pattern, message, ...) lang_require_consume_return_value(pattern, null, message, __VA_ARGS__)

#define parse_expression_declaration ast_node * parse_expression(lang_parser *parser, complete_type_info type)
parse_expression_declaration;

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
                
            digit = head - 'a';
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
    
    bool is_float = false;
    f64 f64_value;
    if (parser->iterator.base[count] == '.')
    {
        count++;
        is_float = true;
        
        f64 fraction = 0;
        f64 factor = base;
        
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
            
            fraction += (f64) digit / factor;
            factor *= base;
            count++;
        }
        
        f64_value = (f64) value + fraction;
            
        if (is_signed)
            f64_value = -f64_value;
    }
    
    if (count)
    {
        string token = skip(&parser->iterator, count);

        new_local_node(number);
        number->value.is_float  = is_float;
        number->value.is_signed = is_signed | is_float;
        //number->value.bit_count_power_of_two = 6;
        
        u32 bit_count;
        
        if (is_float)
        {
            number->value.f64_value = f64_value;
            
            f32 f32_value = (f32) f64_value;
            if ((f64) f32_value == f64_value)
                bit_count = 32;
            else
                bit_count = 64;
        }
        else if (is_signed)
        {
            number->value.s64_value = -(s64) value;
            bit_count = get_highest_bit_index(value);
        }
        else
        {
            number->value.u64_value = value;
            bit_count = get_highest_bit_index(value);
        }
        
        if (bit_count)
            bit_count = (bit_count + 7) & ~0x07;
        else
            bit_count = 8;
        
        number->value.bit_count_power_of_two = get_highest_bit_index(bit_count);

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

// assumes "type(struct_name)" was allready parsed
ast_compound_literal * parse_compound_literal(lang_parser *parser, complete_type_info type)
{
    if (!try_consume(parser, s("{")))
        return null;

    assert(!type.name_type.indirection_count);

    new_local_node(compound_literal);
    compound_literal->type = type;
    
    auto tail_next = make_tail_next(&compound_literal->first_field);
        
    bool is_first = true;
    while (!try_consume(parser, s("}")))
    {
        if (!is_first)
        {
            lang_require_consume(";", " before every new field of compound literal");
        }
        
        is_first = false;
    
        new_local_node(compound_literal_field);
    
        auto backup = parser->iterator;
        auto name = consume_name(parser);
        
        if (name.count && !try_consume(parser, s("=")))
        {
            name = {};
            parser->iterator = backup;
        }
        
        compound_literal_field->name = name;
        compound_literal_field->expression = lang_require_call(parse_expression(parser, type));
        
        append_tail_next(&tail_next, &compound_literal_field->node);
    }
    
    return compound_literal;
}

// assumes "type(type_name[])" was allready parsed
ast_array_literal * parse_array_literal(lang_parser *parser, complete_type_info type)
{
    if (!try_consume(parser, s("{")))
        return null;
        
    new_local_node(array_literal);
    array_literal->type = type;
    
    auto tail_next = make_tail_next(&array_literal->first_expression);
    
    local_node_type(array_type, type.name_type.node);
    auto expression_type = array_type->item_type;
    
    bool is_first = true;
    while (!try_consume(parser, s("}")))
    {
        if (!is_first)
        {
            lang_require_consume(";", " before every new field of array literal");
        }
        
        is_first = false;
        auto expression = lang_require_call(parse_expression(parser, expression_type));
        lang_require(expression, parser->iterator, "expected expression after ';' in array literal");
        
        //number->value.u64_value++;
        array_literal->item_count++;
        
        append_tail_next(&tail_next, expression);
    }
    
    return array_literal;
}

complete_type_info parse_type(lang_parser *parser, bool is_required)
{
    auto name = consume_name(parser);
    
    if (!name.count)
        return {};
    
    complete_type_info result = {};
    result.name = name;

    for (u32 i = 0; i < lang_base_type_count; i++)
    {
        if (name == lang_base_type_names[i])
        {
            result.name_type.node = parser->base_types[i];
            result.base_type      = result.name_type;
            break;
        }
    }

    while (true)
    {
        if (try_consume_keyword(parser, s("ref")))
        {
            result.name_type.indirection_count++;
        }
        else if (try_consume(parser, s("[")))
        {
        #if 0
            ast_array_type *found_array_type = null;
            for (auto it = parser->first_anonymous_type; it; it = it->next)
            {
                if (is_node_type(it, array_type))
                {
                    local_node_type(array_type, it);
                
                    if ((array_type->item_type.name == result.name) && (array_type->item_type.name_type.indirection_count == result.name_type.indirection_count))
                    {
                        found_array_type = array_type;
                        break;
                    }
                }
            }
        #endif
            
            new_local_node(array_type);
            
            auto expression = lang_require_call_return_value(parse_expression(parser, {}), {});
            //lang_require_return_value(expression, {}, parser->iterator, "expected array count expression after '['");
            lang_require_return_value(try_consume(parser, s("]")), {}, parser->iterator, "expected ']' after array count expression");
            
            if (result.name_type.node == result.base_type.node)
                result.base_type = result.name_type;
            
            array_type->count_expression = expression;
            array_type->item_type = result;
            
            result = {};
            result.name_type.node = get_base_node(array_type);
            result.base_type = result.name_type;
        }
        else
        {
            break;
        }
    }
    
    if (result.name_type.node == result.base_type.node)
        result.base_type = result.name_type;
    
    lang_require_return_value(!is_required || result.name_type.node || result.name.count, {}, parser->iterator, "expected type");
    
    return result;
}

ast_node * parse_base_expression(lang_parser *parser, complete_type_info type)
{
    ast_node *root = null;
    ast_node *parent = parser->current_parent;
    ast_node **parent_expression = &root;
    
    while (true)
    {
        auto backup = *parser;
        
        auto keyword = consume_name(parser);
        if (keyword == s("not"))
        {
            new_local_node(not);
            
            parent = get_base_node(not);
            *parent_expression = parent;
            parent_expression = &not->expression;
            continue;
        }
        
        *parser = backup;
        break;
    }
    
    ast_node *expression = null;

    {
        auto backup = *parser;
        bool parsed_type_keyword = !type.name.count && try_consume_keyword(parser, s("type")) && try_consume(parser, s("("));
        if (parsed_type_keyword)
        {
            type = lang_require_call(parse_type(parser, true));
            lang_require_consume(")", "after 'type(...' after type");
        }
        else
        {
            *parser = backup;
        }
    }
        
    if ((type.name.count || type.name_type.node) && !type.name_type.indirection_count)
    {
        if (type.name_type.node && is_node_type(type.name_type.node, array_type))
        {
            expression = lang_require_call(get_base_node(parse_array_literal(parser, type)));
        }
        
        if (!expression && (type.name.count || (type.name_type.node && is_node_type(type.name_type.node, compound_type))))
        {
            expression = lang_require_call(get_base_node(parse_compound_literal(parser, type)));
        }
    }

    if (!expression && try_consume_keyword(parser, s("null")))
    {
        new_local_node(number);
        number->value.u64_value = 0;
        number->value.bit_count_power_of_two = 6;
        
        expression = get_base_node(number);
    }
    
    if (!expression)
        expression = lang_require_call(get_base_node(parse_number(parser)));
        
    if (!expression)
        expression = lang_require_call(get_base_node(parse_string_literal(parser)));
    
    if (!expression)
    {
        auto name = consume_name(parser);
        if (name.count)
        {
            new_local_leaf_node(name_reference);
            name_reference->name = name;
            expression = get_base_node(name_reference);
            
            // function call
            if (try_consume(parser, s("(")))
            {
                new_local_node(function_call);
            
                auto argument_tail_next = make_tail_next(&function_call->first_argument);
            
                bool is_first = true;
                while (!try_consume(parser, s(")")))
                {
                    lang_require(is_first || try_consume(parser, s(",")), parser->iterator, "expected expression after ','");
                    
                    auto argument = lang_require_call(parse_expression(parser, {}));
                    lang_require(argument, parser->iterator, "expected expression or ')' in function call");
                
                    append_tail_next(&argument_tail_next, argument);
                
                    is_first = false;
                }
                
                function_call->expression = expression;
                
                function_call->node.parent = expression->parent;
                expression->parent = get_base_node(function_call);
                
                expression = get_base_node(function_call);
            }
        }
    }
    
    while (expression)
    {
        consume_white_or_comment(parser);
        
        if (try_consume(parser, s(".")))
        {
            auto name = consume_name(parser);
            lang_require(name.count, parser->iterator, "expected field name after '.'");
            
            new_local_node(field_reference);
            field_reference->expression = expression;
            field_reference->name       = name;
            
            field_reference->node.parent = expression->parent;
            expression->parent = get_base_node(field_reference);
            expression = get_base_node(field_reference);
            
            continue;
        }
        else if (try_consume(parser, s("[")))
        {
            new_local_node(array_index);
            array_index->array_expression = expression;
            array_index->index_expression = lang_require_call(parse_expression(parser, {}));
            lang_require(array_index->index_expression, parser->iterator, "expected array index expression after '['");
            
            lang_require(try_consume(parser, s("]")), parser->iterator, "expected ']' after array index expression");
            
            array_index->node.parent = expression->parent;
            expression->parent = get_base_node(array_index);
            expression = get_base_node(array_index);
            
            continue;
        }
        else
        {
            auto backup = *parser;
            
            auto keyword = consume_name(parser);
            if (keyword == s("cast"))
            {
                lang_require(try_consume(parser, s("(")), parser->iterator, "expected '(' after 'cast'");
                auto type = lang_require_call(parse_type(parser, true));
                lang_require(try_consume(parser, s(")")), parser->iterator, "expected ')' at the end of cast");
                
                new_local_node(cast);
                cast->type = type;
                cast->expression = expression;
                
                cast->node.parent = expression->parent;
                expression->parent = get_base_node(cast);
                
                expression = get_base_node(cast);
                continue;
            }
            else if (keyword == s("ref"))
            {
                new_local_node(take_reference);
                take_reference->expression = expression;
                
                take_reference->node.parent = expression->parent;
                expression->parent = get_base_node(take_reference);
                
                expression = get_base_node(take_reference);
                continue;
            }
            else
            {
                *parser = backup;
            }
        }
        
        break;
    }
    
    if (expression)
    {
        expression->parent = parent;
        *parent_expression = expression;
        parser->current_parent = root->parent;
    }
    
    return root;
}

parse_expression_declaration
{
    auto left = lang_require_call(parse_base_expression(parser, type));
    
    while (true)
    {
        u32 operator_node_type = -1;
        string operator_token = {};
        
        auto backup = parser->iterator;
        
        auto keyword = consume_name(parser);
        if (keyword.count)
        {
            struct
            {
                string token;
                ast_node_type node_type;
            }
            keyword_operators[] = 
            {
                { s("is"), ast_node_type_is },
                { s("is_not"), ast_node_type_is_not },
            
                { s("or"), ast_node_type_or },
                { s("and"), ast_node_type_and },
                
                { s("bit_not"), ast_node_type_bit_not },
                { s("bit_or"), ast_node_type_bit_or },
                { s("bit_and"), ast_node_type_bit_and },
            };
            
            for (u32 i = 0; i < carray_count(keyword_operators); i++)
            {
                if (keyword == keyword_operators[i].token)
                {
                    operator_node_type = keyword_operators[i].node_type;
                    operator_token     = keyword_operators[i].token;
                    break;
                }
            }
            
            if (operator_node_type == -1)
                parser->iterator = backup;
        }
        else
        {
            struct
            {
                string token;
                ast_node_type node_type;
            }
            symbol_operators[] = 
            {
                // first match wins, so order is important
                { s("<="), ast_node_type_is_less_equal },
                { s("<"), ast_node_type_is_less },
                { s(">="), ast_node_type_is_greater_equal },
                { s(">"), ast_node_type_is_greater },
                
                
                { s("+"), ast_node_type_add },
                { s("-"), ast_node_type_subtract },
                { s("*"), ast_node_type_multiply },
                { s("/"), ast_node_type_divide },
            };
        
            for (u32 i = 0; i < carray_count(symbol_operators); i++)
            {
                if (try_consume(parser, symbol_operators[i].token))
                {
                    operator_node_type = symbol_operators[i].node_type;
                    operator_token     = symbol_operators[i].token;
                    break;
                }
            }
        }
            
        if (operator_node_type != -1)
        {
            new_local_node(binary_operator);
            binary_operator->node.node_type = (ast_node_type) operator_node_type;
            binary_operator->left = left;
            binary_operator->right = lang_require_call(parse_base_expression(parser, {}));
            lang_require(binary_operator->right, parser->iterator, "expected expression after %.*s '%.*s'", fnode_type_name(&binary_operator->node), fs(operator_token));
    
            left->parent = get_base_node(binary_operator);
    
            left = get_base_node(binary_operator);
            continue;
        }
        
        // nothing matched
        break;
    }
    
    return left;
}

// parses '=' right
ast_assignment * parse_assignment_begin(lang_parser *parser, complete_type_info type)
{
    if (!try_consume(parser, s("=")))
        return null;
    
    begin_new_local_node(assignment);
    
    auto right = lang_require_call(parse_expression(parser, type));
    lang_require(right, parser->iterator, "expected expression after '=' in assignment");
    
    assignment->right = right;
    
    return assignment;
}

void parse_assignment_end(lang_parser *parser, ast_assignment *assignment, ast_node *left)
{
    assignment->left = left;
    // assignment->node.parent = left->parent;
    left->parent     = get_base_node(assignment);
    
    end_node(parser, get_base_node(assignment));
}

complete_type_info get_type(lang_parser *parser, lang_base_type type)
{
    complete_type_info result = {};
    
    result.name_type.node = parser->base_types[type];
    switch (result.name_type.node->node_type)
    {
        cases_complete;
        
        case ast_node_type_number_type:
        {
            local_node_type(number_type, result.name_type.node);
            result.name = number_type->name;
        } break;
        
        case ast_node_type_type_alias:
        {
            local_node_type(type_alias, result.name_type.node);
            result.name = type_alias->type.name;
        } break;
    }
    
    result.base_type = result.name_type;
    
    return result;
}

complete_type_info get_default_type(lang_parser *parser)
{
    return get_type(parser, lang_base_type_s32);
}

complete_type_info parse_type_or_default(lang_parser *parser)
{
    auto type = lang_require_call_return_value(parse_type(parser, false), {});
    
    if (!type.name_type.node && !type.name.count)
        type = get_default_type(parser);
    
    return type;
}

ast_variable * parse_declaration(base_list_tail_next *tail_next, lang_parser *parser)
{
    auto name = consume_name(parser);
                
    ast_node *expression = null;
    
    begin_new_local_node(variable);
    variable->name = name;
    variable->type = lang_require_call(parse_type_or_default(parser));

    append_tail_next(tail_next, &variable->node);
    end_node(parser, get_base_node(variable));
    
    auto assignment = lang_require_call(parse_assignment_begin(parser, variable->type));
    if (assignment)
    {
        new_local_leaf_node(name_reference);
        name_reference->name      = name;
        name_reference->reference = get_base_node(variable);
        
        parse_assignment_end(parser, assignment, get_base_node(name_reference));
        
        append_tail_next(tail_next, &assignment->node);
    }
    
    return variable;
}

// assumes start pattern was allready parsed
ast_compound_type * parse_arguments(lang_parser *parser, string end_pattern)
{
    base_list_tail_next tail_next = null;
    ast_compound_type *compound_type = null;

    bool consumed_semicolon = true;
    while (consumed_semicolon)
    {
        if (try_consume(parser, end_pattern))
        {        
            consumed_semicolon = true;
            break;
        }
    
        if (!compound_type)
        {
            compound_type = begin_new_node(compound_type);
            tail_next = make_tail_next(&compound_type->first_field);
        }
    
        auto name = consume_name(parser);
                
        new_local_node(compound_type_field);
                
        { // scope for variable and its children
            new_local_node(variable);
            variable->name = name;
            variable->type = lang_require_call_return_value(parse_type_or_default(parser), {});
            
            compound_type_field->variable = variable;
        }
        
        if (try_consume(parser, s("=")))
        {
            compound_type_field->default_value_expression = lang_require_call(parse_expression(parser, {}));
        }
        
        //lang_require_call(parse_declaration(&first_argument, parser));
        
        append_tail_next(&tail_next, &compound_type_field->node);
        
        consumed_semicolon = try_consume(parser, s(";"));
        //lang_require(is_first_argument || , parser->iterator, "expected ';' or ')' after function argument");
        
        //is_first_argument = false;
    }
    
    lang_require(consumed_semicolon || try_consume(parser, end_pattern), parser->iterator, "expected ';' or '%.*s'", fs(end_pattern));
    
    if (compound_type)
    {
        end_node(parser, get_base_node(compound_type));
    }
    
    return compound_type;
}

ast_node * parse_statements(lang_parser *parser)
{
    ast_node *first_statement = null;
    auto tail_next = make_tail_next(&first_statement);
    
    while (parser->iterator.count)
    {
        auto backup = parser->iterator;

        auto token = consume_name(parser);
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
                branch->condition = lang_require_call(parse_expression(parser, {}));
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
                
                append_tail_next(&tail_next, &branch->node);
            }
            else if (token == s("while"))
            {
                new_local_node(loop);
                loop->condition = lang_require_call(parse_expression(parser, {}));
                lang_require(loop->condition, parser->iterator, "expected condition expression after 'while'");
                
                lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after loop condition");
                loop->first_statement = lang_require_call(parse_statements(parser));
                lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after loop statements");
                
                append_tail_next(&tail_next, &loop->node);
            }
            else if (token == s("loop"))
            {
                new_local_node(loop_with_counter);
                
                if (try_consume_keyword(parser, s("var")))
                {
                    auto tail_next = make_tail_next(&loop_with_counter->first_counter_statement);
                    lang_require_call(parse_declaration(&tail_next, parser));
                }
                else
                {
                    loop_with_counter->first_counter_statement = lang_require_call(parse_expression(parser, {}));
                }
                lang_require(loop_with_counter->first_counter_statement, parser->iterator, "expected counter statement afer 'loop'");
                
                lang_require_consume(";", " after loop counter");
                
                loop_with_counter->end_condition = lang_require_call(parse_expression(parser, {}));
                lang_require(loop_with_counter->end_condition, parser->iterator, "expected end condition expression after ';' in loop");
                
                lang_require_consume("{", "after loop end condition");
                loop_with_counter->first_statement = lang_require_call(parse_statements(parser));
                lang_require_consume("}", "after loop statements");
                
                append_tail_next(&tail_next, &loop_with_counter->node);
            }
            else if (token == s("switch"))
            {
                new_local_node(branch_switch);
                branch_switch->expression = lang_require_call(parse_expression(parser, {}));
                lang_require(branch_switch->expression, parser->iterator, "expected expression after 'switch'");

                //lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after switch condition");
                auto case_tail_next = make_tail_next(&branch_switch->first_case);

                while (try_consume_keyword(parser, s("case")))
                {
                    new_local_node(branch_switch_case);
                    branch_switch_case->expression = lang_require_call(parse_expression(parser, {}));
                    lang_require(branch_switch_case->expression, parser->iterator, "expected expression after 'case'");
                    
                    append_tail_next(&case_tail_next, &branch_switch_case->node);

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
                
                append_tail_next(&tail_next, &branch_switch->node);
            }
            else if (token == s("return"))
            {
                new_local_node(function_return);
                
                auto expression_tail_next = make_tail_next(&function_return->first_expression);
                
                bool is_first = true;
                while (!try_consume(parser, s(";")))
                {
                    lang_require(is_first || try_consume(parser, s(",")), parser->iterator, "expected ',' or ';' after return expression");
                    is_first = false;
                    
                    // set return value to function output type
                    auto expression = lang_require_call(parse_expression(parser, {}));
                    append_tail_next(&expression_tail_next, expression);
                }
                
                append_tail_next(&tail_next, &function_return->node);
            }
            else if (token == s("def"))
            {
                auto name = consume_name(parser);
                
                if (try_consume(parser, s("=")))
                {
                    new_local_node(constant);
                    constant->name = name;
                    constant->expression = lang_require_call(parse_expression(parser, {}));
                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' after constant definition");
                    
                    append_tail_next(&tail_next, &constant->node);
                }
                else if (try_consume_keyword(parser, s("func")))
                {
                    ast_node *statement = null;
                    complete_type_info type = {};
                    
                    if (try_consume(parser, s("(")))
                    {
                        new_local_node(function_type);
                        
                        function_type->input.name_type.node = (ast_node *) lang_require_call(parse_arguments(parser, s(")")));
                        function_type->input.base_type = function_type->input.name_type;
                        
                        if (try_consume(parser, s("(")))
                        {
                            function_type->output.name_type.node = (ast_node *) lang_require_call(parse_arguments(parser, s(")")));
                            function_type->output.base_type = function_type->input.name_type;
                        }
                        
                        type.name_type.node = get_base_node(function_type);
                        type.base_type      = type.name_type;
                    }
                    else
                    {
                        auto function_type_name = consume_name(parser);
                        lang_require(function_type_name.count, parser->iterator, "expected explicit function type starting with '(' or function type name after function name");
                        
                        type.name = function_type_name;
                    }
                    
                    if (try_consume_keyword(parser, s("extern_binding")))
                    {
                        new_local_node(function);
                        function->name = name;
                        function->type = type;
                        statement = get_base_node(function);
                    
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
                        
                        function->first_statement = get_base_node(external_binding);
                    }
                    else if (try_consume(parser, s("{")))
                    {
                        new_local_node(function);
                        function->name = name;
                        function->type = type;
                        statement = get_base_node(function);
                        
                        function->first_statement = lang_require_call(parse_statements(parser));
                        lang_require(try_consume(parser, s("}")), parser->iterator, "expected '}' after function declaration");
                    }
                    else
                    {
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' after function type");
                        
                        // type alias def x func ...;
                        new_local_node(type_alias);
                        type_alias->type = type;
                        type_alias->name = name;
                        statement = get_base_node(type_alias);
                    }
                    
                    if (type.name_type.node)
                        type.name_type.node->parent = statement;
                    
                    append_tail_next(&tail_next, statement);
                }
                else if (try_consume_keyword(parser, s("struct")))
                {
                    new_local_node(type_alias);
                
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after structure declaration");
                    
                    auto compound_type = lang_require_call(parse_arguments(parser, s("}")));
                    
                    type_alias->type.base_type.node = get_base_node(compound_type);
                    type_alias->type.name_type      = type_alias->type.base_type;
                    type_alias->name = name;
                    
                    append_tail_next(&tail_next, &type_alias->node);
                }
                else if (try_consume_keyword(parser, s("enum")))
                {
                    new_local_node(type_alias);
                
                    new_local_node(enumeration_type);
                    
                    enumeration_type->item_type = lang_require_call_return_value(parse_type_or_default(parser), {});
                    
                    lang_require(is_node_type(enumeration_type->item_type.name_type.node, number_type) && !enumeration_type->item_type.name_type.indirection_count, name, "enumeration can only be of number types");
                    
                    auto item_tail_next = make_tail_next(&enumeration_type->first_item);
                    
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after enumeration declaration");
                    
                    u32 item_count = 0;
                    while (!try_consume(parser, s("}")))
                    {
                        new_local_node(enumeration_item);
                        enumeration_item->enumeration_type = enumeration_type;
                        enumeration_item->name = consume_name(parser);
                        lang_require(enumeration_item->name != s("count"), enumeration_item->name, "name 'count' is reserved fot the number of declared enum items");
                        
                        if (try_consume(parser, s("=")))
                        {
                            enumeration_item->expression = lang_require_call(parse_expression(parser, enumeration_type->item_type));
                        }
                        
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of enumeration item");
                        
                        item_count++;
                        append_tail_next(&item_tail_next, &enumeration_item->node);
                    }
                    
                    enumeration_type->item_count = item_count;
                    
                    type_alias->type.base_type.node = get_base_node(enumeration_type);
                    type_alias->type.name_type      = type_alias->type.base_type;
                    type_alias->name = name;
                    append_tail_next(&tail_next, &type_alias->node);
                }
                else if (try_consume_keyword(parser, s("type")))
                {
                    new_local_node(type_alias);
                    type_alias->name = name;
                    type_alias->type = lang_require_call(parse_type(parser, true));
                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of type alias definition");
                    
                    append_tail_next(&tail_next, &type_alias->node);
                }
                else
                {
                    lang_require(false, parser->iterator, "expected function declaration or type ('func'), structure declaration ('struct'), type alias ('type'), enumeration declaration ('enum') or constant definition ('=') after definition name");
                }
            }
            else if (token == s("module"))
            {
                lang_require(!parser->current_file->module, parser->iterator, "file allready assigned to a module");
                auto name = consume_name(parser);
                
                ast_module *module = null;
                for (auto it = parser->module_list.first; it; it = (ast_module *) it->node.next)
                {
                    if (it->name == name)
                    {
                        module = it;
                        break;
                    }
                }
                
                if (!module)
                {
                    module = new_leaf_node(module);
                    module->node.parent = null; // modules have no parent
                    module->name = name;
                    
                    append_list(&parser->module_list, module);
                }
                
                parser->current_file->module = module;
                
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
                    *file_tail_next = get_base_node(file_reference);
                }
                
                lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");
            }
            else if (token == s("import"))
            {
                auto name = consume_name(parser);
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
                    for (auto it = parser->module_list.first; it; it = (ast_module *) it->node.next)
                    {
                        if (it->name == name)
                        {
                            module_reference = new_leaf_node(module_reference);
                            module_reference->module = it;
                            *dependency_tail_next = module_reference;
                            break;
                        }
                    }
                    
                    if (!module_reference)
                    {
                        new_local_node(module);
                        module->name = name;
                        append_list(&parser->module_list, module);
                    
                        module_reference = new_leaf_node(module_reference);
                        module_reference->module = module;
                        *dependency_tail_next = module_reference;
                    }
                }
            }
            else
            {
                // revert parse
                parser->iterator = backup;

                auto expression = lang_require_call(parse_expression(parser, {}));
                if (expression)
                {
                    // set type to type of left
                    auto assignment = lang_require_call(parse_assignment_begin(parser, {}));
                    if (assignment)
                    {
                        parse_assignment_end(parser, assignment, expression);
                        expression = get_base_node(assignment);
                    }

                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of the statement");

                    append_tail_next(&tail_next, expression);
                }
            }
        }
        else
        {
            break;
        }
    }
    
    // give trailing comments in files a home
    if (parser->pending_comment.count)
    {
        new_local_node(base_node);
        
        append_tail_next(&tail_next, base_node);
    }
    
    return first_statement;
}

string get_name(ast_node *node)
{
    string name = s("");
    switch (node->node_type)
    {
        case ast_node_type_file:
        {
            local_node_type(file, node);
            name = file->path;
        } break;
        
        case ast_node_type_module:
        {
            local_node_type(module, node);
            name = module->name;
        } break;

        case ast_node_type_variable:
        {
            local_node_type(variable, node);
            name = variable->name;
        } break;

        case ast_node_type_enumeration_item:
        {
            local_node_type(enumeration_item, node);
            name = enumeration_item->name;
        } break;

        case ast_node_type_constant:
        {
            local_node_type(constant, node);
            name = constant->name;
        } break;

        case ast_node_type_number_type:
        {
            local_node_type(number_type, node);
            name = number_type->name;
        } break;

        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            name = name_reference->name;
        } break;

        case ast_node_type_field_reference:
        {
            local_node_type(field_reference, node);
            name = field_reference->name;
        } break;

        case ast_node_type_type_alias:
        {
            local_node_type(type_alias, node);
            name = type_alias->name;
        } break;

        case ast_node_type_function:
        {
            local_node_type(function, node);
            name = function->name;
        } break;
    }

    return name;
}

struct ast_queue_entry
{
    ast_node *scope;
    ast_node **node_field; // pointer to where the node is stored, so we can also replace it in the parent
};

buffer_type(ast_queue, ast_queue_array, ast_queue_entry);

#define local_buffer(name, type) type name = {}; defer { free_buffer(&name); };

void enqueue(ast_queue *queue, ast_node *scope, ast_node **node)
{
    assert(node && *node);
    
    // insert in reverse order, since we allways consume from back
    
    u32 count = 0;
    for (auto it = node; *it; it = &(*it)->next)
    {
        count++;
        
        auto node = *it;
        assert(node->parent == scope, "node not properly build [%i] %.*s '%.s'", node->index, fnode_type_name(node), fnode_name(node));
    }
    
    resize_buffer(queue, queue->count + count);
    
    count = 0;
    for (auto it = node; *it; it = &(*it)->next)
    {
        queue->base[queue->count - count - 1].scope       = scope;
        queue->base[queue->count - count - 1].node_field  = it;
        count++;
    }
}

void enqueue(ast_queue *queue, ast_node **node)
{
    enqueue(queue, (*node)->parent, node);
}

void enqueue_one(ast_queue *queue, ast_node **node)
{
    resize_buffer(queue, queue->count + 1);
    queue->base[queue->count - 1].scope       = (*node)->parent;
    queue->base[queue->count - 1].node_field  = node;
}

bool next(ast_queue_entry *out_entry, ast_queue *queue)
{
    if (!queue->count)
        return false;

    auto entry = queue->base[--queue->count];
    auto scope = entry.scope;
    auto node  = *entry.node_field;
    
    assert(node->parent == scope, "node not properly build [%i] %.*s '%.s'", node->index, fnode_type_name(node), fnode_name(node));
    
    switch (node->node_type)
    {
        case ast_node_type_base_node:
        case ast_node_type_number_type:
        case ast_node_type_number:
        case ast_node_type_string:
        case ast_node_type_name_reference:
        case ast_node_type_external_binding:
        {
        } break;
        
        case ast_node_type_variable:
        {
            local_node_type(variable, node);
            
            if (variable->type.name_type.node && !variable->type.name.count)
                enqueue(queue, node, &variable->type.name_type.node);
        } break;
        
        case ast_node_type_type_alias:
        {
            local_node_type(type_alias, node);
            
            auto name_node = type_alias->type.name_type.node;
            if (name_node)
            {
                switch (name_node->node_type)
                {
                    cases_complete;
                
                    case ast_node_type_type_alias:
                    case ast_node_type_number_type:
                    break;
                
                    case ast_node_type_compound_type:
                    case ast_node_type_function_type:
                    case ast_node_type_enumeration_type:
                    case ast_node_type_array_type:
                    {
                        enqueue(queue, node, &type_alias->type.name_type.node);
                    } break;
                }
            }
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
        
        case ast_node_type_assignment:
        {
            local_node_type(assignment, node);
            
            enqueue(queue, node, &assignment->right);
            enqueue(queue, node, &assignment->left);
        } break;
        
        case ast_node_type_enumeration_type:
        {
            local_node_type(enumeration_type, node);
            
            if (enumeration_type->first_item)
                enqueue(queue, node, &(ast_node *) enumeration_type->first_item);
        } break;
        
        case ast_node_type_enumeration_item:
        {
            local_node_type(enumeration_item, node);
            
            if (enumeration_item->expression)
                enqueue(queue, node, &enumeration_item->expression);
        } break;
        
        case ast_node_type_compound_literal:
        {
            local_node_type(compound_literal, node);
            
            if (compound_literal->first_field)
                enqueue(queue, node, &(ast_node *) compound_literal->first_field);
                
            if (!compound_literal->type.name.count && compound_literal->type.name_type.node)
                enqueue(queue, node, &compound_literal->type.name_type.node);
        } break;
        
        case ast_node_type_compound_literal_field:
        {
            local_node_type(compound_literal_field, node);
            
            enqueue(queue, node, &(ast_node *) compound_literal_field->expression);
        } break;
        
        case ast_node_type_array_literal:
        {
            local_node_type(array_literal, node);
            
            if (array_literal->first_expression)
                enqueue(queue, node, &(ast_node *) array_literal->first_expression);
                
            // array type could be declared on assignment, and would belong to def or var declaration
            if (array_literal->type.name_type.node && (array_literal->type.name_type.node->parent == node))
                enqueue(queue, node, &array_literal->type.name_type.node);
        } break;
        
        case ast_node_type_function_type:
        {
            local_node_type(function_type, node);
            
            if (!function_type->output.name.count && function_type->output.name_type.node)
                enqueue(queue, node, &function_type->output.name_type.node);
            
            if (!function_type->input.name.count && function_type->input.name_type.node)
                enqueue(queue, node, &function_type->input.name_type.node);
        } break;
        
        case ast_node_type_function:
        {
            local_node_type(function, node);
            
            if (function->first_statement)
                enqueue(queue, node, &function->first_statement);
            
            if (!function->type.name.count)
                enqueue(queue, node, &function->type.base_type.node);
        } break;
        
        case ast_node_type_compound_type_field:
        {
            local_node_type(compound_type_field, node);
            
            if (compound_type_field->default_value_expression)
                enqueue(queue, node, &compound_type_field->default_value_expression);
                
            enqueue(queue, node, &(ast_node *) compound_type_field->variable);
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, node);
            
            if (compound_type->first_field)
                enqueue(queue, node, &(ast_node *) compound_type->first_field);
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, node);
            
            //auto item_type = array_type->item_type.name_type.node;
            
            if (array_type->count_expression)
                enqueue(queue, node, &array_type->count_expression);
            
            if (array_type->item_type.name_type.node && (array_type->item_type.name_type.node->parent == node))
                enqueue(queue, node, &array_type->item_type.name_type.node);
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
        
        case ast_node_type_loop_with_counter:
        {
            local_node_type(loop_with_counter, node);
            
            if (loop_with_counter->first_statement)
                enqueue(queue, node, &loop_with_counter->first_statement);
                
            enqueue(queue, node, &loop_with_counter->end_condition);
            enqueue(queue, node, &loop_with_counter->first_counter_statement);
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
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            
            enqueue(queue, node, &array_index->index_expression);
            enqueue(queue, node, &array_index->array_expression);
        } break;
        
        default:
        {
            if (is_prefix_operator(node))
            {
                assert(0);
            }
            else if (is_binary_operator(node))
            {
                auto binary_operator = (ast_binary_operator *) node;
                enqueue(queue, node, &binary_operator->right);
                enqueue(queue, node, &binary_operator->left);
            }
            else
            {
                assert(false, "unhandled node type '%.*s' %.*s", fs(get_name(node)), fnode_type_name(node));
            }
        }
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

ast_node * clone(lang_parser *parser, ast_node *root, ast_node *clone_parent)
{
    ast_node *keys[1024] = {};
    ast_node *clones[carray_count(keys)];
    
    hash_table_pointers table = {};
    table.count = carray_count(keys);
    table.keys = (u8 **) keys;

    // clone all nodes and hash node to clone
    {
        local_buffer(queue, ast_queue);
        enqueue_one(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            u32 byte_count = ast_node_type_byte_counts[node->node_type];
            
            auto new_node = (ast_node *) new_base_bucket_item((base_bucket_type **) &parser->bucket_arrays[node->node_type], ast_node_bucket_byte_counts[node->node_type], ast_bucket_item_count, byte_count);
            
            begin_node(parser, new_node, node->node_type);
            end_node(parser, new_node);
            
            auto index = new_node->index;
            memcpy(new_node, node, byte_count);
            new_node->index = index;
            
            u32 slot = get_or_add(&table, (u8 *) node).slot;
            assert(slot != -1);
            clones[slot] = (ast_node *) new_node;
        }
    }
    
    {
        local_buffer(queue, ast_queue);
        enqueue_one(&queue, &root);
        
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto parent        = entry.scope;
            u32 slot = try_get_slot(&table, (u8 *) parent);
            if (slot != -1 && keys[slot])
            {
                auto cloned_parent = clones[slot];
                auto node = *entry.node_field;
                
                u32 slot = try_get_slot(&table, (u8 *) node);
                if (slot != -1 && keys[slot])
                {
                    auto cloned_node = clones[slot];
                    usize field_offset = (u8 *) entry.node_field - (u8 *) parent;
                    auto clone_field = (ast_node **) ((u8 *) cloned_parent + field_offset);
                    *clone_field = cloned_node;
                    
                    cloned_node->parent = cloned_parent;
                }
            }
        }
    }
    
    auto cloned_root = clones[get_slot(&table, (u8 *) root)];
    cloned_root->parent = clone_parent;
    
    return cloned_root;
}

ast_function_type * get_function_type(lang_parser *parser, ast_function *function)
{
    //return get_function_type(parser, function->type);
    assert(function->type.base_type.node);
    
    local_node_type(function_type, function->type.base_type.node);
    
    return function_type;
}

bool types_are_compatible(complete_type_info to, complete_type_info from)
{
    if (is_node_type(to.base_type.node, number_type) && is_node_type(from.base_type.node, number_type))
    {
        auto to_number_type   = get_node_type(number_type, to.base_type.node);
        auto from_number_type = get_node_type(number_type, from.base_type.node);
        
        if ((from_number_type->is_float && !to_number_type->is_float) ||
            (from_number_type->is_signed && !to_number_type->is_signed) ||
            (from_number_type->bit_count_power_of_two > to_number_type->bit_count_power_of_two))
            return false;
    }
    else if (to.base_type.node != from.base_type.node)
        return false;
    
    if (to.base_type.indirection_count != from.base_type.indirection_count)
        return false;

    return true;
}

parsed_number evaluate(ast_node *expression)
{
    switch (expression->node_type)
    {
        cases_complete;
        
        case ast_node_type_number:
        {
            local_node_type(number, expression);
            return number->value;
        } break;
    }

    return {};
}

struct byte_count_and_alignment
{
    u32 byte_count;
    u32 byte_alignment;
};

byte_count_and_alignment get_type_byte_count(complete_type_info type)
{
    // all pointers have the same byte count and alignment
    if (type.name_type.indirection_count)
        return { 8, 8 };

    auto base_type = type.base_type.node;
    switch (base_type->node_type)
    {
        cases_complete;
        
        case ast_node_type_number_type:
        {
            local_node_type(number_type, base_type);
            u32 byte_count = number_type->bit_count_power_of_two >> 3;
            return { byte_count, byte_count };
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, base_type);
            
            if (array_type->count_expression)
            {
                auto count_and_alignment = get_type_byte_count(array_type->item_type);
                
                count_and_alignment.byte_count *= evaluate(array_type->count_expression).u64_value;
                return count_and_alignment;
            }
            else
            {
                // usize + pointer
                return { 16, 8 };
            }
        } break;
        
        case ast_node_type_compound_type:
        {
            local_node_type(compound_type, base_type);
            
            if (!compound_type->byte_count)
            {
                u32 byte_count = 0;
                u32 byte_alignment = 1;
                
                for (auto field = compound_type->first_field; field; field = (ast_compound_type_field *) field->node.next)
                {
                    auto count_and_alignment = get_type_byte_count(field->variable->type);
                    auto mask = count_and_alignment.byte_alignment - 1;
                    byte_count = (byte_count + mask) & ~mask;
                    byte_count += count_and_alignment.byte_count;
                    byte_alignment = maximum(byte_alignment, count_and_alignment.byte_alignment);
                }
                
                // byte_count is multiple of byte_alignment
                auto mask = byte_alignment - 1;
                byte_count = (byte_count + mask) & ~mask;
                
                compound_type->byte_count     = byte_count;
                compound_type->byte_alignment = byte_alignment;
            }
            
            assert(compound_type->byte_alignment);
            
            return { compound_type->byte_count, compound_type->byte_alignment };
        } break;
    }

    return {};
}

complete_type_info get_expression_type(lang_parser *parser, ast_node *node)
{
    switch (node->node_type)
    {
        cases_complete_message("%.*s", fs(ast_node_type_names[node->node_type]));
        
        case ast_node_type_array_literal:
        {
            local_node_type(array_literal, node);
            
            return array_literal->type;
        } break;
        
        case ast_node_type_compound_literal:
        {
            local_node_type(compound_literal, node);
            
            return compound_literal->type;
        } break;
        
        case ast_node_type_field_reference:
        {
            local_node_type(field_reference, node);
            
            if (!field_reference->reference)
                return {};
            
            switch (field_reference->reference->node_type)
            {
                cases_complete;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, field_reference->reference);
                    return variable->type;
                } break;
                
                // HACKY:
                case ast_node_type_enumeration_item:
                {
                    local_node_type(enumeration_item, field_reference->reference);
                    complete_type_info type = {};
                    type.base_type.node = get_base_node(enumeration_item->enumeration_type);
                    type.name_type = type.base_type;
                    return type;
                } break;
            }
        } break;
        
        case ast_node_type_cast:
        {
            local_node_type(cast, node);
            
            return cast->type;
        } break;
        
        case ast_node_type_take_reference:
        {
            local_node_type(take_reference, node);
            
            auto type = take_reference->type;
            type.name_type.indirection_count++;
            
            return take_reference->type;
        } break;
        
        case ast_node_type_not:
        case ast_node_type_is:
        case ast_node_type_is_not:
        {
            return get_type(parser, lang_base_type_u32);
        } break;
        
        case ast_node_type_add:
        case ast_node_type_subtract:
        case ast_node_type_multiply:
        case ast_node_type_divide:
        {
            auto binary_operator = (ast_binary_operator *) node;
            
            if (!binary_operator->type.base_type.node)
            {
                auto left_type  = get_expression_type(parser, binary_operator->left);
                auto right_type = get_expression_type(parser, binary_operator->right);
                
                // HACK:
                
                if (!left_type.base_type.node || !right_type.base_type.node)
                    return {};
                
                if (types_are_compatible(left_type, right_type))
                    binary_operator->type = left_type;
                else if (types_are_compatible(right_type, left_type))
                    binary_operator->type = right_type;
                else
                {
                    lang_require_return_value(false, {}, parser->iterator, " types of math operation '%.*s' arguments don't match", fnode_type_name(node));
                }
                
            }
            
            return binary_operator->type;
        } break;
        
        case ast_node_type_number:
        {
            local_node_type(number, node);
            
            u32 base_type;
            if (number->value.is_float)
                base_type = lang_base_type_f32 + (number->value.bit_count_power_of_two - 5);
            else
                base_type = number->value.is_signed * lang_base_type_s8 + (number->value.bit_count_power_of_two - 3);
                
            return get_type(parser, (lang_base_type) base_type);
        } break;
        
        case ast_node_type_string:
        {
            return get_type(parser, lang_base_type_string);
        } break;
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            auto type = get_expression_type(parser, array_index->array_expression);
            
            if (!type.name_type.node)
                return {};
            
            local_node_type(array_type, type.name_type.node);
            
            return array_type->item_type;
        } break;
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            
            if (!name_reference->reference)
                return {};
            
            //lang_require_return_value(name_reference->reference, {}, name_reference->name, "name reference '%.*s' was not resolved", fs(name_reference->name));
            
            switch (name_reference->reference->node_type)
            {
                cases_complete("%.*s", fs(ast_node_type_names[name_reference->reference->node_type]));
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, name_reference->reference);
                    return type_alias->type;
                } break;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, name_reference->reference);
                    return variable->type;
                } break;
                
                case ast_node_type_constant:
                {
                    local_node_type(constant, name_reference->reference);
                    return get_expression_type(parser, constant->expression);
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, name_reference->reference);
                    //auto function_type = get_function_type(parser, function);
                    
                    //assert(function_type->first_output && !function_type->first_output->next);
                    //local_node_type(variable, function_type->first_output);
                    
                    return function->type;
                } break;
            }
        } break;
        
        case ast_node_type_function_call:
        {
            local_node_type(function_call, node);
            
            auto base_type = get_expression_type(parser, get_base_node(function_call->expression)).base_type.node;
            if (!base_type)
                return {};

            local_node_type(function_type, base_type);
            
            //local_node_type(name_reference, );
            
            //if (!name_reference->reference)
                //return {};
            
            //local_node_type(function, ->reference);
            
            
            //auto function_type = get_function_type(parser, function);
            
            return function_type->output;
            
            //assert(function_type->first_output && !function_type->first_output->next);
            
            //local_node_type(variable, function_type->first_output);
            
            //return variable->type;
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

bool parse(lang_parser *parser, string source, string source_name)
{
    parser->source_name = source_name;
    parser->source = source;
    parser->iterator = parser->source;
    
    consume_white_or_comment(parser);
    parser->node_source_base = parser->iterator.base;
    
    new_local_node(file);
    file->path = source_name;
    file->text = source;
    parser->current_file = file;
    append_list(&parser->file_list, file);
    
    file->first_statement = lang_require_call_return_value(parse_statements(parser), false);
    
    lang_require_return_value(parser->iterator.count == 0, false, parser->iterator, "expected statements, unexpected '%c'", parser->iterator.base[0]);
    
    if (!file->module)
    {
        if (!parser->unnamed_module)
        {
            new_local_node(module);
            module->name = s("(unnamed)");
            
            append_list(&parser->module_list, module);
            
            parser->unnamed_module = module;
        }
    
        file->module = parser->unnamed_module;
        
        new_local_node(file_reference);
        file_reference->file = file;
        
        file_reference->node.next = (ast_node *) parser->unnamed_module->first_file;
        parser->unnamed_module->first_file = file_reference;
    }
    
    return !parser->error;
}

void reset(lang_parser *parser)
{
    crc32_init();

    // reset memory and clear everything else
    {
        auto backup = *parser;
        *parser = {};
        
        for (u32 node_type = 0; node_type < ast_node_type_count; node_type++)
        {
            parser->bucket_arrays[node_type] = backup.bucket_arrays[node_type];
            auto bucket_array = parser->bucket_arrays[node_type];
            
            for (auto it = bucket_array; it; it = it->next)
            {
                it->count = 0;
                memset(it->base, 0, ast_node_type_byte_counts[node_type] * ast_bucket_item_count);
            }
        }
        
        parser->node_comment_buffer = backup.node_comment_buffer;
        resize_buffer(&parser->node_comment_buffer, 0);
        
        parser->node_location_buffer = backup.node_location_buffer;
        resize_buffer(&parser->node_location_buffer, 0);
        
        parser->error_messages.memory = backup.error_messages.memory;
        resize_buffer(&parser->error_messages.memory, 0);
    }
    
    begin_list(&parser->module_list);
    begin_list(&parser->file_list);
    
    base_single_list statements;
    begin_list(&statements);
    
    for (u32 is_signed = 0; is_signed <= 1; is_signed++)
    {
        for (u32 byte_count_power_of_two = 0; byte_count_power_of_two < 4; byte_count_power_of_two++)
        {
            u32 base_type = is_signed * 4 + byte_count_power_of_two;
            new_local_node(number_type);
            number_type->name = lang_base_type_names[base_type];
            number_type->is_signed = is_signed;
            number_type->is_float  = false;
            number_type->bit_count_power_of_two = 8 << byte_count_power_of_two;
            
            parser->base_types[base_type] = get_base_node(number_type);
            
            append_list(&statements, &number_type->node);
        }
    }
    
    for (u32 i = 0; i < 2; i++)
    {
        u32 base_type = 8 + i;
        new_local_node(number_type);
        number_type->name = lang_base_type_names[base_type];
        number_type->is_signed = true;
        number_type->is_float  = true;
        number_type->bit_count_power_of_two = 32 << i;
        
        parser->base_types[base_type] = get_base_node(number_type);
        append_list(&statements, &number_type->node);
    }
    
#if 1
    {
        new_local_node(type_alias);
        
        new_local_node(array_type);
        array_type->item_type.name           = lang_base_type_names[lang_base_type_u8];
        array_type->item_type.name_type.node = parser->base_types[lang_base_type_u8];
        array_type->item_type.base_type      = array_type->item_type.name_type;
        
        type_alias->name                = lang_base_type_names[lang_base_type_string];
        type_alias->type.name_type.node = get_base_node(array_type);
        type_alias->type.base_type      = type_alias->type.name_type;
        
        parser->base_types[lang_base_type_string] = get_base_node(type_alias);
        append_list(&statements, &type_alias->node);
    }
#endif
    
    
// def null = 0 cast(u8 ref);\r

// def false = 0 cast(b8);\r
// def true  = 1 cast(b8);\r

//def string type u8[];\r

// def cstring type u8 ref; // since C++ does not like unsigned char or signned char instead of plain char\r

    string source = s(
"module lang;" "\r\n"
"\r\n"
"def usize type u64;" "\r\n"
"def ssize type s64;" "\r\n"
"\r\n"
"def b8 type u8;" "\r\n"
"def b32 type u32;" "\r\n"
"\r\n"
"def code_location struct" "\r\n"
"{" "\r\n"
"    module   cstring;" "\r\n"
"    file     cstring;" "\r\n"
"    function cstring;" "\r\n"
"    line     u32;" "\r\n"
"    column   u32;" "\r\n"
"}" "\r\n"
);

    lang_require_return_value(parse(parser, source, s("lang_internal")), , source, "internal compiler error");
    
    auto file = parser->file_list.first;
    parser->lang_module = file->module;
    
    // prepend basic types into file
    *statements.tail_next = (base_single_list_entry *) file->first_statement;
    file->first_statement = (ast_node *) statements.first;
    
    auto parent = get_base_node(file);
    for (auto it = file->first_statement; it; it = it->next)
        it->parent = parent;
}

struct resolve_table_key
{
    string name;
    ast_node *scope;
};

struct resolve_table
{
    usize count;
    usize used_count;
    resolve_table_key *keys;
    ast_node          **values;
};

usize hash_of(resolve_table_key key)
{
    u32 value = crc32_begin();
    value = crc32_advance(value, { sizeof(key.scope), (u8 *) key.scope }); // pointer bytes
    value = crc32_advance(value, key.name);
    value = crc32_end(value);
    
    return value;
}

usize get_slot(resolve_table table, resolve_table_key key)
{
    auto it = find_begin(table.count, hash_of(key));
    
    usize slot;
    while (find_next(&slot, &it))
    {
        auto slot_key = table.keys[slot];
        if (!slot_key.name.count || ((slot_key.scope == key.scope) && (slot_key.name == key.name)))
            return slot;
    }
    
    return -1;
}

ast_node * get(resolve_table table, resolve_table_key key)
{
    auto slot = get_slot(table, key);
    if ((slot == -1) || (!table.keys[slot].name.count))
        return null;
    
    return table.values[slot];
}

resolve_table make_resolve_table(usize count)
{
    resolve_table table = {};
    table.count = count;
    
    usize keys_byte_count   = sizeof(table.keys[0])   * table.count;
    usize values_byte_count = sizeof(table.values[0]) * table.count;
    
    table.keys = (resolve_table_key *) platform_allocate_bytes(keys_byte_count + values_byte_count).base;
    
    // TODO check alignment?
    table.values = (ast_node **) ((u8 *) table.keys + keys_byte_count);
    
    memset(table.keys, 0, keys_byte_count);
    
    return table;
}

void free(resolve_table *table)
{
    platform_free_bytes((u8 *) table->keys);
    *table = {};
}

bool insert(resolve_table *table, resolve_table_key key, ast_node *value)
{
    assert(key.name.count);

    auto slot = get_slot(*table, key);
    usize new_count = table->count;
    
    u32 debug_repeat_count = 0;
    while (slot == -1)
    {
        assert(debug_repeat_count < 2);
        debug_repeat_count++;
        
        new_count <<= 1;
        resolve_table new_table = make_resolve_table(new_count);
        
        for (usize i = 0; i < table->count; i++)
        {
            if (table->keys[i].name.count)
            {
                slot = get_slot(new_table, table->keys[i]);
                
                // can't insert all previous keys
                if (slot == -1)
                {
                    free(&new_table);
                    break;
                }
                
                new_table.keys[slot]   = table->keys[i];
                new_table.values[slot] = table->values[i];
            }
        }
        
        slot = get_slot(new_table, key);
        
        // still can't insert new key
        if (slot == -1)
        {
            free(&new_table);
            continue;
        }
        
        new_table.used_count = table->used_count;
        
        // success, free old table
        free(table);
        *table = new_table;
        break;
    }
    
    bool is_new = !table->keys[slot].name.count;
    table->keys[slot]   = key;
    table->values[slot] = value;
    
    table->used_count += is_new;
    
    return is_new;
}

struct lang_resolver
{
    lang_parser *parser;
    
    resolve_table table;
};

ast_node * find_node_in_scope(lang_resolver *resolver, ast_node *scope, string name)
{
    // TODO: fix this!
    if (!scope)
        return null;
    
    auto node = get(resolver->table, { name, scope });
    if (node)
        return node;
    
    // check function type scope
    if (scope && is_node_type(scope, function))
    {
        local_node_type(function, scope);
        if (function->type.base_type.node)
        {
            local_node_type(function_type, function->type.base_type.node);
        
            if (function_type->input.base_type.node)
            {
                local_node_type(compound_type, function_type->input.base_type.node);
                
                for (auto field = compound_type->first_field; field; field = (ast_compound_type_field *) field->node.next)
                {
                    auto node = get(resolver->table, { name, get_base_node(field) });
                    if (node)
                        return node;
                }
            }
        }
    }
    
    return null;
}

ast_node * find_node_in_module(lang_resolver *resolver, ast_module *module, string name)
{
    for (auto file_it = module->first_file; file_it; file_it = (ast_file_reference *) file_it->node.next)
    {
        //if (file == file_it->file)
            //continue;
    
        auto scope = get_base_node(file_it->file);
        
        auto node = find_node_in_scope(resolver, scope, name);
        if (node)
            return node;
    }
    
    return null;
}

ast_node * find_node(lang_resolver *resolver, ast_node *first_scope, string name)
{
    for (auto it = first_scope; it; it = it->parent)
    {
        auto node = find_node_in_scope(resolver, it, name);
        if (node)
            return node;
    }
    
    ast_file *file = null;
    for (auto it = first_scope; it; it = it->parent)
    {
        if (is_node_type(it, file))
        {
            file = get_node_type(file, it);
            break;
        }
    }
    
    if (file)
    {
        {
            auto module = resolver->parser->lang_module;
            
            auto node = find_node_in_module(resolver, module, name);
            if (node)
                return node;
        }
        
        if (file->module)
        {
            auto module = file->module;
            
            auto node = find_node_in_module(resolver, module, name);
            if (node)
                return node;
        }
        
        for (auto module_it = file->first_module_dependency; module_it; module_it = (ast_module_reference *) module_it->node.next)
        {
            auto module = module_it->module;
            
            auto node = find_node_in_module(resolver, module, name);
            if (node)
                return node;
        }
    }
    
    return null;
}

void update(ast_node_buffer *scope_stack, ast_node *scope)
{
    bool found = false;
    for (u32 i = 0; i < scope_stack->count; i++)
    {
        if (scope_stack->base[i] == scope)
        {
            scope_stack->count = i + 1;
            found = true;
            break;
        }
    }
    
    if (!found)
    {
        resize_buffer(scope_stack, scope_stack->count + 1);
        scope_stack->base[scope_stack->count - 1] = scope;
    }
}

struct resolve_name_entry
{
    ast_node *parent;
    
    union
    {
        ast_node           **storage;
        complete_type_info *type;
    };
    
    string name;
};

buffer_type(resolve_name_buffer, resolve_name_array, resolve_name_entry);

void resolve_complete_type(lang_parser *parser, complete_type_info *type)
{
    if (type->base_type.node || !type->name_type.node)
        return;
    
    auto name_type = type->name_type.node;
    switch (name_type->node_type)
    {
        cases_complete_message("%.*s", fs(ast_node_type_names[name_type->node_type]));
        
        case ast_node_type_function_type:
        case ast_node_type_compound_type:
        case ast_node_type_number_type:
        case ast_node_type_array_type:
        {
            type->base_type = type->name_type;
        } break;
        
        case ast_node_type_type_alias:
        {
            local_node_type(type_alias, name_type);
            
            resolve_complete_type(parser, &type_alias->type);            
            
            type->base_type = type_alias->type.base_type;
            type->base_type.indirection_count += type->name_type.indirection_count;
        } break;
    }
}

void resolve_names(lang_parser *parser, lang_resolver *resolver, ast_node *root)
{
    local_buffer(unresolved_nodes, resolve_name_buffer);
    local_buffer(unresolved_types, resolve_name_buffer);
    local_buffer(unresolved_field_references, ast_node_buffer);

    {
        local_buffer(scope_stack, ast_node_buffer);
        local_buffer(queue, ast_queue);
        
        if (root)
            enqueue(&queue, &root);
            
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = *entry.node_field;
            
            update(&scope_stack, entry.scope);
            
            switch (node->node_type)
            {
                case ast_node_type_name_reference:
                {
                    local_node_type(name_reference, node);
                
                    if (!name_reference->reference)
                    {
                        resize_buffer(&unresolved_nodes, unresolved_nodes.count + 1);
                        unresolved_nodes.base[unresolved_nodes.count - 1] = { node->parent, &name_reference->reference, name_reference->name };
                    }
                } break;
                
                case ast_node_type_field_reference:
                {
                    local_node_type(field_reference, node);
                    
                    assert(!field_reference->expression_type.name_type.node);
                
                    resize_buffer(&unresolved_field_references, unresolved_field_references.count + 1);
                    unresolved_field_references.base[unresolved_field_references.count - 1] = node;
                } break;
            
                case ast_node_type_variable:
                {
                    local_node_type(variable, node);
                    
                    if (!variable->type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &variable->type;
                        entry->name = variable->type.name;
                    }
                } break;
                
                case ast_node_type_array_literal:
                {
                    local_node_type(array_literal, node);
                    
                    if (!array_literal->type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &array_literal->type;
                        entry->name = array_literal->type.name;
                    }
                } break;
                
                case ast_node_type_compound_literal:
                {
                    local_node_type(compound_literal, node);
                    
                    if (!compound_literal->type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &compound_literal->type;
                        entry->name = compound_literal->type.name;
                    }
                } break;
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    
                    if (!type_alias->type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &type_alias->type;
                        entry->name = type_alias->type.name;
                    }
                } break;

                case ast_node_type_array_type:
                {
                    local_node_type(array_type, node);

                    if (!array_type->item_type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &array_type->item_type;
                        entry->name = array_type->item_type.name;
                    }
                } break;
                
                 case ast_node_type_cast:
                {
                    local_node_type(cast, node);

                    if (!cast->type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &cast->type;
                        entry->name = cast->type.name;
                    }
                } break;

                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    
                    if (!function->type.name_type.node)
                    {
                        resize_buffer(&unresolved_types, unresolved_types.count + 1);
                        auto entry = &unresolved_types.base[unresolved_types.count - 1];
                        entry->parent = node->parent;
                        entry->type = &function->type;
                        entry->name = function->type.name;
                    }
                } break;
            }
        }
    }
    
    {
        bool did_resolve_entry = true;
        while (unresolved_nodes.count && did_resolve_entry)
        {
            did_resolve_entry = false;
            
            for (u32 i = 0; i < unresolved_nodes.count; i++)
            {
                auto entry = unresolved_nodes.base[i];
                
                *entry.storage = find_node(resolver, entry.parent, entry.name);
                if (*entry.storage)
                {
                    unresolved_nodes.base[i] = unresolved_nodes.base[--unresolved_nodes.count];
                    resize_buffer(&unresolved_nodes, unresolved_nodes.count);
                    did_resolve_entry = true;
                    i++; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_types.count; i++)
            {
                auto entry = unresolved_types.base[i];
                
                if (!entry.type->name_type.node)
                {
                    entry.type->name_type.node = find_node(resolver, entry.parent, entry.name);
                    did_resolve_entry |= (entry.type->name_type.node != null);
                }
                
                if (!entry.type->base_type.node)
                {
                    resolve_complete_type(parser, entry.type);
                    did_resolve_entry |= (entry.type->base_type.node != null);
                }
                
                if (entry.type->base_type.node)
                {
                    unresolved_types.base[i] = unresolved_types.base[--unresolved_types.count];
                    resize_buffer(&unresolved_types, unresolved_types.count);
                    did_resolve_entry = true;
                    i++; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_field_references.count; i++)
            {
                auto node = unresolved_field_references.base[i];
                local_node_type(field_reference, node);
                
                field_reference->expression_type = get_expression_type(parser, field_reference->expression);
                if (field_reference->expression_type.name_type.node)
                {
                    resolve_complete_type(parser, &field_reference->expression_type);
                    
                    auto base_type = field_reference->expression_type.base_type.node;
                    if (base_type)
                    {
                        if (is_node_type(base_type, compound_type))
                        {
                            local_node_type(compound_type, base_type);
                            
                            for (auto field = compound_type->first_field; field; field = (ast_compound_type_field *) field->node.next)
                            {
                                if (field->variable->name == field_reference->name)
                                {
                                    field_reference->reference = get_base_node(field->variable);
                                    break;
                                }
                            }
                        }
                        else if (is_node_type(base_type, enumeration_type))
                        {
                            local_node_type(enumeration_type, base_type);
                            
                            if (field_reference->name == s("count"))
                            {
                                field_reference->reference = base_type;
                            }
                            else
                            {
                                for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                                {
                                    if (item->name == field_reference->name)
                                    {
                                        field_reference->reference = get_base_node(item);
                                        break;
                                    }
                                }
                            }
                        }
                        else if (is_node_type(base_type, array_type))
                        {
                            local_node_type(array_type, base_type);
                            
                            lang_require_return_value(field_reference->name == s("count") || field_reference->name == s("base"), ,field_reference->name, "arrays have no field '%.*s'", fs(field_reference->name));
                        }
                        else
                        {
                            lang_require_return_value(false, , field_reference->name, "expression of type %.*s has no field '%.*s'", fnode_type_name(base_type), fs(field_reference->name));
                        }
                    }
                    
                    //field_reference->reference = find_node(resolver, type.base_type.node, field_reference->name);
                    if (field_reference->reference)
                    {
                        unresolved_field_references.base[i] = unresolved_field_references.base[--unresolved_field_references.count];
                        resize_buffer(&unresolved_field_references, unresolved_field_references.count);
                        did_resolve_entry = true;
                        i++; // repeat index
                    }
                }
            }
        }
    }
    
    // resolve complete type
    {
        local_buffer(scope_stack, ast_node_buffer);
        local_buffer(queue, ast_queue);
        
        if (root)
            enqueue(&queue, &root);
            
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = *entry.node_field;
            
            update(&scope_stack, entry.scope);
            
            switch (node->node_type)
            {
                case ast_node_type_enumeration_type:
                {
                    local_node_type(enumeration_type, node);
                    
                    resolve_complete_type(parser, &enumeration_type->item_type);
                } break;
                
                case ast_node_type_array_type:
                {
                    local_node_type(array_type, node);
                    
                    resolve_complete_type(parser, &array_type->item_type);
                } break;
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    
                    resolve_complete_type(parser, &type_alias->type);
                } break;
                
                case ast_node_type_cast:
                {
                    local_node_type(cast, node);
                    
                    resolve_complete_type(parser, &cast->type);
                } break;
                
                case ast_node_type_take_reference:
                {
                    local_node_type(take_reference, node);
                    
                    resolve_complete_type(parser, &take_reference->type);
                } break;
            
                case ast_node_type_variable:
                {
                    local_node_type(variable, node);
                    
                    resolve_complete_type(parser, &variable->type);
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    
                    resolve_complete_type(parser, &function->type);
                } break;
            }
        }
    }
    
#if 1

    for (u32 i = 0; i < unresolved_nodes.count; i++)
    {
        auto entry = unresolved_nodes.base[i];
        
    #if 0
        switch (node->node_type)
        {
            case ast_node_type_field_reference:
            {
                local_node_type(field_reference, node);
                
                if (field_reference->name == s("count"))
                {
                    auto type = get_expression_type(field_reference->expression);
                    
                    if (type.base_type.modifiers.count && (type.base_type.modifiers.base[type.base_type.modifiers.count - 1] == type_modifier_type_constant_array))
                    {
                        field_reference->array_count_expression = type.base_type.modifiers.base[type.base_type.modifiers.count - 1].constant_array_count_expression;
                        field_reference->referene_type = field_reference_type_array_count_expression;
                    }
                }
                
            } break;
        }
    #endif
    
        //printf("unresolved reference to '%.*s'\n", fs(entry.name));
        
    }

    #if 0
    {
        local_buffer(queue, ast_queue);
 
        if (root)
            enqueue(&queue, &root);
            
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = *entry.node_field;
            
            update(&scope_stack, entry.scope);
            
            switch (node->node_type)
            {
                case ast_node_type_name_reference:
                {
                    local_node_type(name_reference, node);
                
                    if (!name_reference->reference)
                        printf("unresolved reference to '%.*s'\n", fs(name_reference->name));
                } break;
                
                case ast_node_type_field_reference:
                {
                    local_node_type(field_reference, node);
                    
                    if (!field_reference->variable)
                    {
                        printf("unresolved reference to '%.*s'\n", fs(field_reference->name));
                    }
                } break;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, node);
                    
                    if (!variable->type.base_type)
                        printf("unresolved reference to '%.*s'\n", fs(variable->type.name));
                } break;
                
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    
                    if (!type_alias->type.base_type)
                        printf("unresolved reference to '%.*s'\n", fs(type_alias->type.name));
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    
                    if (!function->type.base_type)
                        printf("unresolved reference to '%.*s'\n", fs(function->type.name));
                } break;
            }
        }
    }
    #endif
    
#endif
}

bool try_add_default_argument(lang_parser *parser, ast_function_call *function_call, ast_function_type *function_type, ast_node ***argument_tail_next, ast_compound_type_field **input_pointer)
{
    auto input = *input_pointer;
    assert(input);
    
    auto variable = input->variable;
    
    auto argument = **argument_tail_next;
    
    if (input->default_value_expression)
    {
        auto default_value = input->default_value_expression;

        // handle special pseudo functions
        if (is_node_type(default_value, function_call))
        {
            auto pseudo_function_call = get_node_type(function_call, default_value);

            if (is_node_type(pseudo_function_call->expression, name_reference))
            {
                local_node_type(name_reference, pseudo_function_call->expression);

                if (name_reference->name == s("get_call_argument_text"))
                {
                    lang_require_return_value(pseudo_function_call->first_argument && !pseudo_function_call->first_argument->next && is_node_type(pseudo_function_call->first_argument, name_reference), false, name_reference->name, "pseudo function get_call_argument_text expects exactly one name reference argument");

                    auto argument_name = get_node_type(name_reference, pseudo_function_call->first_argument);

                    auto call_argument = function_call->first_argument;
                    
                    auto input_compound_type = get_node_type(compound_type, function_type->input.base_type.node);
                    
                    for (auto input_it = input_compound_type->first_field; input_it; input_it = (ast_compound_type_field *) input_it->node.next)
                    {
                        auto variable = input_it->variable;

                        if (variable->name == argument_name->name)
                        {
                            lang_require_return_value(call_argument != argument, false, name_reference->name, "pseudo function get_call_argument_text can not have itself as the name reference argument");

                            auto text_node = new_leaf_node(string);
                            text_node->text = parser->node_location_buffer.base[call_argument->index].text;
                            text_node->node.parent = get_base_node(function_call);

                            // add new argument with default value
                            text_node->node.next = argument;
                            **argument_tail_next = get_base_node(text_node);
                            *argument_tail_next = &text_node->node.next;
                            // argument stays the same

                            input = (ast_compound_type_field *) input->node.next;
                            break;
                        }

                        call_argument = call_argument->next;
                    }

                    lang_require_return_value(call_argument, false, name_reference->name, "can't find function argument %.*s for pseudo function get_call_argument_text, expects a name of an argument of the function type input", fs(name_reference->name));
                    
                    *input_pointer = input;
                    return true;
                }
            }
#if 0
            else if (name_reference->name == s("get_call_location"))
            {
                lang_require(!pseudo_function_call->first_argument, name_reference->name, "pseudo function get_call_location expects no arguments");

                new_local_node(name_reference);
                name_reference->name = argument->name;
                name_reference->reference = &argument->node;

                // need to add struct values
                assert(0);

                new_local_node(literal);

                new_local_node(assignment);
                assignment->left = name_reference;
                assignment->right = &literal->node;

                assignment->node.next = argument->node.next;
                argument_it->node.next = &assignment->node;

                input = input->next;
                *input_pointer = input;
                return true;
            }
#endif                            
        }

        auto input_type = variable->type;
        auto argument_type = input_type;
        if (argument)
            argument_type = get_expression_type(parser, argument);

        // default argument skipped on type missmatch
        if (argument_type.base_type.node && types_are_compatible(input_type, argument_type))
        {
            auto default_expression = clone(parser, default_value, get_base_node(function_call));

            // add new argument with default value
            default_expression->next = argument;
            **argument_tail_next = default_expression;
            *argument_tail_next = &default_expression->next;
            // argument stays the same

            input = (ast_compound_type_field *) input->node.next;
            *input_pointer = input;
            return true;
        }                                                                                           
    }
    
    return false;
}

void resolve(lang_parser *parser)
{
    auto root = get_base_node(parser->file_list.first);
    
#if 0
    // print ast
    {
        local_buffer(queue, ast_queue);
        
        if (root)
            enqueue(&queue, &root);
        
        ast_node *node;
        while (next(&node, &queue))
        {
            printf("%.*s 0x%p\n", fs(ast_node_type_names[node->node_type]), node);
        }
    }
#endif

#if 1
    // print modules and files
    for (auto module = parser->module_list.first; module; module = (ast_module *) module->node.next)
    {
        printf("\nmodule %.*s\n", fs(module->name));
        
        for (auto file_it = module->first_file; file_it; file_it = (ast_file_reference *) file_it->node.next)
        {
            printf("\tfile \"%.*s\"\n", fs(file_it->file->path));
        }
    }
#endif
    
    lang_resolver resolver = {};
    resolver.parser = parser;
    
    resolver.table = make_resolve_table(1024);
    defer { free(&resolver.table); };
    
    // collect declarations
    {
        local_buffer(queue, ast_queue);
        
        if (root)
            enqueue(&queue, &root);
        
        ast_queue_entry entry;
        while (next(&entry, &queue))
        {
            auto node = *entry.node_field;
            
            bool add_node = false;
            
            //printf("collected %04x %.*s '%.*s'\n", node->index, fnode_type_name(node), fs(get_name(node)));
            
            switch (node->node_type)
            {
                case ast_node_type_type_alias:
                {
                    local_node_type(type_alias, node);
                    add_node = true;
                } break;
                
            // TODO: make this work with field_references
            #if 0
                case ast_node_type_array_type:
                {
                    local_node_type(array_type, node);                                        
                    
                    if (array_type->count_expression)
                    {
                        auto is_new = insert(&resolver.table, { s("count"), node }, array_type->count_expression);
                        //assert(is_new);
                    }
                } break;
                
                case ast_node_type_enumeration_type:
                {
                    local_node_type(enumeration_type, node);
                    auto is_new = insert(&resolver.table, { s("count"), node }, get_base_node(&enumeration_type->item_count));
                    assert(is_new);
                } break;
            #endif
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, node);
                    add_node = true;
                } break;
                
                case ast_node_type_constant:
                {
                    add_node = true;
                } break;
                
                case ast_node_type_function:
                {
                    local_node_type(function, node);
                    add_node = true;
                } break;
            }
            
            if (add_node)
            {
                auto is_new = insert(&resolver.table, { get_name(node), entry.scope }, node);
                assert(is_new);
            }
        }
    }
    
    printf("table used count / count: %llu / %llu\n", resolver.table.used_count, resolver.table.count);
    
    resolve_names(parser, &resolver, root);
    
    // check function calls
    {
        local_buffer(queue, ast_queue);
        
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
                    
                    auto complete_type = get_expression_type(parser, function_call->expression);
                    auto type = complete_type.base_type;
                    if (!type.node)
                    {
                        //printf("unresolved type of function_call expression\n");
                        break;
                    }
                    
                    lang_require_return_value(!type.indirection_count && is_node_type(type.node, function_type), , parser->iterator, "type of function call expression must be function type");
                    
                    local_node_type(function_type, type.node);
                    
                    if (!function_type->input.base_type.node)
                        break;
                        
                    auto input_compound_type = get_node_type(compound_type, function_type->input.base_type.node);
                    auto input = input_compound_type->first_field;
                    
                    auto argument_tail_next = &function_call->first_argument;
                    auto argument = *argument_tail_next;
                    
                    while (argument && input)
                    {
                        auto argument_type = get_expression_type(parser, argument);
                        
                        auto variable = input->variable;
                        auto input_type = variable->type;
                        
                        if (try_add_default_argument(parser, function_call, function_type, &argument_tail_next, &input))
                            continue;
                        
                        argument_tail_next = &argument->next;
                        argument = *argument_tail_next;
                        input = (ast_compound_type_field *) input->node.next;
                    }
                    
                    lang_require_return_value(!argument, , parser->iterator, "too many arguments too function call");
                    
                    while (input)
                    {
                        auto variable = input->variable;
                        lang_require_return_value(input->default_value_expression, , parser->iterator, "expected argument '%.*s' in function call", fs(variable->name));
                        
                        bool ok = try_add_default_argument(parser, function_call, function_type, &argument_tail_next, &input);
                        assert(ok);
                    }
                } break;
            }
        }
    }
}
