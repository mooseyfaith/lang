#pragma once

#if defined LANG_BREAK_ON_ERROR

#define lang_maybe_break_on_error() \
    platform_conditional_fatal_error_location(false, get_call_location(), "Internal Debug Breakpoint", "Hit 'Continue' to see error messages")

#else

#define lang_maybe_break_on_error()

#endif

#include "utf8_string.h"
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
    macro(function_reference, __VA_ARGS__) \
    macro(function_overloads, __VA_ARGS__) \
    macro(compound_literal, __VA_ARGS__) \
    macro(compound_literal_field, __VA_ARGS__) \
    macro(array_literal, __VA_ARGS__) \
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
    macro(dereference, __VA_ARGS__) \
    macro(field_dereference, __VA_ARGS__) \
    macro(get_type_info, __VA_ARGS__) \
    macro(type_byte_count, __VA_ARGS__) \
    macro(get_function_reference, __VA_ARGS__) \
    macro(get_call_location, __VA_ARGS__) \
    macro(get_call_argument_text, __VA_ARGS__) \
    macro(unary_operator, __VA_ARGS__) \
    macro(binary_operator, __VA_ARGS__) \

    
#define ast_unary_operator_list(macro, ...) \
    macro(not, __VA_ARGS__) \
    macro(negate, __VA_ARGS__) \
    macro(take_reference, __VA_ARGS__) \
    macro(cast, __VA_ARGS__) \
    
#define ast_binary_operator_list(macro, ...) \
    macro(or, __VA_ARGS__) \
    macro(and, __VA_ARGS__) \
    macro(xor, __VA_ARGS__) \
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
    macro(bit_xor, __VA_ARGS__) \
    macro(bit_shift_left, __VA_ARGS__) \
    macro(bit_shift_right, __VA_ARGS__) \
    \
    macro(add, __VA_ARGS__) \
    macro(subtract, __VA_ARGS__) \
    macro(multiply, __VA_ARGS__) \
    macro(divide, __VA_ARGS__) \
    macro(modulo, __VA_ARGS__) \

#define ast_type_list(macro, ...) \
    macro(number_type, __VA_ARGS__) \
    macro(enumeration_type, __VA_ARGS__) \
    macro(function_type, __VA_ARGS__) \
    macro(compound_type, __VA_ARGS__) \
    macro(array_type, __VA_ARGS__) \
    \
    macro(expression_reference_type, __VA_ARGS__) \
    macro(alias_type, __VA_ARGS__) \
    
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

enum ast_unary_operator_type
{
    ast_unary_operator_list(menum, ast_unary_operator_type_)
    
    ast_unary_operator_type_count,
};

enum ast_binary_operator_type
{
    ast_binary_operator_list(menum, ast_binary_operator_type_)
    
    ast_binary_operator_type_count,
};

string ast_unary_operator_names[] = 
{
    ast_unary_operator_list(menum_name)
};

string ast_binary_operator_names[] = 
{
    ast_binary_operator_list(menum_name)
};

string ast_node_type_names[] =
{
    ast_type_list(menum_name)
    ast_node_list(menum_name)
};

#define lang_base_number_type_list(macro, ...) \
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

#define lang_base_alias_type_list(macro, ...) \
    macro(b8, __VA_ARGS__) \
    macro(b32, __VA_ARGS__) \
    macro(usize, __VA_ARGS__) \
    macro(ssize, __VA_ARGS__) \
    macro(string, __VA_ARGS__) \
    macro(code_location, __VA_ARGS__) \
    macro(cstring, __VA_ARGS__) \
    macro(lang_type_info_type, __VA_ARGS__) \
    macro(lang_type_info, __VA_ARGS__) \
    macro(lang_type_info_number_type, __VA_ARGS__) \
    macro(lang_type_info_number, __VA_ARGS__) \
    macro(lang_type_info_compound_field, __VA_ARGS__) \
    macro(lang_type_info_compound, __VA_ARGS__) \
    macro(lang_type_info_array, __VA_ARGS__) \
    macro(lang_type_info_enumeration, __VA_ARGS__) \
    macro(lang_type_info_enumeration_item, __VA_ARGS__) \
    macro(lang_type_info_any_value, __VA_ARGS__) \
    macro(lang_type_info_table, __VA_ARGS__) \

#define lang_base_constant_list(macro, ...) \
    macro(null, __VA_ARGS__) \
    macro(false, __VA_ARGS__) \
    macro(true, __VA_ARGS__) \
    macro(lang_type_table, __VA_ARGS__) \
    
#if 0
    macro(lang_type_info_number_type_table, __VA_ARGS__) \
    macro(lang_type_info_compound_type_table, __VA_ARGS__) \
    macro(lang_type_info_compound_type_field_table, __VA_ARGS__) \
    macro(lang_type_info_array_type_table, __VA_ARGS__) \
    macro(lang_type_info_enumeration_type_table, __VA_ARGS__) \
    macro(lang_type_info_enumeration_type_item_table, __VA_ARGS__) \
    
#endif

enum lang_base_number_type
{
    lang_base_number_type_list(menum, lang_base_number_type_)
    
    lang_base_number_type_count,
};

enum lang_base_alias_type
{
    lang_base_alias_type_list(menum, lang_base_alias_type_)
    
    lang_base_alias_type_count,
};

enum lang_base_type
{
    lang_base_number_type_list(menum, lang_base_type_)
    lang_base_alias_type_list(menum, lang_base_type_)
    
    lang_base_type_count,
};

enum lang_base_constant
{
    lang_base_constant_list(menum, lang_base_constant_)
    
    lang_base_constant_count,
};

string lang_base_type_names[] = 
{
    lang_base_number_type_list(menum_name)
    lang_base_alias_type_list(menum_name)
};

string lang_base_constant_names[] = 
{
    lang_base_constant_list(menum_name)
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
    u32           type_index;
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

enum type_compatibility 
{
    type_compatibility_false,
    type_compatibility_requires_cast,
    type_compatibility_implicit,
    type_compatibility_equal,
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
    ast_node *default_expression;
    string name;
    bool is_global, type_is_declared;
    u32 field_byte_offset;
};

struct ast_enumeration_type;

struct parsed_number
{
    bool is_signed;
    bool is_float;
    bool is_hex;
    
    u8 bit_count_power_of_two;
    
    union
    {
        u64 u64_value;
        s64 s64_value;
        f64 f64_value;
    };
};

struct ast_enumeration_item
{
    ast_base_node node;
    ast_enumeration_type *enumeration_type;
    ast_node *expression;
    string name;
    u64 value;
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
    ast_node           *item_count_expression;  // is constant array
    usize              item_count; // only if count_expression != null
};

struct ast_enumeration_type
{
    ast_base_node node;
    complete_type_info   item_type;
    u32                  item_count;
    ast_enumeration_item *first_item;
};

#if 0
enum calling_convention
{
    calling_convention_default = 0,
     
    // __cdecl
    calling_convention_caller_right_to_left = calling_convention_default,
    
    // _stdcall
    calling_convention_callee_right_to_left, 
    
    calling_convention_count
};
#endif

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

struct ast_alias_type
{
    ast_base_node node;
    string name;
    complete_type_info type;
};

struct ast_expression_reference_type
{
    ast_base_node      node;
    ast_node           *expression;
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
    
    complete_type_info input;
    complete_type_info output;
    
    string calling_convention;
    //calling_convention convention;
};

struct ast_function
{
    ast_base_node node;
    complete_type_info type;
    string name;
    ast_node *first_statement;
};

struct ast_function_reference
{
    ast_base_node node;
    ast_function *function;
};

struct ast_function_overloads
{
    ast_base_node           node;
    string                  name;
    ast_function_reference *first_function_reference;
};

struct ast_compound_type
{
    ast_base_node node;
    ast_variable  *first_field;
    u32           byte_count;
    u32           byte_alignment;
};

struct ast_compound_literal_field
{
    ast_base_node node;
    string   name;
    ast_node *expression;
    u32 byte_offset;
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

struct ast_dereference
{
    ast_base_node      node;
    ast_node           *expression;
    complete_type_info type;
};

struct ast_field_dereference
{
    ast_base_node      node;
    string             name;
    ast_node           *expression;
    ast_node           *reference;
    complete_type_info type;
};

// pseudo functions

struct ast_get_type_info
{
    ast_base_node      node;
    complete_type_info type;
};

struct ast_type_byte_count
{
    ast_base_node      node;
    complete_type_info type;
    parsed_number      byte_count;
};

struct ast_get_function_reference
{
    ast_base_node      node;
    string             name;
    complete_type_info type;
    ast_function       *function;
};

typedef ast_base_node ast_get_call_location;

struct ast_get_call_argument_text
{
    ast_base_node node;
    ast_name_reference *argument;
};

/*
struct ast_import_text_file
{
    ast_base_node node;
    string text;
};*/

struct ast_array_index
{
    ast_base_node node;
    ast_node *array_expression;
    ast_node *index_expression;
};

struct ast_assignment
{
    ast_base_node node;
    ast_node *left;
    ast_node *right;
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

struct ast_unary_operator
{
    ast_base_node node;
    ast_unary_operator_type operator_type;
    complete_type_info type;
    ast_function *function; // if its an overload
    ast_node *expression;
};

struct ast_binary_operator
{
    ast_base_node node;
    ast_binary_operator_type operator_type;
    complete_type_info type;
    ast_function *function; // if its an overload
    ast_node *left;
    //ast_node *right == left->next, less book keeping
};

union ast_node
{
    // copy from ast_base_node
    struct
    {
        ast_node      *next; // needs to be first, to properly work with base lists
        ast_node      *parent;
        u32           index;
        ast_node_type node_type;
        u32           type_index;
    };

    ast_type_list(menum_field)
    ast_node_list(menum_field)
};

#define menum_ast_type_byte_count(entry, ...) \
    sizeof(ast_ ## entry),

u32 ast_node_type_byte_counts[] = {
    ast_type_list(menum_ast_type_byte_count)
    ast_node_list(menum_ast_type_byte_count)
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

single_list_type(ast_file_list,   ast_file);
single_list_type(ast_module_list, ast_module);

#define bucket_type(name, type, capacity) \
struct name \
{ \
    name  *next; \
    usize count; \
    type  base[capacity]; \
};

#define bucket_array_type(name, type, capacity) \
bucket_type(name, type, capacity); \
struct name ## _array \
{ \
    name  *first; \
    name  **tail_next; \
    usize item_count; \
};

bucket_array_type(base_bucket_type, u8, 1);

#define for_bucket_item(bucket, index, bucket_array) \
for (auto bucket = bucket_array.first; bucket; bucket = bucket->next) \
    for (u32 index = 0; index < bucket->count; index++) 

const u32 ast_bucket_item_count = 1024;

#define menum_bucket_type(entry, ...) \
    bucket_array_type(ast_ ## entry ## _bucket, ast_ ## entry, ast_bucket_item_count);
    
#define menum_bucket_array_field(entry, ...) \
    ast_ ## entry ## _bucket_array entry ## _buckets;

#define menum_bucket_type_byte_count(entry, ...) \
    sizeof(ast_ ## entry ## _bucket),

ast_node_list(menum_bucket_type);
ast_type_list(menum_bucket_type);

u32 ast_node_bucket_byte_counts[] = {
    ast_type_list(menum_bucket_type_byte_count)
    ast_node_list(menum_bucket_type_byte_count)
};

struct lang_parser
{
    // memory
    
    union
    {
        struct
        {
            ast_type_list(menum_bucket_array_field);
            ast_node_list(menum_bucket_array_field);
        };
    
        ast_base_node_bucket_array bucket_arrays[ast_node_type_count];
    };
    
    // one source location per node
    string_buffer          node_comments;
    source_location_buffer node_locations;
    
    string_builder error_messages;
    string_builder temp_builder;
    
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
        struct
        {
            ast_number_type *base_number_types[lang_base_number_type_count];
            ast_alias_type  *base_alias_typees[lang_base_alias_type_count];
        };
        
        ast_node *base_types[lang_base_type_count];
    };
    
    ast_constant *base_constants[lang_base_constant_count];
    
    string last_location_token;
    u8 *node_location_base;
    
    ast_node *current_parent;
    
    u32 next_node_index;
    
    ast_module_list module_list;
    ast_file_list   file_list;
    
    string     lang_internal_source;
    ast_module *lang_module;
    ast_file   *lang_file;
    ast_module *unnamed_module;
    
    ast_file   *current_file;
};

#define begin_new_node(node_type, ...) \
( (ast_ ## node_type *) begin_node(parser, (ast_node *) new_base_bucket_item((base_bucket_type_array *) &parser->node_type ## _buckets, sizeof(ast_ ## node_type ## _bucket), ast_bucket_item_count, sizeof(ast_ ## node_type)), ast_node_type_ ## node_type, __VA_ARGS__) )

#define new_leaf_node(node_type, first_token) ( (ast_ ## node_type *) end_node(parser, (ast_node *) begin_new_node(node_type, first_token), !(first_token).count) )

#define begin_new_local_node(node_type)              ast_ ## node_type *node_type = begin_new_node(node_type)
#define new_local_leaf_node(node_type, first_token)  ast_ ## node_type *node_type = new_leaf_node(node_type, first_token)

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
#define new_local_node(node_type, ...) ast_ ## node_type *node_type = begin_new_node(node_type, __VA_ARGS__); defer { end_node(parser, (ast_node *) node_type); }


#define new_bucket_item(bucket_array) ( (decltype(&(bucket_array)->first->base[0])) new_base_bucket_item((base_bucket_type_array *) bucket_array, sizeof(*(bucket_array)->first), carray_count((bucket_array)->first->base), sizeof((bucket_array)->first->base[0])) )

u8 * new_base_bucket_item(base_bucket_type_array *bucket_array, usize bucket_byte_count, usize item_capacity, usize item_byte_count)
{
#if 0
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
#endif

    auto bucket_tail_next = bucket_array->tail_next;
    for (; *bucket_tail_next; bucket_tail_next = &(*bucket_tail_next)->next)
    {
        auto bucket = *bucket_tail_next;
        if (bucket->count < item_capacity)
            break;
    }
    
    if (!*bucket_tail_next)
    {
        auto bucket = (base_bucket_type *) platform_allocate_bytes(bucket_byte_count).base;
        memset(bucket, 0, bucket_byte_count);
        
        *bucket_tail_next = bucket;
        //*bucket_array->tail_next = bucket;
        //bucket_array->tail_next = &bucket;
    }
    
#if 0
    if (!bucket_array->tail || (bucket_array->tail->count >= item_capacity))
    {
        auto bucket = (base_bucket_type *) platform_allocate_bytes(bucket_byte_count).base;
        memset(bucket, 0, bucket_byte_count);
        
        if (!bucket_array->tail)
        {
            assert(!bucket_array->first);
            bucket_array->first = bucket;
            bucket_array->tail = bucket;
        }
        else
        {
            bucket_array->tail->next = bucket;
            bucket_array->tail = bucket;
        }
    }
#endif

    auto bucket = *bucket_tail_next; //bucket_array->tail;
    auto item = (bucket->base + bucket->count * item_byte_count);
    bucket->count++;
    bucket_array->item_count++;
    // no need to clear, since the whole bucket will be cleared on creation
    
    return item;
}

string advance_node_location(lang_parser *parser, u8 *base)
{
    string text = { (usize) (parser->iterator.base - base), base };

    // remove trailing white space
    while (text.count)
    {
        u8 tail = text.base[text.count - 1];
        if (!contains(s(" \t\n\r"), tail))
            break;
        
        --text.count;
    }
    
    parser->node_location_base = parser->iterator.base;
    
    return text;
}

void advance_node_location(lang_parser *parser)
{
    parser->last_location_token = advance_node_location(parser, parser->node_location_base);
}

ast_node * begin_node(lang_parser *parser, ast_node *node, ast_node_type node_type, string first_token = {})
{
    assert(parser->node_locations.count == parser->next_node_index);
    resize_buffer(&parser->node_locations, parser->node_locations.count + 1);
    
    assert(parser->node_comments.count == parser->next_node_index);
    resize_buffer(&parser->node_comments, parser->node_comments.count + 1);
    auto comment = &parser->node_comments.base[parser->node_comments.count - 1];
    *comment = parser->pending_comment;
    parser->pending_comment = {};
    
    node->index  = parser->next_node_index++;
    node->node_type  = node_type;
    node->type_index = parser->bucket_arrays[node_type].item_count - 1;

    node->parent = parser->current_parent;
    parser->current_parent = node;
    
    auto location = &parser->node_locations.base[node->index];
    *location = {};
    
    if (!first_token.base)
        first_token = parser->last_location_token;
    
    location->text = first_token;
    
    return node;
}

ast_node * end_node(lang_parser *parser, ast_node *node, bool update_location_text = true)
{
    assert(parser->error || node == parser->current_parent, "call end_node on parent");
    
    parser->current_parent = parser->current_parent->parent;
    
    if (update_location_text)
    {
        auto location = &parser->node_locations.base[node->index];
        location->text = advance_node_location(parser, location->text.base);
    }
    
    return node;
}

#define get_node_type(type, node)   (ast_ ## type *) (node); assert((node)->node_type == ast_node_type_ ## type)
#define local_node_type(type, node) ast_ ## type *type = get_node_type(type, node)

#define is_node_type(node, type) ((node)->node_type == ast_node_type_ ## type)

#define get_base_node(super_node) ((ast_node *) (super_node))

#define consume_white_or_comment_declaration void consume_white_or_comment(lang_parser *parser)
consume_white_or_comment_declaration;

#define types_are_compatible_declaration type_compatibility types_are_compatible(lang_parser *parser, complete_type_info to, complete_type_info from)
types_are_compatible_declaration;

#define maybe_add_cast_declaration bool maybe_add_cast(lang_parser *parser, ast_node **expression_pointer, type_compatibility compatibility, complete_type_info type)
maybe_add_cast_declaration;

ast_node * get_parent_scope(ast_node *node)
{
    // HACK: module parent is first file to mention it
    if (is_node_type(node, module))
        return null;

    while (node)
    {
        node = node->parent;
    
        switch (node->node_type)
        {
            case ast_node_type_file:
            {
                local_node_type(file, node);
                assert(file->module);
                
                return get_base_node(file->module);
            } break;
            
            case ast_node_type_function:
            case ast_node_type_loop:
            case ast_node_type_branch:
            case ast_node_type_branch_switch:
                return node;
        }
    }
    
    return null;
}

ast_file * get_file_scope(ast_node *node)
{
    assert(node);
    
    while (!is_node_type(node, file))
        node = node->parent;
    
    return (ast_file *) node;
}

string consume_name(lang_parser *parser)
{
    string name = skip_name(&parser->iterator);
    
    if (name.count)
    {
        consume_white_or_comment(parser);
        advance_node_location(parser);
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
        advance_node_location(parser);
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
            advance_node_location(parser);
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
        if (try_skip(&parser->iterator, s("//")))
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

struct location_line
{
    ast_file *file;
    string path;
    string text;
    u32    line;
    u32    column;
};

location_line get_location_line(lang_parser *parser, string token)
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
    
    string path;
    string left;
    if (file)
    {
        left = file->text;
        path = file->path;
    }
    else
    {
        left = parser->source;
        path = parser->source_name;
        assert((left.base <= token.base) && (token.base + token.count <= left.base + left.count));
    }
        
    string line = left;
    
    u32 line_count = 0;
    u32 column_count = 0;
    
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
    
    return { file, path, line, line_count, column_count };
}

void parser_message_va(lang_parser *parser, string token, cstring format, va_list va_arguments)
{
    auto location = get_location_line(parser, token);
    
    auto error_messages = &parser->error_messages;
    print_newline(error_messages);
    print(error_messages, "%.*s(%i,%i):  ", fs(location.path), location.line + 1, location.column + 1);
    print_va(error_messages, format, va_arguments);
    print_newline(error_messages);
    print_line(error_messages, "%.*s(%i,%i):  %.*s", fs(location.path), location.line + 1, location.column + 1, fs(location.text));
    print_line(error_messages, "%.*s(%i,%i):  %*c", fs(location.path), location.line + 1, location.column + 1, location.column, '^');
}

void parser_message(lang_parser *parser, string token, cstring format, ...)
{
    va_list va_arguments;
    va_start(va_arguments, format);
    
    parser_message_va(parser, token, format, va_arguments);
    
    va_end(va_arguments);
}

// assumes lang_parser *parser in local scope
#define lang_require_return_value(condition, return_value, token, message, ...) \
    if (!(condition)) \
    { \
        parser->error = true; \
        parser_message(parser, token, "ERROR: " message, __VA_ARGS__); \
        lang_maybe_break_on_error(); \
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

#define lang_require_expression_return_value(destination, return_value, parser, type) \
    destination = lang_require_call_return_value(parse_expression(parser, type), return_value); \
    lang_require_return_value(destination, return_value, parser->iterator, "expected expression after '%.*s' in %.*s", fs(parser->last_location_token), fnode_type_name(parser->current_parent));

#define lang_require_expression(destination, parser, type) lang_require_expression_return_value(destination, null,parser, type)

u32 get_bit_count_power_of_two(u64 value)
{
    u32 bit_count = get_highest_bit_index(value);
    
    if (bit_count)
        bit_count = (bit_count + 7) & ~0x07;
    else
        bit_count = 8;
    
    return get_highest_bit_index(bit_count);
}

ast_number * new_number_u64(lang_parser *parser, string location_text, u64 value)
{
    new_local_node(number, location_text);
    number->value.u64_value              = value;
    number->value.bit_count_power_of_two = get_bit_count_power_of_two(value);
    
    return number;
}

ast_number * parse_number(lang_parser *parser, bool parsed_minus)
{
    bool is_signed = parsed_minus || try_skip(&parser->iterator, s("-"));
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
        advance_node_location(parser);

        new_local_node(number);
        number->value.is_float  = is_float;
        number->value.is_signed = is_signed | is_float;
        //number->value.bit_count_power_of_two = 6;
        
        u32 bit_count;
        
        if (is_float)
        {
            number->value.f64_value = f64_value;
            
            // TODO: make clear when we use f64
            
            //f32 f32_value = (f32) f64_value;
            //if ((f64) f32_value == f64_value)
            bit_count = 32;
            //else
                //bit_count = 64;
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
        
        assert(!is_hex || !is_float);
        number->value.is_hex = is_hex;
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
    consume_white_or_comment(parser);
    advance_node_location(parser);
    
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
    bool consumed_semicolon = false;
    while (!try_consume(parser, s("}")))
    {
        if (!is_first)
        {
            lang_require(consumed_semicolon, parser->iterator, " expects ';' before every new field of compound literal");
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
        lang_require_expression(compound_literal_field->expression, parser, {});
        consumed_semicolon = try_consume(parser, s(";"));
        
        append_tail_next(&tail_next, &compound_literal_field->node);
    }
    
    return compound_literal;
}

// assumes "type(array_type)" was allready parsed
// add count_expression to type
ast_array_literal * parse_array_literal(lang_parser *parser, complete_type_info type)
{
    if (!try_consume(parser, s("[")))
        return null;
    
    new_local_node(array_literal);
    
    auto tail_next = make_tail_next(&array_literal->first_expression);
    
    complete_type_info expression_type = {};
    if (type.base_type.node && is_node_type(type.base_type.node, array_type))
    {
        local_node_type(array_type, type.name_type.node);
        expression_type = array_type->item_type;
    }
    
    bool is_first = true;
    bool consumed_semicolon = false;
    while (!try_consume(parser, s("]")))
    {
        if (!is_first)
        {
            lang_require(consumed_semicolon, parser->iterator, " before every new field of array literal");
        }
        
        is_first = false;
        ast_node *expression;
        lang_require_expression(expression, parser, expression_type);
        
        array_literal->item_count++;
        
        append_tail_next(&tail_next, expression);
        
        consumed_semicolon = try_consume(parser, s(";"));
    }
    
    if (type.base_type.node && is_node_type(type.base_type.node, array_type))
    {
        local_node_type(array_type, type.name_type.node);
        
        new_local_leaf_node(number, parser->node_locations.base[array_type->node.index].text);
        parser->node_locations.base[number->node.index].text.count = 0;
        
        number->value.u64_value = array_literal->item_count;
        number->value.bit_count_power_of_two = 6;
        
        number->node.parent = get_base_node(array_type);
        array_type->item_count_expression = get_base_node(number);
    }
    
#if 0
    new_local_node(array_type);
    array_literal->type.base_type.node = get_base_node(array_type);
    array_literal->type.name_type      = array_literal->type.base_type;
    array_literal->type.name           = type.name;
    
#else
    array_literal->type = type;
#endif
    
    return array_literal;
}

#define get_expression_type_declaration complete_type_info get_expression_type(lang_parser *parser, ast_node *node)
get_expression_type_declaration;

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
        
        case ast_node_type_expression_reference_type:
        {
            local_node_type(expression_reference_type, name_type);
            
            if (!expression_reference_type->type.base_type.node)
            {
                auto type = get_expression_type(parser, expression_reference_type->expression);
                resolve_complete_type(parser, &type);
                
                expression_reference_type->type = type;
            }
            
            type->base_type = expression_reference_type->type.base_type;
            type->base_type.indirection_count += type->name_type.indirection_count;
        } break;
        
        case ast_node_type_alias_type:
        {
            local_node_type(alias_type, name_type);
            
            resolve_complete_type(parser, &alias_type->type);
            if (!alias_type->type.base_type.node)
                break;
                
            assert(alias_type->type.base_type.node->node_type != ast_node_type_alias_type);
            
            type->base_type = alias_type->type.base_type;
            type->base_type.indirection_count += type->name_type.indirection_count;
            type->name = alias_type->name;
        } break;
    }
}

complete_type_info parse_type(lang_parser *parser, bool is_required)
{
    auto name = consume_name(parser);
    
    if (!name.count)
        return {};
    
    complete_type_info result = {};
    
    if (name == s("type_of"))
    {
        new_local_node(expression_reference_type);
        
        lang_require_consume_return_value("(", {}, "after 'type_of'");
        
        lang_require_expression_return_value(expression_reference_type->expression, {}, parser, {});
        
        lang_require_consume_return_value(")", {}, "after type_of expression");
        
        result.name_type.node = get_base_node(expression_reference_type);
        return result;
    }
    
    result.name = name;

    for (u32 i = 0; i < lang_base_type_count; i++)
    {
        if (name == lang_base_type_names[i])
        {
            result.name_type.node = parser->base_types[i];
            resolve_complete_type(parser, &result);
            break;
        }
    }

    while (true)
    {
        if (try_consume_keyword(parser, s("ref")))
        {
            result.name_type.indirection_count++;
            
            if (result.base_type.node)
                result.base_type.indirection_count++;
        }
        else if (try_consume(parser, s("[")))
        {
            new_local_node(array_type);
            
            auto expression = lang_require_call_return_value(parse_expression(parser, {}), {});
            lang_require_return_value(try_consume(parser, s("]")), {}, parser->iterator, "expected ']' after array count expression");
            
            resolve_complete_type(parser, &result);
            
            array_type->item_count_expression = expression;
            array_type->item_type = result;
            
            result = {};
            result.name_type.node = get_base_node(array_type);
            result.base_type      = result.name_type;
        }
        else
        {
            break;
        }
    }
    
    resolve_complete_type(parser, &result);
    
    lang_require_return_value(!is_required || result.name_type.node || result.name.count, {}, parser->iterator, "expected type");
    
    return result;
}

// assumes start pattern was allready parsed
#define parse_arguments_declaration ast_compound_type * parse_arguments(lang_parser *parser, string end_pattern)
parse_arguments_declaration;

complete_type_info parse_function_type(lang_parser *parser)
{
    complete_type_info type = {};

    if (try_consume(parser, s("(")))
    {
        new_local_node(function_type);
        
        function_type->input.name_type.node = (ast_node *) lang_require_call_return_value(parse_arguments(parser, s(")")), {});
        function_type->input.base_type = function_type->input.name_type;
        
        if (try_consume(parser, s("(")))
        {
            function_type->output.name_type.node = (ast_node *) lang_require_call_return_value(parse_arguments(parser, s(")")), {});
            function_type->output.base_type = function_type->output.name_type;
        }
        
        if (try_consume_keyword(parser, s("calling_convention")))
        {
            bool ok = lang_require_call_return_value(parse_quoted_string(&function_type->calling_convention, parser), {});
            lang_require_return_value(ok && function_type->calling_convention.count, {}, parser->iterator, "expected calling convention in quoates (\"...\") after 'calling_convention'");
        }
        
        type.name_type.node = get_base_node(function_type);
        type.base_type      = type.name_type;
    }
    else
    {
        auto function_type_name = consume_name(parser);
        lang_require_return_value(function_type_name.count, {}, parser->iterator, "expected explicit function type starting with '(' or function type name after function name");
        
        type.name = function_type_name;
    }
    
    return type;
}

ast_node * parse_base_expression(lang_parser *parser, complete_type_info type)
{
    ast_node *root = null;
    ast_node *parent = parser->current_parent;
    ast_node **parent_expression = &root;
    
    ast_node *expression = null;
    
    bool pending_minus = false;
    
    while (true)
    {
        {
            auto backup = *parser;
            
            auto keyword = consume_name(parser);
            if (keyword == s("not"))
            {
                if (pending_minus)
                {
                    new_local_node(unary_operator);
                    unary_operator->operator_type = ast_unary_operator_type_negate;
                    
                    parent = get_base_node(unary_operator);
                    *parent_expression = parent;
                    parent_expression = &unary_operator->expression;
                    pending_minus = false;
                }
            
                new_local_node(unary_operator);
                unary_operator->operator_type = ast_unary_operator_type_not;
                
                parent = get_base_node(unary_operator);
                *parent_expression = parent;
                parent_expression = &unary_operator->expression;
                continue;
            }
            
            *parser = backup;
        }
        
        if (try_consume(parser, s("-")))
        {
            pending_minus = !pending_minus;
            continue;
        }
        
        break;
    }

    if (try_consume(parser, s("(")))
    {
        if (pending_minus)
        {
            new_local_node(unary_operator);
            unary_operator->operator_type = ast_unary_operator_type_negate;
            
            parent = get_base_node(unary_operator);
            *parent_expression = parent;
            parent_expression = &unary_operator->expression;
            pending_minus = false;
        }
    
        lang_require_expression(expression, parser, type);
        lang_require_consume(")", "after sub expression starting with '('");
    }

    if (!expression)
    {
        expression = lang_require_call(get_base_node(parse_number(parser, pending_minus)));
        if (expression)
            pending_minus = false;
    }
        
    if (pending_minus)
    {
        new_local_node(unary_operator);
        unary_operator->operator_type = ast_unary_operator_type_negate;
        
        parent = get_base_node(unary_operator);
        *parent_expression = parent;
        parent_expression = &unary_operator->expression;
        pending_minus = false;
    }
        
    if (!expression)
        expression = lang_require_call(get_base_node(parse_string_literal(parser)));

    if (!expression)
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
        
        //if ((type.name.count || type.name_type.node) && !type.name_type.indirection_count)
        {
            if (!type.base_type.node || is_node_type(type.base_type.node, array_type))
            {
                expression = lang_require_call(get_base_node(parse_array_literal(parser, type)));
            }
            
            // you can do type(u8[]) { count, base } if you want to create an array value
            // so compound_literals can also be of array_type
            if (!expression && (!type.base_type.node || is_node_type(type.base_type.node, compound_type) || is_node_type(type.base_type.node, array_type)))
            {
                expression = lang_require_call(get_base_node(parse_compound_literal(parser, type)));
            }
        }
    }

    if (!expression)
    {
        auto backup = *parser;
        auto keyword = consume_name(parser);
        if (keyword.count)
        {
            for (u32 i = 0; i < lang_base_constant_count; i++)
            {
                if (parser->base_constants[i]->name == keyword)
                {
                    new_local_node(name_reference);
                    name_reference->name = keyword;
                    name_reference->reference = get_base_node(parser->base_constants[i]);
                    expression = get_base_node(name_reference);
                    break;
                }
            }
        }
        
        if (!expression)
            *parser = backup;
    }
    
    
    if (!expression)
    {
        auto name = consume_name(parser);
        if (name.count)
        {
            // check some psedo function calls
            if (name == s("get_call_location"))
            {
                new_local_leaf_node(get_call_location, name);
                
                lang_require_consume("(", "after 'get_call_location'");
                lang_require_consume(")", "after 'get_call_location('");
                
                 expression = get_base_node(get_call_location);
            }
            else if (name == s("get_call_argument_text"))
            {
                new_local_node(get_call_argument_text);
                
                lang_require_consume("(", "after 'get_call_argument_text'");
                
                auto argument_name = consume_name(parser);
                lang_require(argument_name.count, parser->iterator, "expected function argument name as single argument to get_call_argument_text");
                
                lang_require_consume(")", "after 'get_call_argument_text('");
                
                new_local_leaf_node(name_reference, argument_name);
                name_reference->name = argument_name;
                get_call_argument_text->argument = name_reference;
                
                expression = get_base_node(get_call_argument_text);
            }
            else if (name == s("get_type_info"))
            {
                new_local_node(get_type_info);
                
                lang_require_consume_return_value("(", {}, "after 'get_type_info'");
            
                get_type_info->type = lang_require_call(parse_type(parser, true));
                
                lang_require_consume_return_value(")", {}, "after get_type_info type");
                expression = get_base_node(get_type_info);
            }
            else if (name == s("type_byte_count"))
            {
                new_local_node(type_byte_count);
                
                lang_require_consume_return_value("(", {}, "after 'type_byte_count'");
            
                type_byte_count->type = lang_require_call(parse_type(parser, true));
                
                lang_require_consume_return_value(")", {}, "after type_byte_count type");
                expression = get_base_node(type_byte_count);
            }
            else if (name == s("get_function_reference"))
            {
                new_local_node(get_function_reference);
                
                lang_require_consume_return_value("(", {}, "after 'get_function_reference'");
            
                get_function_reference->name = consume_name(parser);
                lang_require_return_value(get_function_reference->name.count, {}, parser->iterator, "exected function name after 'get_function_reference'");
                
                get_function_reference->type = parse_function_type(parser);
                
                lang_require_consume_return_value(")", {}, "after get_function_reference expression");
                
                expression = get_base_node(get_function_reference);
            }
            else
            {
                new_local_leaf_node(name_reference, name);
                name_reference->name = name;
                expression = get_base_node(name_reference);
                
                // function call
                if (try_consume(parser, s("(")))
                {
                    new_local_node(function_call, parser->node_locations.base[expression->index].text);
                
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
    }
    
    while (expression)
    {
        consume_white_or_comment(parser);
        
        if (try_consume(parser, s(".")))
        {
            auto field_name = consume_name(parser);
            
            if (field_name.count)
            {
                new_local_node(field_dereference, parser->node_locations.base[expression->index].text);
                field_dereference->expression = expression;
                field_dereference->name = field_name;
                
                field_dereference->node.parent = expression->parent;
                expression->parent = get_base_node(field_dereference);
                expression = get_base_node(field_dereference);
            }
            else
            {
                new_local_node(dereference, parser->node_locations.base[expression->index].text);
                dereference->expression = expression;
                
                dereference->node.parent = expression->parent;
                expression->parent = get_base_node(dereference);
                expression = get_base_node(dereference);
            }
            
            continue;
        }
        else if (try_consume(parser, s("[")))
        {
            new_local_node(array_index, parser->node_locations.base[expression->index].text);
            array_index->array_expression = expression;
        
        #if 0
            // add bounds check
            {
                auto parent = expression->parent;
                ast_node **first_statement;
                while (!is_scope_node(parent, &first_statement))
                {
                    parent = parent->parent;
                }
                
                while (*first_statement)
                {
                    first_statement = &(*first_statement)->next;
                }
                
                new_local_leaf_node(variable, parser->node_locations.base[expression->index].text);
                lang_require_expression(variable->default_expression, parser, {});
                
                variable->name = s("_array_index");
                expression->parent = get_base_node(variable);
                
                variable->parent = parent;
                *first_statement = get_base_node(variable);
                first_statement = &(*first_statement)->next;
                
                {
                    new_local_node(function_call, parser->node_locations.base[expression->index].text);
                
                    new_local_lead_node(name_reference, parser->node_locations.base[expression->index].text);
                    name_reference->name = s("assert");
                    
                    function_call->expression = name_reference;
                    function_call->
                }
                
                new_local_lead_node(name_reference, parser->node_locations.base[expression->index].text);
                name_reference->name = s("_array_index");
                name_reference->reference = variable;
                
                array_index->array_expression = name_reference;
            }
        #else
            lang_require_expression(array_index->index_expression, parser, {});
        #endif
            
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
                
                if (is_node_type(expression, number) && type.base_type.node && !type.base_type.indirection_count && is_node_type(type.base_type.node, number_type))
                {
                    auto compatibility = types_are_compatible(parser, type, get_expression_type(parser, expression));
                    if (compatibility != type_compatibility_false)
                    {
                        // force convertion to number_type
                        maybe_add_cast(parser, &expression, type_compatibility_requires_cast, type);
                        continue;
                    }
                }
            
                new_local_node(unary_operator, parser->node_locations.base[expression->index].text);
                unary_operator->operator_type = ast_unary_operator_type_cast;
                unary_operator->type = type;
                unary_operator->expression = expression;
                
                unary_operator->node.parent = expression->parent;
                expression->parent = get_base_node(unary_operator);
                
                expression = get_base_node(unary_operator);
                continue;
            }
            else if (keyword == s("ref"))
            {
                new_local_node(unary_operator, parser->node_locations.base[expression->index].text);
                unary_operator->operator_type = ast_unary_operator_type_take_reference;
                unary_operator->expression = expression;
                
                unary_operator->node.parent = expression->parent;
                expression->parent = get_base_node(unary_operator);
                
                expression = get_base_node(unary_operator);
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
        ast_binary_operator_type operator_type = ast_binary_operator_type_count;
        string operator_token = {};
        
        auto backup = parser->iterator;
        
        auto keyword = consume_name(parser);
        if (keyword.count)
        {
            string short_names[] = {
                s("or"),
                s("and"),
                s("xor"),
                
                s("is"),
                s("is_not"),
                s("is_less"),
                s("is_less_equal"),
                s("is_greater"),
                s("is_greater_equal"),
                
                s("bit_not"),
                s("bit_or"),
                s("bit_and"),
                s("bit_xor"),
                s("bit_shift_left"),
                s("bit_shift_right"),
                
                s("add"),
                s("sub"),
                s("mul"),
                s("div"),
                s("mod"),
            };
        
            for (u32 i = 0; i < ast_binary_operator_type_count; i++)
            {
                if ((keyword == short_names[i]) || (keyword == ast_binary_operator_names[i]))
                {
                    operator_type  = (ast_binary_operator_type) i;
                    operator_token = ast_binary_operator_names[i];
                    break;
                }
            }
            
            if (operator_type == ast_binary_operator_type_count)
                parser->iterator = backup;
        }
        else
        {
            struct
            {
                string token;
                ast_binary_operator_type operator_type;
            }
            symbol_operators[] = 
            {
                // first match wins, so order is important
                { s("<="), ast_binary_operator_type_is_less_equal },
                { s("<"), ast_binary_operator_type_is_less },
                { s(">="), ast_binary_operator_type_is_greater_equal },
                { s(">"), ast_binary_operator_type_is_greater },
                
                { s("+"), ast_binary_operator_type_add },
                { s("-"), ast_binary_operator_type_subtract },
                { s("*"), ast_binary_operator_type_multiply },
                { s("/"), ast_binary_operator_type_divide },
            };
        
            for (u32 i = 0; i < carray_count(symbol_operators); i++)
            {
                if (try_consume(parser, symbol_operators[i].token))
                {
                    operator_type  = symbol_operators[i].operator_type;
                    operator_token = symbol_operators[i].token;
                    break;
                }
            }
        }
            
        if (operator_type != ast_binary_operator_type_count)
        {
            new_local_node(binary_operator, parser->node_locations.base[left->index].text);
            binary_operator->operator_type = operator_type;
            binary_operator->left = left;
            assert(!left->next);
            
            // we don't have precendence now, we just build from left to right
            // a + b + c => (a + b) + c
            auto right = lang_require_call(parse_base_expression(parser, type));
            lang_require(right, parser->iterator, "expected espression after binary operator '%.*s'", fs(ast_binary_operator_names[binary_operator->operator_type]));
            
            assert(!right->next)
            binary_operator->left->next = right;
            
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
    lang_require_expression(assignment->right, parser, type);
    
    return assignment;
}

void parse_assignment_end(lang_parser *parser, ast_assignment *assignment, ast_node *left)
{
    assignment->left = left;
    // assignment->node.parent = left->parent;
    left->parent     = get_base_node(assignment);
    
    end_node(parser, get_base_node(assignment));
    
    auto assignment_text = &parser->node_locations.base[assignment->node.index].text;
    auto left_text       = parser->node_locations.base[left->index].text;

    assignment_text->count += (assignment_text->base - left_text.base);
    assignment_text->base  = left_text.base;
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
            result.base_type = result.name_type;
            result.name = number_type->name;
        } break;
        
        case ast_node_type_alias_type:
        {
            local_node_type(alias_type, result.name_type.node);
            result.base_type                    = alias_type->type.base_type;
            result.base_type.indirection_count += alias_type->type.name_type.indirection_count;
            result.name = alias_type->name;
        } break;
    }
    
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
    new_local_node(variable);
    
    auto name = consume_name(parser);
    lang_require(name.count, parser->iterator, "expected declaration name");
    
    ast_node *expression = null;
    
    variable->name = name;
    variable->type = lang_require_call_return_value(parse_type(parser, false), {});
    variable->type_is_declared = variable->type.name.count || variable->type.name_type.node;

    append_tail_next(tail_next, &variable->node);
    
    if (try_consume(parser, s("=")))
    {
        lang_require_expression(variable->default_expression, parser, variable->type);
    }
    
    if (!variable->type_is_declared && !variable->default_expression)
        variable->type = get_default_type(parser);
    
    return variable;
}

parse_arguments_declaration
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
    
        auto variable = lang_require_call(parse_declaration(&tail_next, parser));
        
        consumed_semicolon = try_consume(parser, s(";"));
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
                lang_require_expression(branch_switch->expression, parser, {});
                lang_require_consume(";", " after switch expression");

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
                    lang_require(expression, parser->iterator, "expected expression or ';' after return");
                    
                    append_tail_next(&expression_tail_next, expression);
                }
                
                append_tail_next(&tail_next, &function_return->node);
            }
            else if (token == s("def"))
            {
                auto name = consume_name(parser);
                
                bool is_debug_only = false;
                if (name == s("debug"))
                {
                    is_debug_only = true;
                    name = consume_name(parser);
                }
                
                assert(!is_debug_only, "not supported yet");
                
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
                    
                    auto type = parse_function_type(parser);
                    
                    if (try_consume_keyword(parser, s("extern_binding")))
                    {
                        new_local_node(function);
                        function->name = name;
                        function->type = type;
                        statement = get_base_node(function);
                    
                        lang_require(try_consume(parser, s("(")), parser->iterator, "expected '(' after 'extern_binding_lib'");
                        new_local_node(external_binding);
                        
                        bool ok = lang_require_call(parse_quoted_string(&external_binding->library_name, parser));
                        lang_require(ok && external_binding->library_name.count, parser->iterator, "expected library name after 'extern_binding_lib'");
                        
                        if (try_consume(parser, s(",")))
                        {
                            if (try_consume_keyword(parser, s("true")))
                                external_binding->is_dll = true;
                            else 
                            {
                                lang_require(try_consume_keyword(parser, s("false")), parser->iterator, "expected external binding is dynamic arguemnt after ',' ('true' or 'false')");
                            }
                        }
                        
                        lang_require(try_consume(parser, s(")")), parser->iterator, "expected ')' after 'extern_binding_lib' arguments");
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' after 'extern_binding_lib' statement");
                        
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
                        new_local_node(alias_type);
                        alias_type->type = type;
                        alias_type->name = name;
                        statement = get_base_node(alias_type);
                    }
                    
                    if (type.name_type.node)
                        type.name_type.node->parent = statement;
                    
                    append_tail_next(&tail_next, statement);
                }
                else if (try_consume_keyword(parser, s("struct")))
                {
                    new_local_node(alias_type);
                
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after structure declaration");
                    
                    auto compound_type = lang_require_call(parse_arguments(parser, s("}")));
                    
                    alias_type->type.base_type.node = get_base_node(compound_type);
                    alias_type->type.name_type      = alias_type->type.base_type;
                    alias_type->name = name;
                    
                    append_tail_next(&tail_next, &alias_type->node);
                }
                else if (try_consume_keyword(parser, s("enum")))
                {
                    new_local_node(alias_type);
                
                    new_local_node(enumeration_type);
                    
                    enumeration_type->item_type = lang_require_call_return_value(parse_type_or_default(parser), {});
                    
                    lang_require(is_node_type(enumeration_type->item_type.name_type.node, number_type) && !enumeration_type->item_type.name_type.indirection_count, name, "enumeration can only be of number types");
                    
                    auto item_tail_next = make_tail_next(&enumeration_type->first_item);
                    
                    lang_require(try_consume(parser, s("{")), parser->iterator, "expected '{' after enumeration declaration");
                    
                    ast_node *previous_expression = null;
                    u32 expression_value = 0;
                    
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
                            assert(enumeration_item->expression);
                            
                            previous_expression = enumeration_item->expression;
                            expression_value = 1;
                        }
                        else
                        {
                            if (previous_expression)
                            {
                                new_local_node(binary_operator);
                                binary_operator->operator_type = ast_binary_operator_type_add;
                            
                                new_local_node(number);
                                number->value.u64_value = expression_value;
                                number->value.bit_count_power_of_two = 6;
                                
                                binary_operator->left       = previous_expression;
                                binary_operator->left->next = get_base_node(number);
                                
                                enumeration_item->expression = get_base_node(binary_operator);
                            }
                            else
                            {
                                new_local_node(number);
                                number->value.u64_value = expression_value;
                                number->value.bit_count_power_of_two = 6;
                                enumeration_item->expression = get_base_node(number);
                            }
                            
                            expression_value++;
                        }
                        
                        lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of enumeration item");
                        
                        item_count++;
                        append_tail_next(&item_tail_next, &enumeration_item->node);
                    }
                    
                    enumeration_type->item_count = item_count;
                    
                    alias_type->type.base_type.node = get_base_node(enumeration_type);
                    alias_type->type.name_type      = alias_type->type.base_type;
                    alias_type->name = name;
                    append_tail_next(&tail_next, &alias_type->node);
                }
                else if (try_consume_keyword(parser, s("type")))
                {
                    new_local_node(alias_type);
                    alias_type->name = name;
                    alias_type->type = lang_require_call(parse_type(parser, true));
                    lang_require(try_consume(parser, s(";")), parser->iterator, "expected ';' at the end of type alias definition");
                    
                    append_tail_next(&tail_next, &alias_type->node);
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
                    module = new_leaf_node(module, name);
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
                            module_reference = new_leaf_node(module_reference, name);
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
                    
                        module_reference = new_leaf_node(module_reference, name);
                        module_reference->module = module;
                        *dependency_tail_next = module_reference;
                    }
                }
            }
            else
            {
                // revert parse
                parser->iterator = backup;
                
                if (try_consume(parser, s(";")))
                    continue;

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

        case ast_node_type_field_dereference:
        {
            local_node_type(field_dereference, node);
            name = field_dereference->name;
        } break;

        case ast_node_type_alias_type:
        {
            local_node_type(alias_type, node);
            name = alias_type->name;
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

void skip_children(ast_queue *queue, ast_node *node)
{
    while (queue->count && queue->base[queue->count - 1].scope == node)
        resize_buffer(queue, queue->count - 1);
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
        cases_complete_message("unhandled node type '%.*s' %.*s", fnode_name(node), fnode_type_name(node));
    
        case ast_node_type_base_node:
        case ast_node_type_number_type:
        case ast_node_type_number:
        case ast_node_type_string:
        case ast_node_type_name_reference:
        case ast_node_type_external_binding:
        case ast_node_type_get_call_location:
        {
        } break;
        
        case ast_node_type_get_function_reference:
        {
            local_node_type(get_function_reference, node);
            
            if (get_function_reference->type.base_type.node && (get_function_reference->type.base_type.node->parent == node))
                enqueue(queue, node, &get_function_reference->type.base_type.node);
        } break;
        
        case ast_node_type_get_call_argument_text:
        {
            local_node_type(get_call_argument_text, node);
            
            enqueue(queue, node, &get_base_node(get_call_argument_text->argument));
        } break;
        
        case ast_node_type_variable:
        {
            local_node_type(variable, node);
            
            if (variable->default_expression)
                enqueue(queue, node, &variable->default_expression);
            
            // type belongs to variable
            if (variable->type.name_type.node && variable->type.name_type.node->parent == node)
                enqueue(queue, node, &variable->type.name_type.node);
        } break;
        
        case ast_node_type_get_type_info:
        {
            local_node_type(get_type_info, node);
            
            if (get_type_info->type.name_type.node && get_type_info->type.name_type.node->parent == node)
                enqueue(queue, node, &get_type_info->type.name_type.node);
        } break;
        
        case ast_node_type_type_byte_count:
        {
            local_node_type(type_byte_count, node);
            
            if (type_byte_count->type.name_type.node && type_byte_count->type.name_type.node->parent == node)
                enqueue(queue, node, &type_byte_count->type.name_type.node);
        } break;
        
        case ast_node_type_expression_reference_type:
        {
            local_node_type(expression_reference_type, node);
            
            enqueue(queue, node, &expression_reference_type->expression);
        } break;
        
        case ast_node_type_alias_type:
        {
            local_node_type(alias_type, node);
            
            auto name_node = alias_type->type.name_type.node;
            if (name_node)
            {
                switch (name_node->node_type)
                {
                    cases_complete;
                
                    case ast_node_type_alias_type:
                    case ast_node_type_number_type:
                    break;
                
                    case ast_node_type_compound_type:
                    case ast_node_type_function_type:
                    case ast_node_type_enumeration_type:
                    case ast_node_type_array_type:
                    {
                        enqueue(queue, node, &alias_type->type.name_type.node);
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
        
        case ast_node_type_unary_operator:
        {
            local_node_type(unary_operator, node);
            
            enqueue(queue, node, &unary_operator->expression);
        } break;
        
        case ast_node_type_binary_operator:
        {
            local_node_type(binary_operator, node);
            
            assert(binary_operator->left->next && !binary_operator->left->next->next);
            enqueue(queue, node, &binary_operator->left);
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
                
            // compound type could be declared on assignment, and would belong to def or var declaration
            if (compound_literal->type.name_type.node && (compound_literal->type.name_type.node->parent == node))
                enqueue(queue, node, &compound_literal->type.name_type.node);
        } break;
        
        case ast_node_type_compound_literal_field:
        {
            local_node_type(compound_literal_field, node);
            
            if (compound_literal_field->expression)
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
            
            if (array_type->item_count_expression)
                enqueue(queue, node, &array_type->item_count_expression);
            
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
        
        case ast_node_type_dereference:
        {
            local_node_type(dereference, node);
            
            enqueue(queue, node, &dereference->expression);
        } break;
        
        case ast_node_type_field_dereference:
        {
            local_node_type(field_dereference, node);
            
            enqueue(queue, node, &field_dereference->expression);
        } break;
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            
            enqueue(queue, node, &array_index->index_expression);
            enqueue(queue, node, &array_index->array_expression);
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
            
            auto new_node = (ast_node *) new_base_bucket_item((base_bucket_type_array *) &parser->bucket_arrays[node->node_type], ast_node_bucket_byte_counts[node->node_type], ast_bucket_item_count, byte_count);
            
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
            auto parent = entry.scope;
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
                    if (field_offset < ast_node_type_byte_counts[parent->node_type])
                    {
                        auto clone_field = (ast_node **) ((u8 *) cloned_parent + field_offset);
                        *clone_field = cloned_node;
                    }
                    
                    cloned_node->parent = cloned_parent;
                    
                    if (node->next)
                    {
                        u32 slot = try_get_slot(&table, (u8 *) node->next);
                        if (slot != -1 && keys[slot])
                        {
                            auto cloned_next = clones[slot];
                            cloned_node->next = cloned_next;
                        }
                    }
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

#define get_array_item_count_declaration u64 get_array_item_count(ast_array_type *array_type)
get_array_item_count_declaration;

#define get_enumeration_item_value_declaration u64 get_enumeration_item_value(ast_enumeration_item *enumeration_item)
get_enumeration_item_value_declaration;

parsed_number evaluate(ast_node *expression)
{
    switch (expression->node_type)
    {
        cases_complete;
        
        case ast_node_type_field_dereference:
        {
            local_node_type(field_dereference, expression);
            
            if (!field_dereference->reference)
                return {};
            
            switch (field_dereference->reference->node_type)
            {
                cases_complete;
                
                case ast_node_type_array_type:
                {
                    local_node_type(array_type, field_dereference->reference);
                    
                    assert(field_dereference->name == s("count"));
                    
                    {
                        assert(array_type->item_count_expression);
                        parsed_number value = {};
                        value.u64_value = get_array_item_count(array_type);
                        value.bit_count_power_of_two = get_bit_count_power_of_two(value.u64_value);
                        return value;
                    }
                    /*else if (field_dereference->name == s("base"))
                    {
                        auto type = array_type->item_type;
                        type.base_type.indirection_count++;
                        type.name_type.indirection_count++;
                        return type;
                    }*/
                } break;
                
                /*case ast_node_type_enumeration_type:
                {
                    local_node_type(enumeration_type, field_dereference->reference);
                    return enumeration_type->item_type;
                } break;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, field_dereference->reference);
                    return variable->type;
                } break;
                */
                
                case ast_node_type_enumeration_item:
                {
                    local_node_type(enumeration_item, field_dereference->reference);
                    
                    parsed_number value = {};
                    value.u64_value = get_enumeration_item_value(enumeration_item);
                    value.bit_count_power_of_two = get_bit_count_power_of_two(value.u64_value);
                    return value;
                } break;
            }
        } break;
        
        case ast_node_type_binary_operator:
        {
            local_node_type(binary_operator, expression);
            
            auto left  = evaluate(binary_operator->left);
            auto right = evaluate(binary_operator->left->next);
            
            assert(!left.is_signed && !right.is_signed);
            
            switch (binary_operator->operator_type)
            {
                cases_complete;
                
                //case ast_binary_operator_type_or:
                //case ast_binary_operator_type_and:
                //case ast_binary_operator_type_xor:
                
                //case ast_binary_operator_type_is:
                //case ast_binary_operator_type_is_not:
                //case ast_binary_operator_type_is_less:
                //case ast_binary_operator_type_is_less_equal:
                //case ast_binary_operator_type_is_greater:
                //case ast_binary_operator_type_is_greater_equal:
                
                //case ast_binary_operator_type_bit_not:
                //case ast_binary_operator_type_bit_or:
                //case ast_binary_operator_type_bit_and:
                //case ast_binary_operator_type_bit_xor:
                //case ast_binary_operator_type_bit_shift_left:
                //case ast_binary_operator_type_bit_shift_right:
                
                case ast_binary_operator_type_add:
                {
                    left.u64_value += right.u64_value;
                } break;
                
                case ast_binary_operator_type_subtract:
                {
                    left.u64_value -= right.u64_value;
                } break;
                
                case ast_binary_operator_type_multiply:
                {
                    left.u64_value *= right.u64_value;
                } break;
                
                case ast_binary_operator_type_divide:
                {
                    left.u64_value /= right.u64_value;
                } break;
                
                case ast_binary_operator_type_modulo:
                {
                    left.u64_value %= right.u64_value;
                } break;
            }
            
            left.bit_count_power_of_two = get_bit_count_power_of_two(left.u64_value);
            return left;
        } break;
        
        case ast_node_type_number:
        {
            local_node_type(number, expression);
            return number->value;
        } break;
    }

    return {};
}

get_array_item_count_declaration
{
    assert(array_type->item_count_expression);
    
    if (!array_type->item_count)
    {
        auto value = evaluate(array_type->item_count_expression);
        assert(!value.is_float && !value.is_signed);
        array_type->item_count = value.u64_value;
    }
        
    return array_type->item_count;
}

get_enumeration_item_value_declaration
{
    if (!enumeration_item->value)
    {
        auto value = evaluate(enumeration_item->expression);
        assert(!value.is_float && !value.is_signed);
        enumeration_item->value = value.u64_value;
    }
        
    return enumeration_item->value;
}

types_are_compatible_declaration
{
    assert(to.base_type.node && from.base_type.node);
    
    // implicit cast to b8 (default bool)
    if ((to.name_type.node != from.name_type.node) && (to.name_type.node == get_type(parser, lang_base_type_b8).name_type.node))
        return type_compatibility_requires_cast;

    if (to.base_type.indirection_count != from.base_type.indirection_count)
        return type_compatibility_false;
        
    if (to.name_type.node == from.name_type.node)
        return type_compatibility_equal;
        
    // implicit cast to and from u8 pointer
    if ((to.base_type.node != from.base_type.node) && to.base_type.indirection_count && ((to.base_type.node == get_type(parser, lang_base_type_u8).base_type.node) || (from.base_type.node == get_type(parser, lang_base_type_u8).base_type.node)))
        return type_compatibility_requires_cast;

    if (is_node_type(to.base_type.node, enumeration_type))
    {
        local_node_type(enumeration_type, to.base_type.node);
        
        // enum is not strict
        if (enumeration_type->item_type.name.count)
            to = enumeration_type->item_type;
    }
    
    if (is_node_type(from.base_type.node, enumeration_type))
    {
        local_node_type(enumeration_type, from.base_type.node);
        
        // enum is not strict
        if (enumeration_type->item_type.name.count)
            from = enumeration_type->item_type;
    }

    if (is_node_type(to.base_type.node, number_type) && is_node_type(from.base_type.node, number_type))
    {
        auto to_number_type   = get_node_type(number_type, to.base_type.node);
        auto from_number_type = get_node_type(number_type, from.base_type.node);
        
        if (to_number_type->is_float && !from_number_type->is_float)
            return type_compatibility_requires_cast;
        
        if ((from_number_type->is_float && !to_number_type->is_float) ||
            (from_number_type->is_signed && !to_number_type->is_signed) ||
            (from_number_type->bit_count_power_of_two > to_number_type->bit_count_power_of_two))
            return type_compatibility_false;
    }
    else if (is_node_type(to.base_type.node, array_type) && is_node_type(from.base_type.node, array_type))
    {
        auto to_array_type   = get_node_type(array_type, to.base_type.node);
        auto from_array_type = get_node_type(array_type, from.base_type.node);
        
        if (types_are_compatible(parser, to_array_type->item_type, from_array_type->item_type) != type_compatibility_equal)
            return type_compatibility_false;
            
        if (!to_array_type->item_count_expression && from_array_type->item_count_expression)
            return type_compatibility_requires_cast;
            
        if (to_array_type->item_count_expression && !from_array_type->item_count_expression)
            return type_compatibility_false;
        
        if (to_array_type->item_count_expression && from_array_type->item_count_expression && (get_array_item_count(to_array_type) != get_array_item_count(from_array_type)))
            return type_compatibility_false;
    }
    else if (to.base_type.node != from.base_type.node)
    {
        return type_compatibility_false;
    }

    return type_compatibility_equal;
}

maybe_add_cast_declaration
{
    if (compatibility != type_compatibility_requires_cast)
        return false;
    
    // fetch expression, since *expression_pointer may change
    auto expression = *expression_pointer;
    auto parent = expression->parent;
    
    ast_node *new_expression;
    ast_node *new_parent;
    if (is_node_type(expression, number))
    {
        local_node_type(number, expression);
        local_node_type(number_type, type.base_type.node);
        
        if (!number->value.is_float && number_type->is_float)
        {
            f64 value;
            if (number->value.is_signed)
                value = number->value.s64_value;
            else
                value = number->value.u64_value;
            
            number->value.is_float = true;
            number->value.is_signed = true;
            number->value.f64_value = value;
        }
        else if (!number->value.is_signed && number_type->is_signed)
        {
            assert(number->value.is_float == number_type->is_float);
            
            s64 value = number->value.u64_value;
            number->value.is_signed = true;
            number->value.s64_value = value;
        }
        else
        {
            assert(number->value.is_signed == number_type->is_signed);
        }
        
        number->value.bit_count_power_of_two = number_type->bit_count_power_of_two;
        return true;
    }
    else if (is_node_type(type.base_type.node, array_type))
    {
        auto expression_type = get_expression_type(parser, expression);
        local_node_type(array_type, expression_type.base_type.node);
        
        new_local_node(compound_literal, parser->node_locations.base[expression->index].text);
        compound_literal->type        = type;
        compound_literal->node.parent = parent;
        compound_literal->node.next   = expression->next;
        
        new_expression = get_base_node(compound_literal);
        
        {
            new_local_node(compound_literal_field, parser->node_locations.base[expression->index].text);
            compound_literal_field->name = s("count");
            compound_literal_field->expression = clone(parser, array_type->item_count_expression, get_base_node(compound_literal_field));
            compound_literal->first_field = compound_literal_field;
        }
        
        {
            new_local_node(compound_literal_field, parser->node_locations.base[expression->index].text);
            compound_literal_field->name = s("base");
            compound_literal->first_field->node.next = get_base_node(compound_literal_field);
            
            new_local_node(field_dereference, parser->node_locations.base[expression->index].text);
            field_dereference->name       = s("base");
            field_dereference->expression = expression;
            field_dereference->type       = array_type->item_type;
            field_dereference->reference  = get_base_node(array_type);
            
            compound_literal_field->expression = get_base_node(field_dereference);
            
            new_parent = get_base_node(field_dereference);
        }
    }
    else
    {
        new_local_leaf_node(unary_operator, parser->node_locations.base[expression->index].text);
        unary_operator->operator_type = ast_unary_operator_type_cast;
        unary_operator->expression    = expression;
        unary_operator->type          = type;
        unary_operator->node.parent   = parent;
        unary_operator->node.next     = expression->next;
        
        new_expression = get_base_node(unary_operator);
        new_parent     = new_expression;
    }
    
    // NOTE: expression my be changed below
    
    // redirect children to point to cast instead of expression
    {
        local_buffer(queue, ast_queue)
        enqueue_one(&queue, &parent);
        ast_node *ignored;
        
        // only iterate over parents children
        next(&ignored, &queue);
        for (u32 i = 0; i < queue.count; i++)
        {
            auto entry = queue.base[i];
            if (*entry.node_field == expression)
                *entry.node_field = new_expression;
        }
    }
    
    // after iterating
    expression->parent = new_parent;
    expression->next   = null;
    
    *expression_pointer = new_expression;
    return true;
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
        
        // HACK:
        // is same as pointer for now...
        case ast_node_type_function_type:
        {
            return { 8, 8 };
        } break;
        
        case ast_node_type_enumeration_type:
        {
            local_node_type(enumeration_type, base_type);
            return get_type_byte_count(enumeration_type->item_type);
        } break;
        
        case ast_node_type_number_type:
        {
            local_node_type(number_type, base_type);
            u32 byte_count = 1 << (number_type->bit_count_power_of_two - 3);
            return { byte_count, byte_count };
        } break;
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, base_type);
            
            if (array_type->item_count_expression)
            {
                auto count_and_alignment = get_type_byte_count(array_type->item_type);
                
                count_and_alignment.byte_count *= evaluate(array_type->item_count_expression).u64_value;
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
                
                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                {
                    auto count_and_alignment = get_type_byte_count(field->type);
                    auto mask = count_and_alignment.byte_alignment - 1;
                    byte_count = (byte_count + mask) & ~mask;
                    field->field_byte_offset = byte_count;
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

get_expression_type_declaration
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
        
        case ast_node_type_field_dereference:
        {
            local_node_type(field_dereference, node);
            
            if (!field_dereference->reference)
                return {};
            
            // HACKY:
            switch (field_dereference->reference->node_type)
            {
                cases_complete;
                
                case ast_node_type_array_type:
                {
                    local_node_type(array_type, field_dereference->reference);
                    if (field_dereference->name == s("count"))
                    {
                        if (array_type->item_count_expression)
                            return get_expression_type(parser, array_type->item_count_expression);
                        else
                            return get_type(parser, lang_base_type_usize);
                    }
                    else if (field_dereference->name == s("base"))
                    {
                        auto type = array_type->item_type;
                        type.base_type.indirection_count++;
                        type.name_type.indirection_count++;
                        return type;
                    }
                } break;
                
                case ast_node_type_enumeration_type:
                {
                    local_node_type(enumeration_type, field_dereference->reference);
                    return enumeration_type->item_type;
                } break;
                
                case ast_node_type_variable:
                {
                    local_node_type(variable, field_dereference->reference);
                    return variable->type;
                } break;
                
                case ast_node_type_enumeration_item:
                {
                    local_node_type(enumeration_item, field_dereference->reference);
                    
                    local_node_type(alias_type, enumeration_item->enumeration_type->node.parent);
                    
                    complete_type_info type = {};
                    type.base_type.node = alias_type->type.base_type.node;
                    type.name_type.node = get_base_node(alias_type);
                    return type;
                } break;
            }
        } break;
        
        case ast_node_type_unary_operator:
        {
            local_node_type(unary_operator, node);
            
            switch (unary_operator->operator_type)
            {
                case ast_unary_operator_type_cast:
                {
                    return unary_operator->type;
                } break;
                
                case ast_unary_operator_type_take_reference:
                {
                    if (!unary_operator->type.base_type.node)
                    {
                        unary_operator->type = get_expression_type(parser, unary_operator->expression);
                        unary_operator->type.base_type.indirection_count++;
                        unary_operator->type.name_type.indirection_count++;
                    }
                    
                    return unary_operator->type;
                } break;
                
                default:
                {
                    if (!unary_operator->type.base_type.node)
                        unary_operator->type = get_expression_type(parser, unary_operator->expression);
                        
                    return unary_operator->type;
                }
            }
        } break;
        
        case ast_node_type_binary_operator:
        {
            local_node_type(binary_operator, node);
            
            switch (binary_operator->operator_type)
            {
                case ast_binary_operator_type_is:
                case ast_binary_operator_type_is_not:
                case ast_binary_operator_type_is_less:
                case ast_binary_operator_type_is_less_equal:
                case ast_binary_operator_type_is_greater:
                case ast_binary_operator_type_is_greater_equal:
                {
                    return get_type(parser, lang_base_type_b8);
                } break;
                
                default:
                {
                    if (!binary_operator->type.base_type.node)
                    {
                        if (binary_operator->function && binary_operator->function->type.base_type.node)
                        {
                            local_node_type(function_type, binary_operator->function->type.base_type.node);
                            
                            local_node_type(compound_type, function_type->output.base_type.node);
                            
                            assert(!compound_type->first_field->node.next);
                            binary_operator->type = compound_type->first_field->type;
                        }
                        else
                        {
                            auto left_type  = get_expression_type(parser, binary_operator->left);
                            auto right_type = get_expression_type(parser, binary_operator->left->next);
                            
                            if (!left_type.base_type.node || !right_type.base_type.node)
                                return {};
                            
                            switch (binary_operator->operator_type)
                            {
                                // convert to b8
                                case ast_binary_operator_type_and:
                                case ast_binary_operator_type_or:
                                case ast_binary_operator_type_xor:
                                {
                                    auto b8_type = get_type(parser, lang_base_type_b8);
                                    auto left_compatibility = types_are_compatible(parser, b8_type, left_type);
                                    maybe_add_cast(parser, &binary_operator->left, left_compatibility, b8_type);
                                    
                                    auto right_compatibility = types_are_compatible(parser, b8_type, right_type);
                                    maybe_add_cast(parser, &binary_operator->left->next, right_compatibility, b8_type);
                                    
                                     binary_operator->type = b8_type;
                                } break;
                                
                                // pointer math
                                case ast_binary_operator_type_add:
                                case ast_binary_operator_type_subtract:
                                {
                                    if (left_type.base_type.indirection_count && !right_type.base_type.indirection_count && is_node_type(right_type.base_type.node, number_type))
                                    {
                                        binary_operator->type = left_type;
                                        break;
                                    }
                                
                                } // fallthrough
                                
                                default:
                                {
                                    // check normal compatibility
                                    auto left_compatibility  = types_are_compatible(parser, left_type, right_type);
                                    auto right_compatibility = types_are_compatible(parser, right_type, left_type);
                                    
                                    if (right_compatibility > left_compatibility)
                                    {
                                        binary_operator->type = right_type;
                                        maybe_add_cast(parser, &binary_operator->left, right_compatibility, right_type);
                                    }
                                    else if (left_compatibility)
                                    {
                                        binary_operator->type = left_type;
                                        maybe_add_cast(parser, &binary_operator->left->next, left_compatibility, left_type);
                                    }
                                }
                            }
                        }
                    }
                    
                    return binary_operator->type;
                }
            }
        } break;
        
        case ast_node_type_dereference:
        {
            local_node_type(dereference, node);
            
            if (!dereference->type.base_type.node)
            {
                dereference->type = get_expression_type(parser, dereference->expression);
                
                // trying to dereference a value, check semantics later
                if (!dereference->type.base_type.indirection_count)
                    return {};
                
                dereference->type.base_type.indirection_count--;
                
                if (!dereference->type.name_type.indirection_count)
                {
                    dereference->type.name_type = dereference->type.base_type;
                }
                else
                {
                    dereference->type.name_type.indirection_count--;
                }
            }
            
            return dereference->type;
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
        
        case ast_node_type_get_type_info:
        {
            return get_type(parser, lang_base_type_lang_type_info);
        } break;
        
        case ast_node_type_type_byte_count:
        {
            local_node_type(type_byte_count, node);
            
            if (!type_byte_count->type.base_type.node)
                return {};
            
            if (!type_byte_count->byte_count.bit_count_power_of_two)
            {
                type_byte_count->byte_count.u64_value = get_type_byte_count(type_byte_count->type).byte_count;
                type_byte_count->byte_count.bit_count_power_of_two = get_bit_count_power_of_two(type_byte_count->byte_count.u64_value);
            }
            
            return get_type(parser, (lang_base_type) (lang_base_type_u8 + type_byte_count->byte_count.bit_count_power_of_two - 3));
        } break;
        
        case ast_node_type_array_index:
        {
            local_node_type(array_index, node);
            auto type = get_expression_type(parser, array_index->array_expression);
            
            if (!type.name_type.node || type.base_type.indirection_count || !is_node_type(type.base_type.node, array_type))
                return {};
            
            local_node_type(array_type, type.base_type.node);
            
            return array_type->item_type;
        } break;
        
        case ast_node_type_name_reference:
        {
            local_node_type(name_reference, node);
            
            if (!name_reference->reference)
                return {};
            
            switch (name_reference->reference->node_type)
            {
                cases_complete("%.*s", fs(ast_node_type_names[name_reference->reference->node_type]));
                
                // not fully resolved
                case ast_node_type_function_overloads:
                {
                    return {};
                } break;
                
                case ast_node_type_alias_type:
                {
                    local_node_type(alias_type, name_reference->reference);
                    return alias_type->type;
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
            local_node_type(compound_type, function_type->output.base_type.node);
            if (!compound_type->first_field->node.next)
                return compound_type->first_field->type;
            else
                return function_type->output;
        } break;
        
        case ast_node_type_get_call_location:
        {
            return get_type(parser, lang_base_type_code_location);
        } break;
        
        case ast_node_type_get_call_argument_text:
        {
            return get_type(parser, lang_base_type_string);
        } break;
        
        case ast_node_type_get_function_reference:
        {
            local_node_type(get_function_reference, node);
            return get_function_reference->type;
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

ast_node * parse_statements(lang_parser *parser, string source, string source_name)
{
    parser->source_name = source_name;
    parser->source = source;
    parser->iterator = parser->source;
    
    consume_white_or_comment(parser);
    parser->node_location_base = parser->iterator.base;
    advance_node_location(parser);
    
    return lang_require_call(parse_statements(parser));
}

bool parse(lang_parser *parser, string source, string source_name)
{
    for (auto it = parser->file_list.first; it; it = (ast_file *) it->node.next)
    {
        assert(it->path != source_name);
    }
    
    new_local_node(file);
    file->path = source_name;
    file->text = source;
    parser->current_file = file;
    append_list(&parser->file_list, file);
    
    file->first_statement = lang_require_call_return_value(parse_statements(parser, source, source_name), false);
    
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
            auto bucket_array = &parser->bucket_arrays[node_type];
            bucket_array->tail_next = &bucket_array->first;
            bucket_array->item_count = 0;
            
            for (auto it = bucket_array->first; it; it = it->next)
            {
                it->count = 0;
                memset(it->base, 0, ast_node_type_byte_counts[node_type] * ast_bucket_item_count);
            }
        }
        
        parser->node_comments = backup.node_comments;
        resize_buffer(&parser->node_comments, 0);
        
        parser->node_locations = backup.node_locations;
        resize_buffer(&parser->node_locations, 0);
        
        parser->error_messages.memory = backup.error_messages.memory;
        resize_buffer(&parser->error_messages.memory, 0);
        
        parser->temp_builder.memory = backup.temp_builder.memory;
        resize_buffer(&parser->temp_builder.memory, 0);
        
        parser->lang_internal_source = backup.lang_internal_source;
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
            number_type->bit_count_power_of_two = 3 + byte_count_power_of_two;
            
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
        number_type->bit_count_power_of_two = 5 + i;
        
        parser->base_types[base_type] = get_base_node(number_type);
        append_list(&statements, &number_type->node);
    }
    
    assert(parser->lang_internal_source.count);
    
    lang_require_return_value(parse(parser, parser->lang_internal_source, s("lang_internal")), , parser->lang_internal_source, "internal compiler error");
    
    auto file = parser->file_list.first;
    parser->lang_file   = file;
    parser->lang_module = file->module;
    
    // prepend basic types into file
    *statements.tail_next = (base_single_list_entry *) file->first_statement;
    file->first_statement = (ast_node *) statements.first;
    
    auto parent = get_base_node(file);
    for (auto it = file->first_statement; it; it = it->next)
    {
        if (is_node_type(it, alias_type))
        {
            local_node_type(alias_type, it);
            
            for (u32 i = lang_base_number_type_count; i < lang_base_number_type_count + lang_base_alias_type_count; i++)
            {
                if (alias_type->name == lang_base_type_names[i])
                {
                    parser->base_types[i] = get_base_node(alias_type);
                    break;
                }
            }
        }
        else if (is_node_type(it, constant))
        {
            local_node_type(constant, it);
            
            for (u32 i = 0; i < lang_base_constant_count; i++)
            {
                if (constant->name == lang_base_constant_names[i])
                    parser->base_constants[i] = constant;
            }
        }
    
        it->parent = parent;
    }
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

ast_node * get(resolve_table table, string name, ast_node *scope)
{
    return get(table, { name, scope });
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
    if (node && !is_node_type(node, function_overloads))
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
                
                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                {
                    auto node = get(resolver->table, { name, get_base_node(compound_type) });
                    if (node && !is_node_type(node, function_overloads))
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
    ast_node *node;
    string name;
    
    union
    {
        ast_node           **storage;
        complete_type_info *type;
    };
};

buffer_type(resolve_name_buffer, resolve_name_array, resolve_name_entry);

complete_type_info to_type(lang_parser *parser, ast_node *name_type)
{
    assert(name_type->node_type <= ast_node_type_alias_type);
    complete_type_info type = {};
    type.name_type.node = name_type;
    resolve_complete_type(parser, &type);
    
    return type;
}

void print_type(lang_parser *parser, string_builder *builder, complete_type_info type)
{
    if (!type.name_type.node)
    {
        print(builder, "/* not resolved type */ '%.*s'", fs(type.name));
        return;
    }

    switch (type.name_type.node->node_type)
    {
        cases_complete;
        
        case ast_node_type_number_type:
        {
            local_node_type(number_type, type.name_type.node);
            print(builder, "%.*s", fs(number_type->name));
        } break;
        /*
        case ast_node_type_enumeration_type:
        {
        } break;
        
        case ast_node_type_function_type:
        {
            print(builder, "func(");
            
            for (auto argument = );
            
        } break;

        case ast_node_type_compound_type:
        {
        } break;
        */
        
        case ast_node_type_array_type:
        {
            local_node_type(array_type, type.name_type.node);
            print_type(parser, builder, array_type->item_type);
            
            if (array_type->item_count_expression)
                print(builder, "[!]");
            else
                print(builder, "[]");
        } break;

        case ast_node_type_alias_type:
        {
            local_node_type(alias_type, type.name_type.node);
            print(builder, "%.*s", fs(alias_type->name));
        } break;
    }
    
    for (u32 i = 0; i < type.name_type.indirection_count; i++)
        print(builder, " ref");
}

void print_name(lang_parser *parser, string_builder *builder, ast_node *node)
{
    if (node->node_type <= ast_node_type_alias_type)
    {
        print_type(parser, builder, to_type(parser, node));
    }
    else
    {
        auto name = get_name(node);
        print(builder, "%.*s", fs(name));
    }
}

ast_function * _find_matching_function(lang_parser *parser, ast_function_overloads *function_overloads, ast_node *first_call_argument)
{
    ast_function *matching_function = null;
    
    for (auto function_reference = function_overloads->first_function_reference; function_reference; function_reference = (ast_function_reference *) function_reference->node.next)
    {
        auto function = function_reference->function;
        local_node_type(function_type, function->type.base_type.node);
        
        // no arguments
        if (!function_type->input.base_type.node && !first_call_argument)
        {
            matching_function = function;
            break;
        }
        
        auto function_input    = get_node_type(compound_type, function_type->input.base_type.node);
        auto function_argument = function_input->first_field;
        
        bool does_match = true;
        for (auto call_argument = first_call_argument; call_argument; call_argument = call_argument->next)
        {
            // too many arguments
            if (!function_argument)
            {
                does_match = false;
                break;
            }
        
            // overloads are not completely resolved, abbort
            if (!function_argument->type.base_type.node)
            {
                function_reference = null;
                break;
            }
        
            auto call_argument_type = get_expression_type(parser, call_argument);
            if (!call_argument_type.base_type.node)
            {
                does_match = false;
                break;
            }
            
            while (function_argument && !types_are_compatible(parser, function_argument->type, call_argument_type) && function_argument->default_expression)
            {
                function_argument = (ast_variable *) function_argument->node.next;
                
                // overloads are not completely resolved
                if (!function_argument->type.base_type.node)
                {
                    function_reference = null;
                    break;
                }
            }
            
            if (!function_argument || !types_are_compatible(parser, function_argument->type, call_argument_type))
            {
                does_match = false;
                break;
            }
            
            function_argument = (ast_variable *) function_argument->node.next;
        }
        
        while (function_argument && function_argument->default_expression)
            function_argument = (ast_variable *) function_argument->node.next;
        
        // too few arguments
        if (function_argument)
            does_match = false;
        
        if (!function_reference)
            break;
        
        if (does_match)
        {
            matching_function = function;
            break;
        }
    }
    
    return matching_function;
}

ast_function * find_matching_function(lang_resolver *resolver, ast_node *scope, string name, ast_node *first_call_argument)
{
    auto file = get_file_scope(scope);
    
    // check overloads in file by scope
    while (scope)
    {
        auto function_overloads = (ast_function_overloads *) get(resolver->table, name, scope);
    
        if (function_overloads)
        {
            auto matching_function = _find_matching_function(resolver->parser, function_overloads, first_call_argument);
            if (matching_function)
                return matching_function;
        }
        
        scope = scope->parent;
    }
    
    // check overloads in same module
    {
        auto function_overloads = (ast_function_overloads *) get(resolver->table, name, get_base_node(file->module));
    
        if (function_overloads)
        {
            auto matching_function = _find_matching_function(resolver->parser, function_overloads, first_call_argument);
            if (matching_function)
                return matching_function;
        }
    }
    
    // check overloads in other modules
    for (auto module_it = file->first_module_dependency; module_it; module_it = (ast_module_reference *) module_it->node.next)
    {
        auto module = module_it->module;
        
        auto function_overloads = (ast_function_overloads *) get(resolver->table, name, get_base_node(module));
    
        if (function_overloads)
        {
            auto matching_function = _find_matching_function(resolver->parser, function_overloads, first_call_argument);
            if (matching_function)
                return matching_function;
        }
    }
    
    return null;
}

bool compound_types_match(lang_parser *parser, ast_compound_type *left, ast_compound_type *right)
{
    auto right_field = right->first_field;
    for (auto left_field = left->first_field; left_field; left_field = (ast_variable *) left_field->node.next)
    {
        if (!right_field)
            return false;
        
        if (types_are_compatible(parser, left_field->type, right_field->type) != type_compatibility_equal)
            return false;
        
        right_field = (ast_variable *) right_field->node.next;
    }

    if (right_field)
        return false;
    
    return true;
}

ast_function * find_matching_function(lang_parser *parser, ast_function_overloads *function_overloads, ast_function_type *function_type)
{
    ast_function *matching_function = null;
    
    ast_compound_type *input = null;
    if (function_type->input.base_type.node)
    {
        input = get_node_type(compound_type, function_type->input.base_type.node);
    }
    
    ast_compound_type *output = null;
    if (function_type->output.base_type.node)
    {
        output = get_node_type(compound_type, function_type->output.base_type.node);
    }
    
    for (auto function_reference = function_overloads->first_function_reference; function_reference; function_reference = (ast_function_reference *) function_reference->node.next)
    {
        auto function = function_reference->function;
        auto overload_function_type = get_node_type(function_type, function->type.base_type.node);
        
        ast_compound_type *overload_input = null;
        if (overload_function_type->input.base_type.node)
        {
            overload_input = get_node_type(compound_type, overload_function_type->input.base_type.node);
        }
        
        if (!input != !overload_input)
            return false;
        
        ast_compound_type *overload_output = null;
        if (overload_function_type->output.base_type.node)
        {
            overload_output = get_node_type(compound_type, overload_function_type->output.base_type.node);
        }
        
        if (!output != !overload_output)
            return false;
        
        
        if ((!input || compound_types_match(parser, input, overload_input)) && (!output || compound_types_match(parser, output, overload_output)))
            return function;
    }
    
    return null;
}

// same as find_matching_function with arguments, but with function type instead
ast_function * find_matching_function(lang_resolver *resolver, ast_node *scope, string name, ast_function_type *function_type)
{
    auto file = get_file_scope(scope);
    
    // check overloads in file by scope
    while (scope)
    {
        auto function_overloads = (ast_function_overloads *) get(resolver->table, name, scope);
        if (function_overloads)
        {
            auto matching_function = find_matching_function(resolver->parser, function_overloads, function_type);
            if (matching_function)
                return matching_function;
        }
        
        scope = scope->parent;
    }
    
    // check overloads in same module
    {
        auto function_overloads = (ast_function_overloads *) get(resolver->table, name, get_base_node(file->module));
    
        if (function_overloads)
        {
            auto matching_function = find_matching_function(resolver->parser, function_overloads, function_type);
            if (matching_function)
                return matching_function;
        }
    }
    
    // check overloads in other modules
    for (auto module_it = file->first_module_dependency; module_it; module_it = (ast_module_reference *) module_it->node.next)
    {
        auto module = module_it->module;
        
        auto function_overloads = (ast_function_overloads *) get(resolver->table, name, get_base_node(module));
    
        if (function_overloads)
        {
            auto matching_function = find_matching_function(resolver->parser, function_overloads, function_type);
            if (matching_function)
                return matching_function;
        }
    }
    
    return null;
}

bool try_add_default_argument(lang_parser *parser, ast_function_call *function_call, ast_function_type *function_type, ast_node ***argument_tail_next, ast_variable **input_pointer)
{
    auto input_variable = *input_pointer;
    assert(input_variable);
    
    auto argument = **argument_tail_next;
    
    if (input_variable->default_expression)
    {
        auto default_value = input_variable->default_expression;

        // handle pseodo functions for default arguments
        switch (default_value->node_type)
        {
            case ast_node_type_get_call_location:
            {
                local_node_type(get_call_location, default_value);
                
                new_local_node(compound_literal);
                compound_literal->type.name_type.node = parser->base_types[lang_base_type_code_location];
                compound_literal->type.name           = get_name(parser->base_types[lang_base_type_code_location]);
                resolve_complete_type(parser, &compound_literal->type);
                
                compound_literal->node.parent = get_base_node(function_call);
                
                auto tail_next = make_tail_next(&compound_literal->first_field);
                
                auto location_token = parser->node_locations.base[function_call->node.index].text;
                auto location = get_location_line(parser, location_token);
                
                {
                    new_local_node(compound_literal_field);
                    compound_literal_field->name = s("module");
                
                    new_local_node(string);
                    string->text = location.file->module->name;
                    compound_literal_field->expression = get_base_node(string);
                    
                    append_tail_next(&tail_next, get_base_node(compound_literal_field));
                }
                
                {
                    new_local_node(compound_literal_field);
                    compound_literal_field->name = s("file");
                
                    new_local_node(string);
                    string->text = location.file->path;
                    compound_literal_field->expression = get_base_node(string);
                    
                    append_tail_next(&tail_next, get_base_node(compound_literal_field));
                }
                
                {
                    auto function = (ast_function *) function_call->node.parent;
                    while (function && !is_node_type(get_base_node(function), function))
                        function = (ast_function *) function->node.parent;
                
                    new_local_node(compound_literal_field);
                    compound_literal_field->name = s("function");
                
                    auto string_literal = new_leaf_node(string, string{});
                    if (function)
                        string_literal->text = function->name;
                    else
                        string_literal->text = s("main");
                    compound_literal_field->expression = get_base_node(string_literal);
                    
                    append_tail_next(&tail_next, get_base_node(compound_literal_field));
                }
                
                {
                    new_local_node(compound_literal_field);
                    compound_literal_field->name = s("line");
                
                    new_local_node(number);
                    number->value.u64_value = location.line + 1;
                    number->value.bit_count_power_of_two = 6;
                    compound_literal_field->expression = get_base_node(number);
                    
                    append_tail_next(&tail_next, get_base_node(compound_literal_field));
                }
                
                {
                    new_local_node(compound_literal_field);
                    compound_literal_field->name = s("column");
                
                    new_local_node(number);
                    number->value.u64_value = location.column + 1;
                    number->value.bit_count_power_of_two = 6;
                    compound_literal_field->expression = get_base_node(number);
                    
                    append_tail_next(&tail_next, get_base_node(compound_literal_field));
                }
                
                // add new argument with default value
                compound_literal->node.next = argument;
                **argument_tail_next = get_base_node(compound_literal);
                *argument_tail_next = &compound_literal->node.next;
                // argument stays the same

                input_variable = (ast_variable *) input_variable->node.next;
                *input_pointer = (ast_variable *) input_variable;
                
                return true;
            } break;
            
            case ast_node_type_get_call_argument_text:
            {
                local_node_type(get_call_argument_text, default_value);
                
                auto input_argument_variable = get_node_type(variable, get_call_argument_text->argument->reference);
                
                lang_require_return_value(input_argument_variable, false, input_argument_variable->name, "pseudo function get_call_argument_text argument reference could not be resolved");
                
                lang_require_return_value(input_variable != input_argument_variable, false, input_argument_variable->name, "pseudo function get_call_argument_text can not have itself as the argument reference");
                
                lang_require_return_value(input_argument_variable->node.parent == function_type->input.base_type.node, false, input_argument_variable->name, "pseudo function get_call_argument_text argument reference was not resolved to an argument of function input");
                
                auto input_compound_type = get_node_type(compound_type, function_type->input.base_type.node);
                
                // skip to call argument
                auto call_argument = function_call->first_argument;
                for (auto variable = input_compound_type->first_field; variable; variable = (ast_variable *) variable->node.next)
                {
                    if (variable->name == input_argument_variable->name)
                        break;
                    
                    call_argument = call_argument->next;
                }
                
                auto text_node = new_leaf_node(string, parser->node_locations.base[default_value->index].text);
                text_node->text = parser->node_locations.base[call_argument->index].text;
                text_node->node.parent = get_base_node(function_call);

                // add new argument with default value
                text_node->node.next = argument;
                **argument_tail_next = get_base_node(text_node);
                *argument_tail_next = &text_node->node.next;
                // argument stays the same

                input_variable = (ast_variable *) input_variable->node.next;
                *input_pointer = (ast_variable *) input_variable;
                
                return true;
            } break;
            
            default:
            {
                auto input_type = input_variable->type;
                
                // default argument skipped on type match
                if (!argument || !types_are_compatible(parser, input_type, get_expression_type(parser, argument)))
                {
                    auto default_expression = clone(parser, default_value, get_base_node(function_call));
        
                    // add new argument with default value
                    default_expression->next = argument;
                    **argument_tail_next = default_expression;
                    *argument_tail_next = &default_expression->next;
                    // argument stays the same
        
                    input_variable = (ast_variable *) input_variable->node.next;
                    *input_pointer = (ast_variable *) input_variable;
                    
                    return true;
                }
            }
        }
    }
    
    return false;
}

void resolve_names(lang_parser *parser, lang_resolver *resolver, ast_node *root)
{
    local_buffer(unresolved_names, resolve_name_buffer);
    local_buffer(unresolved_types, resolve_name_buffer);
    local_buffer(unresolved_field_dereferences, ast_node_buffer);
    local_buffer(unresolved_variables, ast_node_buffer);
    local_buffer(unresolved_expression_reference_types, ast_node_buffer);
    local_buffer(unresolved_function_calls, ast_node_buffer);
    local_buffer(unresolved_unary_operations, ast_node_buffer);
    local_buffer(unresolved_binary_operations, ast_node_buffer);
    local_buffer(unresolved_get_function_references, ast_node_buffer);

    // collect
    {
        for_bucket_item(bucket, index, parser->name_reference_buckets)
        {
            auto name_reference = &bucket->base[index];
            
            if (!name_reference->reference)
            {
                resize_buffer(&unresolved_names, unresolved_names.count + 1);
                unresolved_names.base[unresolved_names.count - 1] = { get_base_node(name_reference), name_reference->name, &name_reference->reference };
            }
        }
        
        for_bucket_item(bucket, index, parser->function_call_buckets)
        {
            auto function_call = &bucket->base[index];
            
            if (is_node_type(function_call->expression, name_reference))
            {
                resize_buffer(&unresolved_function_calls, unresolved_function_calls.count + 1);
            unresolved_function_calls.base[unresolved_function_calls.count - 1] = get_base_node(function_call);
            }
        }
        
        for_bucket_item(bucket, index, parser->binary_operator_buckets)
        {
            auto binary_operator = &bucket->base[index];
            
            resize_buffer(&unresolved_binary_operations, unresolved_binary_operations.count + 1);
                unresolved_binary_operations.base[unresolved_binary_operations.count - 1] = get_base_node(binary_operator);
        }
        
        for_bucket_item(bucket, index, parser->unary_operator_buckets)
        {
            auto unary_operator = &bucket->base[index];
            
            resize_buffer(&unresolved_unary_operations, unresolved_unary_operations.count + 1);
                unresolved_unary_operations.base[unresolved_unary_operations.count - 1] = get_base_node(unary_operator);
        }
        
        for_bucket_item(bucket, index, parser->field_dereference_buckets)
        {
            auto field_dereference = &bucket->base[index];
            
            if (!field_dereference->type.name_type.node)
            {
                resize_buffer(&unresolved_field_dereferences, unresolved_field_dereferences.count + 1);
                unresolved_field_dereferences.base[unresolved_field_dereferences.count - 1] = get_base_node(field_dereference);
            }
        }
        
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            
            if (!variable->type.base_type.node)
            {
                if (variable->type.name.count)
                {
                    resize_buffer(&unresolved_types, unresolved_types.count + 1);
                    auto entry = &unresolved_types.base[unresolved_types.count - 1];
                    entry->node = get_base_node(variable);
                    entry->type = &variable->type;
                    entry->name = variable->type.name;
                }
                else
                {
                    assert(variable->default_expression);
                    resize_buffer(&unresolved_variables, unresolved_variables.count + 1);
                    unresolved_variables.base[unresolved_variables.count - 1] = get_base_node(variable);
                }
            }
        }
        
        for_bucket_item(bucket, index, parser->array_literal_buckets)
        {
            auto array_literal = &bucket->base[index];
            
            if (!array_literal->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(array_literal);
                entry->type = &array_literal->type;
                entry->name = array_literal->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->compound_literal_buckets)
        {
            auto compound_literal = &bucket->base[index];
            
            if (!compound_literal->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(compound_literal);
                entry->type = &compound_literal->type;
                entry->name = compound_literal->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->alias_type_buckets)
        {
            auto alias_type = &bucket->base[index];
            
            if (!alias_type->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(alias_type);
                entry->type = &alias_type->type;
                entry->name = alias_type->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->get_type_info_buckets)
        {
            auto get_type_info = &bucket->base[index];
            
            if (!get_type_info->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(get_type_info);
                entry->type = &get_type_info->type;
                entry->name = get_type_info->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->type_byte_count_buckets)
        {
            auto type_byte_count = &bucket->base[index];
            
            if (!type_byte_count->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(type_byte_count);
                entry->type = &type_byte_count->type;
                entry->name = type_byte_count->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->expression_reference_type_buckets)
        {
            auto expression_reference_type = &bucket->base[index];
            
            if (!expression_reference_type->type.base_type.node)
            {
                resize_buffer(&unresolved_expression_reference_types, unresolved_expression_reference_types.count + 1);
                unresolved_expression_reference_types.base[unresolved_expression_reference_types.count - 1] = get_base_node(expression_reference_type);
            }
        }
        
        for_bucket_item(bucket, index, parser->function_buckets)
        {
            auto function = &bucket->base[index];
            
            if (!function->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(function);
                entry->type = &function->type;
                entry->name = function->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->array_type_buckets)
        {
            auto array_type = &bucket->base[index];
            
            if (!array_type->item_type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(array_type);
                entry->type = &array_type->item_type;
                entry->name = array_type->item_type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->unary_operator_buckets)
        {
            auto unary_operator = &bucket->base[index];
            
            if (unary_operator->operator_type == ast_unary_operator_type_cast)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(unary_operator);
                entry->type = &unary_operator->type;
                entry->name = unary_operator->type.name;
            }
        }
        
        for_bucket_item(bucket, index, parser->get_function_reference_buckets)
        {
            auto get_function_reference = &bucket->base[index];
            
            if (!get_function_reference->type.base_type.node)
            {
                resize_buffer(&unresolved_types, unresolved_types.count + 1);
                auto entry = &unresolved_types.base[unresolved_types.count - 1];
                entry->node = get_base_node(get_function_reference);
                entry->type = &get_function_reference->type;
                entry->name = get_function_reference->type.name;
            }
            
            resize_buffer(&unresolved_get_function_references, unresolved_get_function_references.count + 1);
            unresolved_get_function_references.base[unresolved_get_function_references.count - 1] = get_base_node(get_function_reference);
        }
    }
    
    // resolve
    {
        bool did_resolve_entry = true;
        while (did_resolve_entry)
        {
            did_resolve_entry = false;
            
            for (u32 i = 0; i < unresolved_names.count; i++)
            {
                auto entry = unresolved_names.base[i];
                auto reference = find_node(resolver, entry.node, entry.name);
                if (reference)
                {
                    *entry.storage = reference;
                    unresolved_names.base[i] = unresolved_names.base[--unresolved_names.count];
                    resize_buffer(&unresolved_names, unresolved_names.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_types.count; i++)
            {
                auto entry = unresolved_types.base[i];
                
                if (!entry.type->name_type.node)
                {
                    auto type_node = find_node(resolver, entry.node, entry.name);
                    if (type_node && type_node->node_type <= ast_node_type_alias_type)
                    {
                        entry.type->name_type.node = type_node;
                        did_resolve_entry |= (entry.type->name_type.node != null);
                    }
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
                    i--; // repeat index
                    did_resolve_entry = true;
                }
            }
            
            for (u32 i = 0; i < unresolved_variables.count; i++)
            {
                auto node = unresolved_variables.base[i];
                local_node_type(variable, node);
                
                auto type = get_expression_type(parser, variable->default_expression);
                if (type.base_type.node)
                {
                    variable->type = type;
                    
                    unresolved_variables.base[i] = unresolved_variables.base[--unresolved_variables.count];
                    resize_buffer(&unresolved_variables, unresolved_variables.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_expression_reference_types.count; i++)
            {
                auto node = unresolved_expression_reference_types.base[i];
                local_node_type(expression_reference_type, node);
                
                auto type = get_expression_type(parser, expression_reference_type->expression);
                if (type.base_type.node)
                {
                    expression_reference_type->type = type;
                    
                    unresolved_expression_reference_types.base[i] = unresolved_expression_reference_types.base[--unresolved_expression_reference_types.count];
                    resize_buffer(&unresolved_expression_reference_types, unresolved_expression_reference_types.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_field_dereferences.count; i++)
            {
                auto node = unresolved_field_dereferences.base[i];
                local_node_type(field_dereference, node);
                
                field_dereference->type = get_expression_type(parser, field_dereference->expression);
                if (field_dereference->type.name_type.node && field_dereference->name.count)
                {
                    resolve_complete_type(parser, &field_dereference->type);
                    
                    auto base_type = field_dereference->type.base_type.node;
                    if (base_type)
                    {
                        switch (base_type->node_type)
                        {
                            cases_complete_message("%.*s", fnode_type_name(base_type));
                            
                            case ast_node_type_number_type:
                            {
                                local_node_type(number_type, base_type);
                                
                                lang_require_return_value(false, , parser->node_locations.base[field_dereference->node.index].text, "number type %.*s has no field '%.*s'", fs(number_type->name), fs(field_dereference->name));
                            } break;
                            
                            case ast_node_type_compound_type:
                            {
                                local_node_type(compound_type, base_type);
                                
                                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                                {
                                    if (field->name == field_dereference->name)
                                    {
                                        field_dereference->reference = get_base_node(field);
                                        break;
                                    }
                                }
                            } break;
                            
                            case ast_node_type_enumeration_type:
                            {
                                local_node_type(enumeration_type, base_type);
                                
                                if (field_dereference->name == s("count"))
                                {
                                    field_dereference->reference = base_type;
                                }
                                else
                                {
                                    for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                                    {
                                        if (item->name == field_dereference->name)
                                        {
                                            field_dereference->reference = get_base_node(item);
                                            break;
                                        }
                                    }
                                }
                            } break;
                            
                            case ast_node_type_array_type:
                            {
                                local_node_type(array_type, base_type);
                                
                                lang_require_return_value(field_dereference->name == s("count") || field_dereference->name == s("base"), ,field_dereference->name, "array has no field '%.*s'", fs(field_dereference->name));
                                
                                field_dereference->reference = base_type;
                            } break;
                        }
                    }
                    
                    //field_dereference->reference = find_node(resolver, type.base_type.node, field_dereference->name);
                    if (field_dereference->reference)
                    {
                        unresolved_field_dereferences.base[i] = unresolved_field_dereferences.base[--unresolved_field_dereferences.count];
                        resize_buffer(&unresolved_field_dereferences, unresolved_field_dereferences.count);
                        did_resolve_entry = true;
                        i--; // repeat index
                    }
                }
            }
            
            for (u32 i = 0; i < unresolved_unary_operations.count; i++)
            {
                auto node = unresolved_unary_operations.base[i];
                local_node_type(unary_operator, node);
                
                assert(!unary_operator->expression->next);
                auto matching_function = find_matching_function(resolver, node->parent, ast_unary_operator_names[unary_operator->operator_type], unary_operator->expression);
                if (matching_function) 
                {
                    unary_operator->function = matching_function;
                
                    unresolved_unary_operations.base[i] = unresolved_unary_operations.base[--unresolved_unary_operations.count];
                    resize_buffer(&unresolved_unary_operations, unresolved_unary_operations.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_binary_operations.count; i++)
            {
                auto node = unresolved_binary_operations.base[i];
                local_node_type(binary_operator, node);
                
                assert(binary_operator->left->next && !binary_operator->left->next->next);
                auto matching_function = find_matching_function(resolver, node->parent, ast_binary_operator_names[binary_operator->operator_type], binary_operator->left);
                if (matching_function) 
                {
                    binary_operator->function = matching_function;
                
                    unresolved_binary_operations.base[i] = unresolved_binary_operations.base[--unresolved_binary_operations.count];
                    resize_buffer(&unresolved_binary_operations, unresolved_binary_operations.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_get_function_references.count; i++)
            {
                auto node = unresolved_get_function_references.base[i];
                local_node_type(get_function_reference, node);
                
                if (!get_function_reference->type.base_type.node)
                    continue;
                
                local_node_type(function_type, get_function_reference->type.base_type.node);
                
                auto matching_function = find_matching_function(resolver, node->parent, get_function_reference->name, function_type);
                if (matching_function) 
                {
                    get_function_reference->function = matching_function;
                
                    unresolved_get_function_references.base[i] = unresolved_get_function_references.base[--unresolved_get_function_references.count];
                    resize_buffer(&unresolved_get_function_references, unresolved_get_function_references.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
            
            for (u32 i = 0; i < unresolved_function_calls.count; i++)
            {
                auto node = unresolved_function_calls.base[i];
                local_node_type(function_call, node);
                
                if (is_node_type(function_call->expression, name_reference))
                {
                    local_node_type(name_reference, function_call->expression);
                    auto matching_function = find_matching_function(resolver, node->parent, name_reference->name, function_call->first_argument);
                    if (matching_function) 
                        name_reference->reference = get_base_node(matching_function);
                }
                
                auto type = get_expression_type(parser, function_call->expression);
                
                if (!type.base_type.node)
                    continue;
                
                lang_require_return_value(is_node_type(type.base_type.node, function_type), , parser->node_locations.base[function_call->node.index].text, "expected function call expression to be of function_type, but type is %.*s", fnode_type_name(type.base_type.node));
                
                local_node_type(function_type, type.base_type.node);
                
                bool is_resolved = true;
                if (function_type->input.base_type.node)
                {
                    auto input_compound_type = get_node_type(compound_type, function_type->input.base_type.node);
                    auto input_argument = input_compound_type->first_field;
                
                    auto call_argument_tail_next = &function_call->first_argument;
                    auto call_argument = *call_argument_tail_next;
                
                    while (call_argument && input_argument)
                    {
                        auto call_type = get_expression_type(parser, call_argument);
                        auto input_type = input_argument->type;
                        
                        if (!call_type.base_type.node)
                        {
                            is_resolved = false;
                            call_argument = null;
                            input_argument = null;
                            break;
                        }
                        
                        //lang_require_return_value(call_type.base_type.node, , parser->node_locations.base[call_argument->index].text, "argument type not resolved in function call for argument '%.*s'", fs(input_argument->name));
                        
                        auto compatibility = types_are_compatible(parser, input_type, call_type);
                        
                        if (!compatibility && try_add_default_argument(parser, function_call, function_type, &call_argument_tail_next, &input_argument))
                            continue;
                        
                        maybe_add_cast(parser, &call_argument, compatibility, input_type);
                        
                        call_argument_tail_next = &call_argument->next;
                        call_argument = *call_argument_tail_next;
                        input_argument = (ast_variable *) input_argument->node.next;
                    }
                    
                    while (input_argument)
                    {
                        lang_require_return_value(input_argument->default_expression, , parser->node_locations.base[function_call->node.index].text, "expected argument '%.*s' in function call", fs(input_argument->name));
                        
                        bool ok = try_add_default_argument(parser, function_call, function_type, &call_argument_tail_next, &input_argument);
                        assert(ok);
                    }
                }
            
                if (is_resolved)
                {
                    unresolved_function_calls.base[i] = unresolved_function_calls.base[--unresolved_function_calls.count];
                    resize_buffer(&unresolved_function_calls, unresolved_function_calls.count);
                    did_resolve_entry = true;
                    i--; // repeat index
                }
            }
        }
    }
 
    // semantic checks
    {
        auto error_messages = &parser->error_messages;
        bool has_warnings = false;
        
        for (u32 i = 0; i < unresolved_variables.count; i++)
        {
            auto node = unresolved_variables.base[i];
            local_node_type(variable, node);
            
            if (!variable->type.name.count)
            {
                has_warnings = true;
                parser_message(parser, parser->node_locations.base[variable->node.index].text, "could not infere variable type");
            }
        }
        
        for (u32 i = 0; i < unresolved_names.count; i++)
        {
            auto node = unresolved_names.base[i].node;
            local_node_type(name_reference, node);
            
            if (!name_reference->reference || is_node_type(name_reference->reference, function_overloads))
            {
                // HACK: ignore some unresolved names
                string black_list[] =
                {
                    s("__debugbreak"),
                    s("printf"),
                    s("sprintf_s"),
                    s("break"),
                    s("continue")
                };
                
                bool found = false;
                for (u32 i = 0; i < carray_count(black_list); i++)
                {
                    if (black_list[i] == name_reference->name)
                    {
                        found = true;
                        break;
                    }
                }
            
                if (!found)
                {
                    has_warnings = true;
                    parser_message(parser, parser->node_locations.base[name_reference->node.index].text, "WARNING: could not resolve name '%.*s'", fs(name_reference->name));
                }
            }
        }
    
        for (u32 i = 0; i < unresolved_function_calls.count; i++)
        {
            auto node = unresolved_function_calls.base[i];
            local_node_type(function_call, node);
            
            local_node_type(name_reference, function_call->expression);
            
            if (!name_reference->reference || !is_node_type(name_reference->reference, function_overloads))
                continue;
            
            bool is_incomplete = false;
            for (auto call_argument = function_call->first_argument; call_argument; call_argument = call_argument->next)
            {
                auto type = get_expression_type(parser, call_argument);
                if (!type.base_type.node)
                {
                    is_incomplete = true;
                    break;
                }
            }
            
            // only error on function with complete types
            if (is_incomplete)
                continue;
            
            local_node_type(function_overloads, name_reference->reference);
                
            parser->error = true;
            parser_message(parser, parser->node_locations.base[function_call->node.index].text, "ERROR: no matching function overload found");
            
            print_newline(error_messages);
            print_line(error_messages, "for function call:");
            error_messages->indent++;
            
            print_line(error_messages, "%.*s", fs(parser->node_locations.base[function_call->node.index].text));
            error_messages->indent--;
            
            print_newline(error_messages);
            print_line(error_messages, "with types:");
            error_messages->indent++;
            print(error_messages, "(");
            
            bool is_first = true;
            for (auto call_argument = function_call->first_argument; call_argument; call_argument = call_argument->next)
            {
                if (!is_first)
                    print(error_messages, ", ");
                    
                print_type(parser, error_messages, get_expression_type(parser, call_argument));
                is_first = false;
            }
            print_line(error_messages, ")");
            print_newline(error_messages);
            error_messages->indent--;
            
            print_newline(error_messages);
            print_line(error_messages, "possible functions are:");
            error_messages->indent++;
            
            for (auto function_reference = function_overloads->first_function_reference; function_reference; function_reference = (ast_function_reference *) function_reference->node.next)
            {
                auto function = function_reference->function;
                local_node_type(function_type, function->type.base_type.node);
                
                auto function_input = get_node_type(compound_type, function_type->input.base_type.node);
                // print whole token
                print_line(error_messages, "%.*s func%.*s", fs(function->name), fs(parser->node_locations.base[function_type->node.index].text));
                
                auto call_argument  = function_call->first_argument;
                auto input_argument = function_input->first_field;
                
                while (input_argument && call_argument)
                {
                    auto input_type = input_argument->type;
                    auto call_type = get_expression_type(parser, call_argument);
                    
                    if (!input_type.base_type.node)
                    {
                        print_line(error_messages, "function input type was not completely resolved");
                        input_argument = null;
                        call_argument = null;
                        break;
                    }
                    else if (!call_type.base_type.node)
                    {
                        print_line(error_messages, "call argument type was not completely resolved");
                        input_argument = null;
                        call_argument = null;
                        break;
                    }
                    else if (!types_are_compatible(parser, input_type, call_type))
                    {
                        print_line(error_messages, "types are incopatible for argument %.*s", fs(input_argument->name));
                        input_argument = null;
                        call_argument = null;
                        break;
                    }
                    
                    input_argument = (ast_variable *) input_argument->node.next;
                    call_argument  = call_argument->next;
                }
                
                if (!input_argument && call_argument)
                    print_line(error_messages, "too many arguments");
                else if (input_argument && !call_argument)
                    print_line(error_messages, "too few arguments");
            }
            error_messages->indent--;
        }
        
        for_bucket_item(bucket, index, parser->assignment_buckets)
        {
            auto assignment = &bucket->base[index];
            
            auto left_type  = get_expression_type(parser, assignment->left);
            auto right_type = get_expression_type(parser, assignment->right);
            
            if (!left_type.base_type.node)
            {
                has_warnings = true;
                parser_message(parser, parser->node_locations.base[assignment->left->index].text, "WARNING: could not resolve left type in assignment");
                continue;
            }
            
            if (!right_type.base_type.node)
            {
                has_warnings = true;
                parser_message(parser, parser->node_locations.base[assignment->right->index].text, "WARNING: could not resolve right type in assignment");
                continue;
            }
                            
            auto compatibility = types_are_compatible(parser, left_type, right_type);
            maybe_add_cast(parser, &assignment->right, compatibility, left_type);
            
            if (compatibility == type_compatibility_false)
            {
                parser_message(parser, parser->node_locations.base[assignment->node.index].text, "Error: incompatible types in assignment");
                parser->error = true;
            }
        }
        
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            
            if (!variable->default_expression)
                continue;
            
            auto left_type  = variable->type;
            auto right_type = get_expression_type(parser, variable->default_expression);
            
            if (!left_type.base_type.node || !right_type.base_type.node)
            {
                has_warnings = true;
                parser_message(parser, parser->node_locations.base[variable->node.index].text, "WARNING: could not resolve types in variable");
                continue;
            }
                            
            auto compatibility = types_are_compatible(parser, left_type, right_type);
            maybe_add_cast(parser, &variable->default_expression, compatibility, left_type);
            
            if (compatibility == type_compatibility_false)
            {
                parser_message(parser, parser->node_locations.base[variable->node.index].text, "Error: incompatible types in variable default assignment");
                parser->error = true;
            }
        }
        
        if (parser->error)
        {
            lang_maybe_break_on_error();
            return;
        }
    }
}

ast_node * add_table_entry_pointer(lang_parser *parser, ast_constant *table, ast_variable *base_type, u32 index, string location_text)
{
    //new_local_node(compound_literal_field, enumeration_location_text);
    //compound_literal_field->name = s("base");

    auto cast = begin_new_node(unary_operator, location_text);
    defer { end_node(parser, get_base_node(cast), false); };

    new_local_node(unary_operator, location_text);
    
    //new_local_node(field_dereference, location_text);
    
    new_local_node(array_index, location_text);
    
    new_local_leaf_node(name_reference, location_text);
    
    name_reference->name      = table->name;
    name_reference->reference = get_base_node(table);
    
    array_index->array_expression = get_base_node(name_reference);
    array_index->index_expression = get_base_node(new_number_u64(parser, location_text, index));
    
#if 0
    field_dereference->name       = base_type->name;
    field_dereference->expression = get_base_node(array_index);
    field_dereference->reference  = get_base_node(base_type);
    field_dereference->type       = base_type->type;
#endif
    
    auto type = get_expression_type(parser, table->expression);
    local_node_type(array_type, type.base_type.node);
    
    unary_operator->operator_type = ast_unary_operator_type_take_reference;
    //unary_operator->expression    = get_base_node(field_dereference);
    //unary_operator->type          = field_dereference->type;
    unary_operator->expression    = get_base_node(array_index);
    unary_operator->type          = array_type->item_type;
    
    unary_operator->type.base_type.indirection_count++;
    unary_operator->type.name_type.indirection_count++;
    
    // we need a cast to cast const away, thanks c++
    cast->operator_type = ast_unary_operator_type_cast;
    //cast->expression    = get_base_node(field_dereference);
    //cast->type          = field_dereference->type;
    cast->expression    = get_base_node(unary_operator);
    cast->type          = unary_operator->type;
    
    return get_base_node(cast);
}

void print_type_info(string_builder *builder, complete_type_info type)
{
    auto base_type = type.base_type.node;
    
    auto byte_count_and_alignment = get_type_byte_count(type);
    // HACK: cast so we can cast const away for C
    print_line(builder, "{ lang_type_table.%.*ss[%llu].base_type ref cast(lang_type_info_type ref); \"%.*s\"; %u; %u; %u }", fnode_type_name(base_type), base_type->type_index, fs(type.name), type.base_type.indirection_count, byte_count_and_alignment.byte_count, byte_count_and_alignment.byte_alignment);
}

void generate_type_info_tables(lang_parser *parser)
{
    auto builder = &parser->temp_builder;
    auto offset = builder->memory.count;
    
    print_line(builder, "def dummy = type(lang_type_info_table) ");

    auto type_table = parser->base_constants[lang_base_constant_lang_type_table];
    auto type = get_expression_type(parser, type_table->expression);
    local_node_type(compound_type, type.base_type.node);
    
    auto field = compound_type->first_field;

    string bool_names[] =
    {
        s("false"),
        s("true"),
    };

    // type table literal
    {
        print_scope_open(builder);
        
        // number_type array
        {
            print(builder, "type(lang_type_info_number[])");
            print_scope_open(builder, true, "[");
            
            u32 entry_count = 0;
            for_bucket_item(bucket, index, parser->number_type_buckets)
            {
                auto number_type = &bucket->base[index];
                
                print_line(builder, "{ lang_type_info_type.number; lang_type_info_number_type.%.*s; %u; %.*s; %.*s };", fs(number_type->name), (1 << (number_type->bit_count_power_of_two - 3)), fs(bool_names[number_type->is_float]), fs(bool_names[number_type->is_signed]));
                
                entry_count++;
            }
            
            print_scope_close(builder, false, "]");
            print_line(builder, ";");
            
            assert(field->name == s("number_types"));
            local_node_type(array_type, field->type.base_type.node);
            array_type->item_count_expression = get_base_node(new_number_u64(parser, parser->node_locations.base[array_type->node.index].text, entry_count));
            array_type->item_count_expression->parent = get_base_node(array_type);
            field = (ast_variable *) field->node.next;
        }
        
        // array_type array
        {
            print(builder, "type(lang_type_info_array[])");
            print_scope_open(builder, true, "[");
            
            u32 entry_count = 0;
            for_bucket_item(bucket, index, parser->array_type_buckets)
            {
                auto array_type = &bucket->base[index];
                entry_count++;
                
                switch (array_type->item_type.base_type.node->node_type)
                {
                    case ast_node_type_number_type:
                    case ast_node_type_array_type:
                    break;
                    
                    default:
                    {
                        print_line(builder, "{};");
                        continue;
                    }
                }
                
                u64 item_count = 0;
                if (array_type->item_count_expression)
                    item_count = get_array_item_count(array_type);
                
                print(builder, "{ lang_type_info_type.array; ");
                print_type_info(builder, array_type->item_type);
                print_line(builder, "; %llu; %llu };", item_count, item_count * get_type_byte_count(array_type->item_type).byte_count);
                //%.*s); %llu; %llu };", fs(), (1 << (number_type->bit_count_power_of_two - 3)), fs(bool_names[number_type->is_float]), fs(bool_names[number_type->is_signed]));
            }
            
            print_scope_close(builder, false, "]");
            print_line(builder, ";");
            
            assert(field->name == s("array_types"));
            local_node_type(array_type, field->type.base_type.node);
            array_type->item_count_expression = get_base_node(new_number_u64(parser, parser->node_locations.base[array_type->node.index].text, entry_count));
            array_type->item_count_expression->parent = get_base_node(array_type);
            field = (ast_variable *) field->node.next;
        }
    
        // compound_type array
        {
            print(builder, "type(lang_type_info_compound[])");
            print_scope_open(builder, true, "[");
            
            u32 field_entry_count = 0;
            u32 entry_count = 0;
            for_bucket_item(bucket, index, parser->compound_type_buckets)
            {
                auto compound_type = &bucket->base[index];
                entry_count++;
                
                auto field_offset = field_entry_count;
                auto field_count = 0;
                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                {
                    field_count++;
                }
                field_entry_count += field_count;
                
                // HACK: add cast to remove const
                print_line(builder, "{ lang_type_info_type.compound; { %llu; lang_type_table.compound_field_types[%llu] ref cast(lang_type_info_compound_field ref) }; %u; %u };", field_count, field_offset, compound_type->byte_count, compound_type->byte_alignment);
            }
            
            print_scope_close(builder, false, "]");
            print_line(builder, ";");
            
            assert(field->name == s("compound_types"));
            local_node_type(array_type, field->type.base_type.node);
            array_type->item_count_expression = get_base_node(new_number_u64(parser, parser->node_locations.base[array_type->node.index].text, entry_count));
            array_type->item_count_expression->parent = get_base_node(array_type);
            field = (ast_variable *) field->node.next;
        }
        
        // compound_type_field array
        {
            print(builder, "type(lang_type_info_compound_field[])");
            print_scope_open(builder, true, "[");
            
            u32 entry_count = 0;
            for_bucket_item(bucket, index, parser->compound_type_buckets)
            {
                auto compound_type = &bucket->base[index];
                
                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                {
                    entry_count++;
                    
                    switch (field->type.base_type.node->node_type)
                    {
                        case ast_node_type_number_type:
                        case ast_node_type_array_type:
                        break;
                        
                        default:
                        {
                            print_line(builder, "{};");
                            continue;
                        }
                    }
                    
                    print(builder, "{ lang_type_info_type.compound_field; ");
                    print_type_info(builder, field->type);
                    print_line(builder, "; \"%.*s\"; %u };", fs(field->name), field->field_byte_offset);
                }
            }
            
            print_scope_close(builder, false, "]");
            print_line(builder, ";");
            
            assert(field->name == s("compound_field_types"));
            local_node_type(array_type, field->type.base_type.node);
            array_type->item_count_expression = get_base_node(new_number_u64(parser, parser->node_locations.base[array_type->node.index].text, entry_count));
            array_type->item_count_expression->parent = get_base_node(array_type);
            field = (ast_variable *) field->node.next;
        }
        
        print_scope_close(builder, false);
        print_line(builder, ";");
    }
    
    auto statement = parse_statements(parser, { builder->memory.array.count - offset, builder->memory.array.base + offset }, s("internal"));
    local_node_type(constant, statement);
    
    type_table->expression = constant->expression;
    assert(!parser->error && type_table->expression && !type_table->expression->next && is_node_type(type_table->expression, compound_literal));
    
    type_table->expression->parent = get_base_node(type_table);
    
    // remove dummy constant
    {
        (*parser->constant_buckets.tail_next)->count--;
        parser->constant_buckets.item_count--;
    }
    
    return;

#if 0
    // number table
    {
        local_node_type(array_literal, parser->base_constants[lang_base_constant_lang_type_info_number_type_table]->expression);
        local_node_type(array_type, array_literal->type.base_type.node);
        
        auto location_text = parser->node_locations.base[array_literal->node.index].text;
        
        auto type_info_type        = get_type(parser, lang_base_type_lang_type_info_type);
        auto type_info_number_type = get_type(parser, lang_base_type_lang_type_info_number_type);
        
        auto type_info_type_enum        = get_node_type(enumeration_type, type_info_type.base_type.node);
        auto type_info_number_type_enum = get_node_type(enumeration_type, type_info_number_type.base_type.node);
        
        ast_enumeration_item *type_info_type_number = null;
        for (auto it = type_info_type_enum->first_item; it; it = (ast_enumeration_item *) it->node.next)
        {
            if (it->name == s("number"))
            {
                type_info_type_number = it;
                break;
            }
        }
        assert(type_info_type_number);
        
        auto array_tail_next = make_tail_next(&array_literal->first_expression);
        
        u32 type_index = 0;
        defer
        {
            array_type->item_count_expression = get_base_node(new_number_u64(parser, location_text, type_index));
            array_type->item_count_expression->parent = get_base_node(array_type);
            array_literal->item_count = type_index;
        };
        
        for_bucket_item(bucket, index, parser->number_type_buckets)
        {
            auto number_type = &bucket->base[index];
        
            auto compound_literal = begin_new_node(compound_literal, location_text);
            defer
            {
                end_node(parser, get_base_node(compound_literal), false);
                compound_literal->node.parent = get_base_node(array_literal);
                type_index++;
            };
            
            compound_literal->type = array_type->item_type;
            
            append_tail_next(&array_tail_next, compound_literal);
            
            auto tail_next = make_tail_next(&compound_literal->first_field);
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("base_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                new_local_node(field_dereference, location_text);
                
                new_local_node(name_reference, location_text);
                name_reference->name      = type_info_type.name;
                name_reference->reference = type_info_type.name_type.node;
                
                field_dereference->name       = type_info_type_number->name;
                field_dereference->expression = get_base_node(name_reference);
                field_dereference->reference  = get_base_node(type_info_type_number);
                field_dereference->type       = type_info_type;
        
                compound_literal_field->expression = get_base_node(field_dereference);
            }
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("number_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                ast_enumeration_item *type_info_number_type_value = null;
                for (auto it = type_info_number_type_enum->first_item; it; it = (ast_enumeration_item *) it->node.next)
                {
                    if (it->name == number_type->name)
                    {
                        type_info_number_type_value = it;
                        break;
                    }
                }
                assert(type_info_number_type_value);
                
                new_local_node(field_dereference, location_text);
                
                new_local_node(name_reference, location_text);
                name_reference->name      = type_info_number_type.name;
                name_reference->reference = type_info_number_type.name_type.node;
                
                field_dereference->name       = type_info_number_type_value->name;
                field_dereference->expression = get_base_node(name_reference);
                field_dereference->reference  = get_base_node(type_info_number_type_value);
                field_dereference->type       = type_info_number_type;
                
                compound_literal_field->expression = get_base_node(field_dereference);
            }
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("byte_count");
                compound_literal_field->expression = get_base_node(new_number_u64(parser, location_text, 1 << (number_type->bit_count_power_of_two - 3)));
                
                append_tail_next(&tail_next, compound_literal_field);
            }
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("is_float");
                compound_literal_field->expression = get_base_node(new_number_u64(parser, location_text, number_type->is_float));
                
                append_tail_next(&tail_next, compound_literal_field);
            }
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("is_signed");
                compound_literal_field->expression = get_base_node(new_number_u64(parser, location_text, number_type->is_signed));
                
                append_tail_next(&tail_next, compound_literal_field);
            }
        }
    }
    
    // array table
    {
        local_node_type(array_literal, parser->base_constants[lang_base_constant_lang_type_info_array_type_table]->expression);
        local_node_type(array_type, array_literal->type.base_type.node);
        auto type = array_type->item_type;
        
        auto location_text = parser->node_locations.base[array_literal->node.index].text;
        
        auto type_info_type       = get_type(parser, lang_base_type_lang_type_info_type);
        auto type_info_type_enum  = get_node_type(enumeration_type, type_info_type.base_type.node);
        
        ast_enumeration_item *type_info_type_number = null;
        for (auto it = type_info_type_enum->first_item; it; it = (ast_enumeration_item *) it->node.next)
        {
            if (it->name == s("array"))
            {
                type_info_type_number = it;
                break;
            }
        }
        assert(type_info_type_number);
        
        auto array_tail_next = make_tail_next(&array_literal->first_expression);
        
        u32 type_index = 0;
        defer
        {
            array_type->item_count_expression = get_base_node(new_number_u64(parser, location_text, type_index));
            array_type->item_count_expression->parent = get_base_node(array_type);
            array_literal->item_count = type_index;
        };
        
        for_bucket_item(bucket, index, parser->array_type_buckets)
        {
            auto array_type = &bucket->base[index];
        
            auto compound_literal = begin_new_node(compound_literal, location_text);
            defer
            {
                end_node(parser, get_base_node(compound_literal), false);
                compound_literal->node.parent = get_base_node(array_literal);
                
                type_index++;
            };
            
            compound_literal->type = type;
            
            append_tail_next(&array_tail_next, compound_literal);
            
            auto tail_next = make_tail_next(&compound_literal->first_field);
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("base_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                new_local_node(field_dereference, location_text);
                
                new_local_node(name_reference, location_text);
                name_reference->name      = type_info_type.name;
                name_reference->reference = type_info_type.name_type.node;
                
                field_dereference->name       = type_info_type_number->name;
                field_dereference->expression = get_base_node(name_reference);
                field_dereference->reference  = get_base_node(type_info_type_number);
                field_dereference->type       = type_info_type;
        
                compound_literal_field->expression = get_base_node(field_dereference);
            }
            
            {
                new_local_node(compound_literal_field, location_text);
                compound_literal_field->name = s("item_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                new_local_node(get_type_info, location_text);
                get_type_info->type = array_type->item_type;
                
                compound_literal_field->expression = get_base_node(get_type_info);
            }
            
            if (array_type->item_count_expression)
            {
                auto item_count = evaluate(array_type->item_count_expression).u64_value;
                
                {
                    new_local_node(compound_literal_field, location_text);
                    compound_literal_field->name = s("item_count");
                    compound_literal_field->expression = get_base_node(new_number_u64(parser, location_text, item_count));
                    
                    append_tail_next(&tail_next, compound_literal_field);
                }
                
                {
                    new_local_node(compound_literal_field, location_text);
                    compound_literal_field->name = s("byte_count");
                    compound_literal_field->expression = get_base_node(new_number_u64(parser, location_text, item_count * get_type_byte_count(array_type->item_type).byte_count));
                    
                    append_tail_next(&tail_next, compound_literal_field);
                }
            }
        }
    }
    
    // compound & compound_field table
    {
        auto compound_table = get_node_type(array_literal, parser->base_constants[lang_base_constant_lang_type_info_compound_type_table]->expression);
        
        auto compound_field_table_constant = parser->base_constants[lang_base_constant_lang_type_info_compound_type_field_table];
        auto compound_field_table = get_node_type(array_literal, compound_field_table_constant->expression);
        
        auto compound_table_type       = get_node_type(array_type, compound_table->type.base_type.node);
        auto compound_field_table_type = get_node_type(array_type, compound_field_table->type.base_type.node);
        
        auto compound_location_text       = parser->node_locations.base[compound_table->node.index].text;
        auto compound_field_location_text = parser->node_locations.base[compound_field_table->node.index].text;
        
        auto type_info_type      = get_type(parser, lang_base_type_lang_type_info_type);
        auto type_info_type_enum = get_node_type(enumeration_type, type_info_type.base_type.node);
        
        ast_enumeration_item *type_info_type_compound       = null;
        ast_enumeration_item *type_info_type_compound_field = null;
        for (auto it = type_info_type_enum->first_item; it; it = (ast_enumeration_item *) it->node.next)
        {
            if (it->name == s("compound"))
            {
                type_info_type_compound = it;
            }
            else if (it->name == s("compound_field"))
            {
                type_info_type_compound_field = it;
            }
        }
        assert(type_info_type_compound);
        assert(type_info_type_compound_field);
        
        complete_type_info type_info_compound_fields_type = {};
        {
            local_node_type(compound_type, compound_table_type->item_type.base_type.node);
            for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
            {
                if (field->name == s("fields"))
                {
                    type_info_compound_fields_type = field->type;
                    break;
                }
            }
        }
        assert(type_info_compound_fields_type.base_type.node);
        
        ast_variable *compound_type_field_base_type = null;
        {
            local_node_type(compound_type, compound_field_table_type->item_type.base_type.node);
            for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
            {
                if (field->name == s("base_type"))
                {
                    compound_type_field_base_type = field;
                    break;
                }
            }
        }
        assert(compound_type_field_base_type);
        
        auto compound_tail_next       = make_tail_next(&compound_table->first_expression);
        auto compound_field_tail_next = make_tail_next(&compound_field_table->first_expression);
        
        u32 compound_index = 0;
        u32 compound_field_index = 0;
        
        defer 
        {
            compound_table_type->item_count_expression = get_base_node(new_number_u64(parser, compound_location_text, compound_index));
            compound_table_type->item_count_expression->parent = get_base_node(compound_table_type);
            compound_table->item_count = compound_index;
            
            compound_field_table_type->item_count_expression = get_base_node(new_number_u64(parser, compound_location_text, compound_field_index));
            compound_field_table_type->item_count_expression->parent = get_base_node(compound_field_table_type);
            compound_field_table->item_count = compound_field_index;
        };
        
        for_bucket_item(bucket, index, parser->compound_type_buckets)
        {
            auto compound_type = &bucket->base[index];
            
            // add fields
            u32 first_field_index = compound_field_index;
            u32 field_count = 0;
            {
                for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
                {
                    auto compound_literal = begin_new_node(compound_literal, compound_field_location_text);
                    defer {            
                        end_node(parser, get_base_node(compound_literal), false);
                        compound_literal->node.parent = get_base_node(compound_field_table);
                        compound_field_index++;
                        field_count++;
                    };
                    
                    compound_literal->type = compound_field_table_type->item_type;
                    
                    append_tail_next(&compound_field_tail_next, compound_literal);
                    
                    auto tail_next = make_tail_next(&compound_literal->first_field);
                    
                    {
                        new_local_node(compound_literal_field, compound_field_location_text);
                        compound_literal_field->name = s("base_type");
                
                        append_tail_next(&tail_next, compound_literal_field);
                
                        new_local_node(field_dereference, compound_field_location_text);
                        
                        new_local_node(name_reference, compound_field_location_text);
                        name_reference->name      = type_info_type.name;
                        name_reference->reference = type_info_type.name_type.node;
                        
                        field_dereference->name       = type_info_type_compound_field->name;
                        field_dereference->expression = get_base_node(name_reference);
                        field_dereference->reference  = get_base_node(type_info_type_compound_field);
                        field_dereference->type       = type_info_type;
                
                        compound_literal_field->expression = get_base_node(field_dereference);
                    }
                    
                    {
                        new_local_node(compound_literal_field, compound_field_location_text);
                        compound_literal_field->name = s("type");
                
                        append_tail_next(&tail_next, compound_literal_field);
                
                        new_local_node(get_type_info, compound_field_location_text);
                        get_type_info->type = field->type;
                        
                        compound_literal_field->expression = get_base_node(get_type_info);
                    }
                    
                    {
                        new_local_node(compound_literal_field, compound_field_location_text);
                        compound_literal_field->name = s("name");
                        
                        append_tail_next(&tail_next, compound_literal_field);
                        
                        auto string_node = new_leaf_node(string, compound_field_location_text);
                        string_node->text = field->name;
                        
                        compound_literal_field->expression = get_base_node(string_node);
                    }
                    
                    {
                        new_local_node(compound_literal_field, compound_field_location_text);
                        compound_literal_field->name = s("byte_offset");
                        compound_literal_field->expression = get_base_node(new_number_u64(parser, compound_location_text, field->field_byte_offset));
                        
                        append_tail_next(&tail_next, compound_literal_field);
                    }
                }
            }
            
            auto compound_literal = begin_new_node(compound_literal, compound_location_text);
            defer {            
                end_node(parser, get_base_node(compound_literal), false);
                compound_literal->node.parent = get_base_node(compound_table);
                compound_index++;
            };
            
            compound_literal->type = compound_table_type->item_type;
            
            append_tail_next(&compound_tail_next, compound_literal);
            
            auto tail_next = make_tail_next(&compound_literal->first_field);
            
            {
                new_local_node(compound_literal_field, compound_location_text);
                compound_literal_field->name = s("base_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                new_local_node(field_dereference, compound_location_text);
                
                new_local_node(name_reference, compound_location_text);
                name_reference->name      = type_info_type.name;
                name_reference->reference = type_info_type.name_type.node;
                
                field_dereference->name       = type_info_type_compound->name;
                field_dereference->expression = get_base_node(name_reference);
                field_dereference->reference  = get_base_node(type_info_type_compound);
                field_dereference->type       = type_info_type;
        
                compound_literal_field->expression = get_base_node(field_dereference);
            }
            
            {
                new_local_node(compound_literal_field, compound_location_text);
                compound_literal_field->name = s("fields");
        
                append_tail_next(&tail_next, compound_literal_field);
                
                {
                    auto fields_compound_literal = begin_new_node(compound_literal, compound_location_text);
                    defer { end_node(parser, get_base_node(fields_compound_literal), false); };
                    
                    fields_compound_literal->type = type_info_compound_fields_type;
                    
                    auto fields_compound_tail_next = make_tail_next(&fields_compound_literal->first_field);
                    
                    compound_literal_field->expression = get_base_node(fields_compound_literal);
                    
                    {
                        new_local_node(compound_literal_field, compound_location_text);
                        compound_literal_field->name = s("count");
                        compound_literal_field->expression = get_base_node(new_number_u64(parser, compound_location_text, field_count));
            
                        append_tail_next(&fields_compound_tail_next, compound_literal_field);
                    }
                    
                    {
                        new_local_node(compound_literal_field, compound_location_text);
                        compound_literal_field->name = s("base");
                        compound_literal_field->expression = add_table_entry_pointer(parser, compound_field_table_constant, compound_type_field_base_type, first_field_index, compound_location_text);
                        
                        append_tail_next(&fields_compound_tail_next, compound_literal_field);
                    }
                }
            }
            
            complete_type_info type = {};
            type.base_type.node = get_base_node(compound_type);
            type.name_type.node = type.base_type.node;
            auto byte_and_alignment = get_type_byte_count(type);
            
            {
                new_local_node(compound_literal_field, compound_location_text);
                compound_literal_field->name = s("byte_count");
                compound_literal_field->expression = get_base_node(new_number_u64(parser, compound_location_text, byte_and_alignment.byte_count));
                
                append_tail_next(&tail_next, compound_literal_field);
            }
            
            {
                new_local_node(compound_literal_field, compound_location_text);
                compound_literal_field->name = s("byte_alignment");
                compound_literal_field->expression = get_base_node(new_number_u64(parser, compound_location_text, byte_and_alignment.byte_alignment));
                
                append_tail_next(&tail_next, compound_literal_field);
            }
        }
    }
    
    // enumeration & enumeration item
    {
        auto enumeration_table = get_node_type(array_literal, parser->base_constants[lang_base_constant_lang_type_info_enumeration_type_table]->expression);
        
        auto enumeration_item_table_constant = parser->base_constants[lang_base_constant_lang_type_info_enumeration_type_item_table];
        auto enumeration_item_table = get_node_type(array_literal, enumeration_item_table_constant->expression);
        
        auto enumeration_table_type      = get_node_type(array_type, enumeration_table->type.base_type.node);
        auto enumeration_item_table_type = get_node_type(array_type, enumeration_item_table->type.base_type.node);
        
        auto enumeration_location_text       = parser->node_locations.base[enumeration_table->node.index].text;
        auto enumeration_item_location_text = parser->node_locations.base[enumeration_item_table->node.index].text;
        
        auto type_info_type      = get_type(parser, lang_base_type_lang_type_info_type);
        auto type_info_type_enum = get_node_type(enumeration_type, type_info_type.base_type.node);
        
        ast_enumeration_item *type_info_type_enumeration       = null;
        ast_enumeration_item *type_info_type_enumeration_item = null;
        for (auto it = type_info_type_enum->first_item; it; it = (ast_enumeration_item *) it->node.next)
        {
            if (it->name == s("enumeration"))
            {
                type_info_type_enumeration = it;
            }
            else if (it->name == s("enumeration_item"))
            {
                type_info_type_enumeration_item = it;
            }
        }
        assert(type_info_type_enumeration);
        assert(type_info_type_enumeration_item);
        
        complete_type_info type_info_enumeration_items_type = {};
        {
            local_node_type(compound_type, enumeration_table_type->item_type.base_type.node);
            for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
            {
                if (field->name == s("items"))
                {
                    type_info_enumeration_items_type = field->type;
                    break;
                }
            }
        }
        assert(type_info_enumeration_items_type.base_type.node);
        
        ast_variable *enumeration_type_item_base_type = null;
        {
            local_node_type(compound_type, enumeration_table_type->item_type.base_type.node);
            for (auto field = compound_type->first_field; field; field = (ast_variable *) field->node.next)
            {
                if (field->name == s("base_type"))
                {
                    enumeration_type_item_base_type = field;
                    break;
                }
            }
        }
        assert(enumeration_type_item_base_type);
        
        auto enumeration_tail_next       = make_tail_next(&enumeration_table->first_expression);
        auto enumeration_item_tail_next = make_tail_next(&enumeration_item_table->first_expression);
        
        u32 enumeration_index = 0;
        u32 enumeration_item_index = 0;
        
        defer 
        {
            enumeration_table_type->item_count_expression = get_base_node(new_number_u64(parser, enumeration_location_text, enumeration_index));
            enumeration_table_type->item_count_expression->parent = get_base_node(enumeration_table_type);
            enumeration_table->item_count = enumeration_index;
            
            enumeration_item_table_type->item_count_expression = get_base_node(new_number_u64(parser, enumeration_location_text, enumeration_item_index));
            enumeration_item_table_type->item_count_expression->parent = get_base_node(enumeration_item_table_type);
            enumeration_item_table->item_count = enumeration_item_index;
        };
        
        for_bucket_item(bucket, index, parser->enumeration_type_buckets)
        {
            auto enumeration_type = &bucket->base[index];
            
            // add fields
            u32 first_item_index = enumeration_item_index;
            u32 item_count = 0;
            {
                for (auto item = enumeration_type->first_item; item; item = (ast_enumeration_item *) item->node.next)
                {
                    auto compound_literal = begin_new_node(compound_literal, enumeration_item_location_text);
                    defer {            
                        end_node(parser, get_base_node(compound_literal), false);
                        compound_literal->node.parent = get_base_node(enumeration_item_table);
                        enumeration_item_index++;
                        item_count++;
                    };
                    
                    compound_literal->type = enumeration_item_table_type->item_type;
                    
                    append_tail_next(&enumeration_item_tail_next, compound_literal);
                    
                    auto tail_next = make_tail_next(&compound_literal->first_field);
                    
                    {
                        new_local_node(compound_literal_field, enumeration_item_location_text);
                        compound_literal_field->name = s("base_type");
                
                        append_tail_next(&tail_next, compound_literal_field);
                
                        new_local_node(field_dereference, enumeration_item_location_text);
                        
                        new_local_node(name_reference, enumeration_item_location_text);
                        name_reference->name      = type_info_type.name;
                        name_reference->reference = type_info_type.name_type.node;
                        
                        field_dereference->name       = type_info_type_enumeration_item->name;
                        field_dereference->expression = get_base_node(name_reference);
                        field_dereference->reference  = get_base_node(type_info_type_enumeration_item);
                        field_dereference->type       = type_info_type;
                
                        compound_literal_field->expression = get_base_node(field_dereference);
                    }
                    
                    {
                        new_local_node(compound_literal_field, enumeration_item_location_text);
                        compound_literal_field->name = s("name");
                        
                        append_tail_next(&tail_next, compound_literal_field);
                        
                        auto string_node = new_leaf_node(string, enumeration_item_location_text);
                        string_node->text = item->name;
                        
                        compound_literal_field->expression = get_base_node(string_node);
                    }
                    
                    {
                        new_local_node(compound_literal_field, enumeration_item_location_text);
                        compound_literal_field->name = s("value");
                        compound_literal_field->expression = get_base_node(new_number_u64(parser, enumeration_item_location_text, evaluate(item->expression).u64_value));
                        
                        append_tail_next(&tail_next, compound_literal_field);
                        
                        auto string_node = new_leaf_node(string, enumeration_item_location_text);
                        string_node->text = item->name;
                    }
                }
            }
            
            auto compound_literal = begin_new_node(compound_literal, enumeration_location_text);
            defer {            
                end_node(parser, get_base_node(compound_literal), false);
                compound_literal->node.parent = get_base_node(enumeration_table);
                enumeration_index++;
            };
            
            compound_literal->type = enumeration_table_type->item_type;
            
            append_tail_next(&enumeration_tail_next, compound_literal);
            
            auto tail_next = make_tail_next(&compound_literal->first_field);
            
            {
                new_local_node(compound_literal_field, enumeration_location_text);
                compound_literal_field->name = s("base_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                new_local_node(field_dereference, enumeration_location_text);
                
                new_local_node(name_reference, enumeration_location_text);
                name_reference->name      = type_info_type.name;
                name_reference->reference = type_info_type.name_type.node;
                
                field_dereference->name       = type_info_type_enumeration->name;
                field_dereference->expression = get_base_node(name_reference);
                field_dereference->reference  = get_base_node(type_info_type_enumeration);
                field_dereference->type       = type_info_type;
        
                compound_literal_field->expression = get_base_node(field_dereference);
            }
            
            {
                new_local_node(compound_literal_field, enumeration_location_text);
                compound_literal_field->name = s("item_type");
        
                append_tail_next(&tail_next, compound_literal_field);
        
                new_local_node(get_type_info, enumeration_location_text);
                get_type_info->type = enumeration_type->item_type;
                
                compound_literal_field->expression = get_base_node(get_type_info);
            }
            
            {
                new_local_node(compound_literal_field, enumeration_location_text);
                compound_literal_field->name = s("items");
        
                append_tail_next(&tail_next, compound_literal_field);
                
                {
                    auto fields_compound_literal = begin_new_node(compound_literal, enumeration_location_text);
                    defer { end_node(parser, get_base_node(fields_compound_literal), false); };
                    
                    fields_compound_literal->type = type_info_enumeration_items_type;
                    
                    auto fields_compound_tail_next = make_tail_next(&fields_compound_literal->first_field);
                    
                    compound_literal_field->expression = get_base_node(fields_compound_literal);
                    
                    {
                        new_local_node(compound_literal_field, enumeration_location_text);
                        compound_literal_field->name = s("count");
                        compound_literal_field->expression = get_base_node(new_number_u64(parser, enumeration_location_text, item_count));
            
                        append_tail_next(&fields_compound_tail_next, compound_literal_field);
                    }
                    
                    {
                        new_local_node(compound_literal_field, enumeration_location_text);
                        compound_literal_field->name = s("base");
                        compound_literal_field->expression = add_table_entry_pointer(parser, enumeration_item_table_constant, enumeration_type_item_base_type, first_item_index, enumeration_location_text);
                        
                        append_tail_next(&fields_compound_tail_next, compound_literal_field);
                    }
                }
            }
        }
    }
#endif
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

#if 0
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
        for_bucket_item(bucket, index, parser->alias_type_buckets)
        {
            auto alias_type = &bucket->base[index];
            auto is_new = insert(&resolver.table, { alias_type->name, alias_type->node.parent }, get_base_node(alias_type));
            assert(is_new);
        }
        
        for_bucket_item(bucket, index, parser->variable_buckets)
        {
            auto variable = &bucket->base[index];
            auto is_new = insert(&resolver.table, { variable->name, variable->node.parent }, get_base_node(variable));
            assert(is_new);
        }
        
        for_bucket_item(bucket, index, parser->constant_buckets)
        {
            auto constant = &bucket->base[index];
            auto is_new = insert(&resolver.table, { constant->name, constant->node.parent }, get_base_node(constant));
            assert(is_new);
        }
        
        for_bucket_item(bucket, index, parser->function_buckets)
        {
            auto function = &bucket->base[index];

            auto parent = get_parent_scope(get_base_node(function));
            assert(parent);
            
            auto function_overloads = (ast_function_overloads *) get(resolver.table, function->name, parent);
            if (!function_overloads)
            {
                function_overloads = new_leaf_node(function_overloads, function->name);
                function_overloads->name        = function->name;
                function_overloads->node.parent = parent;
                
                auto is_new = insert(&resolver.table, { function_overloads->name, parent }, get_base_node(function_overloads));
                assert(is_new);
            }
                
            new_local_leaf_node(function_reference, function->name);
            function_reference->function = function;
            
            function_reference->node.next = get_base_node(function_overloads->first_function_reference);
            function_overloads->first_function_reference = function_reference;
                
        #if 0
            ast_function_overloads *function_overloads = null;
            
            // add full function overloads hirarchy for every scope up until root
            {
                auto previous_parent = &get_base_node(function_overloads);
                auto parent = get_parent_scope(get_base_node(function));
                assert(parent);
                
                while (parent)
                {
                    // skip file scopes
                    if (is_node_type(parent, file))
                    {
                        parent = get_parent_scope(parent);
                        assert(parent);
                    }
                
                    auto function_overloads = (ast_function_overloads *) get(resolver.table, function->name, parent);
                    if (!function_overloads)
                    {
                        function_overloads = new_leaf_node(function_overloads, function->name);
                        function_overloads->name        = function->name;
                        
                        auto is_new = insert(&resolver.table, { function_overloads->name, parent }, get_base_node(function_overloads));
                        assert(is_new);
                        
                        *previous_parent = get_base_node(function_overloads);
                        previous_parent = &function_overloads->node.parent;
                        
                        if (is_node_type(parent, module))
                            function_overloads->node.parent = parent;
                    }
                    else
                    {
                        *previous_parent = get_base_node(function_overloads);
                        previous_parent = &function_overloads->node.parent;
                        break;
                    }
                    
                    parent = get_parent_scope(parent);
                }
            }
            
            /*
            // add file funtion to module overloads
            auto parent = get_parent_scope(get_base_node(function));
            if (is_node_type(parent, file))
            {
                local_node_type(file, parent);
                auto function_overloads = (ast_function_overloads *) get(resolver.table, function->name, get_base_node(file->module));
                
                new_local_leaf_node(function_reference, function->name);
                function_reference->function = function;
                
                function_reference->node.next = get_base_node(function_overloads->first_function_reference);
                function_overloads->first_function_reference = function_reference;
            }
            
            
            // append all module overloads
            auto file = get_file_scope(get_base_node(function));
            for (auto module_it = file->first_module_dependency; module_it; module_it = (ast_module_reference *) module_it->node.next)
            {
                auto module = module_it->module;
                auto module_function_overloads = (ast_function_overloads *) get(resolver.table, function->name, get_base_node(module));
            
                for (auto function_it = module
                new_local_leaf_node(function_reference, function->name);
                function_reference->function = function;
                
                function_reference->node.next = get_base_node(function_overloads->first_function_reference);
                function_overloads->first_function_reference = function_reference;
            }
            
            // TODO: assert function overloads in one scope are unique?
            for (auto it = function_overloads->first_function_reference; it; it = (ast_function_reference *) it->node.next)
            {

            }
            */
            
            new_local_leaf_node(function_reference, function->name);
            function_reference->function = function;
            
            function_reference->node.next = get_base_node(function_overloads->first_function_reference);
            function_overloads->first_function_reference = function_reference;
        #endif
        }
    }
    
    // printf("table used count / count: %llu / %llu\n", resolver.table.used_count, resolver.table.count);
    
    lang_require_call_return_value(resolve_names(parser, &resolver, root), );
    
    generate_type_info_tables(parser);
    resolve_names(parser, &resolver, root);
    assert(!parser->error);
    
    
    // check for semantic errors
    {
        for_bucket_item(bucket, index, parser->array_index_buckets)
        {
            auto array_index = &bucket->base[index];
            
            auto base_type = get_expression_type(parser, array_index->array_expression).base_type.node;
            lang_require_return_value(base_type, , parser->node_locations.base[array_index->array_expression->index].text, "can't index expression of unkown type");
            
            lang_require_return_value(is_node_type(base_type, array_type), , parser->node_locations.base[array_index->array_expression->index].text, "can't index expression of type '%.*s'", fnode_type_name(base_type));
            local_node_type(array_type, base_type);
        }
        
        for_bucket_item(bucket, index, parser->binary_operator_buckets)
        {
            auto binary_operator = &bucket->base[index];
            
            auto type = get_expression_type(parser, get_base_node(binary_operator));
            if (!type.base_type.node)
            {
                auto left_type  = get_expression_type(parser, binary_operator->left);
                auto right_type = get_expression_type(parser, binary_operator->left->next);
                
                // only complete operators
                lang_require_return_value(false, , parser->node_locations.base[binary_operator->node.index].text, " argument types of binary operation '%.*s' are not compatible", fs(ast_binary_operator_names[binary_operator->operator_type]));
            }
        }
    }
}
