module gl;

// types are manually added, since these are a mess to generate from the headers
def GLenum type u32;

def GLsizei    type ssize;
def GLsizeiptr type ssize;
def GLintptr   type s32 ref;

def GLvoid     type u8; // since its only useful as a pointer
def GLboolean  type u8;
def GLchar     type u8;
def GLbitfield type u32;

def GLubyte  type u8;
def GLushort type u16;
def GLuint   type u32;
def GLuint64 type u64;

def GLbyte  type s8;
def GLshort type s16;
def GLint   type s32;
def GLint64 type s64;

def GLfloat  type f32;
def GLdouble type f64;

def GLclampf type f32;
def GLclampd type f64;

def GLhalf  type s16;
def GLfixed type s32;

def GLuint64EXT type u64;
def GLint64EXT  type s64;

def GLhalfNV         type u16;
def GLvdpauSurfaceNV type GLintptr;

def GLhandleARB   type u32;
def GLcharARB     type u8;
def GLsizeiptrARB type ssize;
def GLintptrARB   type s32 ref;

def GLeglImageOES type u8 ref;

def GLeglClientBufferEXT type u8 ref;

// structs that are passed by pointer only
def GLsync      type u8;

def _cl_context type u8;
def _cl_event   type u8;

def HPBUFFERARB          type u8;
def HPBUFFEREXT          type u8;
def HGPUNV               type u8;
def PGPU_DEVICE          type u8;
def HVIDEOOUTPUTDEVICENV type u8;
def HVIDEOINPUTDEVICENV  type u8;
def HPVIDEODEV  type u8;
    

// file: C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/gl/GL.h

def GL_VERSION_1_1 = 1;
def GL_ACCUM = 0x0100;
def GL_LOAD = 0x0101;
def GL_RETURN = 0x0102;
def GL_MULT = 0x0103;
def GL_ADD = 0x0104;
def GL_NEVER = 0x0200;
def GL_LESS = 0x0201;
def GL_EQUAL = 0x0202;
def GL_LEQUAL = 0x0203;
def GL_GREATER = 0x0204;
def GL_NOTEQUAL = 0x0205;
def GL_GEQUAL = 0x0206;
def GL_ALWAYS = 0x0207;
def GL_CURRENT_BIT = 0x00000001;
def GL_POINT_BIT = 0x00000002;
def GL_LINE_BIT = 0x00000004;
def GL_POLYGON_BIT = 0x00000008;
def GL_POLYGON_STIPPLE_BIT = 0x00000010;
def GL_PIXEL_MODE_BIT = 0x00000020;
def GL_LIGHTING_BIT = 0x00000040;
def GL_FOG_BIT = 0x00000080;
def GL_DEPTH_BUFFER_BIT = 0x00000100;
def GL_ACCUM_BUFFER_BIT = 0x00000200;
def GL_STENCIL_BUFFER_BIT = 0x00000400;
def GL_VIEWPORT_BIT = 0x00000800;
def GL_TRANSFORM_BIT = 0x00001000;
def GL_ENABLE_BIT = 0x00002000;
def GL_COLOR_BUFFER_BIT = 0x00004000;
def GL_HINT_BIT = 0x00008000;
def GL_EVAL_BIT = 0x00010000;
def GL_LIST_BIT = 0x00020000;
def GL_TEXTURE_BIT = 0x00040000;
def GL_SCISSOR_BIT = 0x00080000;
def GL_ALL_ATTRIB_BITS = 0x000fffff;
def GL_POINTS = 0x0000;
def GL_LINES = 0x0001;
def GL_LINE_LOOP = 0x0002;
def GL_LINE_STRIP = 0x0003;
def GL_TRIANGLES = 0x0004;
def GL_TRIANGLE_STRIP = 0x0005;
def GL_TRIANGLE_FAN = 0x0006;
def GL_QUADS = 0x0007;
def GL_QUAD_STRIP = 0x0008;
def GL_POLYGON = 0x0009;
def GL_ZERO = 0;
def GL_ONE = 1;
def GL_SRC_COLOR = 0x0300;
def GL_ONE_MINUS_SRC_COLOR = 0x0301;
def GL_SRC_ALPHA = 0x0302;
def GL_ONE_MINUS_SRC_ALPHA = 0x0303;
def GL_DST_ALPHA = 0x0304;
def GL_ONE_MINUS_DST_ALPHA = 0x0305;
def GL_DST_COLOR = 0x0306;
def GL_ONE_MINUS_DST_COLOR = 0x0307;
def GL_SRC_ALPHA_SATURATE = 0x0308;
def GL_TRUE = 1;
def GL_FALSE = 0;
def GL_CLIP_PLANE0 = 0x3000;
def GL_CLIP_PLANE1 = 0x3001;
def GL_CLIP_PLANE2 = 0x3002;
def GL_CLIP_PLANE3 = 0x3003;
def GL_CLIP_PLANE4 = 0x3004;
def GL_CLIP_PLANE5 = 0x3005;
def GL_BYTE = 0x1400;
def GL_UNSIGNED_BYTE = 0x1401;
def GL_SHORT = 0x1402;
def GL_UNSIGNED_SHORT = 0x1403;
def GL_INT = 0x1404;
def GL_UNSIGNED_INT = 0x1405;
def GL_FLOAT = 0x1406;
def GL_2_BYTES = 0x1407;
def GL_3_BYTES = 0x1408;
def GL_4_BYTES = 0x1409;
def GL_DOUBLE = 0x140A;
def GL_NONE = 0;
def GL_FRONT_LEFT = 0x0400;
def GL_FRONT_RIGHT = 0x0401;
def GL_BACK_LEFT = 0x0402;
def GL_BACK_RIGHT = 0x0403;
def GL_FRONT = 0x0404;
def GL_BACK = 0x0405;
def GL_LEFT = 0x0406;
def GL_RIGHT = 0x0407;
def GL_FRONT_AND_BACK = 0x0408;
def GL_AUX0 = 0x0409;
def GL_AUX1 = 0x040A;
def GL_AUX2 = 0x040B;
def GL_AUX3 = 0x040C;
def GL_NO_ERROR = 0;
def GL_INVALID_ENUM = 0x0500;
def GL_INVALID_VALUE = 0x0501;
def GL_INVALID_OPERATION = 0x0502;
def GL_STACK_OVERFLOW = 0x0503;
def GL_STACK_UNDERFLOW = 0x0504;
def GL_OUT_OF_MEMORY = 0x0505;
def GL_2D = 0x0600;
def GL_3D = 0x0601;
def GL_3D_COLOR = 0x0602;
def GL_3D_COLOR_TEXTURE = 0x0603;
def GL_4D_COLOR_TEXTURE = 0x0604;
def GL_PASS_THROUGH_TOKEN = 0x0700;
def GL_POINT_TOKEN = 0x0701;
def GL_LINE_TOKEN = 0x0702;
def GL_POLYGON_TOKEN = 0x0703;
def GL_BITMAP_TOKEN = 0x0704;
def GL_DRAW_PIXEL_TOKEN = 0x0705;
def GL_COPY_PIXEL_TOKEN = 0x0706;
def GL_LINE_RESET_TOKEN = 0x0707;
def GL_EXP = 0x0800;
def GL_EXP2 = 0x0801;
def GL_CW = 0x0900;
def GL_CCW = 0x0901;
def GL_COEFF = 0x0A00;
def GL_ORDER = 0x0A01;
def GL_DOMAIN = 0x0A02;
def GL_CURRENT_COLOR = 0x0B00;
def GL_CURRENT_INDEX = 0x0B01;
def GL_CURRENT_NORMAL = 0x0B02;
def GL_CURRENT_TEXTURE_COORDS = 0x0B03;
def GL_CURRENT_RASTER_COLOR = 0x0B04;
def GL_CURRENT_RASTER_INDEX = 0x0B05;
def GL_CURRENT_RASTER_TEXTURE_COORDS = 0x0B06;
def GL_CURRENT_RASTER_POSITION = 0x0B07;
def GL_CURRENT_RASTER_POSITION_VALID = 0x0B08;
def GL_CURRENT_RASTER_DISTANCE = 0x0B09;
def GL_POINT_SMOOTH = 0x0B10;
def GL_POINT_SIZE = 0x0B11;
def GL_POINT_SIZE_RANGE = 0x0B12;
def GL_POINT_SIZE_GRANULARITY = 0x0B13;
def GL_LINE_SMOOTH = 0x0B20;
def GL_LINE_WIDTH = 0x0B21;
def GL_LINE_WIDTH_RANGE = 0x0B22;
def GL_LINE_WIDTH_GRANULARITY = 0x0B23;
def GL_LINE_STIPPLE = 0x0B24;
def GL_LINE_STIPPLE_PATTERN = 0x0B25;
def GL_LINE_STIPPLE_REPEAT = 0x0B26;
def GL_LIST_MODE = 0x0B30;
def GL_MAX_LIST_NESTING = 0x0B31;
def GL_LIST_BASE = 0x0B32;
def GL_LIST_INDEX = 0x0B33;
def GL_POLYGON_MODE = 0x0B40;
def GL_POLYGON_SMOOTH = 0x0B41;
def GL_POLYGON_STIPPLE = 0x0B42;
def GL_EDGE_FLAG = 0x0B43;
def GL_CULL_FACE = 0x0B44;
def GL_CULL_FACE_MODE = 0x0B45;
def GL_FRONT_FACE = 0x0B46;
def GL_LIGHTING = 0x0B50;
def GL_LIGHT_MODEL_LOCAL_VIEWER = 0x0B51;
def GL_LIGHT_MODEL_TWO_SIDE = 0x0B52;
def GL_LIGHT_MODEL_AMBIENT = 0x0B53;
def GL_SHADE_MODEL = 0x0B54;
def GL_COLOR_MATERIAL_FACE = 0x0B55;
def GL_COLOR_MATERIAL_PARAMETER = 0x0B56;
def GL_COLOR_MATERIAL = 0x0B57;
def GL_FOG = 0x0B60;
def GL_FOG_INDEX = 0x0B61;
def GL_FOG_DENSITY = 0x0B62;
def GL_FOG_START = 0x0B63;
def GL_FOG_END = 0x0B64;
def GL_FOG_MODE = 0x0B65;
def GL_FOG_COLOR = 0x0B66;
def GL_DEPTH_RANGE = 0x0B70;
def GL_DEPTH_TEST = 0x0B71;
def GL_DEPTH_WRITEMASK = 0x0B72;
def GL_DEPTH_CLEAR_VALUE = 0x0B73;
def GL_DEPTH_FUNC = 0x0B74;
def GL_ACCUM_CLEAR_VALUE = 0x0B80;
def GL_STENCIL_TEST = 0x0B90;
def GL_STENCIL_CLEAR_VALUE = 0x0B91;
def GL_STENCIL_FUNC = 0x0B92;
def GL_STENCIL_VALUE_MASK = 0x0B93;
def GL_STENCIL_FAIL = 0x0B94;
def GL_STENCIL_PASS_DEPTH_FAIL = 0x0B95;
def GL_STENCIL_PASS_DEPTH_PASS = 0x0B96;
def GL_STENCIL_REF = 0x0B97;
def GL_STENCIL_WRITEMASK = 0x0B98;
def GL_MATRIX_MODE = 0x0BA0;
def GL_NORMALIZE = 0x0BA1;
def GL_VIEWPORT = 0x0BA2;
def GL_MODELVIEW_STACK_DEPTH = 0x0BA3;
def GL_PROJECTION_STACK_DEPTH = 0x0BA4;
def GL_TEXTURE_STACK_DEPTH = 0x0BA5;
def GL_MODELVIEW_MATRIX = 0x0BA6;
def GL_PROJECTION_MATRIX = 0x0BA7;
def GL_TEXTURE_MATRIX = 0x0BA8;
def GL_ATTRIB_STACK_DEPTH = 0x0BB0;
def GL_CLIENT_ATTRIB_STACK_DEPTH = 0x0BB1;
def GL_ALPHA_TEST = 0x0BC0;
def GL_ALPHA_TEST_FUNC = 0x0BC1;
def GL_ALPHA_TEST_REF = 0x0BC2;
def GL_DITHER = 0x0BD0;
def GL_BLEND_DST = 0x0BE0;
def GL_BLEND_SRC = 0x0BE1;
def GL_BLEND = 0x0BE2;
def GL_LOGIC_OP_MODE = 0x0BF0;
def GL_INDEX_LOGIC_OP = 0x0BF1;
def GL_COLOR_LOGIC_OP = 0x0BF2;
def GL_AUX_BUFFERS = 0x0C00;
def GL_DRAW_BUFFER = 0x0C01;
def GL_READ_BUFFER = 0x0C02;
def GL_SCISSOR_BOX = 0x0C10;
def GL_SCISSOR_TEST = 0x0C11;
def GL_INDEX_CLEAR_VALUE = 0x0C20;
def GL_INDEX_WRITEMASK = 0x0C21;
def GL_COLOR_CLEAR_VALUE = 0x0C22;
def GL_COLOR_WRITEMASK = 0x0C23;
def GL_INDEX_MODE = 0x0C30;
def GL_RGBA_MODE = 0x0C31;
def GL_DOUBLEBUFFER = 0x0C32;
def GL_STEREO = 0x0C33;
def GL_RENDER_MODE = 0x0C40;
def GL_PERSPECTIVE_CORRECTION_HINT = 0x0C50;
def GL_POINT_SMOOTH_HINT = 0x0C51;
def GL_LINE_SMOOTH_HINT = 0x0C52;
def GL_POLYGON_SMOOTH_HINT = 0x0C53;
def GL_FOG_HINT = 0x0C54;
def GL_TEXTURE_GEN_S = 0x0C60;
def GL_TEXTURE_GEN_T = 0x0C61;
def GL_TEXTURE_GEN_R = 0x0C62;
def GL_TEXTURE_GEN_Q = 0x0C63;
def GL_PIXEL_MAP_I_TO_I = 0x0C70;
def GL_PIXEL_MAP_S_TO_S = 0x0C71;
def GL_PIXEL_MAP_I_TO_R = 0x0C72;
def GL_PIXEL_MAP_I_TO_G = 0x0C73;
def GL_PIXEL_MAP_I_TO_B = 0x0C74;
def GL_PIXEL_MAP_I_TO_A = 0x0C75;
def GL_PIXEL_MAP_R_TO_R = 0x0C76;
def GL_PIXEL_MAP_G_TO_G = 0x0C77;
def GL_PIXEL_MAP_B_TO_B = 0x0C78;
def GL_PIXEL_MAP_A_TO_A = 0x0C79;
def GL_PIXEL_MAP_I_TO_I_SIZE = 0x0CB0;
def GL_PIXEL_MAP_S_TO_S_SIZE = 0x0CB1;
def GL_PIXEL_MAP_I_TO_R_SIZE = 0x0CB2;
def GL_PIXEL_MAP_I_TO_G_SIZE = 0x0CB3;
def GL_PIXEL_MAP_I_TO_B_SIZE = 0x0CB4;
def GL_PIXEL_MAP_I_TO_A_SIZE = 0x0CB5;
def GL_PIXEL_MAP_R_TO_R_SIZE = 0x0CB6;
def GL_PIXEL_MAP_G_TO_G_SIZE = 0x0CB7;
def GL_PIXEL_MAP_B_TO_B_SIZE = 0x0CB8;
def GL_PIXEL_MAP_A_TO_A_SIZE = 0x0CB9;
def GL_UNPACK_SWAP_BYTES = 0x0CF0;
def GL_UNPACK_LSB_FIRST = 0x0CF1;
def GL_UNPACK_ROW_LENGTH = 0x0CF2;
def GL_UNPACK_SKIP_ROWS = 0x0CF3;
def GL_UNPACK_SKIP_PIXELS = 0x0CF4;
def GL_UNPACK_ALIGNMENT = 0x0CF5;
def GL_PACK_SWAP_BYTES = 0x0D00;
def GL_PACK_LSB_FIRST = 0x0D01;
def GL_PACK_ROW_LENGTH = 0x0D02;
def GL_PACK_SKIP_ROWS = 0x0D03;
def GL_PACK_SKIP_PIXELS = 0x0D04;
def GL_PACK_ALIGNMENT = 0x0D05;
def GL_MAP_COLOR = 0x0D10;
def GL_MAP_STENCIL = 0x0D11;
def GL_INDEX_SHIFT = 0x0D12;
def GL_INDEX_OFFSET = 0x0D13;
def GL_RED_SCALE = 0x0D14;
def GL_RED_BIAS = 0x0D15;
def GL_ZOOM_X = 0x0D16;
def GL_ZOOM_Y = 0x0D17;
def GL_GREEN_SCALE = 0x0D18;
def GL_GREEN_BIAS = 0x0D19;
def GL_BLUE_SCALE = 0x0D1A;
def GL_BLUE_BIAS = 0x0D1B;
def GL_ALPHA_SCALE = 0x0D1C;
def GL_ALPHA_BIAS = 0x0D1D;
def GL_DEPTH_SCALE = 0x0D1E;
def GL_DEPTH_BIAS = 0x0D1F;
def GL_MAX_EVAL_ORDER = 0x0D30;
def GL_MAX_LIGHTS = 0x0D31;
def GL_MAX_CLIP_PLANES = 0x0D32;
def GL_MAX_TEXTURE_SIZE = 0x0D33;
def GL_MAX_PIXEL_MAP_TABLE = 0x0D34;
def GL_MAX_ATTRIB_STACK_DEPTH = 0x0D35;
def GL_MAX_MODELVIEW_STACK_DEPTH = 0x0D36;
def GL_MAX_NAME_STACK_DEPTH = 0x0D37;
def GL_MAX_PROJECTION_STACK_DEPTH = 0x0D38;
def GL_MAX_TEXTURE_STACK_DEPTH = 0x0D39;
def GL_MAX_VIEWPORT_DIMS = 0x0D3A;
def GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = 0x0D3B;
def GL_SUBPIXEL_BITS = 0x0D50;
def GL_INDEX_BITS = 0x0D51;
def GL_RED_BITS = 0x0D52;
def GL_GREEN_BITS = 0x0D53;
def GL_BLUE_BITS = 0x0D54;
def GL_ALPHA_BITS = 0x0D55;
def GL_DEPTH_BITS = 0x0D56;
def GL_STENCIL_BITS = 0x0D57;
def GL_ACCUM_RED_BITS = 0x0D58;
def GL_ACCUM_GREEN_BITS = 0x0D59;
def GL_ACCUM_BLUE_BITS = 0x0D5A;
def GL_ACCUM_ALPHA_BITS = 0x0D5B;
def GL_NAME_STACK_DEPTH = 0x0D70;
def GL_AUTO_NORMAL = 0x0D80;
def GL_MAP1_COLOR_4 = 0x0D90;
def GL_MAP1_INDEX = 0x0D91;
def GL_MAP1_NORMAL = 0x0D92;
def GL_MAP1_TEXTURE_COORD_1 = 0x0D93;
def GL_MAP1_TEXTURE_COORD_2 = 0x0D94;
def GL_MAP1_TEXTURE_COORD_3 = 0x0D95;
def GL_MAP1_TEXTURE_COORD_4 = 0x0D96;
def GL_MAP1_VERTEX_3 = 0x0D97;
def GL_MAP1_VERTEX_4 = 0x0D98;
def GL_MAP2_COLOR_4 = 0x0DB0;
def GL_MAP2_INDEX = 0x0DB1;
def GL_MAP2_NORMAL = 0x0DB2;
def GL_MAP2_TEXTURE_COORD_1 = 0x0DB3;
def GL_MAP2_TEXTURE_COORD_2 = 0x0DB4;
def GL_MAP2_TEXTURE_COORD_3 = 0x0DB5;
def GL_MAP2_TEXTURE_COORD_4 = 0x0DB6;
def GL_MAP2_VERTEX_3 = 0x0DB7;
def GL_MAP2_VERTEX_4 = 0x0DB8;
def GL_MAP1_GRID_DOMAIN = 0x0DD0;
def GL_MAP1_GRID_SEGMENTS = 0x0DD1;
def GL_MAP2_GRID_DOMAIN = 0x0DD2;
def GL_MAP2_GRID_SEGMENTS = 0x0DD3;
def GL_TEXTURE_1D = 0x0DE0;
def GL_TEXTURE_2D = 0x0DE1;
def GL_FEEDBACK_BUFFER_POINTER = 0x0DF0;
def GL_FEEDBACK_BUFFER_SIZE = 0x0DF1;
def GL_FEEDBACK_BUFFER_TYPE = 0x0DF2;
def GL_SELECTION_BUFFER_POINTER = 0x0DF3;
def GL_SELECTION_BUFFER_SIZE = 0x0DF4;
def GL_TEXTURE_WIDTH = 0x1000;
def GL_TEXTURE_HEIGHT = 0x1001;
def GL_TEXTURE_INTERNAL_FORMAT = 0x1003;
def GL_TEXTURE_BORDER_COLOR = 0x1004;
def GL_TEXTURE_BORDER = 0x1005;
def GL_DONT_CARE = 0x1100;
def GL_FASTEST = 0x1101;
def GL_NICEST = 0x1102;
def GL_LIGHT0 = 0x4000;
def GL_LIGHT1 = 0x4001;
def GL_LIGHT2 = 0x4002;
def GL_LIGHT3 = 0x4003;
def GL_LIGHT4 = 0x4004;
def GL_LIGHT5 = 0x4005;
def GL_LIGHT6 = 0x4006;
def GL_LIGHT7 = 0x4007;
def GL_AMBIENT = 0x1200;
def GL_DIFFUSE = 0x1201;
def GL_SPECULAR = 0x1202;
def GL_POSITION = 0x1203;
def GL_SPOT_DIRECTION = 0x1204;
def GL_SPOT_EXPONENT = 0x1205;
def GL_SPOT_CUTOFF = 0x1206;
def GL_CONSTANT_ATTENUATION = 0x1207;
def GL_LINEAR_ATTENUATION = 0x1208;
def GL_QUADRATIC_ATTENUATION = 0x1209;
def GL_COMPILE = 0x1300;
def GL_COMPILE_AND_EXECUTE = 0x1301;
def GL_CLEAR = 0x1500;
def GL_AND = 0x1501;
def GL_AND_REVERSE = 0x1502;
def GL_COPY = 0x1503;
def GL_AND_INVERTED = 0x1504;
def GL_NOOP = 0x1505;
def GL_XOR = 0x1506;
def GL_OR = 0x1507;
def GL_NOR = 0x1508;
def GL_EQUIV = 0x1509;
def GL_INVERT = 0x150A;
def GL_OR_REVERSE = 0x150B;
def GL_COPY_INVERTED = 0x150C;
def GL_OR_INVERTED = 0x150D;
def GL_NAND = 0x150E;
def GL_SET = 0x150F;
def GL_EMISSION = 0x1600;
def GL_SHININESS = 0x1601;
def GL_AMBIENT_AND_DIFFUSE = 0x1602;
def GL_COLOR_INDEXES = 0x1603;
def GL_MODELVIEW = 0x1700;
def GL_PROJECTION = 0x1701;
def GL_TEXTURE = 0x1702;
def GL_COLOR = 0x1800;
def GL_DEPTH = 0x1801;
def GL_STENCIL = 0x1802;
def GL_COLOR_INDEX = 0x1900;
def GL_STENCIL_INDEX = 0x1901;
def GL_DEPTH_COMPONENT = 0x1902;
def GL_RED = 0x1903;
def GL_GREEN = 0x1904;
def GL_BLUE = 0x1905;
def GL_ALPHA = 0x1906;
def GL_RGB = 0x1907;
def GL_RGBA = 0x1908;
def GL_LUMINANCE = 0x1909;
def GL_LUMINANCE_ALPHA = 0x190A;
def GL_BITMAP = 0x1A00;
def GL_POINT = 0x1B00;
def GL_LINE = 0x1B01;
def GL_FILL = 0x1B02;
def GL_RENDER = 0x1C00;
def GL_FEEDBACK = 0x1C01;
def GL_SELECT = 0x1C02;
def GL_FLAT = 0x1D00;
def GL_SMOOTH = 0x1D01;
def GL_KEEP = 0x1E00;
def GL_REPLACE = 0x1E01;
def GL_INCR = 0x1E02;
def GL_DECR = 0x1E03;
def GL_VENDOR = 0x1F00;
def GL_RENDERER = 0x1F01;
def GL_VERSION = 0x1F02;
def GL_EXTENSIONS = 0x1F03;
def GL_S = 0x2000;
def GL_T = 0x2001;
def GL_R = 0x2002;
def GL_Q = 0x2003;
def GL_MODULATE = 0x2100;
def GL_DECAL = 0x2101;
def GL_TEXTURE_ENV_MODE = 0x2200;
def GL_TEXTURE_ENV_COLOR = 0x2201;
def GL_TEXTURE_ENV = 0x2300;
def GL_EYE_LINEAR = 0x2400;
def GL_OBJECT_LINEAR = 0x2401;
def GL_SPHERE_MAP = 0x2402;
def GL_TEXTURE_GEN_MODE = 0x2500;
def GL_OBJECT_PLANE = 0x2501;
def GL_EYE_PLANE = 0x2502;
def GL_NEAREST = 0x2600;
def GL_LINEAR = 0x2601;
def GL_NEAREST_MIPMAP_NEAREST = 0x2700;
def GL_LINEAR_MIPMAP_NEAREST = 0x2701;
def GL_NEAREST_MIPMAP_LINEAR = 0x2702;
def GL_LINEAR_MIPMAP_LINEAR = 0x2703;
def GL_TEXTURE_MAG_FILTER = 0x2800;
def GL_TEXTURE_MIN_FILTER = 0x2801;
def GL_TEXTURE_WRAP_S = 0x2802;
def GL_TEXTURE_WRAP_T = 0x2803;
def GL_CLAMP = 0x2900;
def GL_REPEAT = 0x2901;
def GL_CLIENT_PIXEL_STORE_BIT = 0x00000001;
def GL_CLIENT_VERTEX_ARRAY_BIT = 0x00000002;
def GL_CLIENT_ALL_ATTRIB_BITS = 0xffffffff;
def GL_POLYGON_OFFSET_FACTOR = 0x8038;
def GL_POLYGON_OFFSET_UNITS = 0x2A00;
def GL_POLYGON_OFFSET_POINT = 0x2A01;
def GL_POLYGON_OFFSET_LINE = 0x2A02;
def GL_POLYGON_OFFSET_FILL = 0x8037;
def GL_ALPHA4 = 0x803B;
def GL_ALPHA8 = 0x803C;
def GL_ALPHA12 = 0x803D;
def GL_ALPHA16 = 0x803E;
def GL_LUMINANCE4 = 0x803F;
def GL_LUMINANCE8 = 0x8040;
def GL_LUMINANCE12 = 0x8041;
def GL_LUMINANCE16 = 0x8042;
def GL_LUMINANCE4_ALPHA4 = 0x8043;
def GL_LUMINANCE6_ALPHA2 = 0x8044;
def GL_LUMINANCE8_ALPHA8 = 0x8045;
def GL_LUMINANCE12_ALPHA4 = 0x8046;
def GL_LUMINANCE12_ALPHA12 = 0x8047;
def GL_LUMINANCE16_ALPHA16 = 0x8048;
def GL_INTENSITY = 0x8049;
def GL_INTENSITY4 = 0x804A;
def GL_INTENSITY8 = 0x804B;
def GL_INTENSITY12 = 0x804C;
def GL_INTENSITY16 = 0x804D;
def GL_R3_G3_B2 = 0x2A10;
def GL_RGB4 = 0x804F;
def GL_RGB5 = 0x8050;
def GL_RGB8 = 0x8051;
def GL_RGB10 = 0x8052;
def GL_RGB12 = 0x8053;
def GL_RGB16 = 0x8054;
def GL_RGBA2 = 0x8055;
def GL_RGBA4 = 0x8056;
def GL_RGB5_A1 = 0x8057;
def GL_RGBA8 = 0x8058;
def GL_RGB10_A2 = 0x8059;
def GL_RGBA12 = 0x805A;
def GL_RGBA16 = 0x805B;
def GL_TEXTURE_RED_SIZE = 0x805C;
def GL_TEXTURE_GREEN_SIZE = 0x805D;
def GL_TEXTURE_BLUE_SIZE = 0x805E;
def GL_TEXTURE_ALPHA_SIZE = 0x805F;
def GL_TEXTURE_LUMINANCE_SIZE = 0x8060;
def GL_TEXTURE_INTENSITY_SIZE = 0x8061;
def GL_PROXY_TEXTURE_1D = 0x8063;
def GL_PROXY_TEXTURE_2D = 0x8064;
def GL_TEXTURE_PRIORITY = 0x8066;
def GL_TEXTURE_RESIDENT = 0x8067;
def GL_TEXTURE_BINDING_1D = 0x8068;
def GL_TEXTURE_BINDING_2D = 0x8069;
def GL_VERTEX_ARRAY = 0x8074;
def GL_NORMAL_ARRAY = 0x8075;
def GL_COLOR_ARRAY = 0x8076;
def GL_INDEX_ARRAY = 0x8077;
def GL_TEXTURE_COORD_ARRAY = 0x8078;
def GL_EDGE_FLAG_ARRAY = 0x8079;
def GL_VERTEX_ARRAY_SIZE = 0x807A;
def GL_VERTEX_ARRAY_TYPE = 0x807B;
def GL_VERTEX_ARRAY_STRIDE = 0x807C;
def GL_NORMAL_ARRAY_TYPE = 0x807E;
def GL_NORMAL_ARRAY_STRIDE = 0x807F;
def GL_COLOR_ARRAY_SIZE = 0x8081;
def GL_COLOR_ARRAY_TYPE = 0x8082;
def GL_COLOR_ARRAY_STRIDE = 0x8083;
def GL_INDEX_ARRAY_TYPE = 0x8085;
def GL_INDEX_ARRAY_STRIDE = 0x8086;
def GL_TEXTURE_COORD_ARRAY_SIZE = 0x8088;
def GL_TEXTURE_COORD_ARRAY_TYPE = 0x8089;
def GL_TEXTURE_COORD_ARRAY_STRIDE = 0x808A;
def GL_EDGE_FLAG_ARRAY_STRIDE = 0x808C;
def GL_VERTEX_ARRAY_POINTER = 0x808E;
def GL_NORMAL_ARRAY_POINTER = 0x808F;
def GL_COLOR_ARRAY_POINTER = 0x8090;
def GL_INDEX_ARRAY_POINTER = 0x8091;
def GL_TEXTURE_COORD_ARRAY_POINTER = 0x8092;
def GL_EDGE_FLAG_ARRAY_POINTER = 0x8093;
def GL_V2F = 0x2A20;
def GL_V3F = 0x2A21;
def GL_C4UB_V2F = 0x2A22;
def GL_C4UB_V3F = 0x2A23;
def GL_C3F_V3F = 0x2A24;
def GL_N3F_V3F = 0x2A25;
def GL_C4F_N3F_V3F = 0x2A26;
def GL_T2F_V3F = 0x2A27;
def GL_T4F_V4F = 0x2A28;
def GL_T2F_C4UB_V3F = 0x2A29;
def GL_T2F_C3F_V3F = 0x2A2A;
def GL_T2F_N3F_V3F = 0x2A2B;
def GL_T2F_C4F_N3F_V3F = 0x2A2C;
def GL_T4F_C4F_N3F_V4F = 0x2A2D;
def GL_EXT_vertex_array = 1;
def GL_EXT_bgra = 1;
def GL_EXT_paletted_texture = 1;
def GL_WIN_swap_hint = 1;
def GL_WIN_draw_range_elements = 1;
def GL_VERTEX_ARRAY_EXT = 0x8074;
def GL_NORMAL_ARRAY_EXT = 0x8075;
def GL_COLOR_ARRAY_EXT = 0x8076;
def GL_INDEX_ARRAY_EXT = 0x8077;
def GL_TEXTURE_COORD_ARRAY_EXT = 0x8078;
def GL_EDGE_FLAG_ARRAY_EXT = 0x8079;
def GL_VERTEX_ARRAY_SIZE_EXT = 0x807A;
def GL_VERTEX_ARRAY_TYPE_EXT = 0x807B;
def GL_VERTEX_ARRAY_STRIDE_EXT = 0x807C;
def GL_VERTEX_ARRAY_COUNT_EXT = 0x807D;
def GL_NORMAL_ARRAY_TYPE_EXT = 0x807E;
def GL_NORMAL_ARRAY_STRIDE_EXT = 0x807F;
def GL_NORMAL_ARRAY_COUNT_EXT = 0x8080;
def GL_COLOR_ARRAY_SIZE_EXT = 0x8081;
def GL_COLOR_ARRAY_TYPE_EXT = 0x8082;
def GL_COLOR_ARRAY_STRIDE_EXT = 0x8083;
def GL_COLOR_ARRAY_COUNT_EXT = 0x8084;
def GL_INDEX_ARRAY_TYPE_EXT = 0x8085;
def GL_INDEX_ARRAY_STRIDE_EXT = 0x8086;
def GL_INDEX_ARRAY_COUNT_EXT = 0x8087;
def GL_TEXTURE_COORD_ARRAY_SIZE_EXT = 0x8088;
def GL_TEXTURE_COORD_ARRAY_TYPE_EXT = 0x8089;
def GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = 0x808A;
def GL_TEXTURE_COORD_ARRAY_COUNT_EXT = 0x808B;
def GL_EDGE_FLAG_ARRAY_STRIDE_EXT = 0x808C;
def GL_EDGE_FLAG_ARRAY_COUNT_EXT = 0x808D;
def GL_VERTEX_ARRAY_POINTER_EXT = 0x808E;
def GL_NORMAL_ARRAY_POINTER_EXT = 0x808F;
def GL_COLOR_ARRAY_POINTER_EXT = 0x8090;
def GL_INDEX_ARRAY_POINTER_EXT = 0x8091;
def GL_TEXTURE_COORD_ARRAY_POINTER_EXT = 0x8092;
def GL_EDGE_FLAG_ARRAY_POINTER_EXT = 0x8093;
def GL_DOUBLE_EXT = GL_DOUBLE;
def GL_BGR_EXT = 0x80E0;
def GL_BGRA_EXT = 0x80E1;
def GL_COLOR_TABLE_FORMAT_EXT = 0x80D8;
def GL_COLOR_TABLE_WIDTH_EXT = 0x80D9;
def GL_COLOR_TABLE_RED_SIZE_EXT = 0x80DA;
def GL_COLOR_TABLE_GREEN_SIZE_EXT = 0x80DB;
def GL_COLOR_TABLE_BLUE_SIZE_EXT = 0x80DC;
def GL_COLOR_TABLE_ALPHA_SIZE_EXT = 0x80DD;
def GL_COLOR_TABLE_LUMINANCE_SIZE_EXT = 0x80DE;
def GL_COLOR_TABLE_INTENSITY_SIZE_EXT = 0x80DF;
def GL_COLOR_INDEX1_EXT = 0x80E2;
def GL_COLOR_INDEX2_EXT = 0x80E3;
def GL_COLOR_INDEX4_EXT = 0x80E4;
def GL_COLOR_INDEX8_EXT = 0x80E5;
def GL_COLOR_INDEX12_EXT = 0x80E6;
def GL_COLOR_INDEX16_EXT = 0x80E7;
def GL_MAX_ELEMENTS_VERTICES_WIN = 0x80E8;
def GL_MAX_ELEMENTS_INDICES_WIN = 0x80E9;
def GL_PHONG_WIN = 0x80EA ;
def GL_PHONG_HINT_WIN = 0x80EB ;
def GL_FOG_SPECULAR_TEXTURE_WIN = 0x80EC;
def GL_LOGIC_OP = GL_INDEX_LOGIC_OP;
def GL_TEXTURE_COMPONENTS = GL_TEXTURE_INTERNAL_FORMAT;

def glAccum func(op GLenum; value GLfloat) extern_binding("opengl32", true);

def glAlphaFunc func(func GLenum; ref GLclampf) extern_binding("opengl32", true);

def glAreTexturesResident func(n GLsizei; textures GLuint ref; residences GLboolean ref) (result GLboolean) extern_binding("opengl32", true);

def glArrayElement func(i GLint) extern_binding("opengl32", true);

def glBegin func(mode GLenum) extern_binding("opengl32", true);

def glBindTexture func(target GLenum; texture GLuint) extern_binding("opengl32", true);

def glBitmap func(width GLsizei; height GLsizei; xorig GLfloat; yorig GLfloat; xmove GLfloat; ymove GLfloat; bitmap GLubyte ref) extern_binding("opengl32", true);

def glBlendFunc func(sfactor GLenum; dfactor GLenum) extern_binding("opengl32", true);

def glCallList func(list GLuint) extern_binding("opengl32", true);

def glCallLists func(n GLsizei; type GLenum; lists GLvoid ref) extern_binding("opengl32", true);

def glClear func(mask GLbitfield) extern_binding("opengl32", true);

def glClearAccum func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat) extern_binding("opengl32", true);

def glClearColor func(red GLclampf; green GLclampf; blue GLclampf; alpha GLclampf) extern_binding("opengl32", true);

def glClearDepth func(depth GLclampd) extern_binding("opengl32", true);

def glClearIndex func(c GLfloat) extern_binding("opengl32", true);

def glClearStencil func(s GLint) extern_binding("opengl32", true);

def glClipPlane func(plane GLenum; equation GLdouble ref) extern_binding("opengl32", true);

def glColor3b func(red GLbyte; green GLbyte; blue GLbyte) extern_binding("opengl32", true);

def glColor3bv func(v GLbyte ref) extern_binding("opengl32", true);

def glColor3d func(red GLdouble; green GLdouble; blue GLdouble) extern_binding("opengl32", true);

def glColor3dv func(v GLdouble ref) extern_binding("opengl32", true);

def glColor3f func(red GLfloat; green GLfloat; blue GLfloat) extern_binding("opengl32", true);

def glColor3fv func(v GLfloat ref) extern_binding("opengl32", true);

def glColor3i func(red GLint; green GLint; blue GLint) extern_binding("opengl32", true);

def glColor3iv func(v GLint ref) extern_binding("opengl32", true);

def glColor3s func(red GLshort; green GLshort; blue GLshort) extern_binding("opengl32", true);

def glColor3sv func(v GLshort ref) extern_binding("opengl32", true);

def glColor3ub func(red GLubyte; green GLubyte; blue GLubyte) extern_binding("opengl32", true);

def glColor3ubv func(v GLubyte ref) extern_binding("opengl32", true);

def glColor3ui func(red GLuint; green GLuint; blue GLuint) extern_binding("opengl32", true);

def glColor3uiv func(v GLuint ref) extern_binding("opengl32", true);

def glColor3us func(red GLushort; green GLushort; blue GLushort) extern_binding("opengl32", true);

def glColor3usv func(v GLushort ref) extern_binding("opengl32", true);

def glColor4b func(red GLbyte; green GLbyte; blue GLbyte; alpha GLbyte) extern_binding("opengl32", true);

def glColor4bv func(v GLbyte ref) extern_binding("opengl32", true);

def glColor4d func(red GLdouble; green GLdouble; blue GLdouble; alpha GLdouble) extern_binding("opengl32", true);

def glColor4dv func(v GLdouble ref) extern_binding("opengl32", true);

def glColor4f func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat) extern_binding("opengl32", true);

def glColor4fv func(v GLfloat ref) extern_binding("opengl32", true);

def glColor4i func(red GLint; green GLint; blue GLint; alpha GLint) extern_binding("opengl32", true);

def glColor4iv func(v GLint ref) extern_binding("opengl32", true);

def glColor4s func(red GLshort; green GLshort; blue GLshort; alpha GLshort) extern_binding("opengl32", true);

def glColor4sv func(v GLshort ref) extern_binding("opengl32", true);

def glColor4ub func(red GLubyte; green GLubyte; blue GLubyte; alpha GLubyte) extern_binding("opengl32", true);

def glColor4ubv func(v GLubyte ref) extern_binding("opengl32", true);

def glColor4ui func(red GLuint; green GLuint; blue GLuint; alpha GLuint) extern_binding("opengl32", true);

def glColor4uiv func(v GLuint ref) extern_binding("opengl32", true);

def glColor4us func(red GLushort; green GLushort; blue GLushort; alpha GLushort) extern_binding("opengl32", true);

def glColor4usv func(v GLushort ref) extern_binding("opengl32", true);

def glColorMask func(red GLboolean; green GLboolean; blue GLboolean; alpha GLboolean) extern_binding("opengl32", true);

def glColorMaterial func(face GLenum; mode GLenum) extern_binding("opengl32", true);

def glColorPointer func(size GLint; type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glCopyPixels func(x GLint; y GLint; width GLsizei; height GLsizei; type GLenum) extern_binding("opengl32", true);

def glCopyTexImage1D func(target GLenum; level GLint; internalFormat GLenum; x GLint; y GLint; width GLsizei; border GLint) extern_binding("opengl32", true);

def glCopyTexImage2D func(target GLenum; level GLint; internalFormat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint) extern_binding("opengl32", true);

def glCopyTexSubImage1D func(target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei) extern_binding("opengl32", true);

def glCopyTexSubImage2D func(target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei) extern_binding("opengl32", true);

def glCullFace func(mode GLenum) extern_binding("opengl32", true);

def glDeleteLists func(list GLuint; range GLsizei) extern_binding("opengl32", true);

def glDeleteTextures func(n GLsizei; textures GLuint ref) extern_binding("opengl32", true);

def glDepthFunc func(func GLenum) extern_binding("opengl32", true);

def glDepthMask func(flag GLboolean) extern_binding("opengl32", true);

def glDepthRange func(zNear GLclampd; zFar GLclampd) extern_binding("opengl32", true);

def glDisable func(cap GLenum) extern_binding("opengl32", true);

def glDisableClientState func(array GLenum) extern_binding("opengl32", true);

def glDrawArrays func(mode GLenum; first GLint; count GLsizei) extern_binding("opengl32", true);

def glDrawBuffer func(mode GLenum) extern_binding("opengl32", true);

def glDrawElements func(mode GLenum; count GLsizei; type GLenum; indices GLvoid ref) extern_binding("opengl32", true);

def glDrawPixels func(width GLsizei; height GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glEdgeFlag func(flag GLboolean) extern_binding("opengl32", true);

def glEdgeFlagPointer func(stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glEdgeFlagv func(flag GLboolean ref) extern_binding("opengl32", true);

def glEnable func(cap GLenum) extern_binding("opengl32", true);

def glEnableClientState func(array GLenum) extern_binding("opengl32", true);

def glEnd func() extern_binding("opengl32", true);

def glEndList func() extern_binding("opengl32", true);

def glEvalCoord1d func(u GLdouble) extern_binding("opengl32", true);

def glEvalCoord1dv func(u GLdouble ref) extern_binding("opengl32", true);

def glEvalCoord1f func(u GLfloat) extern_binding("opengl32", true);

def glEvalCoord1fv func(u GLfloat ref) extern_binding("opengl32", true);

def glEvalCoord2d func(u GLdouble; v GLdouble) extern_binding("opengl32", true);

def glEvalCoord2dv func(u GLdouble ref) extern_binding("opengl32", true);

def glEvalCoord2f func(u GLfloat; v GLfloat) extern_binding("opengl32", true);

def glEvalCoord2fv func(u GLfloat ref) extern_binding("opengl32", true);

def glEvalMesh1 func(mode GLenum; i1 GLint; i2 GLint) extern_binding("opengl32", true);

def glEvalMesh2 func(mode GLenum; i1 GLint; i2 GLint; j1 GLint; j2 GLint) extern_binding("opengl32", true);

def glEvalPoint1 func(i GLint) extern_binding("opengl32", true);

def glEvalPoint2 func(i GLint; j GLint) extern_binding("opengl32", true);

def glFeedbackBuffer func(size GLsizei; type GLenum; buffer GLfloat ref) extern_binding("opengl32", true);

def glFinish func() extern_binding("opengl32", true);

def glFlush func() extern_binding("opengl32", true);

def glFogf func(pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glFogfv func(pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glFogi func(pname GLenum; param GLint) extern_binding("opengl32", true);

def glFogiv func(pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glFrontFace func(mode GLenum) extern_binding("opengl32", true);

def glFrustum func(left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble) extern_binding("opengl32", true);

def glGenLists func(range GLsizei) (result GLuint) extern_binding("opengl32", true);

def glGenTextures func(n GLsizei; textures GLuint ref) extern_binding("opengl32", true);

def glGetBooleanv func(pname GLenum; params GLboolean ref) extern_binding("opengl32", true);

def glGetClipPlane func(plane GLenum; equation GLdouble ref) extern_binding("opengl32", true);

def glGetDoublev func(pname GLenum; params GLdouble ref) extern_binding("opengl32", true);

def glGetError func() (result GLenum) extern_binding("opengl32", true);

def glGetFloatv func(pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetIntegerv func(pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glGetLightfv func(light GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetLightiv func(light GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glGetMapdv func(target GLenum; query GLenum; v GLdouble ref) extern_binding("opengl32", true);

def glGetMapfv func(target GLenum; query GLenum; v GLfloat ref) extern_binding("opengl32", true);

def glGetMapiv func(target GLenum; query GLenum; v GLint ref) extern_binding("opengl32", true);

def glGetMaterialfv func(face GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetMaterialiv func(face GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glGetPixelMapfv func(map GLenum; values GLfloat ref) extern_binding("opengl32", true);

def glGetPixelMapuiv func(map GLenum; values GLuint ref) extern_binding("opengl32", true);

def glGetPixelMapusv func(map GLenum; values GLushort ref) extern_binding("opengl32", true);

def glGetPointerv func(pname GLenum; params GLvoid ref ref) extern_binding("opengl32", true);

def glGetPolygonStipple func(mask GLubyte ref) extern_binding("opengl32", true);

def glGetString func(name GLenum) (result GLubyte ref) extern_binding("opengl32", true);

def glGetTexEnvfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetTexEnviv func(target GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glGetTexGendv func(coord GLenum; pname GLenum; params GLdouble ref) extern_binding("opengl32", true);

def glGetTexGenfv func(coord GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetTexGeniv func(coord GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glGetTexImage func(target GLenum; level GLint; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glGetTexLevelParameterfv func(target GLenum; level GLint; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetTexLevelParameteriv func(target GLenum; level GLint; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glGetTexParameterfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glGetTexParameteriv func(target GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glHint func(target GLenum; mode GLenum) extern_binding("opengl32", true);

def glIndexMask func(mask GLuint) extern_binding("opengl32", true);

def glIndexPointer func(type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glIndexd func(c GLdouble) extern_binding("opengl32", true);

def glIndexdv func(c GLdouble ref) extern_binding("opengl32", true);

def glIndexf func(c GLfloat) extern_binding("opengl32", true);

def glIndexfv func(c GLfloat ref) extern_binding("opengl32", true);

def glIndexi func(c GLint) extern_binding("opengl32", true);

def glIndexiv func(c GLint ref) extern_binding("opengl32", true);

def glIndexs func(c GLshort) extern_binding("opengl32", true);

def glIndexsv func(c GLshort ref) extern_binding("opengl32", true);

def glIndexub func(c GLubyte) extern_binding("opengl32", true);

def glIndexubv func(c GLubyte ref) extern_binding("opengl32", true);

def glInitNames func() extern_binding("opengl32", true);

def glInterleavedArrays func(format GLenum; stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glIsEnabled func(cap GLenum) (result GLboolean) extern_binding("opengl32", true);

def glIsList func(list GLuint) (result GLboolean) extern_binding("opengl32", true);

def glIsTexture func(texture GLuint) (result GLboolean) extern_binding("opengl32", true);

def glLightModelf func(pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glLightModelfv func(pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glLightModeli func(pname GLenum; param GLint) extern_binding("opengl32", true);

def glLightModeliv func(pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glLightf func(light GLenum; pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glLightfv func(light GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glLighti func(light GLenum; pname GLenum; param GLint) extern_binding("opengl32", true);

def glLightiv func(light GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glLineStipple func(factor GLint; pattern GLushort) extern_binding("opengl32", true);

def glLineWidth func(width GLfloat) extern_binding("opengl32", true);

def glListBase func(base GLuint) extern_binding("opengl32", true);

def glLoadIdentity func() extern_binding("opengl32", true);

def glLoadMatrixd func(m GLdouble ref) extern_binding("opengl32", true);

def glLoadMatrixf func(m GLfloat ref) extern_binding("opengl32", true);

def glLoadName func(name GLuint) extern_binding("opengl32", true);

def glLogicOp func(opcode GLenum) extern_binding("opengl32", true);

def glMap1d func(target GLenum; u1 GLdouble; u2 GLdouble; stride GLint; order GLint; points GLdouble ref) extern_binding("opengl32", true);

def glMap1f func(target GLenum; u1 GLfloat; u2 GLfloat; stride GLint; order GLint; points GLfloat ref) extern_binding("opengl32", true);

def glMap2d func(target GLenum; u1 GLdouble; u2 GLdouble; ustride GLint; uorder GLint; v1 GLdouble; v2 GLdouble; vstride GLint; vorder GLint; points GLdouble ref) extern_binding("opengl32", true);

def glMap2f func(target GLenum; u1 GLfloat; u2 GLfloat; ustride GLint; uorder GLint; v1 GLfloat; v2 GLfloat; vstride GLint; vorder GLint; points GLfloat ref) extern_binding("opengl32", true);

def glMapGrid1d func(un GLint; u1 GLdouble; u2 GLdouble) extern_binding("opengl32", true);

def glMapGrid1f func(un GLint; u1 GLfloat; u2 GLfloat) extern_binding("opengl32", true);

def glMapGrid2d func(un GLint; u1 GLdouble; u2 GLdouble; vn GLint; v1 GLdouble; v2 GLdouble) extern_binding("opengl32", true);

def glMapGrid2f func(un GLint; u1 GLfloat; u2 GLfloat; vn GLint; v1 GLfloat; v2 GLfloat) extern_binding("opengl32", true);

def glMaterialf func(face GLenum; pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glMaterialfv func(face GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glMateriali func(face GLenum; pname GLenum; param GLint) extern_binding("opengl32", true);

def glMaterialiv func(face GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glMatrixMode func(mode GLenum) extern_binding("opengl32", true);

def glMultMatrixd func(m GLdouble ref) extern_binding("opengl32", true);

def glMultMatrixf func(m GLfloat ref) extern_binding("opengl32", true);

def glNewList func(list GLuint; mode GLenum) extern_binding("opengl32", true);

def glNormal3b func(nx GLbyte; ny GLbyte; nz GLbyte) extern_binding("opengl32", true);

def glNormal3bv func(v GLbyte ref) extern_binding("opengl32", true);

def glNormal3d func(nx GLdouble; ny GLdouble; nz GLdouble) extern_binding("opengl32", true);

def glNormal3dv func(v GLdouble ref) extern_binding("opengl32", true);

def glNormal3f func(nx GLfloat; ny GLfloat; nz GLfloat) extern_binding("opengl32", true);

def glNormal3fv func(v GLfloat ref) extern_binding("opengl32", true);

def glNormal3i func(nx GLint; ny GLint; nz GLint) extern_binding("opengl32", true);

def glNormal3iv func(v GLint ref) extern_binding("opengl32", true);

def glNormal3s func(nx GLshort; ny GLshort; nz GLshort) extern_binding("opengl32", true);

def glNormal3sv func(v GLshort ref) extern_binding("opengl32", true);

def glNormalPointer func(type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glOrtho func(left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble) extern_binding("opengl32", true);

def glPassThrough func(token GLfloat) extern_binding("opengl32", true);

def glPixelMapfv func(map GLenum; mapsize GLsizei; values GLfloat ref) extern_binding("opengl32", true);

def glPixelMapuiv func(map GLenum; mapsize GLsizei; values GLuint ref) extern_binding("opengl32", true);

def glPixelMapusv func(map GLenum; mapsize GLsizei; values GLushort ref) extern_binding("opengl32", true);

def glPixelStoref func(pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glPixelStorei func(pname GLenum; param GLint) extern_binding("opengl32", true);

def glPixelTransferf func(pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glPixelTransferi func(pname GLenum; param GLint) extern_binding("opengl32", true);

def glPixelZoom func(xfactor GLfloat; yfactor GLfloat) extern_binding("opengl32", true);

def glPointSize func(size GLfloat) extern_binding("opengl32", true);

def glPolygonMode func(face GLenum; mode GLenum) extern_binding("opengl32", true);

def glPolygonOffset func(factor GLfloat; units GLfloat) extern_binding("opengl32", true);

def glPolygonStipple func(mask GLubyte ref) extern_binding("opengl32", true);

def glPopAttrib func() extern_binding("opengl32", true);

def glPopClientAttrib func() extern_binding("opengl32", true);

def glPopMatrix func() extern_binding("opengl32", true);

def glPopName func() extern_binding("opengl32", true);

def glPrioritizeTextures func(n GLsizei; textures GLuint ref; priorities GLclampf ref) extern_binding("opengl32", true);

def glPushAttrib func(mask GLbitfield) extern_binding("opengl32", true);

def glPushClientAttrib func(mask GLbitfield) extern_binding("opengl32", true);

def glPushMatrix func() extern_binding("opengl32", true);

def glPushName func(name GLuint) extern_binding("opengl32", true);

def glRasterPos2d func(x GLdouble; y GLdouble) extern_binding("opengl32", true);

def glRasterPos2dv func(v GLdouble ref) extern_binding("opengl32", true);

def glRasterPos2f func(x GLfloat; y GLfloat) extern_binding("opengl32", true);

def glRasterPos2fv func(v GLfloat ref) extern_binding("opengl32", true);

def glRasterPos2i func(x GLint; y GLint) extern_binding("opengl32", true);

def glRasterPos2iv func(v GLint ref) extern_binding("opengl32", true);

def glRasterPos2s func(x GLshort; y GLshort) extern_binding("opengl32", true);

def glRasterPos2sv func(v GLshort ref) extern_binding("opengl32", true);

def glRasterPos3d func(x GLdouble; y GLdouble; z GLdouble) extern_binding("opengl32", true);

def glRasterPos3dv func(v GLdouble ref) extern_binding("opengl32", true);

def glRasterPos3f func(x GLfloat; y GLfloat; z GLfloat) extern_binding("opengl32", true);

def glRasterPos3fv func(v GLfloat ref) extern_binding("opengl32", true);

def glRasterPos3i func(x GLint; y GLint; z GLint) extern_binding("opengl32", true);

def glRasterPos3iv func(v GLint ref) extern_binding("opengl32", true);

def glRasterPos3s func(x GLshort; y GLshort; z GLshort) extern_binding("opengl32", true);

def glRasterPos3sv func(v GLshort ref) extern_binding("opengl32", true);

def glRasterPos4d func(x GLdouble; y GLdouble; z GLdouble; w GLdouble) extern_binding("opengl32", true);

def glRasterPos4dv func(v GLdouble ref) extern_binding("opengl32", true);

def glRasterPos4f func(x GLfloat; y GLfloat; z GLfloat; w GLfloat) extern_binding("opengl32", true);

def glRasterPos4fv func(v GLfloat ref) extern_binding("opengl32", true);

def glRasterPos4i func(x GLint; y GLint; z GLint; w GLint) extern_binding("opengl32", true);

def glRasterPos4iv func(v GLint ref) extern_binding("opengl32", true);

def glRasterPos4s func(x GLshort; y GLshort; z GLshort; w GLshort) extern_binding("opengl32", true);

def glRasterPos4sv func(v GLshort ref) extern_binding("opengl32", true);

def glReadBuffer func(mode GLenum) extern_binding("opengl32", true);

def glReadPixels func(x GLint; y GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glRectd func(x1 GLdouble; y1 GLdouble; x2 GLdouble; y2 GLdouble) extern_binding("opengl32", true);

def glRectdv func(v1 GLdouble ref; v2 GLdouble ref) extern_binding("opengl32", true);

def glRectf func(x1 GLfloat; y1 GLfloat; x2 GLfloat; y2 GLfloat) extern_binding("opengl32", true);

def glRectfv func(v1 GLfloat ref; v2 GLfloat ref) extern_binding("opengl32", true);

def glRecti func(x1 GLint; y1 GLint; x2 GLint; y2 GLint) extern_binding("opengl32", true);

def glRectiv func(v1 GLint ref; v2 GLint ref) extern_binding("opengl32", true);

def glRects func(x1 GLshort; y1 GLshort; x2 GLshort; y2 GLshort) extern_binding("opengl32", true);

def glRectsv func(v1 GLshort ref; v2 GLshort ref) extern_binding("opengl32", true);

def glRenderMode func(mode GLenum) (result GLint) extern_binding("opengl32", true);

def glRotated func(angle GLdouble; x GLdouble; y GLdouble; z GLdouble) extern_binding("opengl32", true);

def glRotatef func(angle GLfloat; x GLfloat; y GLfloat; z GLfloat) extern_binding("opengl32", true);

def glScaled func(x GLdouble; y GLdouble; z GLdouble) extern_binding("opengl32", true);

def glScalef func(x GLfloat; y GLfloat; z GLfloat) extern_binding("opengl32", true);

def glScissor func(x GLint; y GLint; width GLsizei; height GLsizei) extern_binding("opengl32", true);

def glSelectBuffer func(size GLsizei; buffer GLuint ref) extern_binding("opengl32", true);

def glShadeModel func(mode GLenum) extern_binding("opengl32", true);

def glStencilFunc func(func GLenum; ref GLint; mask GLuint) extern_binding("opengl32", true);

def glStencilMask func(mask GLuint) extern_binding("opengl32", true);

def glStencilOp func(fail GLenum; zfail GLenum; zpass GLenum) extern_binding("opengl32", true);

def glTexCoord1d func(s GLdouble) extern_binding("opengl32", true);

def glTexCoord1dv func(v GLdouble ref) extern_binding("opengl32", true);

def glTexCoord1f func(s GLfloat) extern_binding("opengl32", true);

def glTexCoord1fv func(v GLfloat ref) extern_binding("opengl32", true);

def glTexCoord1i func(s GLint) extern_binding("opengl32", true);

def glTexCoord1iv func(v GLint ref) extern_binding("opengl32", true);

def glTexCoord1s func(s GLshort) extern_binding("opengl32", true);

def glTexCoord1sv func(v GLshort ref) extern_binding("opengl32", true);

def glTexCoord2d func(s GLdouble; t GLdouble) extern_binding("opengl32", true);

def glTexCoord2dv func(v GLdouble ref) extern_binding("opengl32", true);

def glTexCoord2f func(s GLfloat; t GLfloat) extern_binding("opengl32", true);

def glTexCoord2fv func(v GLfloat ref) extern_binding("opengl32", true);

def glTexCoord2i func(s GLint; t GLint) extern_binding("opengl32", true);

def glTexCoord2iv func(v GLint ref) extern_binding("opengl32", true);

def glTexCoord2s func(s GLshort; t GLshort) extern_binding("opengl32", true);

def glTexCoord2sv func(v GLshort ref) extern_binding("opengl32", true);

def glTexCoord3d func(s GLdouble; t GLdouble; r GLdouble) extern_binding("opengl32", true);

def glTexCoord3dv func(v GLdouble ref) extern_binding("opengl32", true);

def glTexCoord3f func(s GLfloat; t GLfloat; r GLfloat) extern_binding("opengl32", true);

def glTexCoord3fv func(v GLfloat ref) extern_binding("opengl32", true);

def glTexCoord3i func(s GLint; t GLint; r GLint) extern_binding("opengl32", true);

def glTexCoord3iv func(v GLint ref) extern_binding("opengl32", true);

def glTexCoord3s func(s GLshort; t GLshort; r GLshort) extern_binding("opengl32", true);

def glTexCoord3sv func(v GLshort ref) extern_binding("opengl32", true);

def glTexCoord4d func(s GLdouble; t GLdouble; r GLdouble; q GLdouble) extern_binding("opengl32", true);

def glTexCoord4dv func(v GLdouble ref) extern_binding("opengl32", true);

def glTexCoord4f func(s GLfloat; t GLfloat; r GLfloat; q GLfloat) extern_binding("opengl32", true);

def glTexCoord4fv func(v GLfloat ref) extern_binding("opengl32", true);

def glTexCoord4i func(s GLint; t GLint; r GLint; q GLint) extern_binding("opengl32", true);

def glTexCoord4iv func(v GLint ref) extern_binding("opengl32", true);

def glTexCoord4s func(s GLshort; t GLshort; r GLshort; q GLshort) extern_binding("opengl32", true);

def glTexCoord4sv func(v GLshort ref) extern_binding("opengl32", true);

def glTexCoordPointer func(size GLint; type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glTexEnvf func(target GLenum; pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glTexEnvfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glTexEnvi func(target GLenum; pname GLenum; param GLint) extern_binding("opengl32", true);

def glTexEnviv func(target GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glTexGend func(coord GLenum; pname GLenum; param GLdouble) extern_binding("opengl32", true);

def glTexGendv func(coord GLenum; pname GLenum; params GLdouble ref) extern_binding("opengl32", true);

def glTexGenf func(coord GLenum; pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glTexGenfv func(coord GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glTexGeni func(coord GLenum; pname GLenum; param GLint) extern_binding("opengl32", true);

def glTexGeniv func(coord GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glTexImage1D func(target GLenum; level GLint; internalformat GLint; width GLsizei; border GLint; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glTexImage2D func(target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; border GLint; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glTexParameterf func(target GLenum; pname GLenum; param GLfloat) extern_binding("opengl32", true);

def glTexParameterfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding("opengl32", true);

def glTexParameteri func(target GLenum; pname GLenum; param GLint) extern_binding("opengl32", true);

def glTexParameteriv func(target GLenum; pname GLenum; params GLint ref) extern_binding("opengl32", true);

def glTexSubImage1D func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glTexSubImage2D func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding("opengl32", true);

def glTranslated func(x GLdouble; y GLdouble; z GLdouble) extern_binding("opengl32", true);

def glTranslatef func(x GLfloat; y GLfloat; z GLfloat) extern_binding("opengl32", true);

def glVertex2d func(x GLdouble; y GLdouble) extern_binding("opengl32", true);

def glVertex2dv func(v GLdouble ref) extern_binding("opengl32", true);

def glVertex2f func(x GLfloat; y GLfloat) extern_binding("opengl32", true);

def glVertex2fv func(v GLfloat ref) extern_binding("opengl32", true);

def glVertex2i func(x GLint; y GLint) extern_binding("opengl32", true);

def glVertex2iv func(v GLint ref) extern_binding("opengl32", true);

def glVertex2s func(x GLshort; y GLshort) extern_binding("opengl32", true);

def glVertex2sv func(v GLshort ref) extern_binding("opengl32", true);

def glVertex3d func(x GLdouble; y GLdouble; z GLdouble) extern_binding("opengl32", true);

def glVertex3dv func(v GLdouble ref) extern_binding("opengl32", true);

def glVertex3f func(x GLfloat; y GLfloat; z GLfloat) extern_binding("opengl32", true);

def glVertex3fv func(v GLfloat ref) extern_binding("opengl32", true);

def glVertex3i func(x GLint; y GLint; z GLint) extern_binding("opengl32", true);

def glVertex3iv func(v GLint ref) extern_binding("opengl32", true);

def glVertex3s func(x GLshort; y GLshort; z GLshort) extern_binding("opengl32", true);

def glVertex3sv func(v GLshort ref) extern_binding("opengl32", true);

def glVertex4d func(x GLdouble; y GLdouble; z GLdouble; w GLdouble) extern_binding("opengl32", true);

def glVertex4dv func(v GLdouble ref) extern_binding("opengl32", true);

def glVertex4f func(x GLfloat; y GLfloat; z GLfloat; w GLfloat) extern_binding("opengl32", true);

def glVertex4fv func(v GLfloat ref) extern_binding("opengl32", true);

def glVertex4i func(x GLint; y GLint; z GLint; w GLint) extern_binding("opengl32", true);

def glVertex4iv func(v GLint ref) extern_binding("opengl32", true);

def glVertex4s func(x GLshort; y GLshort; z GLshort; w GLshort) extern_binding("opengl32", true);

def glVertex4sv func(v GLshort ref) extern_binding("opengl32", true);

def glVertexPointer func(size GLint; type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding("opengl32", true);

def glViewport func(x GLint; y GLint; width GLsizei; height GLsizei) extern_binding("opengl32", true);

// file: gl/glext.h

def GL_GLEXT_VERSION = 20211115;
def GL_VERSION_1_2 = 1;
def GL_UNSIGNED_BYTE_3_3_2 = 0x8032;
def GL_UNSIGNED_SHORT_4_4_4_4 = 0x8033;
def GL_UNSIGNED_SHORT_5_5_5_1 = 0x8034;
def GL_UNSIGNED_INT_8_8_8_8 = 0x8035;
def GL_UNSIGNED_INT_10_10_10_2 = 0x8036;
def GL_TEXTURE_BINDING_3D = 0x806A;
def GL_PACK_SKIP_IMAGES = 0x806B;
def GL_PACK_IMAGE_HEIGHT = 0x806C;
def GL_UNPACK_SKIP_IMAGES = 0x806D;
def GL_UNPACK_IMAGE_HEIGHT = 0x806E;
def GL_TEXTURE_3D = 0x806F;
def GL_PROXY_TEXTURE_3D = 0x8070;
def GL_TEXTURE_DEPTH = 0x8071;
def GL_TEXTURE_WRAP_R = 0x8072;
def GL_MAX_3D_TEXTURE_SIZE = 0x8073;
def GL_UNSIGNED_BYTE_2_3_3_REV = 0x8362;
def GL_UNSIGNED_SHORT_5_6_5 = 0x8363;
def GL_UNSIGNED_SHORT_5_6_5_REV = 0x8364;
def GL_UNSIGNED_SHORT_4_4_4_4_REV = 0x8365;
def GL_UNSIGNED_SHORT_1_5_5_5_REV = 0x8366;
def GL_UNSIGNED_INT_8_8_8_8_REV = 0x8367;
def GL_UNSIGNED_INT_2_10_10_10_REV = 0x8368;
def GL_BGR = 0x80E0;
def GL_BGRA = 0x80E1;
def GL_MAX_ELEMENTS_VERTICES = 0x80E8;
def GL_MAX_ELEMENTS_INDICES = 0x80E9;
def GL_CLAMP_TO_EDGE = 0x812F;
def GL_TEXTURE_MIN_LOD = 0x813A;
def GL_TEXTURE_MAX_LOD = 0x813B;
def GL_TEXTURE_BASE_LEVEL = 0x813C;
def GL_TEXTURE_MAX_LEVEL = 0x813D;
def GL_SMOOTH_POINT_SIZE_RANGE = 0x0B12;
def GL_SMOOTH_POINT_SIZE_GRANULARITY = 0x0B13;
def GL_SMOOTH_LINE_WIDTH_RANGE = 0x0B22;
def GL_SMOOTH_LINE_WIDTH_GRANULARITY = 0x0B23;
def GL_ALIASED_LINE_WIDTH_RANGE = 0x846E;
def GL_RESCALE_NORMAL = 0x803A;
def GL_LIGHT_MODEL_COLOR_CONTROL = 0x81F8;
def GL_SINGLE_COLOR = 0x81F9;
def GL_SEPARATE_SPECULAR_COLOR = 0x81FA;
def GL_ALIASED_POINT_SIZE_RANGE = 0x846D;

def glDrawRangeElements_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei; type GLenum; indices u8 ref);
var global glDrawRangeElements glDrawRangeElements_signature;

def glTexImage3D_signature func(target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glTexImage3D glTexImage3D_signature;

def glTexSubImage3D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTexSubImage3D glTexSubImage3D_signature;

def glCopyTexSubImage3D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTexSubImage3D glCopyTexSubImage3D_signature;
def GL_VERSION_1_3 = 1;
def GL_TEXTURE0 = 0x84C0;
def GL_TEXTURE1 = 0x84C1;
def GL_TEXTURE2 = 0x84C2;
def GL_TEXTURE3 = 0x84C3;
def GL_TEXTURE4 = 0x84C4;
def GL_TEXTURE5 = 0x84C5;
def GL_TEXTURE6 = 0x84C6;
def GL_TEXTURE7 = 0x84C7;
def GL_TEXTURE8 = 0x84C8;
def GL_TEXTURE9 = 0x84C9;
def GL_TEXTURE10 = 0x84CA;
def GL_TEXTURE11 = 0x84CB;
def GL_TEXTURE12 = 0x84CC;
def GL_TEXTURE13 = 0x84CD;
def GL_TEXTURE14 = 0x84CE;
def GL_TEXTURE15 = 0x84CF;
def GL_TEXTURE16 = 0x84D0;
def GL_TEXTURE17 = 0x84D1;
def GL_TEXTURE18 = 0x84D2;
def GL_TEXTURE19 = 0x84D3;
def GL_TEXTURE20 = 0x84D4;
def GL_TEXTURE21 = 0x84D5;
def GL_TEXTURE22 = 0x84D6;
def GL_TEXTURE23 = 0x84D7;
def GL_TEXTURE24 = 0x84D8;
def GL_TEXTURE25 = 0x84D9;
def GL_TEXTURE26 = 0x84DA;
def GL_TEXTURE27 = 0x84DB;
def GL_TEXTURE28 = 0x84DC;
def GL_TEXTURE29 = 0x84DD;
def GL_TEXTURE30 = 0x84DE;
def GL_TEXTURE31 = 0x84DF;
def GL_ACTIVE_TEXTURE = 0x84E0;
def GL_MULTISAMPLE = 0x809D;
def GL_SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
def GL_SAMPLE_ALPHA_TO_ONE = 0x809F;
def GL_SAMPLE_COVERAGE = 0x80A0;
def GL_SAMPLE_BUFFERS = 0x80A8;
def GL_SAMPLES = 0x80A9;
def GL_SAMPLE_COVERAGE_VALUE = 0x80AA;
def GL_SAMPLE_COVERAGE_INVERT = 0x80AB;
def GL_TEXTURE_CUBE_MAP = 0x8513;
def GL_TEXTURE_BINDING_CUBE_MAP = 0x8514;
def GL_TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
def GL_TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
def GL_TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
def GL_PROXY_TEXTURE_CUBE_MAP = 0x851B;
def GL_MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
def GL_COMPRESSED_RGB = 0x84ED;
def GL_COMPRESSED_RGBA = 0x84EE;
def GL_TEXTURE_COMPRESSION_HINT = 0x84EF;
def GL_TEXTURE_COMPRESSED_IMAGE_SIZE = 0x86A0;
def GL_TEXTURE_COMPRESSED = 0x86A1;
def GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
def GL_COMPRESSED_TEXTURE_FORMATS = 0x86A3;
def GL_CLAMP_TO_BORDER = 0x812D;
def GL_CLIENT_ACTIVE_TEXTURE = 0x84E1;
def GL_MAX_TEXTURE_UNITS = 0x84E2;
def GL_TRANSPOSE_MODELVIEW_MATRIX = 0x84E3;
def GL_TRANSPOSE_PROJECTION_MATRIX = 0x84E4;
def GL_TRANSPOSE_TEXTURE_MATRIX = 0x84E5;
def GL_TRANSPOSE_COLOR_MATRIX = 0x84E6;
def GL_MULTISAMPLE_BIT = 0x20000000;
def GL_NORMAL_MAP = 0x8511;
def GL_REFLECTION_MAP = 0x8512;
def GL_COMPRESSED_ALPHA = 0x84E9;
def GL_COMPRESSED_LUMINANCE = 0x84EA;
def GL_COMPRESSED_LUMINANCE_ALPHA = 0x84EB;
def GL_COMPRESSED_INTENSITY = 0x84EC;
def GL_COMBINE = 0x8570;
def GL_COMBINE_RGB = 0x8571;
def GL_COMBINE_ALPHA = 0x8572;
def GL_SOURCE0_RGB = 0x8580;
def GL_SOURCE1_RGB = 0x8581;
def GL_SOURCE2_RGB = 0x8582;
def GL_SOURCE0_ALPHA = 0x8588;
def GL_SOURCE1_ALPHA = 0x8589;
def GL_SOURCE2_ALPHA = 0x858A;
def GL_OPERAND0_RGB = 0x8590;
def GL_OPERAND1_RGB = 0x8591;
def GL_OPERAND2_RGB = 0x8592;
def GL_OPERAND0_ALPHA = 0x8598;
def GL_OPERAND1_ALPHA = 0x8599;
def GL_OPERAND2_ALPHA = 0x859A;
def GL_RGB_SCALE = 0x8573;
def GL_ADD_SIGNED = 0x8574;
def GL_INTERPOLATE = 0x8575;
def GL_SUBTRACT = 0x84E7;
def GL_CONSTANT = 0x8576;
def GL_PRIMARY_COLOR = 0x8577;
def GL_PREVIOUS = 0x8578;
def GL_DOT3_RGB = 0x86AE;
def GL_DOT3_RGBA = 0x86AF;

def glActiveTexture_signature func(texture GLenum);
var global glActiveTexture glActiveTexture_signature;

def glSampleCoverage_signature func(value GLfloat; invert GLboolean);
var global glSampleCoverage glSampleCoverage_signature;

def glCompressedTexImage3D_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var global glCompressedTexImage3D glCompressedTexImage3D_signature;

def glCompressedTexImage2D_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var global glCompressedTexImage2D glCompressedTexImage2D_signature;

def glCompressedTexImage1D_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var global glCompressedTexImage1D glCompressedTexImage1D_signature;

def glCompressedTexSubImage3D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTexSubImage3D glCompressedTexSubImage3D_signature;

def glCompressedTexSubImage2D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTexSubImage2D glCompressedTexSubImage2D_signature;

def glCompressedTexSubImage1D_signature func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTexSubImage1D glCompressedTexSubImage1D_signature;

def glGetCompressedTexImage_signature func(target GLenum; level GLint; img u8 ref);
var global glGetCompressedTexImage glGetCompressedTexImage_signature;

def glClientActiveTexture_signature func(texture GLenum);
var global glClientActiveTexture glClientActiveTexture_signature;

def glMultiTexCoord1d_signature func(target GLenum; s GLdouble);
var global glMultiTexCoord1d glMultiTexCoord1d_signature;

def glMultiTexCoord1dv_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord1dv glMultiTexCoord1dv_signature;

def glMultiTexCoord1f_signature func(target GLenum; s GLfloat);
var global glMultiTexCoord1f glMultiTexCoord1f_signature;

def glMultiTexCoord1fv_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord1fv glMultiTexCoord1fv_signature;

def glMultiTexCoord1i_signature func(target GLenum; s GLint);
var global glMultiTexCoord1i glMultiTexCoord1i_signature;

def glMultiTexCoord1iv_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord1iv glMultiTexCoord1iv_signature;

def glMultiTexCoord1s_signature func(target GLenum; s GLshort);
var global glMultiTexCoord1s glMultiTexCoord1s_signature;

def glMultiTexCoord1sv_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord1sv glMultiTexCoord1sv_signature;

def glMultiTexCoord2d_signature func(target GLenum; s GLdouble; t GLdouble);
var global glMultiTexCoord2d glMultiTexCoord2d_signature;

def glMultiTexCoord2dv_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord2dv glMultiTexCoord2dv_signature;

def glMultiTexCoord2f_signature func(target GLenum; s GLfloat; t GLfloat);
var global glMultiTexCoord2f glMultiTexCoord2f_signature;

def glMultiTexCoord2fv_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord2fv glMultiTexCoord2fv_signature;

def glMultiTexCoord2i_signature func(target GLenum; s GLint; t GLint);
var global glMultiTexCoord2i glMultiTexCoord2i_signature;

def glMultiTexCoord2iv_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord2iv glMultiTexCoord2iv_signature;

def glMultiTexCoord2s_signature func(target GLenum; s GLshort; t GLshort);
var global glMultiTexCoord2s glMultiTexCoord2s_signature;

def glMultiTexCoord2sv_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord2sv glMultiTexCoord2sv_signature;

def glMultiTexCoord3d_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble);
var global glMultiTexCoord3d glMultiTexCoord3d_signature;

def glMultiTexCoord3dv_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord3dv glMultiTexCoord3dv_signature;

def glMultiTexCoord3f_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat);
var global glMultiTexCoord3f glMultiTexCoord3f_signature;

def glMultiTexCoord3fv_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord3fv glMultiTexCoord3fv_signature;

def glMultiTexCoord3i_signature func(target GLenum; s GLint; t GLint; r GLint);
var global glMultiTexCoord3i glMultiTexCoord3i_signature;

def glMultiTexCoord3iv_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord3iv glMultiTexCoord3iv_signature;

def glMultiTexCoord3s_signature func(target GLenum; s GLshort; t GLshort; r GLshort);
var global glMultiTexCoord3s glMultiTexCoord3s_signature;

def glMultiTexCoord3sv_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord3sv glMultiTexCoord3sv_signature;

def glMultiTexCoord4d_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble; q GLdouble);
var global glMultiTexCoord4d glMultiTexCoord4d_signature;

def glMultiTexCoord4dv_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord4dv glMultiTexCoord4dv_signature;

def glMultiTexCoord4f_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat; q GLfloat);
var global glMultiTexCoord4f glMultiTexCoord4f_signature;

def glMultiTexCoord4fv_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord4fv glMultiTexCoord4fv_signature;

def glMultiTexCoord4i_signature func(target GLenum; s GLint; t GLint; r GLint; q GLint);
var global glMultiTexCoord4i glMultiTexCoord4i_signature;

def glMultiTexCoord4iv_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord4iv glMultiTexCoord4iv_signature;

def glMultiTexCoord4s_signature func(target GLenum; s GLshort; t GLshort; r GLshort; q GLshort);
var global glMultiTexCoord4s glMultiTexCoord4s_signature;

def glMultiTexCoord4sv_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord4sv glMultiTexCoord4sv_signature;

def glLoadTransposeMatrixf_signature func(m GLfloat ref);
var global glLoadTransposeMatrixf glLoadTransposeMatrixf_signature;

def glLoadTransposeMatrixd_signature func(m GLdouble ref);
var global glLoadTransposeMatrixd glLoadTransposeMatrixd_signature;

def glMultTransposeMatrixf_signature func(m GLfloat ref);
var global glMultTransposeMatrixf glMultTransposeMatrixf_signature;

def glMultTransposeMatrixd_signature func(m GLdouble ref);
var global glMultTransposeMatrixd glMultTransposeMatrixd_signature;
def GL_VERSION_1_4 = 1;
def GL_BLEND_DST_RGB = 0x80C8;
def GL_BLEND_SRC_RGB = 0x80C9;
def GL_BLEND_DST_ALPHA = 0x80CA;
def GL_BLEND_SRC_ALPHA = 0x80CB;
def GL_POINT_FADE_THRESHOLD_SIZE = 0x8128;
def GL_DEPTH_COMPONENT16 = 0x81A5;
def GL_DEPTH_COMPONENT24 = 0x81A6;
def GL_DEPTH_COMPONENT32 = 0x81A7;
def GL_MIRRORED_REPEAT = 0x8370;
def GL_MAX_TEXTURE_LOD_BIAS = 0x84FD;
def GL_TEXTURE_LOD_BIAS = 0x8501;
def GL_INCR_WRAP = 0x8507;
def GL_DECR_WRAP = 0x8508;
def GL_TEXTURE_DEPTH_SIZE = 0x884A;
def GL_TEXTURE_COMPARE_MODE = 0x884C;
def GL_TEXTURE_COMPARE_FUNC = 0x884D;
def GL_POINT_SIZE_MIN = 0x8126;
def GL_POINT_SIZE_MAX = 0x8127;
def GL_POINT_DISTANCE_ATTENUATION = 0x8129;
def GL_GENERATE_MIPMAP = 0x8191;
def GL_GENERATE_MIPMAP_HINT = 0x8192;
def GL_FOG_COORDINATE_SOURCE = 0x8450;
def GL_FOG_COORDINATE = 0x8451;
def GL_FRAGMENT_DEPTH = 0x8452;
def GL_CURRENT_FOG_COORDINATE = 0x8453;
def GL_FOG_COORDINATE_ARRAY_TYPE = 0x8454;
def GL_FOG_COORDINATE_ARRAY_STRIDE = 0x8455;
def GL_FOG_COORDINATE_ARRAY_POINTER = 0x8456;
def GL_FOG_COORDINATE_ARRAY = 0x8457;
def GL_COLOR_SUM = 0x8458;
def GL_CURRENT_SECONDARY_COLOR = 0x8459;
def GL_SECONDARY_COLOR_ARRAY_SIZE = 0x845A;
def GL_SECONDARY_COLOR_ARRAY_TYPE = 0x845B;
def GL_SECONDARY_COLOR_ARRAY_STRIDE = 0x845C;
def GL_SECONDARY_COLOR_ARRAY_POINTER = 0x845D;
def GL_SECONDARY_COLOR_ARRAY = 0x845E;
def GL_TEXTURE_FILTER_CONTROL = 0x8500;
def GL_DEPTH_TEXTURE_MODE = 0x884B;
def GL_COMPARE_R_TO_TEXTURE = 0x884E;
def GL_BLEND_COLOR = 0x8005;
def GL_BLEND_EQUATION = 0x8009;
def GL_CONSTANT_COLOR = 0x8001;
def GL_ONE_MINUS_CONSTANT_COLOR = 0x8002;
def GL_CONSTANT_ALPHA = 0x8003;
def GL_ONE_MINUS_CONSTANT_ALPHA = 0x8004;
def GL_FUNC_ADD = 0x8006;
def GL_FUNC_REVERSE_SUBTRACT = 0x800B;
def GL_FUNC_SUBTRACT = 0x800A;
def GL_MIN = 0x8007;
def GL_MAX = 0x8008;

def glBlendFuncSeparate_signature func(sfactorRGB GLenum; dfactorRGB GLenum; sfactorAlpha GLenum; dfactorAlpha GLenum);
var global glBlendFuncSeparate glBlendFuncSeparate_signature;

def glMultiDrawArrays_signature func(mode GLenum; first GLint ref; count GLsizei ref; drawcount GLsizei);
var global glMultiDrawArrays glMultiDrawArrays_signature;

def glMultiDrawElements_signature func(mode GLenum; count GLsizei ref; type GLenum; indices u8 ref ref; drawcount GLsizei);
var global glMultiDrawElements glMultiDrawElements_signature;

def glPointParameterf_signature func(pname GLenum; param GLfloat);
var global glPointParameterf glPointParameterf_signature;

def glPointParameterfv_signature func(pname GLenum; params GLfloat ref);
var global glPointParameterfv glPointParameterfv_signature;

def glPointParameteri_signature func(pname GLenum; param GLint);
var global glPointParameteri glPointParameteri_signature;

def glPointParameteriv_signature func(pname GLenum; params GLint ref);
var global glPointParameteriv glPointParameteriv_signature;

def glFogCoordf_signature func(coord GLfloat);
var global glFogCoordf glFogCoordf_signature;

def glFogCoordfv_signature func(coord GLfloat ref);
var global glFogCoordfv glFogCoordfv_signature;

def glFogCoordd_signature func(coord GLdouble);
var global glFogCoordd glFogCoordd_signature;

def glFogCoorddv_signature func(coord GLdouble ref);
var global glFogCoorddv glFogCoorddv_signature;

def glFogCoordPointer_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var global glFogCoordPointer glFogCoordPointer_signature;

def glSecondaryColor3b_signature func(red GLbyte; green GLbyte; blue GLbyte);
var global glSecondaryColor3b glSecondaryColor3b_signature;

def glSecondaryColor3bv_signature func(v GLbyte ref);
var global glSecondaryColor3bv glSecondaryColor3bv_signature;

def glSecondaryColor3d_signature func(red GLdouble; green GLdouble; blue GLdouble);
var global glSecondaryColor3d glSecondaryColor3d_signature;

def glSecondaryColor3dv_signature func(v GLdouble ref);
var global glSecondaryColor3dv glSecondaryColor3dv_signature;

def glSecondaryColor3f_signature func(red GLfloat; green GLfloat; blue GLfloat);
var global glSecondaryColor3f glSecondaryColor3f_signature;

def glSecondaryColor3fv_signature func(v GLfloat ref);
var global glSecondaryColor3fv glSecondaryColor3fv_signature;

def glSecondaryColor3i_signature func(red GLint; green GLint; blue GLint);
var global glSecondaryColor3i glSecondaryColor3i_signature;

def glSecondaryColor3iv_signature func(v GLint ref);
var global glSecondaryColor3iv glSecondaryColor3iv_signature;

def glSecondaryColor3s_signature func(red GLshort; green GLshort; blue GLshort);
var global glSecondaryColor3s glSecondaryColor3s_signature;

def glSecondaryColor3sv_signature func(v GLshort ref);
var global glSecondaryColor3sv glSecondaryColor3sv_signature;

def glSecondaryColor3ub_signature func(red GLubyte; green GLubyte; blue GLubyte);
var global glSecondaryColor3ub glSecondaryColor3ub_signature;

def glSecondaryColor3ubv_signature func(v GLubyte ref);
var global glSecondaryColor3ubv glSecondaryColor3ubv_signature;

def glSecondaryColor3ui_signature func(red GLuint; green GLuint; blue GLuint);
var global glSecondaryColor3ui glSecondaryColor3ui_signature;

def glSecondaryColor3uiv_signature func(v GLuint ref);
var global glSecondaryColor3uiv glSecondaryColor3uiv_signature;

def glSecondaryColor3us_signature func(red GLushort; green GLushort; blue GLushort);
var global glSecondaryColor3us glSecondaryColor3us_signature;

def glSecondaryColor3usv_signature func(v GLushort ref);
var global glSecondaryColor3usv glSecondaryColor3usv_signature;

def glSecondaryColorPointer_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glSecondaryColorPointer glSecondaryColorPointer_signature;

def glWindowPos2d_signature func(x GLdouble; y GLdouble);
var global glWindowPos2d glWindowPos2d_signature;

def glWindowPos2dv_signature func(v GLdouble ref);
var global glWindowPos2dv glWindowPos2dv_signature;

def glWindowPos2f_signature func(x GLfloat; y GLfloat);
var global glWindowPos2f glWindowPos2f_signature;

def glWindowPos2fv_signature func(v GLfloat ref);
var global glWindowPos2fv glWindowPos2fv_signature;

def glWindowPos2i_signature func(x GLint; y GLint);
var global glWindowPos2i glWindowPos2i_signature;

def glWindowPos2iv_signature func(v GLint ref);
var global glWindowPos2iv glWindowPos2iv_signature;

def glWindowPos2s_signature func(x GLshort; y GLshort);
var global glWindowPos2s glWindowPos2s_signature;

def glWindowPos2sv_signature func(v GLshort ref);
var global glWindowPos2sv glWindowPos2sv_signature;

def glWindowPos3d_signature func(x GLdouble; y GLdouble; z GLdouble);
var global glWindowPos3d glWindowPos3d_signature;

def glWindowPos3dv_signature func(v GLdouble ref);
var global glWindowPos3dv glWindowPos3dv_signature;

def glWindowPos3f_signature func(x GLfloat; y GLfloat; z GLfloat);
var global glWindowPos3f glWindowPos3f_signature;

def glWindowPos3fv_signature func(v GLfloat ref);
var global glWindowPos3fv glWindowPos3fv_signature;

def glWindowPos3i_signature func(x GLint; y GLint; z GLint);
var global glWindowPos3i glWindowPos3i_signature;

def glWindowPos3iv_signature func(v GLint ref);
var global glWindowPos3iv glWindowPos3iv_signature;

def glWindowPos3s_signature func(x GLshort; y GLshort; z GLshort);
var global glWindowPos3s glWindowPos3s_signature;

def glWindowPos3sv_signature func(v GLshort ref);
var global glWindowPos3sv glWindowPos3sv_signature;

def glBlendColor_signature func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat);
var global glBlendColor glBlendColor_signature;

def glBlendEquation_signature func(mode GLenum);
var global glBlendEquation glBlendEquation_signature;
def GL_VERSION_1_5 = 1;
def GL_BUFFER_SIZE = 0x8764;
def GL_BUFFER_USAGE = 0x8765;
def GL_QUERY_COUNTER_BITS = 0x8864;
def GL_CURRENT_QUERY = 0x8865;
def GL_QUERY_RESULT = 0x8866;
def GL_QUERY_RESULT_AVAILABLE = 0x8867;
def GL_ARRAY_BUFFER = 0x8892;
def GL_ELEMENT_ARRAY_BUFFER = 0x8893;
def GL_ARRAY_BUFFER_BINDING = 0x8894;
def GL_ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
def GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
def GL_READ_ONLY = 0x88B8;
def GL_WRITE_ONLY = 0x88B9;
def GL_READ_WRITE = 0x88BA;
def GL_BUFFER_ACCESS = 0x88BB;
def GL_BUFFER_MAPPED = 0x88BC;
def GL_BUFFER_MAP_POINTER = 0x88BD;
def GL_STREAM_DRAW = 0x88E0;
def GL_STREAM_READ = 0x88E1;
def GL_STREAM_COPY = 0x88E2;
def GL_STATIC_DRAW = 0x88E4;
def GL_STATIC_READ = 0x88E5;
def GL_STATIC_COPY = 0x88E6;
def GL_DYNAMIC_DRAW = 0x88E8;
def GL_DYNAMIC_READ = 0x88E9;
def GL_DYNAMIC_COPY = 0x88EA;
def GL_SAMPLES_PASSED = 0x8914;
def GL_SRC1_ALPHA = 0x8589;
def GL_VERTEX_ARRAY_BUFFER_BINDING = 0x8896;
def GL_NORMAL_ARRAY_BUFFER_BINDING = 0x8897;
def GL_COLOR_ARRAY_BUFFER_BINDING = 0x8898;
def GL_INDEX_ARRAY_BUFFER_BINDING = 0x8899;
def GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = 0x889A;
def GL_EDGE_FLAG_ARRAY_BUFFER_BINDING = 0x889B;
def GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = 0x889C;
def GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = 0x889D;
def GL_WEIGHT_ARRAY_BUFFER_BINDING = 0x889E;
def GL_FOG_COORD_SRC = 0x8450;
def GL_FOG_COORD = 0x8451;
def GL_CURRENT_FOG_COORD = 0x8453;
def GL_FOG_COORD_ARRAY_TYPE = 0x8454;
def GL_FOG_COORD_ARRAY_STRIDE = 0x8455;
def GL_FOG_COORD_ARRAY_POINTER = 0x8456;
def GL_FOG_COORD_ARRAY = 0x8457;
def GL_FOG_COORD_ARRAY_BUFFER_BINDING = 0x889D;
def GL_SRC0_RGB = 0x8580;
def GL_SRC1_RGB = 0x8581;
def GL_SRC2_RGB = 0x8582;
def GL_SRC0_ALPHA = 0x8588;
def GL_SRC2_ALPHA = 0x858A;

def glGenQueries_signature func(n GLsizei; ids GLuint ref);
var global glGenQueries glGenQueries_signature;

def glDeleteQueries_signature func(n GLsizei; ids GLuint ref);
var global glDeleteQueries glDeleteQueries_signature;

def glIsQuery_signature func(id GLuint) (result GLboolean);
var global glIsQuery glIsQuery_signature;

def glBeginQuery_signature func(target GLenum; id GLuint);
var global glBeginQuery glBeginQuery_signature;

def glEndQuery_signature func(target GLenum);
var global glEndQuery glEndQuery_signature;

def glGetQueryiv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetQueryiv glGetQueryiv_signature;

def glGetQueryObjectiv_signature func(id GLuint; pname GLenum; params GLint ref);
var global glGetQueryObjectiv glGetQueryObjectiv_signature;

def glGetQueryObjectuiv_signature func(id GLuint; pname GLenum; params GLuint ref);
var global glGetQueryObjectuiv glGetQueryObjectuiv_signature;

def glBindBuffer_signature func(target GLenum; buffer GLuint);
var global glBindBuffer glBindBuffer_signature;

def glDeleteBuffers_signature func(n GLsizei; buffers GLuint ref);
var global glDeleteBuffers glDeleteBuffers_signature;

def glGenBuffers_signature func(n GLsizei; buffers GLuint ref);
var global glGenBuffers glGenBuffers_signature;

def glIsBuffer_signature func(buffer GLuint) (result GLboolean);
var global glIsBuffer glIsBuffer_signature;

def glBufferData_signature func(target GLenum; size GLsizeiptr; data u8 ref; usage GLenum);
var global glBufferData glBufferData_signature;

def glBufferSubData_signature func(target GLenum; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glBufferSubData glBufferSubData_signature;

def glGetBufferSubData_signature func(target GLenum; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glGetBufferSubData glGetBufferSubData_signature;

def glMapBuffer_signature func(target GLenum; access GLenum) (result u8 ref);
var global glMapBuffer glMapBuffer_signature;

def glUnmapBuffer_signature func(target GLenum) (result GLboolean);
var global glUnmapBuffer glUnmapBuffer_signature;

def glGetBufferParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetBufferParameteriv glGetBufferParameteriv_signature;

def glGetBufferPointerv_signature func(target GLenum; pname GLenum; params u8 ref ref);
var global glGetBufferPointerv glGetBufferPointerv_signature;
def GL_VERSION_2_0 = 1;
def GL_BLEND_EQUATION_RGB = 0x8009;
def GL_VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
def GL_VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
def GL_VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
def GL_VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
def GL_CURRENT_VERTEX_ATTRIB = 0x8626;
def GL_VERTEX_PROGRAM_POINT_SIZE = 0x8642;
def GL_VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
def GL_STENCIL_BACK_FUNC = 0x8800;
def GL_STENCIL_BACK_FAIL = 0x8801;
def GL_STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
def GL_STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
def GL_MAX_DRAW_BUFFERS = 0x8824;
def GL_DRAW_BUFFER0 = 0x8825;
def GL_DRAW_BUFFER1 = 0x8826;
def GL_DRAW_BUFFER2 = 0x8827;
def GL_DRAW_BUFFER3 = 0x8828;
def GL_DRAW_BUFFER4 = 0x8829;
def GL_DRAW_BUFFER5 = 0x882A;
def GL_DRAW_BUFFER6 = 0x882B;
def GL_DRAW_BUFFER7 = 0x882C;
def GL_DRAW_BUFFER8 = 0x882D;
def GL_DRAW_BUFFER9 = 0x882E;
def GL_DRAW_BUFFER10 = 0x882F;
def GL_DRAW_BUFFER11 = 0x8830;
def GL_DRAW_BUFFER12 = 0x8831;
def GL_DRAW_BUFFER13 = 0x8832;
def GL_DRAW_BUFFER14 = 0x8833;
def GL_DRAW_BUFFER15 = 0x8834;
def GL_BLEND_EQUATION_ALPHA = 0x883D;
def GL_MAX_VERTEX_ATTRIBS = 0x8869;
def GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
def GL_MAX_TEXTURE_IMAGE_UNITS = 0x8872;
def GL_FRAGMENT_SHADER = 0x8B30;
def GL_VERTEX_SHADER = 0x8B31;
def GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
def GL_MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
def GL_MAX_VARYING_FLOATS = 0x8B4B;
def GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
def GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
def GL_SHADER_TYPE = 0x8B4F;
def GL_FLOAT_VEC2 = 0x8B50;
def GL_FLOAT_VEC3 = 0x8B51;
def GL_FLOAT_VEC4 = 0x8B52;
def GL_INT_VEC2 = 0x8B53;
def GL_INT_VEC3 = 0x8B54;
def GL_INT_VEC4 = 0x8B55;
def GL_BOOL = 0x8B56;
def GL_BOOL_VEC2 = 0x8B57;
def GL_BOOL_VEC3 = 0x8B58;
def GL_BOOL_VEC4 = 0x8B59;
def GL_FLOAT_MAT2 = 0x8B5A;
def GL_FLOAT_MAT3 = 0x8B5B;
def GL_FLOAT_MAT4 = 0x8B5C;
def GL_SAMPLER_1D = 0x8B5D;
def GL_SAMPLER_2D = 0x8B5E;
def GL_SAMPLER_3D = 0x8B5F;
def GL_SAMPLER_CUBE = 0x8B60;
def GL_SAMPLER_1D_SHADOW = 0x8B61;
def GL_SAMPLER_2D_SHADOW = 0x8B62;
def GL_DELETE_STATUS = 0x8B80;
def GL_COMPILE_STATUS = 0x8B81;
def GL_LINK_STATUS = 0x8B82;
def GL_VALIDATE_STATUS = 0x8B83;
def GL_INFO_LOG_LENGTH = 0x8B84;
def GL_ATTACHED_SHADERS = 0x8B85;
def GL_ACTIVE_UNIFORMS = 0x8B86;
def GL_ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87;
def GL_SHADER_SOURCE_LENGTH = 0x8B88;
def GL_ACTIVE_ATTRIBUTES = 0x8B89;
def GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A;
def GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
def GL_SHADING_LANGUAGE_VERSION = 0x8B8C;
def GL_CURRENT_PROGRAM = 0x8B8D;
def GL_POINT_SPRITE_COORD_ORIGIN = 0x8CA0;
def GL_LOWER_LEFT = 0x8CA1;
def GL_UPPER_LEFT = 0x8CA2;
def GL_STENCIL_BACK_REF = 0x8CA3;
def GL_STENCIL_BACK_VALUE_MASK = 0x8CA4;
def GL_STENCIL_BACK_WRITEMASK = 0x8CA5;
def GL_VERTEX_PROGRAM_TWO_SIDE = 0x8643;
def GL_POINT_SPRITE = 0x8861;
def GL_COORD_REPLACE = 0x8862;
def GL_MAX_TEXTURE_COORDS = 0x8871;

def glBlendEquationSeparate_signature func(modeRGB GLenum; modeAlpha GLenum);
var global glBlendEquationSeparate glBlendEquationSeparate_signature;

def glDrawBuffers_signature func(n GLsizei; bufs GLenum ref);
var global glDrawBuffers glDrawBuffers_signature;

def glStencilOpSeparate_signature func(face GLenum; sfail GLenum; dpfail GLenum; dppass GLenum);
var global glStencilOpSeparate glStencilOpSeparate_signature;

def glStencilFuncSeparate_signature func(face GLenum; func GLenum; ref GLint; mask GLuint);
var global glStencilFuncSeparate glStencilFuncSeparate_signature;

def glStencilMaskSeparate_signature func(face GLenum; mask GLuint);
var global glStencilMaskSeparate glStencilMaskSeparate_signature;

def glAttachShader_signature func(program GLuint; shader GLuint);
var global glAttachShader glAttachShader_signature;

def glBindAttribLocation_signature func(program GLuint; index GLuint; name GLchar ref);
var global glBindAttribLocation glBindAttribLocation_signature;

def glCompileShader_signature func(shader GLuint);
var global glCompileShader glCompileShader_signature;

def glCreateProgram_signature func() (result GLuint);
var global glCreateProgram glCreateProgram_signature;

def glCreateShader_signature func(type GLenum) (result GLuint);
var global glCreateShader glCreateShader_signature;

def glDeleteProgram_signature func(program GLuint);
var global glDeleteProgram glDeleteProgram_signature;

def glDeleteShader_signature func(shader GLuint);
var global glDeleteShader glDeleteShader_signature;

def glDetachShader_signature func(program GLuint; shader GLuint);
var global glDetachShader glDetachShader_signature;

def glDisableVertexAttribArray_signature func(index GLuint);
var global glDisableVertexAttribArray glDisableVertexAttribArray_signature;

def glEnableVertexAttribArray_signature func(index GLuint);
var global glEnableVertexAttribArray glEnableVertexAttribArray_signature;

def glGetActiveAttrib_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLchar ref);
var global glGetActiveAttrib glGetActiveAttrib_signature;

def glGetActiveUniform_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLchar ref);
var global glGetActiveUniform glGetActiveUniform_signature;

def glGetAttachedShaders_signature func(program GLuint; maxCount GLsizei; count GLsizei ref; shaders GLuint ref);
var global glGetAttachedShaders glGetAttachedShaders_signature;

def glGetAttribLocation_signature func(program GLuint; name GLchar ref) (result GLint);
var global glGetAttribLocation glGetAttribLocation_signature;

def glGetProgramiv_signature func(program GLuint; pname GLenum; params GLint ref);
var global glGetProgramiv glGetProgramiv_signature;

def glGetProgramInfoLog_signature func(program GLuint; bufSize GLsizei; length GLsizei ref; infoLog GLchar ref);
var global glGetProgramInfoLog glGetProgramInfoLog_signature;

def glGetShaderiv_signature func(shader GLuint; pname GLenum; params GLint ref);
var global glGetShaderiv glGetShaderiv_signature;

def glGetShaderInfoLog_signature func(shader GLuint; bufSize GLsizei; length GLsizei ref; infoLog GLchar ref);
var global glGetShaderInfoLog glGetShaderInfoLog_signature;

def glGetShaderSource_signature func(shader GLuint; bufSize GLsizei; length GLsizei ref; source GLchar ref);
var global glGetShaderSource glGetShaderSource_signature;

def glGetUniformLocation_signature func(program GLuint; name GLchar ref) (result GLint);
var global glGetUniformLocation glGetUniformLocation_signature;

def glGetUniformfv_signature func(program GLuint; location GLint; params GLfloat ref);
var global glGetUniformfv glGetUniformfv_signature;

def glGetUniformiv_signature func(program GLuint; location GLint; params GLint ref);
var global glGetUniformiv glGetUniformiv_signature;

def glGetVertexAttribdv_signature func(index GLuint; pname GLenum; params GLdouble ref);
var global glGetVertexAttribdv glGetVertexAttribdv_signature;

def glGetVertexAttribfv_signature func(index GLuint; pname GLenum; params GLfloat ref);
var global glGetVertexAttribfv glGetVertexAttribfv_signature;

def glGetVertexAttribiv_signature func(index GLuint; pname GLenum; params GLint ref);
var global glGetVertexAttribiv glGetVertexAttribiv_signature;

def glGetVertexAttribPointerv_signature func(index GLuint; pname GLenum; pointer u8 ref ref);
var global glGetVertexAttribPointerv glGetVertexAttribPointerv_signature;

def glIsProgram_signature func(program GLuint) (result GLboolean);
var global glIsProgram glIsProgram_signature;

def glIsShader_signature func(shader GLuint) (result GLboolean);
var global glIsShader glIsShader_signature;

def glLinkProgram_signature func(program GLuint);
var global glLinkProgram glLinkProgram_signature;

def glShaderSource_signature func(shader GLuint; count GLsizei; string GLchar ref ref; length GLint ref);
var global glShaderSource glShaderSource_signature;

def glUseProgram_signature func(program GLuint);
var global glUseProgram glUseProgram_signature;

def glUniform1f_signature func(location GLint; v0 GLfloat);
var global glUniform1f glUniform1f_signature;

def glUniform2f_signature func(location GLint; v0 GLfloat; v1 GLfloat);
var global glUniform2f glUniform2f_signature;

def glUniform3f_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var global glUniform3f glUniform3f_signature;

def glUniform4f_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var global glUniform4f glUniform4f_signature;

def glUniform1i_signature func(location GLint; v0 GLint);
var global glUniform1i glUniform1i_signature;

def glUniform2i_signature func(location GLint; v0 GLint; v1 GLint);
var global glUniform2i glUniform2i_signature;

def glUniform3i_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint);
var global glUniform3i glUniform3i_signature;

def glUniform4i_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var global glUniform4i glUniform4i_signature;

def glUniform1fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform1fv glUniform1fv_signature;

def glUniform2fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform2fv glUniform2fv_signature;

def glUniform3fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform3fv glUniform3fv_signature;

def glUniform4fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform4fv glUniform4fv_signature;

def glUniform1iv_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform1iv glUniform1iv_signature;

def glUniform2iv_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform2iv glUniform2iv_signature;

def glUniform3iv_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform3iv glUniform3iv_signature;

def glUniform4iv_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform4iv glUniform4iv_signature;

def glUniformMatrix2fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix2fv glUniformMatrix2fv_signature;

def glUniformMatrix3fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix3fv glUniformMatrix3fv_signature;

def glUniformMatrix4fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix4fv glUniformMatrix4fv_signature;

def glValidateProgram_signature func(program GLuint);
var global glValidateProgram glValidateProgram_signature;

def glVertexAttrib1d_signature func(index GLuint; x GLdouble);
var global glVertexAttrib1d glVertexAttrib1d_signature;

def glVertexAttrib1dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib1dv glVertexAttrib1dv_signature;

def glVertexAttrib1f_signature func(index GLuint; x GLfloat);
var global glVertexAttrib1f glVertexAttrib1f_signature;

def glVertexAttrib1fv_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib1fv glVertexAttrib1fv_signature;

def glVertexAttrib1s_signature func(index GLuint; x GLshort);
var global glVertexAttrib1s glVertexAttrib1s_signature;

def glVertexAttrib1sv_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib1sv glVertexAttrib1sv_signature;

def glVertexAttrib2d_signature func(index GLuint; x GLdouble; y GLdouble);
var global glVertexAttrib2d glVertexAttrib2d_signature;

def glVertexAttrib2dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib2dv glVertexAttrib2dv_signature;

def glVertexAttrib2f_signature func(index GLuint; x GLfloat; y GLfloat);
var global glVertexAttrib2f glVertexAttrib2f_signature;

def glVertexAttrib2fv_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib2fv glVertexAttrib2fv_signature;

def glVertexAttrib2s_signature func(index GLuint; x GLshort; y GLshort);
var global glVertexAttrib2s glVertexAttrib2s_signature;

def glVertexAttrib2sv_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib2sv glVertexAttrib2sv_signature;

def glVertexAttrib3d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var global glVertexAttrib3d glVertexAttrib3d_signature;

def glVertexAttrib3dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib3dv glVertexAttrib3dv_signature;

def glVertexAttrib3f_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat);
var global glVertexAttrib3f glVertexAttrib3f_signature;

def glVertexAttrib3fv_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib3fv glVertexAttrib3fv_signature;

def glVertexAttrib3s_signature func(index GLuint; x GLshort; y GLshort; z GLshort);
var global glVertexAttrib3s glVertexAttrib3s_signature;

def glVertexAttrib3sv_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib3sv glVertexAttrib3sv_signature;

def glVertexAttrib4Nbv_signature func(index GLuint; v GLbyte ref);
var global glVertexAttrib4Nbv glVertexAttrib4Nbv_signature;

def glVertexAttrib4Niv_signature func(index GLuint; v GLint ref);
var global glVertexAttrib4Niv glVertexAttrib4Niv_signature;

def glVertexAttrib4Nsv_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib4Nsv glVertexAttrib4Nsv_signature;

def glVertexAttrib4Nub_signature func(index GLuint; x GLubyte; y GLubyte; z GLubyte; w GLubyte);
var global glVertexAttrib4Nub glVertexAttrib4Nub_signature;

def glVertexAttrib4Nubv_signature func(index GLuint; v GLubyte ref);
var global glVertexAttrib4Nubv glVertexAttrib4Nubv_signature;

def glVertexAttrib4Nuiv_signature func(index GLuint; v GLuint ref);
var global glVertexAttrib4Nuiv glVertexAttrib4Nuiv_signature;

def glVertexAttrib4Nusv_signature func(index GLuint; v GLushort ref);
var global glVertexAttrib4Nusv glVertexAttrib4Nusv_signature;

def glVertexAttrib4bv_signature func(index GLuint; v GLbyte ref);
var global glVertexAttrib4bv glVertexAttrib4bv_signature;

def glVertexAttrib4d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glVertexAttrib4d glVertexAttrib4d_signature;

def glVertexAttrib4dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib4dv glVertexAttrib4dv_signature;

def glVertexAttrib4f_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glVertexAttrib4f glVertexAttrib4f_signature;

def glVertexAttrib4fv_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib4fv glVertexAttrib4fv_signature;

def glVertexAttrib4iv_signature func(index GLuint; v GLint ref);
var global glVertexAttrib4iv glVertexAttrib4iv_signature;

def glVertexAttrib4s_signature func(index GLuint; x GLshort; y GLshort; z GLshort; w GLshort);
var global glVertexAttrib4s glVertexAttrib4s_signature;

def glVertexAttrib4sv_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib4sv glVertexAttrib4sv_signature;

def glVertexAttrib4ubv_signature func(index GLuint; v GLubyte ref);
var global glVertexAttrib4ubv glVertexAttrib4ubv_signature;

def glVertexAttrib4uiv_signature func(index GLuint; v GLuint ref);
var global glVertexAttrib4uiv glVertexAttrib4uiv_signature;

def glVertexAttrib4usv_signature func(index GLuint; v GLushort ref);
var global glVertexAttrib4usv glVertexAttrib4usv_signature;

def glVertexAttribPointer_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; pointer u8 ref);
var global glVertexAttribPointer glVertexAttribPointer_signature;
def GL_VERSION_2_1 = 1;
def GL_PIXEL_PACK_BUFFER = 0x88EB;
def GL_PIXEL_UNPACK_BUFFER = 0x88EC;
def GL_PIXEL_PACK_BUFFER_BINDING = 0x88ED;
def GL_PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
def GL_FLOAT_MAT2x3 = 0x8B65;
def GL_FLOAT_MAT2x4 = 0x8B66;
def GL_FLOAT_MAT3x2 = 0x8B67;
def GL_FLOAT_MAT3x4 = 0x8B68;
def GL_FLOAT_MAT4x2 = 0x8B69;
def GL_FLOAT_MAT4x3 = 0x8B6A;
def GL_SRGB = 0x8C40;
def GL_SRGB8 = 0x8C41;
def GL_SRGB_ALPHA = 0x8C42;
def GL_SRGB8_ALPHA8 = 0x8C43;
def GL_COMPRESSED_SRGB = 0x8C48;
def GL_COMPRESSED_SRGB_ALPHA = 0x8C49;
def GL_CURRENT_RASTER_SECONDARY_COLOR = 0x845F;
def GL_SLUMINANCE_ALPHA = 0x8C44;
def GL_SLUMINANCE8_ALPHA8 = 0x8C45;
def GL_SLUMINANCE = 0x8C46;
def GL_SLUMINANCE8 = 0x8C47;
def GL_COMPRESSED_SLUMINANCE = 0x8C4A;
def GL_COMPRESSED_SLUMINANCE_ALPHA = 0x8C4B;

def glUniformMatrix2x3fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix2x3fv glUniformMatrix2x3fv_signature;

def glUniformMatrix3x2fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix3x2fv glUniformMatrix3x2fv_signature;

def glUniformMatrix2x4fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix2x4fv glUniformMatrix2x4fv_signature;

def glUniformMatrix4x2fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix4x2fv glUniformMatrix4x2fv_signature;

def glUniformMatrix3x4fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix3x4fv glUniformMatrix3x4fv_signature;

def glUniformMatrix4x3fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix4x3fv glUniformMatrix4x3fv_signature;
def GL_VERSION_3_0 = 1;
def GL_COMPARE_REF_TO_TEXTURE = 0x884E;
def GL_CLIP_DISTANCE0 = 0x3000;
def GL_CLIP_DISTANCE1 = 0x3001;
def GL_CLIP_DISTANCE2 = 0x3002;
def GL_CLIP_DISTANCE3 = 0x3003;
def GL_CLIP_DISTANCE4 = 0x3004;
def GL_CLIP_DISTANCE5 = 0x3005;
def GL_CLIP_DISTANCE6 = 0x3006;
def GL_CLIP_DISTANCE7 = 0x3007;
def GL_MAX_CLIP_DISTANCES = 0x0D32;
def GL_MAJOR_VERSION = 0x821B;
def GL_MINOR_VERSION = 0x821C;
def GL_NUM_EXTENSIONS = 0x821D;
def GL_CONTEXT_FLAGS = 0x821E;
def GL_COMPRESSED_RED = 0x8225;
def GL_COMPRESSED_RG = 0x8226;
def GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x00000001;
def GL_RGBA32F = 0x8814;
def GL_RGB32F = 0x8815;
def GL_RGBA16F = 0x881A;
def GL_RGB16F = 0x881B;
def GL_VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
def GL_MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
def GL_MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
def GL_MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
def GL_CLAMP_READ_COLOR = 0x891C;
def GL_FIXED_ONLY = 0x891D;
def GL_MAX_VARYING_COMPONENTS = 0x8B4B;
def GL_TEXTURE_1D_ARRAY = 0x8C18;
def GL_PROXY_TEXTURE_1D_ARRAY = 0x8C19;
def GL_TEXTURE_2D_ARRAY = 0x8C1A;
def GL_PROXY_TEXTURE_2D_ARRAY = 0x8C1B;
def GL_TEXTURE_BINDING_1D_ARRAY = 0x8C1C;
def GL_TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
def GL_R11F_G11F_B10F = 0x8C3A;
def GL_UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
def GL_RGB9_E5 = 0x8C3D;
def GL_UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
def GL_TEXTURE_SHARED_SIZE = 0x8C3F;
def GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76;
def GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
def GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
def GL_TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
def GL_TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
def GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
def GL_PRIMITIVES_GENERATED = 0x8C87;
def GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
def GL_RASTERIZER_DISCARD = 0x8C89;
def GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
def GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
def GL_INTERLEAVED_ATTRIBS = 0x8C8C;
def GL_SEPARATE_ATTRIBS = 0x8C8D;
def GL_TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
def GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
def GL_RGBA32UI = 0x8D70;
def GL_RGB32UI = 0x8D71;
def GL_RGBA16UI = 0x8D76;
def GL_RGB16UI = 0x8D77;
def GL_RGBA8UI = 0x8D7C;
def GL_RGB8UI = 0x8D7D;
def GL_RGBA32I = 0x8D82;
def GL_RGB32I = 0x8D83;
def GL_RGBA16I = 0x8D88;
def GL_RGB16I = 0x8D89;
def GL_RGBA8I = 0x8D8E;
def GL_RGB8I = 0x8D8F;
def GL_RED_INTEGER = 0x8D94;
def GL_GREEN_INTEGER = 0x8D95;
def GL_BLUE_INTEGER = 0x8D96;
def GL_RGB_INTEGER = 0x8D98;
def GL_RGBA_INTEGER = 0x8D99;
def GL_BGR_INTEGER = 0x8D9A;
def GL_BGRA_INTEGER = 0x8D9B;
def GL_SAMPLER_1D_ARRAY = 0x8DC0;
def GL_SAMPLER_2D_ARRAY = 0x8DC1;
def GL_SAMPLER_1D_ARRAY_SHADOW = 0x8DC3;
def GL_SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
def GL_SAMPLER_CUBE_SHADOW = 0x8DC5;
def GL_UNSIGNED_INT_VEC2 = 0x8DC6;
def GL_UNSIGNED_INT_VEC3 = 0x8DC7;
def GL_UNSIGNED_INT_VEC4 = 0x8DC8;
def GL_INT_SAMPLER_1D = 0x8DC9;
def GL_INT_SAMPLER_2D = 0x8DCA;
def GL_INT_SAMPLER_3D = 0x8DCB;
def GL_INT_SAMPLER_CUBE = 0x8DCC;
def GL_INT_SAMPLER_1D_ARRAY = 0x8DCE;
def GL_INT_SAMPLER_2D_ARRAY = 0x8DCF;
def GL_UNSIGNED_INT_SAMPLER_1D = 0x8DD1;
def GL_UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
def GL_UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
def GL_UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
def GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = 0x8DD6;
def GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
def GL_QUERY_WAIT = 0x8E13;
def GL_QUERY_NO_WAIT = 0x8E14;
def GL_QUERY_BY_REGION_WAIT = 0x8E15;
def GL_QUERY_BY_REGION_NO_WAIT = 0x8E16;
def GL_BUFFER_ACCESS_FLAGS = 0x911F;
def GL_BUFFER_MAP_LENGTH = 0x9120;
def GL_BUFFER_MAP_OFFSET = 0x9121;
def GL_DEPTH_COMPONENT32F = 0x8CAC;
def GL_DEPTH32F_STENCIL8 = 0x8CAD;
def GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
def GL_INVALID_FRAMEBUFFER_OPERATION = 0x0506;
def GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
def GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
def GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
def GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
def GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
def GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
def GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
def GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
def GL_FRAMEBUFFER_DEFAULT = 0x8218;
def GL_FRAMEBUFFER_UNDEFINED = 0x8219;
def GL_DEPTH_STENCIL_ATTACHMENT = 0x821A;
def GL_MAX_RENDERBUFFER_SIZE = 0x84E8;
def GL_DEPTH_STENCIL = 0x84F9;
def GL_UNSIGNED_INT_24_8 = 0x84FA;
def GL_DEPTH24_STENCIL8 = 0x88F0;
def GL_TEXTURE_STENCIL_SIZE = 0x88F1;
def GL_TEXTURE_RED_TYPE = 0x8C10;
def GL_TEXTURE_GREEN_TYPE = 0x8C11;
def GL_TEXTURE_BLUE_TYPE = 0x8C12;
def GL_TEXTURE_ALPHA_TYPE = 0x8C13;
def GL_TEXTURE_DEPTH_TYPE = 0x8C16;
def GL_UNSIGNED_NORMALIZED = 0x8C17;
def GL_FRAMEBUFFER_BINDING = 0x8CA6;
def GL_DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
def GL_RENDERBUFFER_BINDING = 0x8CA7;
def GL_READ_FRAMEBUFFER = 0x8CA8;
def GL_DRAW_FRAMEBUFFER = 0x8CA9;
def GL_READ_FRAMEBUFFER_BINDING = 0x8CAA;
def GL_RENDERBUFFER_SAMPLES = 0x8CAB;
def GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
def GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
def GL_FRAMEBUFFER_COMPLETE = 0x8CD5;
def GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
def GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
def GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB;
def GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC;
def GL_FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
def GL_MAX_COLOR_ATTACHMENTS = 0x8CDF;
def GL_COLOR_ATTACHMENT0 = 0x8CE0;
def GL_COLOR_ATTACHMENT1 = 0x8CE1;
def GL_COLOR_ATTACHMENT2 = 0x8CE2;
def GL_COLOR_ATTACHMENT3 = 0x8CE3;
def GL_COLOR_ATTACHMENT4 = 0x8CE4;
def GL_COLOR_ATTACHMENT5 = 0x8CE5;
def GL_COLOR_ATTACHMENT6 = 0x8CE6;
def GL_COLOR_ATTACHMENT7 = 0x8CE7;
def GL_COLOR_ATTACHMENT8 = 0x8CE8;
def GL_COLOR_ATTACHMENT9 = 0x8CE9;
def GL_COLOR_ATTACHMENT10 = 0x8CEA;
def GL_COLOR_ATTACHMENT11 = 0x8CEB;
def GL_COLOR_ATTACHMENT12 = 0x8CEC;
def GL_COLOR_ATTACHMENT13 = 0x8CED;
def GL_COLOR_ATTACHMENT14 = 0x8CEE;
def GL_COLOR_ATTACHMENT15 = 0x8CEF;
def GL_COLOR_ATTACHMENT16 = 0x8CF0;
def GL_COLOR_ATTACHMENT17 = 0x8CF1;
def GL_COLOR_ATTACHMENT18 = 0x8CF2;
def GL_COLOR_ATTACHMENT19 = 0x8CF3;
def GL_COLOR_ATTACHMENT20 = 0x8CF4;
def GL_COLOR_ATTACHMENT21 = 0x8CF5;
def GL_COLOR_ATTACHMENT22 = 0x8CF6;
def GL_COLOR_ATTACHMENT23 = 0x8CF7;
def GL_COLOR_ATTACHMENT24 = 0x8CF8;
def GL_COLOR_ATTACHMENT25 = 0x8CF9;
def GL_COLOR_ATTACHMENT26 = 0x8CFA;
def GL_COLOR_ATTACHMENT27 = 0x8CFB;
def GL_COLOR_ATTACHMENT28 = 0x8CFC;
def GL_COLOR_ATTACHMENT29 = 0x8CFD;
def GL_COLOR_ATTACHMENT30 = 0x8CFE;
def GL_COLOR_ATTACHMENT31 = 0x8CFF;
def GL_DEPTH_ATTACHMENT = 0x8D00;
def GL_STENCIL_ATTACHMENT = 0x8D20;
def GL_FRAMEBUFFER = 0x8D40;
def GL_RENDERBUFFER = 0x8D41;
def GL_RENDERBUFFER_WIDTH = 0x8D42;
def GL_RENDERBUFFER_HEIGHT = 0x8D43;
def GL_RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
def GL_STENCIL_INDEX1 = 0x8D46;
def GL_STENCIL_INDEX4 = 0x8D47;
def GL_STENCIL_INDEX8 = 0x8D48;
def GL_STENCIL_INDEX16 = 0x8D49;
def GL_RENDERBUFFER_RED_SIZE = 0x8D50;
def GL_RENDERBUFFER_GREEN_SIZE = 0x8D51;
def GL_RENDERBUFFER_BLUE_SIZE = 0x8D52;
def GL_RENDERBUFFER_ALPHA_SIZE = 0x8D53;
def GL_RENDERBUFFER_DEPTH_SIZE = 0x8D54;
def GL_RENDERBUFFER_STENCIL_SIZE = 0x8D55;
def GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
def GL_MAX_SAMPLES = 0x8D57;
def GL_INDEX = 0x8222;
def GL_TEXTURE_LUMINANCE_TYPE = 0x8C14;
def GL_TEXTURE_INTENSITY_TYPE = 0x8C15;
def GL_FRAMEBUFFER_SRGB = 0x8DB9;
def GL_HALF_FLOAT = 0x140B;
def GL_MAP_READ_BIT = 0x0001;
def GL_MAP_WRITE_BIT = 0x0002;
def GL_MAP_INVALIDATE_RANGE_BIT = 0x0004;
def GL_MAP_INVALIDATE_BUFFER_BIT = 0x0008;
def GL_MAP_FLUSH_EXPLICIT_BIT = 0x0010;
def GL_MAP_UNSYNCHRONIZED_BIT = 0x0020;
def GL_COMPRESSED_RED_RGTC1 = 0x8DBB;
def GL_COMPRESSED_SIGNED_RED_RGTC1 = 0x8DBC;
def GL_COMPRESSED_RG_RGTC2 = 0x8DBD;
def GL_COMPRESSED_SIGNED_RG_RGTC2 = 0x8DBE;
def GL_RG = 0x8227;
def GL_RG_INTEGER = 0x8228;
def GL_R8 = 0x8229;
def GL_R16 = 0x822A;
def GL_RG8 = 0x822B;
def GL_RG16 = 0x822C;
def GL_R16F = 0x822D;
def GL_R32F = 0x822E;
def GL_RG16F = 0x822F;
def GL_RG32F = 0x8230;
def GL_R8I = 0x8231;
def GL_R8UI = 0x8232;
def GL_R16I = 0x8233;
def GL_R16UI = 0x8234;
def GL_R32I = 0x8235;
def GL_R32UI = 0x8236;
def GL_RG8I = 0x8237;
def GL_RG8UI = 0x8238;
def GL_RG16I = 0x8239;
def GL_RG16UI = 0x823A;
def GL_RG32I = 0x823B;
def GL_RG32UI = 0x823C;
def GL_VERTEX_ARRAY_BINDING = 0x85B5;
def GL_CLAMP_VERTEX_COLOR = 0x891A;
def GL_CLAMP_FRAGMENT_COLOR = 0x891B;
def GL_ALPHA_INTEGER = 0x8D97;

def glColorMaski_signature func(index GLuint; r GLboolean; g GLboolean; b GLboolean; a GLboolean);
var global glColorMaski glColorMaski_signature;

def glGetBooleani_v_signature func(target GLenum; index GLuint; data GLboolean ref);
var global glGetBooleani_v glGetBooleani_v_signature;

def glGetIntegeri_v_signature func(target GLenum; index GLuint; data GLint ref);
var global glGetIntegeri_v glGetIntegeri_v_signature;

def glEnablei_signature func(target GLenum; index GLuint);
var global glEnablei glEnablei_signature;

def glDisablei_signature func(target GLenum; index GLuint);
var global glDisablei glDisablei_signature;

def glIsEnabledi_signature func(target GLenum; index GLuint) (result GLboolean);
var global glIsEnabledi glIsEnabledi_signature;

def glBeginTransformFeedback_signature func(primitiveMode GLenum);
var global glBeginTransformFeedback glBeginTransformFeedback_signature;

def glEndTransformFeedback_signature func();
var global glEndTransformFeedback glEndTransformFeedback_signature;

def glBindBufferRange_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glBindBufferRange glBindBufferRange_signature;

def glBindBufferBase_signature func(target GLenum; index GLuint; buffer GLuint);
var global glBindBufferBase glBindBufferBase_signature;

def glTransformFeedbackVaryings_signature func(program GLuint; count GLsizei; varyings GLchar ref ref; bufferMode GLenum);
var global glTransformFeedbackVaryings glTransformFeedbackVaryings_signature;

def glGetTransformFeedbackVarying_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLsizei ref; type GLenum ref; name GLchar ref);
var global glGetTransformFeedbackVarying glGetTransformFeedbackVarying_signature;

def glClampColor_signature func(target GLenum; clamp GLenum);
var global glClampColor glClampColor_signature;

def glBeginConditionalRender_signature func(id GLuint; mode GLenum);
var global glBeginConditionalRender glBeginConditionalRender_signature;

def glEndConditionalRender_signature func();
var global glEndConditionalRender glEndConditionalRender_signature;

def glVertexAttribIPointer_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glVertexAttribIPointer glVertexAttribIPointer_signature;

def glGetVertexAttribIiv_signature func(index GLuint; pname GLenum; params GLint ref);
var global glGetVertexAttribIiv glGetVertexAttribIiv_signature;

def glGetVertexAttribIuiv_signature func(index GLuint; pname GLenum; params GLuint ref);
var global glGetVertexAttribIuiv glGetVertexAttribIuiv_signature;

def glVertexAttribI1i_signature func(index GLuint; x GLint);
var global glVertexAttribI1i glVertexAttribI1i_signature;

def glVertexAttribI2i_signature func(index GLuint; x GLint; y GLint);
var global glVertexAttribI2i glVertexAttribI2i_signature;

def glVertexAttribI3i_signature func(index GLuint; x GLint; y GLint; z GLint);
var global glVertexAttribI3i glVertexAttribI3i_signature;

def glVertexAttribI4i_signature func(index GLuint; x GLint; y GLint; z GLint; w GLint);
var global glVertexAttribI4i glVertexAttribI4i_signature;

def glVertexAttribI1ui_signature func(index GLuint; x GLuint);
var global glVertexAttribI1ui glVertexAttribI1ui_signature;

def glVertexAttribI2ui_signature func(index GLuint; x GLuint; y GLuint);
var global glVertexAttribI2ui glVertexAttribI2ui_signature;

def glVertexAttribI3ui_signature func(index GLuint; x GLuint; y GLuint; z GLuint);
var global glVertexAttribI3ui glVertexAttribI3ui_signature;

def glVertexAttribI4ui_signature func(index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var global glVertexAttribI4ui glVertexAttribI4ui_signature;

def glVertexAttribI1iv_signature func(index GLuint; v GLint ref);
var global glVertexAttribI1iv glVertexAttribI1iv_signature;

def glVertexAttribI2iv_signature func(index GLuint; v GLint ref);
var global glVertexAttribI2iv glVertexAttribI2iv_signature;

def glVertexAttribI3iv_signature func(index GLuint; v GLint ref);
var global glVertexAttribI3iv glVertexAttribI3iv_signature;

def glVertexAttribI4iv_signature func(index GLuint; v GLint ref);
var global glVertexAttribI4iv glVertexAttribI4iv_signature;

def glVertexAttribI1uiv_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI1uiv glVertexAttribI1uiv_signature;

def glVertexAttribI2uiv_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI2uiv glVertexAttribI2uiv_signature;

def glVertexAttribI3uiv_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI3uiv glVertexAttribI3uiv_signature;

def glVertexAttribI4uiv_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI4uiv glVertexAttribI4uiv_signature;

def glVertexAttribI4bv_signature func(index GLuint; v GLbyte ref);
var global glVertexAttribI4bv glVertexAttribI4bv_signature;

def glVertexAttribI4sv_signature func(index GLuint; v GLshort ref);
var global glVertexAttribI4sv glVertexAttribI4sv_signature;

def glVertexAttribI4ubv_signature func(index GLuint; v GLubyte ref);
var global glVertexAttribI4ubv glVertexAttribI4ubv_signature;

def glVertexAttribI4usv_signature func(index GLuint; v GLushort ref);
var global glVertexAttribI4usv glVertexAttribI4usv_signature;

def glGetUniformuiv_signature func(program GLuint; location GLint; params GLuint ref);
var global glGetUniformuiv glGetUniformuiv_signature;

def glBindFragDataLocation_signature func(program GLuint; color GLuint; name GLchar ref);
var global glBindFragDataLocation glBindFragDataLocation_signature;

def glGetFragDataLocation_signature func(program GLuint; name GLchar ref) (result GLint);
var global glGetFragDataLocation glGetFragDataLocation_signature;

def glUniform1ui_signature func(location GLint; v0 GLuint);
var global glUniform1ui glUniform1ui_signature;

def glUniform2ui_signature func(location GLint; v0 GLuint; v1 GLuint);
var global glUniform2ui glUniform2ui_signature;

def glUniform3ui_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var global glUniform3ui glUniform3ui_signature;

def glUniform4ui_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var global glUniform4ui glUniform4ui_signature;

def glUniform1uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform1uiv glUniform1uiv_signature;

def glUniform2uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform2uiv glUniform2uiv_signature;

def glUniform3uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform3uiv glUniform3uiv_signature;

def glUniform4uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform4uiv glUniform4uiv_signature;

def glTexParameterIiv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glTexParameterIiv glTexParameterIiv_signature;

def glTexParameterIuiv_signature func(target GLenum; pname GLenum; params GLuint ref);
var global glTexParameterIuiv glTexParameterIuiv_signature;

def glGetTexParameterIiv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetTexParameterIiv glGetTexParameterIiv_signature;

def glGetTexParameterIuiv_signature func(target GLenum; pname GLenum; params GLuint ref);
var global glGetTexParameterIuiv glGetTexParameterIuiv_signature;

def glClearBufferiv_signature func(buffer GLenum; drawbuffer GLint; value GLint ref);
var global glClearBufferiv glClearBufferiv_signature;

def glClearBufferuiv_signature func(buffer GLenum; drawbuffer GLint; value GLuint ref);
var global glClearBufferuiv glClearBufferuiv_signature;

def glClearBufferfv_signature func(buffer GLenum; drawbuffer GLint; value GLfloat ref);
var global glClearBufferfv glClearBufferfv_signature;

def glClearBufferfi_signature func(buffer GLenum; drawbuffer GLint; depth GLfloat; stencil GLint);
var global glClearBufferfi glClearBufferfi_signature;

def glGetStringi_signature func(name GLenum; index GLuint) (result GLubyte ref);
var global glGetStringi glGetStringi_signature;

def glIsRenderbuffer_signature func(renderbuffer GLuint) (result GLboolean);
var global glIsRenderbuffer glIsRenderbuffer_signature;

def glBindRenderbuffer_signature func(target GLenum; renderbuffer GLuint);
var global glBindRenderbuffer glBindRenderbuffer_signature;

def glDeleteRenderbuffers_signature func(n GLsizei; renderbuffers GLuint ref);
var global glDeleteRenderbuffers glDeleteRenderbuffers_signature;

def glGenRenderbuffers_signature func(n GLsizei; renderbuffers GLuint ref);
var global glGenRenderbuffers glGenRenderbuffers_signature;

def glRenderbufferStorage_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei);
var global glRenderbufferStorage glRenderbufferStorage_signature;

def glGetRenderbufferParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetRenderbufferParameteriv glGetRenderbufferParameteriv_signature;

def glIsFramebuffer_signature func(framebuffer GLuint) (result GLboolean);
var global glIsFramebuffer glIsFramebuffer_signature;

def glBindFramebuffer_signature func(target GLenum; framebuffer GLuint);
var global glBindFramebuffer glBindFramebuffer_signature;

def glDeleteFramebuffers_signature func(n GLsizei; framebuffers GLuint ref);
var global glDeleteFramebuffers glDeleteFramebuffers_signature;

def glGenFramebuffers_signature func(n GLsizei; framebuffers GLuint ref);
var global glGenFramebuffers glGenFramebuffers_signature;

def glCheckFramebufferStatus_signature func(target GLenum) (result GLenum);
var global glCheckFramebufferStatus glCheckFramebufferStatus_signature;

def glFramebufferTexture1D_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var global glFramebufferTexture1D glFramebufferTexture1D_signature;

def glFramebufferTexture2D_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var global glFramebufferTexture2D glFramebufferTexture2D_signature;

def glFramebufferTexture3D_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint; zoffset GLint);
var global glFramebufferTexture3D glFramebufferTexture3D_signature;

def glFramebufferRenderbuffer_signature func(target GLenum; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var global glFramebufferRenderbuffer glFramebufferRenderbuffer_signature;

def glGetFramebufferAttachmentParameteriv_signature func(target GLenum; attachment GLenum; pname GLenum; params GLint ref);
var global glGetFramebufferAttachmentParameteriv glGetFramebufferAttachmentParameteriv_signature;

def glGenerateMipmap_signature func(target GLenum);
var global glGenerateMipmap glGenerateMipmap_signature;

def glBlitFramebuffer_signature func(srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var global glBlitFramebuffer glBlitFramebuffer_signature;

def glRenderbufferStorageMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glRenderbufferStorageMultisample glRenderbufferStorageMultisample_signature;

def glFramebufferTextureLayer_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; layer GLint);
var global glFramebufferTextureLayer glFramebufferTextureLayer_signature;

def glMapBufferRange_signature func(target GLenum; offset GLintptr; length GLsizeiptr; access GLbitfield) (result u8 ref);
var global glMapBufferRange glMapBufferRange_signature;

def glFlushMappedBufferRange_signature func(target GLenum; offset GLintptr; length GLsizeiptr);
var global glFlushMappedBufferRange glFlushMappedBufferRange_signature;

def glBindVertexArray_signature func(array GLuint);
var global glBindVertexArray glBindVertexArray_signature;

def glDeleteVertexArrays_signature func(n GLsizei; arrays GLuint ref);
var global glDeleteVertexArrays glDeleteVertexArrays_signature;

def glGenVertexArrays_signature func(n GLsizei; arrays GLuint ref);
var global glGenVertexArrays glGenVertexArrays_signature;

def glIsVertexArray_signature func(array GLuint) (result GLboolean);
var global glIsVertexArray glIsVertexArray_signature;
def GL_VERSION_3_1 = 1;
def GL_SAMPLER_2D_RECT = 0x8B63;
def GL_SAMPLER_2D_RECT_SHADOW = 0x8B64;
def GL_SAMPLER_BUFFER = 0x8DC2;
def GL_INT_SAMPLER_2D_RECT = 0x8DCD;
def GL_INT_SAMPLER_BUFFER = 0x8DD0;
def GL_UNSIGNED_INT_SAMPLER_2D_RECT = 0x8DD5;
def GL_UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8;
def GL_TEXTURE_BUFFER = 0x8C2A;
def GL_MAX_TEXTURE_BUFFER_SIZE = 0x8C2B;
def GL_TEXTURE_BINDING_BUFFER = 0x8C2C;
def GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D;
def GL_TEXTURE_RECTANGLE = 0x84F5;
def GL_TEXTURE_BINDING_RECTANGLE = 0x84F6;
def GL_PROXY_TEXTURE_RECTANGLE = 0x84F7;
def GL_MAX_RECTANGLE_TEXTURE_SIZE = 0x84F8;
def GL_R8_SNORM = 0x8F94;
def GL_RG8_SNORM = 0x8F95;
def GL_RGB8_SNORM = 0x8F96;
def GL_RGBA8_SNORM = 0x8F97;
def GL_R16_SNORM = 0x8F98;
def GL_RG16_SNORM = 0x8F99;
def GL_RGB16_SNORM = 0x8F9A;
def GL_RGBA16_SNORM = 0x8F9B;
def GL_SIGNED_NORMALIZED = 0x8F9C;
def GL_PRIMITIVE_RESTART = 0x8F9D;
def GL_PRIMITIVE_RESTART_INDEX = 0x8F9E;
def GL_COPY_READ_BUFFER = 0x8F36;
def GL_COPY_WRITE_BUFFER = 0x8F37;
def GL_UNIFORM_BUFFER = 0x8A11;
def GL_UNIFORM_BUFFER_BINDING = 0x8A28;
def GL_UNIFORM_BUFFER_START = 0x8A29;
def GL_UNIFORM_BUFFER_SIZE = 0x8A2A;
def GL_MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
def GL_MAX_GEOMETRY_UNIFORM_BLOCKS = 0x8A2C;
def GL_MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
def GL_MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
def GL_MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
def GL_MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
def GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
def GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32;
def GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
def GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
def GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35;
def GL_ACTIVE_UNIFORM_BLOCKS = 0x8A36;
def GL_UNIFORM_TYPE = 0x8A37;
def GL_UNIFORM_SIZE = 0x8A38;
def GL_UNIFORM_NAME_LENGTH = 0x8A39;
def GL_UNIFORM_BLOCK_INDEX = 0x8A3A;
def GL_UNIFORM_OFFSET = 0x8A3B;
def GL_UNIFORM_ARRAY_STRIDE = 0x8A3C;
def GL_UNIFORM_MATRIX_STRIDE = 0x8A3D;
def GL_UNIFORM_IS_ROW_MAJOR = 0x8A3E;
def GL_UNIFORM_BLOCK_BINDING = 0x8A3F;
def GL_UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
def GL_UNIFORM_BLOCK_NAME_LENGTH = 0x8A41;
def GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
def GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
def GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
def GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45;
def GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
def GL_INVALID_INDEX = 0xFFFFFFFF;

def glDrawArraysInstanced_signature func(mode GLenum; first GLint; count GLsizei; instancecount GLsizei);
var global glDrawArraysInstanced glDrawArraysInstanced_signature;

def glDrawElementsInstanced_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei);
var global glDrawElementsInstanced glDrawElementsInstanced_signature;

def glTexBuffer_signature func(target GLenum; internalformat GLenum; buffer GLuint);
var global glTexBuffer glTexBuffer_signature;

def glPrimitiveRestartIndex_signature func(index GLuint);
var global glPrimitiveRestartIndex glPrimitiveRestartIndex_signature;

def glCopyBufferSubData_signature func(readTarget GLenum; writeTarget GLenum; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var global glCopyBufferSubData glCopyBufferSubData_signature;

def glGetUniformIndices_signature func(program GLuint; uniformCount GLsizei; uniformNames GLchar ref ref; uniformIndices GLuint ref);
var global glGetUniformIndices glGetUniformIndices_signature;

def glGetActiveUniformsiv_signature func(program GLuint; uniformCount GLsizei; uniformIndices GLuint ref; pname GLenum; params GLint ref);
var global glGetActiveUniformsiv glGetActiveUniformsiv_signature;

def glGetActiveUniformName_signature func(program GLuint; uniformIndex GLuint; bufSize GLsizei; length GLsizei ref; uniformName GLchar ref);
var global glGetActiveUniformName glGetActiveUniformName_signature;

def glGetUniformBlockIndex_signature func(program GLuint; uniformBlockName GLchar ref) (result GLuint);
var global glGetUniformBlockIndex glGetUniformBlockIndex_signature;

def glGetActiveUniformBlockiv_signature func(program GLuint; uniformBlockIndex GLuint; pname GLenum; params GLint ref);
var global glGetActiveUniformBlockiv glGetActiveUniformBlockiv_signature;

def glGetActiveUniformBlockName_signature func(program GLuint; uniformBlockIndex GLuint; bufSize GLsizei; length GLsizei ref; uniformBlockName GLchar ref);
var global glGetActiveUniformBlockName glGetActiveUniformBlockName_signature;

def glUniformBlockBinding_signature func(program GLuint; uniformBlockIndex GLuint; uniformBlockBinding GLuint);
var global glUniformBlockBinding glUniformBlockBinding_signature;
def GL_VERSION_3_2 = 1;
def GL_CONTEXT_CORE_PROFILE_BIT = 0x00000001;
def GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002;
def GL_LINES_ADJACENCY = 0x000A;
def GL_LINE_STRIP_ADJACENCY = 0x000B;
def GL_TRIANGLES_ADJACENCY = 0x000C;
def GL_TRIANGLE_STRIP_ADJACENCY = 0x000D;
def GL_PROGRAM_POINT_SIZE = 0x8642;
def GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29;
def GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7;
def GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8;
def GL_GEOMETRY_SHADER = 0x8DD9;
def GL_GEOMETRY_VERTICES_OUT = 0x8916;
def GL_GEOMETRY_INPUT_TYPE = 0x8917;
def GL_GEOMETRY_OUTPUT_TYPE = 0x8918;
def GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF;
def GL_MAX_GEOMETRY_OUTPUT_VERTICES = 0x8DE0;
def GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1;
def GL_MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
def GL_MAX_GEOMETRY_INPUT_COMPONENTS = 0x9123;
def GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124;
def GL_MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
def GL_CONTEXT_PROFILE_MASK = 0x9126;
def GL_DEPTH_CLAMP = 0x864F;
def GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C;
def GL_FIRST_VERTEX_CONVENTION = 0x8E4D;
def GL_LAST_VERTEX_CONVENTION = 0x8E4E;
def GL_PROVOKING_VERTEX = 0x8E4F;
def GL_TEXTURE_CUBE_MAP_SEAMLESS = 0x884F;
def GL_MAX_SERVER_WAIT_TIMEOUT = 0x9111;
def GL_OBJECT_TYPE = 0x9112;
def GL_SYNC_CONDITION = 0x9113;
def GL_SYNC_STATUS = 0x9114;
def GL_SYNC_FLAGS = 0x9115;
def GL_SYNC_FENCE = 0x9116;
def GL_SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
def GL_UNSIGNALED = 0x9118;
def GL_SIGNALED = 0x9119;
def GL_ALREADY_SIGNALED = 0x911A;
def GL_TIMEOUT_EXPIRED = 0x911B;
def GL_CONDITION_SATISFIED = 0x911C;
def GL_WAIT_FAILED = 0x911D;
def GL_TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF;
def GL_SYNC_FLUSH_COMMANDS_BIT = 0x00000001;
def GL_SAMPLE_POSITION = 0x8E50;
def GL_SAMPLE_MASK = 0x8E51;
def GL_SAMPLE_MASK_VALUE = 0x8E52;
def GL_MAX_SAMPLE_MASK_WORDS = 0x8E59;
def GL_TEXTURE_2D_MULTISAMPLE = 0x9100;
def GL_PROXY_TEXTURE_2D_MULTISAMPLE = 0x9101;
def GL_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102;
def GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103;
def GL_TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104;
def GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105;
def GL_TEXTURE_SAMPLES = 0x9106;
def GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107;
def GL_SAMPLER_2D_MULTISAMPLE = 0x9108;
def GL_INT_SAMPLER_2D_MULTISAMPLE = 0x9109;
def GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A;
def GL_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B;
def GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C;
def GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D;
def GL_MAX_COLOR_TEXTURE_SAMPLES = 0x910E;
def GL_MAX_DEPTH_TEXTURE_SAMPLES = 0x910F;
def GL_MAX_INTEGER_SAMPLES = 0x9110;

def glDrawElementsBaseVertex_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; basevertex GLint);
var global glDrawElementsBaseVertex glDrawElementsBaseVertex_signature;

def glDrawRangeElementsBaseVertex_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei; type GLenum; indices u8 ref; basevertex GLint);
var global glDrawRangeElementsBaseVertex glDrawRangeElementsBaseVertex_signature;

def glDrawElementsInstancedBaseVertex_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei; basevertex GLint);
var global glDrawElementsInstancedBaseVertex glDrawElementsInstancedBaseVertex_signature;

def glMultiDrawElementsBaseVertex_signature func(mode GLenum; count GLsizei ref; type GLenum; indices u8 ref ref; drawcount GLsizei; basevertex GLint ref);
var global glMultiDrawElementsBaseVertex glMultiDrawElementsBaseVertex_signature;

def glProvokingVertex_signature func(mode GLenum);
var global glProvokingVertex glProvokingVertex_signature;

def glFenceSync_signature func(condition GLenum; flags GLbitfield) (result GLsync);
var global glFenceSync glFenceSync_signature;

def glIsSync_signature func(sync GLsync) (result GLboolean);
var global glIsSync glIsSync_signature;

def glDeleteSync_signature func(sync GLsync);
var global glDeleteSync glDeleteSync_signature;

def glClientWaitSync_signature func(sync GLsync; flags GLbitfield; timeout GLuint64) (result GLenum);
var global glClientWaitSync glClientWaitSync_signature;

def glWaitSync_signature func(sync GLsync; flags GLbitfield; timeout GLuint64);
var global glWaitSync glWaitSync_signature;

def glGetInteger64v_signature func(pname GLenum; data GLint64 ref);
var global glGetInteger64v glGetInteger64v_signature;

def glGetSynciv_signature func(sync GLsync; pname GLenum; count GLsizei; length GLsizei ref; values GLint ref);
var global glGetSynciv glGetSynciv_signature;

def glGetInteger64i_v_signature func(target GLenum; index GLuint; data GLint64 ref);
var global glGetInteger64i_v glGetInteger64i_v_signature;

def glGetBufferParameteri64v_signature func(target GLenum; pname GLenum; params GLint64 ref);
var global glGetBufferParameteri64v glGetBufferParameteri64v_signature;

def glFramebufferTexture_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint);
var global glFramebufferTexture glFramebufferTexture_signature;

def glTexImage2DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var global glTexImage2DMultisample glTexImage2DMultisample_signature;

def glTexImage3DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var global glTexImage3DMultisample glTexImage3DMultisample_signature;

def glGetMultisamplefv_signature func(pname GLenum; index GLuint; val GLfloat ref);
var global glGetMultisamplefv glGetMultisamplefv_signature;

def glSampleMaski_signature func(maskNumber GLuint; mask GLbitfield);
var global glSampleMaski glSampleMaski_signature;
def GL_VERSION_3_3 = 1;
def GL_VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
def GL_SRC1_COLOR = 0x88F9;
def GL_ONE_MINUS_SRC1_COLOR = 0x88FA;
def GL_ONE_MINUS_SRC1_ALPHA = 0x88FB;
def GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = 0x88FC;
def GL_ANY_SAMPLES_PASSED = 0x8C2F;
def GL_SAMPLER_BINDING = 0x8919;
def GL_RGB10_A2UI = 0x906F;
def GL_TEXTURE_SWIZZLE_R = 0x8E42;
def GL_TEXTURE_SWIZZLE_G = 0x8E43;
def GL_TEXTURE_SWIZZLE_B = 0x8E44;
def GL_TEXTURE_SWIZZLE_A = 0x8E45;
def GL_TEXTURE_SWIZZLE_RGBA = 0x8E46;
def GL_TIME_ELAPSED = 0x88BF;
def GL_TIMESTAMP = 0x8E28;
def GL_INT_2_10_10_10_REV = 0x8D9F;

def glBindFragDataLocationIndexed_signature func(program GLuint; colorNumber GLuint; index GLuint; name GLchar ref);
var global glBindFragDataLocationIndexed glBindFragDataLocationIndexed_signature;

def glGetFragDataIndex_signature func(program GLuint; name GLchar ref) (result GLint);
var global glGetFragDataIndex glGetFragDataIndex_signature;

def glGenSamplers_signature func(count GLsizei; samplers GLuint ref);
var global glGenSamplers glGenSamplers_signature;

def glDeleteSamplers_signature func(count GLsizei; samplers GLuint ref);
var global glDeleteSamplers glDeleteSamplers_signature;

def glIsSampler_signature func(sampler GLuint) (result GLboolean);
var global glIsSampler glIsSampler_signature;

def glBindSampler_signature func(unit GLuint; sampler GLuint);
var global glBindSampler glBindSampler_signature;

def glSamplerParameteri_signature func(sampler GLuint; pname GLenum; param GLint);
var global glSamplerParameteri glSamplerParameteri_signature;

def glSamplerParameteriv_signature func(sampler GLuint; pname GLenum; param GLint ref);
var global glSamplerParameteriv glSamplerParameteriv_signature;

def glSamplerParameterf_signature func(sampler GLuint; pname GLenum; param GLfloat);
var global glSamplerParameterf glSamplerParameterf_signature;

def glSamplerParameterfv_signature func(sampler GLuint; pname GLenum; param GLfloat ref);
var global glSamplerParameterfv glSamplerParameterfv_signature;

def glSamplerParameterIiv_signature func(sampler GLuint; pname GLenum; param GLint ref);
var global glSamplerParameterIiv glSamplerParameterIiv_signature;

def glSamplerParameterIuiv_signature func(sampler GLuint; pname GLenum; param GLuint ref);
var global glSamplerParameterIuiv glSamplerParameterIuiv_signature;

def glGetSamplerParameteriv_signature func(sampler GLuint; pname GLenum; params GLint ref);
var global glGetSamplerParameteriv glGetSamplerParameteriv_signature;

def glGetSamplerParameterIiv_signature func(sampler GLuint; pname GLenum; params GLint ref);
var global glGetSamplerParameterIiv glGetSamplerParameterIiv_signature;

def glGetSamplerParameterfv_signature func(sampler GLuint; pname GLenum; params GLfloat ref);
var global glGetSamplerParameterfv glGetSamplerParameterfv_signature;

def glGetSamplerParameterIuiv_signature func(sampler GLuint; pname GLenum; params GLuint ref);
var global glGetSamplerParameterIuiv glGetSamplerParameterIuiv_signature;

def glQueryCounter_signature func(id GLuint; target GLenum);
var global glQueryCounter glQueryCounter_signature;

def glGetQueryObjecti64v_signature func(id GLuint; pname GLenum; params GLint64 ref);
var global glGetQueryObjecti64v glGetQueryObjecti64v_signature;

def glGetQueryObjectui64v_signature func(id GLuint; pname GLenum; params GLuint64 ref);
var global glGetQueryObjectui64v glGetQueryObjectui64v_signature;

def glVertexAttribDivisor_signature func(index GLuint; divisor GLuint);
var global glVertexAttribDivisor glVertexAttribDivisor_signature;

def glVertexAttribP1ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var global glVertexAttribP1ui glVertexAttribP1ui_signature;

def glVertexAttribP1uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var global glVertexAttribP1uiv glVertexAttribP1uiv_signature;

def glVertexAttribP2ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var global glVertexAttribP2ui glVertexAttribP2ui_signature;

def glVertexAttribP2uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var global glVertexAttribP2uiv glVertexAttribP2uiv_signature;

def glVertexAttribP3ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var global glVertexAttribP3ui glVertexAttribP3ui_signature;

def glVertexAttribP3uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var global glVertexAttribP3uiv glVertexAttribP3uiv_signature;

def glVertexAttribP4ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var global glVertexAttribP4ui glVertexAttribP4ui_signature;

def glVertexAttribP4uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var global glVertexAttribP4uiv glVertexAttribP4uiv_signature;

def glVertexP2ui_signature func(type GLenum; value GLuint);
var global glVertexP2ui glVertexP2ui_signature;

def glVertexP2uiv_signature func(type GLenum; value GLuint ref);
var global glVertexP2uiv glVertexP2uiv_signature;

def glVertexP3ui_signature func(type GLenum; value GLuint);
var global glVertexP3ui glVertexP3ui_signature;

def glVertexP3uiv_signature func(type GLenum; value GLuint ref);
var global glVertexP3uiv glVertexP3uiv_signature;

def glVertexP4ui_signature func(type GLenum; value GLuint);
var global glVertexP4ui glVertexP4ui_signature;

def glVertexP4uiv_signature func(type GLenum; value GLuint ref);
var global glVertexP4uiv glVertexP4uiv_signature;

def glTexCoordP1ui_signature func(type GLenum; coords GLuint);
var global glTexCoordP1ui glTexCoordP1ui_signature;

def glTexCoordP1uiv_signature func(type GLenum; coords GLuint ref);
var global glTexCoordP1uiv glTexCoordP1uiv_signature;

def glTexCoordP2ui_signature func(type GLenum; coords GLuint);
var global glTexCoordP2ui glTexCoordP2ui_signature;

def glTexCoordP2uiv_signature func(type GLenum; coords GLuint ref);
var global glTexCoordP2uiv glTexCoordP2uiv_signature;

def glTexCoordP3ui_signature func(type GLenum; coords GLuint);
var global glTexCoordP3ui glTexCoordP3ui_signature;

def glTexCoordP3uiv_signature func(type GLenum; coords GLuint ref);
var global glTexCoordP3uiv glTexCoordP3uiv_signature;

def glTexCoordP4ui_signature func(type GLenum; coords GLuint);
var global glTexCoordP4ui glTexCoordP4ui_signature;

def glTexCoordP4uiv_signature func(type GLenum; coords GLuint ref);
var global glTexCoordP4uiv glTexCoordP4uiv_signature;

def glMultiTexCoordP1ui_signature func(texture GLenum; type GLenum; coords GLuint);
var global glMultiTexCoordP1ui glMultiTexCoordP1ui_signature;

def glMultiTexCoordP1uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var global glMultiTexCoordP1uiv glMultiTexCoordP1uiv_signature;

def glMultiTexCoordP2ui_signature func(texture GLenum; type GLenum; coords GLuint);
var global glMultiTexCoordP2ui glMultiTexCoordP2ui_signature;

def glMultiTexCoordP2uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var global glMultiTexCoordP2uiv glMultiTexCoordP2uiv_signature;

def glMultiTexCoordP3ui_signature func(texture GLenum; type GLenum; coords GLuint);
var global glMultiTexCoordP3ui glMultiTexCoordP3ui_signature;

def glMultiTexCoordP3uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var global glMultiTexCoordP3uiv glMultiTexCoordP3uiv_signature;

def glMultiTexCoordP4ui_signature func(texture GLenum; type GLenum; coords GLuint);
var global glMultiTexCoordP4ui glMultiTexCoordP4ui_signature;

def glMultiTexCoordP4uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var global glMultiTexCoordP4uiv glMultiTexCoordP4uiv_signature;

def glNormalP3ui_signature func(type GLenum; coords GLuint);
var global glNormalP3ui glNormalP3ui_signature;

def glNormalP3uiv_signature func(type GLenum; coords GLuint ref);
var global glNormalP3uiv glNormalP3uiv_signature;

def glColorP3ui_signature func(type GLenum; color GLuint);
var global glColorP3ui glColorP3ui_signature;

def glColorP3uiv_signature func(type GLenum; color GLuint ref);
var global glColorP3uiv glColorP3uiv_signature;

def glColorP4ui_signature func(type GLenum; color GLuint);
var global glColorP4ui glColorP4ui_signature;

def glColorP4uiv_signature func(type GLenum; color GLuint ref);
var global glColorP4uiv glColorP4uiv_signature;

def glSecondaryColorP3ui_signature func(type GLenum; color GLuint);
var global glSecondaryColorP3ui glSecondaryColorP3ui_signature;

def glSecondaryColorP3uiv_signature func(type GLenum; color GLuint ref);
var global glSecondaryColorP3uiv glSecondaryColorP3uiv_signature;
def GL_VERSION_4_0 = 1;
def GL_SAMPLE_SHADING = 0x8C36;
def GL_MIN_SAMPLE_SHADING_VALUE = 0x8C37;
def GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5E;
def GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5F;
def GL_TEXTURE_CUBE_MAP_ARRAY = 0x9009;
def GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = 0x900A;
def GL_PROXY_TEXTURE_CUBE_MAP_ARRAY = 0x900B;
def GL_SAMPLER_CUBE_MAP_ARRAY = 0x900C;
def GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW = 0x900D;
def GL_INT_SAMPLER_CUBE_MAP_ARRAY = 0x900E;
def GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = 0x900F;
def GL_DRAW_INDIRECT_BUFFER = 0x8F3F;
def GL_DRAW_INDIRECT_BUFFER_BINDING = 0x8F43;
def GL_GEOMETRY_SHADER_INVOCATIONS = 0x887F;
def GL_MAX_GEOMETRY_SHADER_INVOCATIONS = 0x8E5A;
def GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5B;
def GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5C;
def GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = 0x8E5D;
def GL_MAX_VERTEX_STREAMS = 0x8E71;
def GL_DOUBLE_VEC2 = 0x8FFC;
def GL_DOUBLE_VEC3 = 0x8FFD;
def GL_DOUBLE_VEC4 = 0x8FFE;
def GL_DOUBLE_MAT2 = 0x8F46;
def GL_DOUBLE_MAT3 = 0x8F47;
def GL_DOUBLE_MAT4 = 0x8F48;
def GL_DOUBLE_MAT2x3 = 0x8F49;
def GL_DOUBLE_MAT2x4 = 0x8F4A;
def GL_DOUBLE_MAT3x2 = 0x8F4B;
def GL_DOUBLE_MAT3x4 = 0x8F4C;
def GL_DOUBLE_MAT4x2 = 0x8F4D;
def GL_DOUBLE_MAT4x3 = 0x8F4E;
def GL_ACTIVE_SUBROUTINES = 0x8DE5;
def GL_ACTIVE_SUBROUTINE_UNIFORMS = 0x8DE6;
def GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = 0x8E47;
def GL_ACTIVE_SUBROUTINE_MAX_LENGTH = 0x8E48;
def GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = 0x8E49;
def GL_MAX_SUBROUTINES = 0x8DE7;
def GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = 0x8DE8;
def GL_NUM_COMPATIBLE_SUBROUTINES = 0x8E4A;
def GL_COMPATIBLE_SUBROUTINES = 0x8E4B;
def GL_PATCHES = 0x000E;
def GL_PATCH_VERTICES = 0x8E72;
def GL_PATCH_DEFAULT_INNER_LEVEL = 0x8E73;
def GL_PATCH_DEFAULT_OUTER_LEVEL = 0x8E74;
def GL_TESS_CONTROL_OUTPUT_VERTICES = 0x8E75;
def GL_TESS_GEN_MODE = 0x8E76;
def GL_TESS_GEN_SPACING = 0x8E77;
def GL_TESS_GEN_VERTEX_ORDER = 0x8E78;
def GL_TESS_GEN_POINT_MODE = 0x8E79;
def GL_ISOLINES = 0x8E7A;
def GL_FRACTIONAL_ODD = 0x8E7B;
def GL_FRACTIONAL_EVEN = 0x8E7C;
def GL_MAX_PATCH_VERTICES = 0x8E7D;
def GL_MAX_TESS_GEN_LEVEL = 0x8E7E;
def GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E7F;
def GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E80;
def GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = 0x8E81;
def GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = 0x8E82;
def GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = 0x8E83;
def GL_MAX_TESS_PATCH_COMPONENTS = 0x8E84;
def GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = 0x8E85;
def GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = 0x8E86;
def GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = 0x8E89;
def GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = 0x8E8A;
def GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = 0x886C;
def GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = 0x886D;
def GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E1E;
def GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E1F;
def GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = 0x84F0;
def GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x84F1;
def GL_TESS_EVALUATION_SHADER = 0x8E87;
def GL_TESS_CONTROL_SHADER = 0x8E88;
def GL_TRANSFORM_FEEDBACK = 0x8E22;
def GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = 0x8E23;
def GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = 0x8E24;
def GL_TRANSFORM_FEEDBACK_BINDING = 0x8E25;
def GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = 0x8E70;

def glMinSampleShading_signature func(value GLfloat);
var global glMinSampleShading glMinSampleShading_signature;

def glBlendEquationi_signature func(buf GLuint; mode GLenum);
var global glBlendEquationi glBlendEquationi_signature;

def glBlendEquationSeparatei_signature func(buf GLuint; modeRGB GLenum; modeAlpha GLenum);
var global glBlendEquationSeparatei glBlendEquationSeparatei_signature;

def glBlendFunci_signature func(buf GLuint; src GLenum; dst GLenum);
var global glBlendFunci glBlendFunci_signature;

def glBlendFuncSeparatei_signature func(buf GLuint; srcRGB GLenum; dstRGB GLenum; srcAlpha GLenum; dstAlpha GLenum);
var global glBlendFuncSeparatei glBlendFuncSeparatei_signature;

def glDrawArraysIndirect_signature func(mode GLenum; indirect u8 ref);
var global glDrawArraysIndirect glDrawArraysIndirect_signature;

def glDrawElementsIndirect_signature func(mode GLenum; type GLenum; indirect u8 ref);
var global glDrawElementsIndirect glDrawElementsIndirect_signature;

def glUniform1d_signature func(location GLint; x GLdouble);
var global glUniform1d glUniform1d_signature;

def glUniform2d_signature func(location GLint; x GLdouble; y GLdouble);
var global glUniform2d glUniform2d_signature;

def glUniform3d_signature func(location GLint; x GLdouble; y GLdouble; z GLdouble);
var global glUniform3d glUniform3d_signature;

def glUniform4d_signature func(location GLint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glUniform4d glUniform4d_signature;

def glUniform1dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var global glUniform1dv glUniform1dv_signature;

def glUniform2dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var global glUniform2dv glUniform2dv_signature;

def glUniform3dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var global glUniform3dv glUniform3dv_signature;

def glUniform4dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var global glUniform4dv glUniform4dv_signature;

def glUniformMatrix2dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix2dv glUniformMatrix2dv_signature;

def glUniformMatrix3dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix3dv glUniformMatrix3dv_signature;

def glUniformMatrix4dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix4dv glUniformMatrix4dv_signature;

def glUniformMatrix2x3dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix2x3dv glUniformMatrix2x3dv_signature;

def glUniformMatrix2x4dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix2x4dv glUniformMatrix2x4dv_signature;

def glUniformMatrix3x2dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix3x2dv glUniformMatrix3x2dv_signature;

def glUniformMatrix3x4dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix3x4dv glUniformMatrix3x4dv_signature;

def glUniformMatrix4x2dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix4x2dv glUniformMatrix4x2dv_signature;

def glUniformMatrix4x3dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glUniformMatrix4x3dv glUniformMatrix4x3dv_signature;

def glGetUniformdv_signature func(program GLuint; location GLint; params GLdouble ref);
var global glGetUniformdv glGetUniformdv_signature;

def glGetSubroutineUniformLocation_signature func(program GLuint; shadertype GLenum; name GLchar ref) (result GLint);
var global glGetSubroutineUniformLocation glGetSubroutineUniformLocation_signature;

def glGetSubroutineIndex_signature func(program GLuint; shadertype GLenum; name GLchar ref) (result GLuint);
var global glGetSubroutineIndex glGetSubroutineIndex_signature;

def glGetActiveSubroutineUniformiv_signature func(program GLuint; shadertype GLenum; index GLuint; pname GLenum; values GLint ref);
var global glGetActiveSubroutineUniformiv glGetActiveSubroutineUniformiv_signature;

def glGetActiveSubroutineUniformName_signature func(program GLuint; shadertype GLenum; index GLuint; bufSize GLsizei; length GLsizei ref; name GLchar ref);
var global glGetActiveSubroutineUniformName glGetActiveSubroutineUniformName_signature;

def glGetActiveSubroutineName_signature func(program GLuint; shadertype GLenum; index GLuint; bufSize GLsizei; length GLsizei ref; name GLchar ref);
var global glGetActiveSubroutineName glGetActiveSubroutineName_signature;

def glUniformSubroutinesuiv_signature func(shadertype GLenum; count GLsizei; indices GLuint ref);
var global glUniformSubroutinesuiv glUniformSubroutinesuiv_signature;

def glGetUniformSubroutineuiv_signature func(shadertype GLenum; location GLint; params GLuint ref);
var global glGetUniformSubroutineuiv glGetUniformSubroutineuiv_signature;

def glGetProgramStageiv_signature func(program GLuint; shadertype GLenum; pname GLenum; values GLint ref);
var global glGetProgramStageiv glGetProgramStageiv_signature;

def glPatchParameteri_signature func(pname GLenum; value GLint);
var global glPatchParameteri glPatchParameteri_signature;

def glPatchParameterfv_signature func(pname GLenum; values GLfloat ref);
var global glPatchParameterfv glPatchParameterfv_signature;

def glBindTransformFeedback_signature func(target GLenum; id GLuint);
var global glBindTransformFeedback glBindTransformFeedback_signature;

def glDeleteTransformFeedbacks_signature func(n GLsizei; ids GLuint ref);
var global glDeleteTransformFeedbacks glDeleteTransformFeedbacks_signature;

def glGenTransformFeedbacks_signature func(n GLsizei; ids GLuint ref);
var global glGenTransformFeedbacks glGenTransformFeedbacks_signature;

def glIsTransformFeedback_signature func(id GLuint) (result GLboolean);
var global glIsTransformFeedback glIsTransformFeedback_signature;

def glPauseTransformFeedback_signature func();
var global glPauseTransformFeedback glPauseTransformFeedback_signature;

def glResumeTransformFeedback_signature func();
var global glResumeTransformFeedback glResumeTransformFeedback_signature;

def glDrawTransformFeedback_signature func(mode GLenum; id GLuint);
var global glDrawTransformFeedback glDrawTransformFeedback_signature;

def glDrawTransformFeedbackStream_signature func(mode GLenum; id GLuint; stream GLuint);
var global glDrawTransformFeedbackStream glDrawTransformFeedbackStream_signature;

def glBeginQueryIndexed_signature func(target GLenum; index GLuint; id GLuint);
var global glBeginQueryIndexed glBeginQueryIndexed_signature;

def glEndQueryIndexed_signature func(target GLenum; index GLuint);
var global glEndQueryIndexed glEndQueryIndexed_signature;

def glGetQueryIndexediv_signature func(target GLenum; index GLuint; pname GLenum; params GLint ref);
var global glGetQueryIndexediv glGetQueryIndexediv_signature;
def GL_VERSION_4_1 = 1;
def GL_FIXED = 0x140C;
def GL_IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
def GL_IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
def GL_LOW_FLOAT = 0x8DF0;
def GL_MEDIUM_FLOAT = 0x8DF1;
def GL_HIGH_FLOAT = 0x8DF2;
def GL_LOW_INT = 0x8DF3;
def GL_MEDIUM_INT = 0x8DF4;
def GL_HIGH_INT = 0x8DF5;
def GL_SHADER_COMPILER = 0x8DFA;
def GL_SHADER_BINARY_FORMATS = 0x8DF8;
def GL_NUM_SHADER_BINARY_FORMATS = 0x8DF9;
def GL_MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
def GL_MAX_VARYING_VECTORS = 0x8DFC;
def GL_MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
def GL_RGB565 = 0x8D62;
def GL_PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257;
def GL_PROGRAM_BINARY_LENGTH = 0x8741;
def GL_NUM_PROGRAM_BINARY_FORMATS = 0x87FE;
def GL_PROGRAM_BINARY_FORMATS = 0x87FF;
def GL_VERTEX_SHADER_BIT = 0x00000001;
def GL_FRAGMENT_SHADER_BIT = 0x00000002;
def GL_GEOMETRY_SHADER_BIT = 0x00000004;
def GL_TESS_CONTROL_SHADER_BIT = 0x00000008;
def GL_TESS_EVALUATION_SHADER_BIT = 0x00000010;
def GL_ALL_SHADER_BITS = 0xFFFFFFFF;
def GL_PROGRAM_SEPARABLE = 0x8258;
def GL_ACTIVE_PROGRAM = 0x8259;
def GL_PROGRAM_PIPELINE_BINDING = 0x825A;
def GL_MAX_VIEWPORTS = 0x825B;
def GL_VIEWPORT_SUBPIXEL_BITS = 0x825C;
def GL_VIEWPORT_BOUNDS_RANGE = 0x825D;
def GL_LAYER_PROVOKING_VERTEX = 0x825E;
def GL_VIEWPORT_INDEX_PROVOKING_VERTEX = 0x825F;
def GL_UNDEFINED_VERTEX = 0x8260;

def glReleaseShaderCompiler_signature func();
var global glReleaseShaderCompiler glReleaseShaderCompiler_signature;

def glShaderBinary_signature func(count GLsizei; shaders GLuint ref; binaryFormat GLenum; binary u8 ref; length GLsizei);
var global glShaderBinary glShaderBinary_signature;

def glGetShaderPrecisionFormat_signature func(shadertype GLenum; precisiontype GLenum; range GLint ref; precision GLint ref);
var global glGetShaderPrecisionFormat glGetShaderPrecisionFormat_signature;

def glDepthRangef_signature func(n GLfloat; f GLfloat);
var global glDepthRangef glDepthRangef_signature;

def glClearDepthf_signature func(d GLfloat);
var global glClearDepthf glClearDepthf_signature;

def glGetProgramBinary_signature func(program GLuint; bufSize GLsizei; length GLsizei ref; binaryFormat GLenum ref; binary u8 ref);
var global glGetProgramBinary glGetProgramBinary_signature;

def glProgramBinary_signature func(program GLuint; binaryFormat GLenum; binary u8 ref; length GLsizei);
var global glProgramBinary glProgramBinary_signature;

def glProgramParameteri_signature func(program GLuint; pname GLenum; value GLint);
var global glProgramParameteri glProgramParameteri_signature;

def glUseProgramStages_signature func(pipeline GLuint; stages GLbitfield; program GLuint);
var global glUseProgramStages glUseProgramStages_signature;

def glActiveShaderProgram_signature func(pipeline GLuint; program GLuint);
var global glActiveShaderProgram glActiveShaderProgram_signature;

def glCreateShaderProgramv_signature func(type GLenum; count GLsizei; strings GLchar ref ref) (result GLuint);
var global glCreateShaderProgramv glCreateShaderProgramv_signature;

def glBindProgramPipeline_signature func(pipeline GLuint);
var global glBindProgramPipeline glBindProgramPipeline_signature;

def glDeleteProgramPipelines_signature func(n GLsizei; pipelines GLuint ref);
var global glDeleteProgramPipelines glDeleteProgramPipelines_signature;

def glGenProgramPipelines_signature func(n GLsizei; pipelines GLuint ref);
var global glGenProgramPipelines glGenProgramPipelines_signature;

def glIsProgramPipeline_signature func(pipeline GLuint) (result GLboolean);
var global glIsProgramPipeline glIsProgramPipeline_signature;

def glGetProgramPipelineiv_signature func(pipeline GLuint; pname GLenum; params GLint ref);
var global glGetProgramPipelineiv glGetProgramPipelineiv_signature;

def glProgramUniform1i_signature func(program GLuint; location GLint; v0 GLint);
var global glProgramUniform1i glProgramUniform1i_signature;

def glProgramUniform1iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform1iv glProgramUniform1iv_signature;

def glProgramUniform1f_signature func(program GLuint; location GLint; v0 GLfloat);
var global glProgramUniform1f glProgramUniform1f_signature;

def glProgramUniform1fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform1fv glProgramUniform1fv_signature;

def glProgramUniform1d_signature func(program GLuint; location GLint; v0 GLdouble);
var global glProgramUniform1d glProgramUniform1d_signature;

def glProgramUniform1dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform1dv glProgramUniform1dv_signature;

def glProgramUniform1ui_signature func(program GLuint; location GLint; v0 GLuint);
var global glProgramUniform1ui glProgramUniform1ui_signature;

def glProgramUniform1uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform1uiv glProgramUniform1uiv_signature;

def glProgramUniform2i_signature func(program GLuint; location GLint; v0 GLint; v1 GLint);
var global glProgramUniform2i glProgramUniform2i_signature;

def glProgramUniform2iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform2iv glProgramUniform2iv_signature;

def glProgramUniform2f_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat);
var global glProgramUniform2f glProgramUniform2f_signature;

def glProgramUniform2fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform2fv glProgramUniform2fv_signature;

def glProgramUniform2d_signature func(program GLuint; location GLint; v0 GLdouble; v1 GLdouble);
var global glProgramUniform2d glProgramUniform2d_signature;

def glProgramUniform2dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform2dv glProgramUniform2dv_signature;

def glProgramUniform2ui_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint);
var global glProgramUniform2ui glProgramUniform2ui_signature;

def glProgramUniform2uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform2uiv glProgramUniform2uiv_signature;

def glProgramUniform3i_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint);
var global glProgramUniform3i glProgramUniform3i_signature;

def glProgramUniform3iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform3iv glProgramUniform3iv_signature;

def glProgramUniform3f_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var global glProgramUniform3f glProgramUniform3f_signature;

def glProgramUniform3fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform3fv glProgramUniform3fv_signature;

def glProgramUniform3d_signature func(program GLuint; location GLint; v0 GLdouble; v1 GLdouble; v2 GLdouble);
var global glProgramUniform3d glProgramUniform3d_signature;

def glProgramUniform3dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform3dv glProgramUniform3dv_signature;

def glProgramUniform3ui_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var global glProgramUniform3ui glProgramUniform3ui_signature;

def glProgramUniform3uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform3uiv glProgramUniform3uiv_signature;

def glProgramUniform4i_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var global glProgramUniform4i glProgramUniform4i_signature;

def glProgramUniform4iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform4iv glProgramUniform4iv_signature;

def glProgramUniform4f_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var global glProgramUniform4f glProgramUniform4f_signature;

def glProgramUniform4fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform4fv glProgramUniform4fv_signature;

def glProgramUniform4d_signature func(program GLuint; location GLint; v0 GLdouble; v1 GLdouble; v2 GLdouble; v3 GLdouble);
var global glProgramUniform4d glProgramUniform4d_signature;

def glProgramUniform4dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform4dv glProgramUniform4dv_signature;

def glProgramUniform4ui_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var global glProgramUniform4ui glProgramUniform4ui_signature;

def glProgramUniform4uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform4uiv glProgramUniform4uiv_signature;

def glProgramUniformMatrix2fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix2fv glProgramUniformMatrix2fv_signature;

def glProgramUniformMatrix3fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix3fv glProgramUniformMatrix3fv_signature;

def glProgramUniformMatrix4fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix4fv glProgramUniformMatrix4fv_signature;

def glProgramUniformMatrix2dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix2dv glProgramUniformMatrix2dv_signature;

def glProgramUniformMatrix3dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix3dv glProgramUniformMatrix3dv_signature;

def glProgramUniformMatrix4dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix4dv glProgramUniformMatrix4dv_signature;

def glProgramUniformMatrix2x3fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix2x3fv glProgramUniformMatrix2x3fv_signature;

def glProgramUniformMatrix3x2fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix3x2fv glProgramUniformMatrix3x2fv_signature;

def glProgramUniformMatrix2x4fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix2x4fv glProgramUniformMatrix2x4fv_signature;

def glProgramUniformMatrix4x2fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix4x2fv glProgramUniformMatrix4x2fv_signature;

def glProgramUniformMatrix3x4fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix3x4fv glProgramUniformMatrix3x4fv_signature;

def glProgramUniformMatrix4x3fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix4x3fv glProgramUniformMatrix4x3fv_signature;

def glProgramUniformMatrix2x3dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix2x3dv glProgramUniformMatrix2x3dv_signature;

def glProgramUniformMatrix3x2dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix3x2dv glProgramUniformMatrix3x2dv_signature;

def glProgramUniformMatrix2x4dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix2x4dv glProgramUniformMatrix2x4dv_signature;

def glProgramUniformMatrix4x2dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix4x2dv glProgramUniformMatrix4x2dv_signature;

def glProgramUniformMatrix3x4dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix3x4dv glProgramUniformMatrix3x4dv_signature;

def glProgramUniformMatrix4x3dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix4x3dv glProgramUniformMatrix4x3dv_signature;

def glValidateProgramPipeline_signature func(pipeline GLuint);
var global glValidateProgramPipeline glValidateProgramPipeline_signature;

def glGetProgramPipelineInfoLog_signature func(pipeline GLuint; bufSize GLsizei; length GLsizei ref; infoLog GLchar ref);
var global glGetProgramPipelineInfoLog glGetProgramPipelineInfoLog_signature;

def glVertexAttribL1d_signature func(index GLuint; x GLdouble);
var global glVertexAttribL1d glVertexAttribL1d_signature;

def glVertexAttribL2d_signature func(index GLuint; x GLdouble; y GLdouble);
var global glVertexAttribL2d glVertexAttribL2d_signature;

def glVertexAttribL3d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var global glVertexAttribL3d glVertexAttribL3d_signature;

def glVertexAttribL4d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glVertexAttribL4d glVertexAttribL4d_signature;

def glVertexAttribL1dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL1dv glVertexAttribL1dv_signature;

def glVertexAttribL2dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL2dv glVertexAttribL2dv_signature;

def glVertexAttribL3dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL3dv glVertexAttribL3dv_signature;

def glVertexAttribL4dv_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL4dv glVertexAttribL4dv_signature;

def glVertexAttribLPointer_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glVertexAttribLPointer glVertexAttribLPointer_signature;

def glGetVertexAttribLdv_signature func(index GLuint; pname GLenum; params GLdouble ref);
var global glGetVertexAttribLdv glGetVertexAttribLdv_signature;

def glViewportArrayv_signature func(first GLuint; count GLsizei; v GLfloat ref);
var global glViewportArrayv glViewportArrayv_signature;

def glViewportIndexedf_signature func(index GLuint; x GLfloat; y GLfloat; w GLfloat; h GLfloat);
var global glViewportIndexedf glViewportIndexedf_signature;

def glViewportIndexedfv_signature func(index GLuint; v GLfloat ref);
var global glViewportIndexedfv glViewportIndexedfv_signature;

def glScissorArrayv_signature func(first GLuint; count GLsizei; v GLint ref);
var global glScissorArrayv glScissorArrayv_signature;

def glScissorIndexed_signature func(index GLuint; left GLint; bottom GLint; width GLsizei; height GLsizei);
var global glScissorIndexed glScissorIndexed_signature;

def glScissorIndexedv_signature func(index GLuint; v GLint ref);
var global glScissorIndexedv glScissorIndexedv_signature;

def glDepthRangeArrayv_signature func(first GLuint; count GLsizei; v GLdouble ref);
var global glDepthRangeArrayv glDepthRangeArrayv_signature;

def glDepthRangeIndexed_signature func(index GLuint; n GLdouble; f GLdouble);
var global glDepthRangeIndexed glDepthRangeIndexed_signature;

def glGetFloati_v_signature func(target GLenum; index GLuint; data GLfloat ref);
var global glGetFloati_v glGetFloati_v_signature;

def glGetDoublei_v_signature func(target GLenum; index GLuint; data GLdouble ref);
var global glGetDoublei_v glGetDoublei_v_signature;
def GL_VERSION_4_2 = 1;
def GL_COPY_READ_BUFFER_BINDING = 0x8F36;
def GL_COPY_WRITE_BUFFER_BINDING = 0x8F37;
def GL_TRANSFORM_FEEDBACK_ACTIVE = 0x8E24;
def GL_TRANSFORM_FEEDBACK_PAUSED = 0x8E23;
def GL_UNPACK_COMPRESSED_BLOCK_WIDTH = 0x9127;
def GL_UNPACK_COMPRESSED_BLOCK_HEIGHT = 0x9128;
def GL_UNPACK_COMPRESSED_BLOCK_DEPTH = 0x9129;
def GL_UNPACK_COMPRESSED_BLOCK_SIZE = 0x912A;
def GL_PACK_COMPRESSED_BLOCK_WIDTH = 0x912B;
def GL_PACK_COMPRESSED_BLOCK_HEIGHT = 0x912C;
def GL_PACK_COMPRESSED_BLOCK_DEPTH = 0x912D;
def GL_PACK_COMPRESSED_BLOCK_SIZE = 0x912E;
def GL_NUM_SAMPLE_COUNTS = 0x9380;
def GL_MIN_MAP_BUFFER_ALIGNMENT = 0x90BC;
def GL_ATOMIC_COUNTER_BUFFER = 0x92C0;
def GL_ATOMIC_COUNTER_BUFFER_BINDING = 0x92C1;
def GL_ATOMIC_COUNTER_BUFFER_START = 0x92C2;
def GL_ATOMIC_COUNTER_BUFFER_SIZE = 0x92C3;
def GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE = 0x92C4;
def GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS = 0x92C5;
def GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES = 0x92C6;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER = 0x92C7;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER = 0x92C8;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x92C9;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER = 0x92CA;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER = 0x92CB;
def GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = 0x92CC;
def GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = 0x92CD;
def GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = 0x92CE;
def GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = 0x92CF;
def GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = 0x92D0;
def GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = 0x92D1;
def GL_MAX_VERTEX_ATOMIC_COUNTERS = 0x92D2;
def GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS = 0x92D3;
def GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS = 0x92D4;
def GL_MAX_GEOMETRY_ATOMIC_COUNTERS = 0x92D5;
def GL_MAX_FRAGMENT_ATOMIC_COUNTERS = 0x92D6;
def GL_MAX_COMBINED_ATOMIC_COUNTERS = 0x92D7;
def GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE = 0x92D8;
def GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = 0x92DC;
def GL_ACTIVE_ATOMIC_COUNTER_BUFFERS = 0x92D9;
def GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX = 0x92DA;
def GL_UNSIGNED_INT_ATOMIC_COUNTER = 0x92DB;
def GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT = 0x00000001;
def GL_ELEMENT_ARRAY_BARRIER_BIT = 0x00000002;
def GL_UNIFORM_BARRIER_BIT = 0x00000004;
def GL_TEXTURE_FETCH_BARRIER_BIT = 0x00000008;
def GL_SHADER_IMAGE_ACCESS_BARRIER_BIT = 0x00000020;
def GL_COMMAND_BARRIER_BIT = 0x00000040;
def GL_PIXEL_BUFFER_BARRIER_BIT = 0x00000080;
def GL_TEXTURE_UPDATE_BARRIER_BIT = 0x00000100;
def GL_BUFFER_UPDATE_BARRIER_BIT = 0x00000200;
def GL_FRAMEBUFFER_BARRIER_BIT = 0x00000400;
def GL_TRANSFORM_FEEDBACK_BARRIER_BIT = 0x00000800;
def GL_ATOMIC_COUNTER_BARRIER_BIT = 0x00001000;
def GL_ALL_BARRIER_BITS = 0xFFFFFFFF;
def GL_MAX_IMAGE_UNITS = 0x8F38;
def GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS = 0x8F39;
def GL_IMAGE_BINDING_NAME = 0x8F3A;
def GL_IMAGE_BINDING_LEVEL = 0x8F3B;
def GL_IMAGE_BINDING_LAYERED = 0x8F3C;
def GL_IMAGE_BINDING_LAYER = 0x8F3D;
def GL_IMAGE_BINDING_ACCESS = 0x8F3E;
def GL_IMAGE_1D = 0x904C;
def GL_IMAGE_2D = 0x904D;
def GL_IMAGE_3D = 0x904E;
def GL_IMAGE_2D_RECT = 0x904F;
def GL_IMAGE_CUBE = 0x9050;
def GL_IMAGE_BUFFER = 0x9051;
def GL_IMAGE_1D_ARRAY = 0x9052;
def GL_IMAGE_2D_ARRAY = 0x9053;
def GL_IMAGE_CUBE_MAP_ARRAY = 0x9054;
def GL_IMAGE_2D_MULTISAMPLE = 0x9055;
def GL_IMAGE_2D_MULTISAMPLE_ARRAY = 0x9056;
def GL_INT_IMAGE_1D = 0x9057;
def GL_INT_IMAGE_2D = 0x9058;
def GL_INT_IMAGE_3D = 0x9059;
def GL_INT_IMAGE_2D_RECT = 0x905A;
def GL_INT_IMAGE_CUBE = 0x905B;
def GL_INT_IMAGE_BUFFER = 0x905C;
def GL_INT_IMAGE_1D_ARRAY = 0x905D;
def GL_INT_IMAGE_2D_ARRAY = 0x905E;
def GL_INT_IMAGE_CUBE_MAP_ARRAY = 0x905F;
def GL_INT_IMAGE_2D_MULTISAMPLE = 0x9060;
def GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x9061;
def GL_UNSIGNED_INT_IMAGE_1D = 0x9062;
def GL_UNSIGNED_INT_IMAGE_2D = 0x9063;
def GL_UNSIGNED_INT_IMAGE_3D = 0x9064;
def GL_UNSIGNED_INT_IMAGE_2D_RECT = 0x9065;
def GL_UNSIGNED_INT_IMAGE_CUBE = 0x9066;
def GL_UNSIGNED_INT_IMAGE_BUFFER = 0x9067;
def GL_UNSIGNED_INT_IMAGE_1D_ARRAY = 0x9068;
def GL_UNSIGNED_INT_IMAGE_2D_ARRAY = 0x9069;
def GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = 0x906A;
def GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE = 0x906B;
def GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x906C;
def GL_MAX_IMAGE_SAMPLES = 0x906D;
def GL_IMAGE_BINDING_FORMAT = 0x906E;
def GL_IMAGE_FORMAT_COMPATIBILITY_TYPE = 0x90C7;
def GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = 0x90C8;
def GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = 0x90C9;
def GL_MAX_VERTEX_IMAGE_UNIFORMS = 0x90CA;
def GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS = 0x90CB;
def GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS = 0x90CC;
def GL_MAX_GEOMETRY_IMAGE_UNIFORMS = 0x90CD;
def GL_MAX_FRAGMENT_IMAGE_UNIFORMS = 0x90CE;
def GL_MAX_COMBINED_IMAGE_UNIFORMS = 0x90CF;
def GL_COMPRESSED_RGBA_BPTC_UNORM = 0x8E8C;
def GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM = 0x8E8D;
def GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT = 0x8E8E;
def GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT = 0x8E8F;
def GL_TEXTURE_IMMUTABLE_FORMAT = 0x912F;

def glDrawArraysInstancedBaseInstance_signature func(mode GLenum; first GLint; count GLsizei; instancecount GLsizei; baseinstance GLuint);
var global glDrawArraysInstancedBaseInstance glDrawArraysInstancedBaseInstance_signature;

def glDrawElementsInstancedBaseInstance_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei; baseinstance GLuint);
var global glDrawElementsInstancedBaseInstance glDrawElementsInstancedBaseInstance_signature;

def glDrawElementsInstancedBaseVertexBaseInstance_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei; basevertex GLint; baseinstance GLuint);
var global glDrawElementsInstancedBaseVertexBaseInstance glDrawElementsInstancedBaseVertexBaseInstance_signature;

def glGetInternalformativ_signature func(target GLenum; internalformat GLenum; pname GLenum; count GLsizei; params GLint ref);
var global glGetInternalformativ glGetInternalformativ_signature;

def glGetActiveAtomicCounterBufferiv_signature func(program GLuint; bufferIndex GLuint; pname GLenum; params GLint ref);
var global glGetActiveAtomicCounterBufferiv glGetActiveAtomicCounterBufferiv_signature;

def glBindImageTexture_signature func(unit GLuint; texture GLuint; level GLint; layered GLboolean; layer GLint; access GLenum; format GLenum);
var global glBindImageTexture glBindImageTexture_signature;

def glMemoryBarrier_signature func(barriers GLbitfield);
var global glMemoryBarrier glMemoryBarrier_signature;

def glTexStorage1D_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei);
var global glTexStorage1D glTexStorage1D_signature;

def glTexStorage2D_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glTexStorage2D glTexStorage2D_signature;

def glTexStorage3D_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var global glTexStorage3D glTexStorage3D_signature;

def glDrawTransformFeedbackInstanced_signature func(mode GLenum; id GLuint; instancecount GLsizei);
var global glDrawTransformFeedbackInstanced glDrawTransformFeedbackInstanced_signature;

def glDrawTransformFeedbackStreamInstanced_signature func(mode GLenum; id GLuint; stream GLuint; instancecount GLsizei);
var global glDrawTransformFeedbackStreamInstanced glDrawTransformFeedbackStreamInstanced_signature;
def GL_VERSION_4_3 = 1;

def GLDEBUGPROC func(source GLenum; type GLenum; id GLuint; severity GLenum; length GLsizei; message GLchar ref; userParam u8 ref);
def GL_NUM_SHADING_LANGUAGE_VERSIONS = 0x82E9;
def GL_VERTEX_ATTRIB_ARRAY_LONG = 0x874E;
def GL_COMPRESSED_RGB8_ETC2 = 0x9274;
def GL_COMPRESSED_SRGB8_ETC2 = 0x9275;
def GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276;
def GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277;
def GL_COMPRESSED_RGBA8_ETC2_EAC = 0x9278;
def GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279;
def GL_COMPRESSED_R11_EAC = 0x9270;
def GL_COMPRESSED_SIGNED_R11_EAC = 0x9271;
def GL_COMPRESSED_RG11_EAC = 0x9272;
def GL_COMPRESSED_SIGNED_RG11_EAC = 0x9273;
def GL_PRIMITIVE_RESTART_FIXED_INDEX = 0x8D69;
def GL_ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A;
def GL_MAX_ELEMENT_INDEX = 0x8D6B;
def GL_COMPUTE_SHADER = 0x91B9;
def GL_MAX_COMPUTE_UNIFORM_BLOCKS = 0x91BB;
def GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS = 0x91BC;
def GL_MAX_COMPUTE_IMAGE_UNIFORMS = 0x91BD;
def GL_MAX_COMPUTE_SHARED_MEMORY_SIZE = 0x8262;
def GL_MAX_COMPUTE_UNIFORM_COMPONENTS = 0x8263;
def GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = 0x8264;
def GL_MAX_COMPUTE_ATOMIC_COUNTERS = 0x8265;
def GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = 0x8266;
def GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS = 0x90EB;
def GL_MAX_COMPUTE_WORK_GROUP_COUNT = 0x91BE;
def GL_MAX_COMPUTE_WORK_GROUP_SIZE = 0x91BF;
def GL_COMPUTE_WORK_GROUP_SIZE = 0x8267;
def GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER = 0x90EC;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER = 0x90ED;
def GL_DISPATCH_INDIRECT_BUFFER = 0x90EE;
def GL_DISPATCH_INDIRECT_BUFFER_BINDING = 0x90EF;
def GL_COMPUTE_SHADER_BIT = 0x00000020;
def GL_DEBUG_OUTPUT_SYNCHRONOUS = 0x8242;
def GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = 0x8243;
def GL_DEBUG_CALLBACK_FUNCTION = 0x8244;
def GL_DEBUG_CALLBACK_USER_PARAM = 0x8245;
def GL_DEBUG_SOURCE_API = 0x8246;
def GL_DEBUG_SOURCE_WINDOW_SYSTEM = 0x8247;
def GL_DEBUG_SOURCE_SHADER_COMPILER = 0x8248;
def GL_DEBUG_SOURCE_THIRD_PARTY = 0x8249;
def GL_DEBUG_SOURCE_APPLICATION = 0x824A;
def GL_DEBUG_SOURCE_OTHER = 0x824B;
def GL_DEBUG_TYPE_ERROR = 0x824C;
def GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR = 0x824D;
def GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR = 0x824E;
def GL_DEBUG_TYPE_PORTABILITY = 0x824F;
def GL_DEBUG_TYPE_PERFORMANCE = 0x8250;
def GL_DEBUG_TYPE_OTHER = 0x8251;
def GL_MAX_DEBUG_MESSAGE_LENGTH = 0x9143;
def GL_MAX_DEBUG_LOGGED_MESSAGES = 0x9144;
def GL_DEBUG_LOGGED_MESSAGES = 0x9145;
def GL_DEBUG_SEVERITY_HIGH = 0x9146;
def GL_DEBUG_SEVERITY_MEDIUM = 0x9147;
def GL_DEBUG_SEVERITY_LOW = 0x9148;
def GL_DEBUG_TYPE_MARKER = 0x8268;
def GL_DEBUG_TYPE_PUSH_GROUP = 0x8269;
def GL_DEBUG_TYPE_POP_GROUP = 0x826A;
def GL_DEBUG_SEVERITY_NOTIFICATION = 0x826B;
def GL_MAX_DEBUG_GROUP_STACK_DEPTH = 0x826C;
def GL_DEBUG_GROUP_STACK_DEPTH = 0x826D;
def GL_BUFFER = 0x82E0;
def GL_SHADER = 0x82E1;
def GL_PROGRAM = 0x82E2;
def GL_QUERY = 0x82E3;
def GL_PROGRAM_PIPELINE = 0x82E4;
def GL_SAMPLER = 0x82E6;
def GL_MAX_LABEL_LENGTH = 0x82E8;
def GL_DEBUG_OUTPUT = 0x92E0;
def GL_CONTEXT_FLAG_DEBUG_BIT = 0x00000002;
def GL_MAX_UNIFORM_LOCATIONS = 0x826E;
def GL_FRAMEBUFFER_DEFAULT_WIDTH = 0x9310;
def GL_FRAMEBUFFER_DEFAULT_HEIGHT = 0x9311;
def GL_FRAMEBUFFER_DEFAULT_LAYERS = 0x9312;
def GL_FRAMEBUFFER_DEFAULT_SAMPLES = 0x9313;
def GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 0x9314;
def GL_MAX_FRAMEBUFFER_WIDTH = 0x9315;
def GL_MAX_FRAMEBUFFER_HEIGHT = 0x9316;
def GL_MAX_FRAMEBUFFER_LAYERS = 0x9317;
def GL_MAX_FRAMEBUFFER_SAMPLES = 0x9318;
def GL_INTERNALFORMAT_SUPPORTED = 0x826F;
def GL_INTERNALFORMAT_PREFERRED = 0x8270;
def GL_INTERNALFORMAT_RED_SIZE = 0x8271;
def GL_INTERNALFORMAT_GREEN_SIZE = 0x8272;
def GL_INTERNALFORMAT_BLUE_SIZE = 0x8273;
def GL_INTERNALFORMAT_ALPHA_SIZE = 0x8274;
def GL_INTERNALFORMAT_DEPTH_SIZE = 0x8275;
def GL_INTERNALFORMAT_STENCIL_SIZE = 0x8276;
def GL_INTERNALFORMAT_SHARED_SIZE = 0x8277;
def GL_INTERNALFORMAT_RED_TYPE = 0x8278;
def GL_INTERNALFORMAT_GREEN_TYPE = 0x8279;
def GL_INTERNALFORMAT_BLUE_TYPE = 0x827A;
def GL_INTERNALFORMAT_ALPHA_TYPE = 0x827B;
def GL_INTERNALFORMAT_DEPTH_TYPE = 0x827C;
def GL_INTERNALFORMAT_STENCIL_TYPE = 0x827D;
def GL_MAX_WIDTH = 0x827E;
def GL_MAX_HEIGHT = 0x827F;
def GL_MAX_DEPTH = 0x8280;
def GL_MAX_LAYERS = 0x8281;
def GL_MAX_COMBINED_DIMENSIONS = 0x8282;
def GL_COLOR_COMPONENTS = 0x8283;
def GL_DEPTH_COMPONENTS = 0x8284;
def GL_STENCIL_COMPONENTS = 0x8285;
def GL_COLOR_RENDERABLE = 0x8286;
def GL_DEPTH_RENDERABLE = 0x8287;
def GL_STENCIL_RENDERABLE = 0x8288;
def GL_FRAMEBUFFER_RENDERABLE = 0x8289;
def GL_FRAMEBUFFER_RENDERABLE_LAYERED = 0x828A;
def GL_FRAMEBUFFER_BLEND = 0x828B;
def GL_READ_PIXELS = 0x828C;
def GL_READ_PIXELS_FORMAT = 0x828D;
def GL_READ_PIXELS_TYPE = 0x828E;
def GL_TEXTURE_IMAGE_FORMAT = 0x828F;
def GL_TEXTURE_IMAGE_TYPE = 0x8290;
def GL_GET_TEXTURE_IMAGE_FORMAT = 0x8291;
def GL_GET_TEXTURE_IMAGE_TYPE = 0x8292;
def GL_MIPMAP = 0x8293;
def GL_MANUAL_GENERATE_MIPMAP = 0x8294;
def GL_AUTO_GENERATE_MIPMAP = 0x8295;
def GL_COLOR_ENCODING = 0x8296;
def GL_SRGB_READ = 0x8297;
def GL_SRGB_WRITE = 0x8298;
def GL_FILTER = 0x829A;
def GL_VERTEX_TEXTURE = 0x829B;
def GL_TESS_CONTROL_TEXTURE = 0x829C;
def GL_TESS_EVALUATION_TEXTURE = 0x829D;
def GL_GEOMETRY_TEXTURE = 0x829E;
def GL_FRAGMENT_TEXTURE = 0x829F;
def GL_COMPUTE_TEXTURE = 0x82A0;
def GL_TEXTURE_SHADOW = 0x82A1;
def GL_TEXTURE_GATHER = 0x82A2;
def GL_TEXTURE_GATHER_SHADOW = 0x82A3;
def GL_SHADER_IMAGE_LOAD = 0x82A4;
def GL_SHADER_IMAGE_STORE = 0x82A5;
def GL_SHADER_IMAGE_ATOMIC = 0x82A6;
def GL_IMAGE_TEXEL_SIZE = 0x82A7;
def GL_IMAGE_COMPATIBILITY_CLASS = 0x82A8;
def GL_IMAGE_PIXEL_FORMAT = 0x82A9;
def GL_IMAGE_PIXEL_TYPE = 0x82AA;
def GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST = 0x82AC;
def GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST = 0x82AD;
def GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE = 0x82AE;
def GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE = 0x82AF;
def GL_TEXTURE_COMPRESSED_BLOCK_WIDTH = 0x82B1;
def GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT = 0x82B2;
def GL_TEXTURE_COMPRESSED_BLOCK_SIZE = 0x82B3;
def GL_CLEAR_BUFFER = 0x82B4;
def GL_TEXTURE_VIEW = 0x82B5;
def GL_VIEW_COMPATIBILITY_CLASS = 0x82B6;
def GL_FULL_SUPPORT = 0x82B7;
def GL_CAVEAT_SUPPORT = 0x82B8;
def GL_IMAGE_CLASS_4_X_32 = 0x82B9;
def GL_IMAGE_CLASS_2_X_32 = 0x82BA;
def GL_IMAGE_CLASS_1_X_32 = 0x82BB;
def GL_IMAGE_CLASS_4_X_16 = 0x82BC;
def GL_IMAGE_CLASS_2_X_16 = 0x82BD;
def GL_IMAGE_CLASS_1_X_16 = 0x82BE;
def GL_IMAGE_CLASS_4_X_8 = 0x82BF;
def GL_IMAGE_CLASS_2_X_8 = 0x82C0;
def GL_IMAGE_CLASS_1_X_8 = 0x82C1;
def GL_IMAGE_CLASS_11_11_10 = 0x82C2;
def GL_IMAGE_CLASS_10_10_10_2 = 0x82C3;
def GL_VIEW_CLASS_128_BITS = 0x82C4;
def GL_VIEW_CLASS_96_BITS = 0x82C5;
def GL_VIEW_CLASS_64_BITS = 0x82C6;
def GL_VIEW_CLASS_48_BITS = 0x82C7;
def GL_VIEW_CLASS_32_BITS = 0x82C8;
def GL_VIEW_CLASS_24_BITS = 0x82C9;
def GL_VIEW_CLASS_16_BITS = 0x82CA;
def GL_VIEW_CLASS_8_BITS = 0x82CB;
def GL_VIEW_CLASS_S3TC_DXT1_RGB = 0x82CC;
def GL_VIEW_CLASS_S3TC_DXT1_RGBA = 0x82CD;
def GL_VIEW_CLASS_S3TC_DXT3_RGBA = 0x82CE;
def GL_VIEW_CLASS_S3TC_DXT5_RGBA = 0x82CF;
def GL_VIEW_CLASS_RGTC1_RED = 0x82D0;
def GL_VIEW_CLASS_RGTC2_RG = 0x82D1;
def GL_VIEW_CLASS_BPTC_UNORM = 0x82D2;
def GL_VIEW_CLASS_BPTC_FLOAT = 0x82D3;
def GL_UNIFORM = 0x92E1;
def GL_UNIFORM_BLOCK = 0x92E2;
def GL_PROGRAM_INPUT = 0x92E3;
def GL_PROGRAM_OUTPUT = 0x92E4;
def GL_BUFFER_VARIABLE = 0x92E5;
def GL_SHADER_STORAGE_BLOCK = 0x92E6;
def GL_VERTEX_SUBROUTINE = 0x92E8;
def GL_TESS_CONTROL_SUBROUTINE = 0x92E9;
def GL_TESS_EVALUATION_SUBROUTINE = 0x92EA;
def GL_GEOMETRY_SUBROUTINE = 0x92EB;
def GL_FRAGMENT_SUBROUTINE = 0x92EC;
def GL_COMPUTE_SUBROUTINE = 0x92ED;
def GL_VERTEX_SUBROUTINE_UNIFORM = 0x92EE;
def GL_TESS_CONTROL_SUBROUTINE_UNIFORM = 0x92EF;
def GL_TESS_EVALUATION_SUBROUTINE_UNIFORM = 0x92F0;
def GL_GEOMETRY_SUBROUTINE_UNIFORM = 0x92F1;
def GL_FRAGMENT_SUBROUTINE_UNIFORM = 0x92F2;
def GL_COMPUTE_SUBROUTINE_UNIFORM = 0x92F3;
def GL_TRANSFORM_FEEDBACK_VARYING = 0x92F4;
def GL_ACTIVE_RESOURCES = 0x92F5;
def GL_MAX_NAME_LENGTH = 0x92F6;
def GL_MAX_NUM_ACTIVE_VARIABLES = 0x92F7;
def GL_MAX_NUM_COMPATIBLE_SUBROUTINES = 0x92F8;
def GL_NAME_LENGTH = 0x92F9;
def GL_TYPE = 0x92FA;
def GL_ARRAY_SIZE = 0x92FB;
def GL_OFFSET = 0x92FC;
def GL_BLOCK_INDEX = 0x92FD;
def GL_ARRAY_STRIDE = 0x92FE;
def GL_MATRIX_STRIDE = 0x92FF;
def GL_IS_ROW_MAJOR = 0x9300;
def GL_ATOMIC_COUNTER_BUFFER_INDEX = 0x9301;
def GL_BUFFER_BINDING = 0x9302;
def GL_BUFFER_DATA_SIZE = 0x9303;
def GL_NUM_ACTIVE_VARIABLES = 0x9304;
def GL_ACTIVE_VARIABLES = 0x9305;
def GL_REFERENCED_BY_VERTEX_SHADER = 0x9306;
def GL_REFERENCED_BY_TESS_CONTROL_SHADER = 0x9307;
def GL_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x9308;
def GL_REFERENCED_BY_GEOMETRY_SHADER = 0x9309;
def GL_REFERENCED_BY_FRAGMENT_SHADER = 0x930A;
def GL_REFERENCED_BY_COMPUTE_SHADER = 0x930B;
def GL_TOP_LEVEL_ARRAY_SIZE = 0x930C;
def GL_TOP_LEVEL_ARRAY_STRIDE = 0x930D;
def GL_LOCATION = 0x930E;
def GL_LOCATION_INDEX = 0x930F;
def GL_IS_PER_PATCH = 0x92E7;
def GL_SHADER_STORAGE_BUFFER = 0x90D2;
def GL_SHADER_STORAGE_BUFFER_BINDING = 0x90D3;
def GL_SHADER_STORAGE_BUFFER_START = 0x90D4;
def GL_SHADER_STORAGE_BUFFER_SIZE = 0x90D5;
def GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = 0x90D6;
def GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 0x90D7;
def GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 0x90D8;
def GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 0x90D9;
def GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 0x90DA;
def GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 0x90DB;
def GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = 0x90DC;
def GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = 0x90DD;
def GL_MAX_SHADER_STORAGE_BLOCK_SIZE = 0x90DE;
def GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 0x90DF;
def GL_SHADER_STORAGE_BARRIER_BIT = 0x00002000;
def GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = 0x8F39;
def GL_DEPTH_STENCIL_TEXTURE_MODE = 0x90EA;
def GL_TEXTURE_BUFFER_OFFSET = 0x919D;
def GL_TEXTURE_BUFFER_SIZE = 0x919E;
def GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F;
def GL_TEXTURE_VIEW_MIN_LEVEL = 0x82DB;
def GL_TEXTURE_VIEW_NUM_LEVELS = 0x82DC;
def GL_TEXTURE_VIEW_MIN_LAYER = 0x82DD;
def GL_TEXTURE_VIEW_NUM_LAYERS = 0x82DE;
def GL_TEXTURE_IMMUTABLE_LEVELS = 0x82DF;
def GL_VERTEX_ATTRIB_BINDING = 0x82D4;
def GL_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D5;
def GL_VERTEX_BINDING_DIVISOR = 0x82D6;
def GL_VERTEX_BINDING_OFFSET = 0x82D7;
def GL_VERTEX_BINDING_STRIDE = 0x82D8;
def GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D9;
def GL_MAX_VERTEX_ATTRIB_BINDINGS = 0x82DA;
def GL_VERTEX_BINDING_BUFFER = 0x8F4F;
def GL_DISPLAY_LIST = 0x82E7;

def glClearBufferData_signature func(target GLenum; internalformat GLenum; format GLenum; type GLenum; data u8 ref);
var global glClearBufferData glClearBufferData_signature;

def glClearBufferSubData_signature func(target GLenum; internalformat GLenum; offset GLintptr; size GLsizeiptr; format GLenum; type GLenum; data u8 ref);
var global glClearBufferSubData glClearBufferSubData_signature;

def glDispatchCompute_signature func(num_groups_x GLuint; num_groups_y GLuint; num_groups_z GLuint);
var global glDispatchCompute glDispatchCompute_signature;

def glDispatchComputeIndirect_signature func(indirect GLintptr);
var global glDispatchComputeIndirect glDispatchComputeIndirect_signature;

def glCopyImageSubData_signature func(srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; srcWidth GLsizei; srcHeight GLsizei; srcDepth GLsizei);
var global glCopyImageSubData glCopyImageSubData_signature;

def glFramebufferParameteri_signature func(target GLenum; pname GLenum; param GLint);
var global glFramebufferParameteri glFramebufferParameteri_signature;

def glGetFramebufferParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetFramebufferParameteriv glGetFramebufferParameteriv_signature;

def glGetInternalformati64v_signature func(target GLenum; internalformat GLenum; pname GLenum; count GLsizei; params GLint64 ref);
var global glGetInternalformati64v glGetInternalformati64v_signature;

def glInvalidateTexSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei);
var global glInvalidateTexSubImage glInvalidateTexSubImage_signature;

def glInvalidateTexImage_signature func(texture GLuint; level GLint);
var global glInvalidateTexImage glInvalidateTexImage_signature;

def glInvalidateBufferSubData_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr);
var global glInvalidateBufferSubData glInvalidateBufferSubData_signature;

def glInvalidateBufferData_signature func(buffer GLuint);
var global glInvalidateBufferData glInvalidateBufferData_signature;

def glInvalidateFramebuffer_signature func(target GLenum; numAttachments GLsizei; attachments GLenum ref);
var global glInvalidateFramebuffer glInvalidateFramebuffer_signature;

def glInvalidateSubFramebuffer_signature func(target GLenum; numAttachments GLsizei; attachments GLenum ref; x GLint; y GLint; width GLsizei; height GLsizei);
var global glInvalidateSubFramebuffer glInvalidateSubFramebuffer_signature;

def glMultiDrawArraysIndirect_signature func(mode GLenum; indirect u8 ref; drawcount GLsizei; stride GLsizei);
var global glMultiDrawArraysIndirect glMultiDrawArraysIndirect_signature;

def glMultiDrawElementsIndirect_signature func(mode GLenum; type GLenum; indirect u8 ref; drawcount GLsizei; stride GLsizei);
var global glMultiDrawElementsIndirect glMultiDrawElementsIndirect_signature;

def glGetProgramInterfaceiv_signature func(program GLuint; programInterface GLenum; pname GLenum; params GLint ref);
var global glGetProgramInterfaceiv glGetProgramInterfaceiv_signature;

def glGetProgramResourceIndex_signature func(program GLuint; programInterface GLenum; name GLchar ref) (result GLuint);
var global glGetProgramResourceIndex glGetProgramResourceIndex_signature;

def glGetProgramResourceName_signature func(program GLuint; programInterface GLenum; index GLuint; bufSize GLsizei; length GLsizei ref; name GLchar ref);
var global glGetProgramResourceName glGetProgramResourceName_signature;

def glGetProgramResourceiv_signature func(program GLuint; programInterface GLenum; index GLuint; propCount GLsizei; props GLenum ref; count GLsizei; length GLsizei ref; params GLint ref);
var global glGetProgramResourceiv glGetProgramResourceiv_signature;

def glGetProgramResourceLocation_signature func(program GLuint; programInterface GLenum; name GLchar ref) (result GLint);
var global glGetProgramResourceLocation glGetProgramResourceLocation_signature;

def glGetProgramResourceLocationIndex_signature func(program GLuint; programInterface GLenum; name GLchar ref) (result GLint);
var global glGetProgramResourceLocationIndex glGetProgramResourceLocationIndex_signature;

def glShaderStorageBlockBinding_signature func(program GLuint; storageBlockIndex GLuint; storageBlockBinding GLuint);
var global glShaderStorageBlockBinding glShaderStorageBlockBinding_signature;

def glTexBufferRange_signature func(target GLenum; internalformat GLenum; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glTexBufferRange glTexBufferRange_signature;

def glTexStorage2DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var global glTexStorage2DMultisample glTexStorage2DMultisample_signature;

def glTexStorage3DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var global glTexStorage3DMultisample glTexStorage3DMultisample_signature;

def glTextureView_signature func(texture GLuint; target GLenum; origtexture GLuint; internalformat GLenum; minlevel GLuint; numlevels GLuint; minlayer GLuint; numlayers GLuint);
var global glTextureView glTextureView_signature;

def glBindVertexBuffer_signature func(bindingindex GLuint; buffer GLuint; offset GLintptr; stride GLsizei);
var global glBindVertexBuffer glBindVertexBuffer_signature;

def glVertexAttribFormat_signature func(attribindex GLuint; size GLint; type GLenum; normalized GLboolean; relativeoffset GLuint);
var global glVertexAttribFormat glVertexAttribFormat_signature;

def glVertexAttribIFormat_signature func(attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var global glVertexAttribIFormat glVertexAttribIFormat_signature;

def glVertexAttribLFormat_signature func(attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var global glVertexAttribLFormat glVertexAttribLFormat_signature;

def glVertexAttribBinding_signature func(attribindex GLuint; bindingindex GLuint);
var global glVertexAttribBinding glVertexAttribBinding_signature;

def glVertexBindingDivisor_signature func(bindingindex GLuint; divisor GLuint);
var global glVertexBindingDivisor glVertexBindingDivisor_signature;

def glDebugMessageControl_signature func(source GLenum; type GLenum; severity GLenum; count GLsizei; ids GLuint ref; enabled GLboolean);
var global glDebugMessageControl glDebugMessageControl_signature;

def glDebugMessageInsert_signature func(source GLenum; type GLenum; id GLuint; severity GLenum; length GLsizei; buf GLchar ref);
var global glDebugMessageInsert glDebugMessageInsert_signature;

def glDebugMessageCallback_signature func(callback GLDEBUGPROC; userParam u8 ref);
var global glDebugMessageCallback glDebugMessageCallback_signature;

def glGetDebugMessageLog_signature func(count GLuint; bufSize GLsizei; sources GLenum ref; types GLenum ref; ids GLuint ref; severities GLenum ref; lengths GLsizei ref; messageLog GLchar ref) (result GLuint);
var global glGetDebugMessageLog glGetDebugMessageLog_signature;

def glPushDebugGroup_signature func(source GLenum; id GLuint; length GLsizei; message GLchar ref);
var global glPushDebugGroup glPushDebugGroup_signature;

def glPopDebugGroup_signature func();
var global glPopDebugGroup glPopDebugGroup_signature;

def glObjectLabel_signature func(identifier GLenum; name GLuint; length GLsizei; label GLchar ref);
var global glObjectLabel glObjectLabel_signature;

def glGetObjectLabel_signature func(identifier GLenum; name GLuint; bufSize GLsizei; length GLsizei ref; label GLchar ref);
var global glGetObjectLabel glGetObjectLabel_signature;

def glObjectPtrLabel_signature func(ptr u8 ref; length GLsizei; label GLchar ref);
var global glObjectPtrLabel glObjectPtrLabel_signature;

def glGetObjectPtrLabel_signature func(ptr u8 ref; bufSize GLsizei; length GLsizei ref; label GLchar ref);
var global glGetObjectPtrLabel glGetObjectPtrLabel_signature;
def GL_VERSION_4_4 = 1;
def GL_MAX_VERTEX_ATTRIB_STRIDE = 0x82E5;
def GL_PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED = 0x8221;
def GL_TEXTURE_BUFFER_BINDING = 0x8C2A;
def GL_MAP_PERSISTENT_BIT = 0x0040;
def GL_MAP_COHERENT_BIT = 0x0080;
def GL_DYNAMIC_STORAGE_BIT = 0x0100;
def GL_CLIENT_STORAGE_BIT = 0x0200;
def GL_CLIENT_MAPPED_BUFFER_BARRIER_BIT = 0x00004000;
def GL_BUFFER_IMMUTABLE_STORAGE = 0x821F;
def GL_BUFFER_STORAGE_FLAGS = 0x8220;
def GL_CLEAR_TEXTURE = 0x9365;
def GL_LOCATION_COMPONENT = 0x934A;
def GL_TRANSFORM_FEEDBACK_BUFFER_INDEX = 0x934B;
def GL_TRANSFORM_FEEDBACK_BUFFER_STRIDE = 0x934C;
def GL_QUERY_BUFFER = 0x9192;
def GL_QUERY_BUFFER_BARRIER_BIT = 0x00008000;
def GL_QUERY_BUFFER_BINDING = 0x9193;
def GL_QUERY_RESULT_NO_WAIT = 0x9194;
def GL_MIRROR_CLAMP_TO_EDGE = 0x8743;

def glBufferStorage_signature func(target GLenum; size GLsizeiptr; data u8 ref; flags GLbitfield);
var global glBufferStorage glBufferStorage_signature;

def glClearTexImage_signature func(texture GLuint; level GLint; format GLenum; type GLenum; data u8 ref);
var global glClearTexImage glClearTexImage_signature;

def glClearTexSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; data u8 ref);
var global glClearTexSubImage glClearTexSubImage_signature;

def glBindBuffersBase_signature func(target GLenum; first GLuint; count GLsizei; buffers GLuint ref);
var global glBindBuffersBase glBindBuffersBase_signature;

def glBindBuffersRange_signature func(target GLenum; first GLuint; count GLsizei; buffers GLuint ref; offsets GLintptr ref; sizes GLsizeiptr ref);
var global glBindBuffersRange glBindBuffersRange_signature;

def glBindTextures_signature func(first GLuint; count GLsizei; textures GLuint ref);
var global glBindTextures glBindTextures_signature;

def glBindSamplers_signature func(first GLuint; count GLsizei; samplers GLuint ref);
var global glBindSamplers glBindSamplers_signature;

def glBindImageTextures_signature func(first GLuint; count GLsizei; textures GLuint ref);
var global glBindImageTextures glBindImageTextures_signature;

def glBindVertexBuffers_signature func(first GLuint; count GLsizei; buffers GLuint ref; offsets GLintptr ref; strides GLsizei ref);
var global glBindVertexBuffers glBindVertexBuffers_signature;
def GL_VERSION_4_5 = 1;
def GL_CONTEXT_LOST = 0x0507;
def GL_NEGATIVE_ONE_TO_ONE = 0x935E;
def GL_ZERO_TO_ONE = 0x935F;
def GL_CLIP_ORIGIN = 0x935C;
def GL_CLIP_DEPTH_MODE = 0x935D;
def GL_QUERY_WAIT_INVERTED = 0x8E17;
def GL_QUERY_NO_WAIT_INVERTED = 0x8E18;
def GL_QUERY_BY_REGION_WAIT_INVERTED = 0x8E19;
def GL_QUERY_BY_REGION_NO_WAIT_INVERTED = 0x8E1A;
def GL_MAX_CULL_DISTANCES = 0x82F9;
def GL_MAX_COMBINED_CLIP_AND_CULL_DISTANCES = 0x82FA;
def GL_TEXTURE_TARGET = 0x1006;
def GL_QUERY_TARGET = 0x82EA;
def GL_GUILTY_CONTEXT_RESET = 0x8253;
def GL_INNOCENT_CONTEXT_RESET = 0x8254;
def GL_UNKNOWN_CONTEXT_RESET = 0x8255;
def GL_RESET_NOTIFICATION_STRATEGY = 0x8256;
def GL_LOSE_CONTEXT_ON_RESET = 0x8252;
def GL_NO_RESET_NOTIFICATION = 0x8261;
def GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT = 0x00000004;
def GL_COLOR_TABLE = 0x80D0;
def GL_POST_CONVOLUTION_COLOR_TABLE = 0x80D1;
def GL_POST_COLOR_MATRIX_COLOR_TABLE = 0x80D2;
def GL_PROXY_COLOR_TABLE = 0x80D3;
def GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = 0x80D4;
def GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE = 0x80D5;
def GL_CONVOLUTION_1D = 0x8010;
def GL_CONVOLUTION_2D = 0x8011;
def GL_SEPARABLE_2D = 0x8012;
def GL_HISTOGRAM = 0x8024;
def GL_PROXY_HISTOGRAM = 0x8025;
def GL_MINMAX = 0x802E;
def GL_CONTEXT_RELEASE_BEHAVIOR = 0x82FB;
def GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x82FC;

def glClipControl_signature func(origin GLenum; depth GLenum);
var global glClipControl glClipControl_signature;

def glCreateTransformFeedbacks_signature func(n GLsizei; ids GLuint ref);
var global glCreateTransformFeedbacks glCreateTransformFeedbacks_signature;

def glTransformFeedbackBufferBase_signature func(xfb GLuint; index GLuint; buffer GLuint);
var global glTransformFeedbackBufferBase glTransformFeedbackBufferBase_signature;

def glTransformFeedbackBufferRange_signature func(xfb GLuint; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glTransformFeedbackBufferRange glTransformFeedbackBufferRange_signature;

def glGetTransformFeedbackiv_signature func(xfb GLuint; pname GLenum; param GLint ref);
var global glGetTransformFeedbackiv glGetTransformFeedbackiv_signature;

def glGetTransformFeedbacki_v_signature func(xfb GLuint; pname GLenum; index GLuint; param GLint ref);
var global glGetTransformFeedbacki_v glGetTransformFeedbacki_v_signature;

def glGetTransformFeedbacki64_v_signature func(xfb GLuint; pname GLenum; index GLuint; param GLint64 ref);
var global glGetTransformFeedbacki64_v glGetTransformFeedbacki64_v_signature;

def glCreateBuffers_signature func(n GLsizei; buffers GLuint ref);
var global glCreateBuffers glCreateBuffers_signature;

def glNamedBufferStorage_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; flags GLbitfield);
var global glNamedBufferStorage glNamedBufferStorage_signature;

def glNamedBufferData_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; usage GLenum);
var global glNamedBufferData glNamedBufferData_signature;

def glNamedBufferSubData_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glNamedBufferSubData glNamedBufferSubData_signature;

def glCopyNamedBufferSubData_signature func(readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var global glCopyNamedBufferSubData glCopyNamedBufferSubData_signature;

def glClearNamedBufferData_signature func(buffer GLuint; internalformat GLenum; format GLenum; type GLenum; data u8 ref);
var global glClearNamedBufferData glClearNamedBufferData_signature;

def glClearNamedBufferSubData_signature func(buffer GLuint; internalformat GLenum; offset GLintptr; size GLsizeiptr; format GLenum; type GLenum; data u8 ref);
var global glClearNamedBufferSubData glClearNamedBufferSubData_signature;

def glMapNamedBuffer_signature func(buffer GLuint; access GLenum) (result u8 ref);
var global glMapNamedBuffer glMapNamedBuffer_signature;

def glMapNamedBufferRange_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr; access GLbitfield) (result u8 ref);
var global glMapNamedBufferRange glMapNamedBufferRange_signature;

def glUnmapNamedBuffer_signature func(buffer GLuint) (result GLboolean);
var global glUnmapNamedBuffer glUnmapNamedBuffer_signature;

def glFlushMappedNamedBufferRange_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr);
var global glFlushMappedNamedBufferRange glFlushMappedNamedBufferRange_signature;

def glGetNamedBufferParameteriv_signature func(buffer GLuint; pname GLenum; params GLint ref);
var global glGetNamedBufferParameteriv glGetNamedBufferParameteriv_signature;

def glGetNamedBufferParameteri64v_signature func(buffer GLuint; pname GLenum; params GLint64 ref);
var global glGetNamedBufferParameteri64v glGetNamedBufferParameteri64v_signature;

def glGetNamedBufferPointerv_signature func(buffer GLuint; pname GLenum; params u8 ref ref);
var global glGetNamedBufferPointerv glGetNamedBufferPointerv_signature;

def glGetNamedBufferSubData_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glGetNamedBufferSubData glGetNamedBufferSubData_signature;

def glCreateFramebuffers_signature func(n GLsizei; framebuffers GLuint ref);
var global glCreateFramebuffers glCreateFramebuffers_signature;

def glNamedFramebufferRenderbuffer_signature func(framebuffer GLuint; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var global glNamedFramebufferRenderbuffer glNamedFramebufferRenderbuffer_signature;

def glNamedFramebufferParameteri_signature func(framebuffer GLuint; pname GLenum; param GLint);
var global glNamedFramebufferParameteri glNamedFramebufferParameteri_signature;

def glNamedFramebufferTexture_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint);
var global glNamedFramebufferTexture glNamedFramebufferTexture_signature;

def glNamedFramebufferTextureLayer_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint; layer GLint);
var global glNamedFramebufferTextureLayer glNamedFramebufferTextureLayer_signature;

def glNamedFramebufferDrawBuffer_signature func(framebuffer GLuint; buf GLenum);
var global glNamedFramebufferDrawBuffer glNamedFramebufferDrawBuffer_signature;

def glNamedFramebufferDrawBuffers_signature func(framebuffer GLuint; n GLsizei; bufs GLenum ref);
var global glNamedFramebufferDrawBuffers glNamedFramebufferDrawBuffers_signature;

def glNamedFramebufferReadBuffer_signature func(framebuffer GLuint; src GLenum);
var global glNamedFramebufferReadBuffer glNamedFramebufferReadBuffer_signature;

def glInvalidateNamedFramebufferData_signature func(framebuffer GLuint; numAttachments GLsizei; attachments GLenum ref);
var global glInvalidateNamedFramebufferData glInvalidateNamedFramebufferData_signature;

def glInvalidateNamedFramebufferSubData_signature func(framebuffer GLuint; numAttachments GLsizei; attachments GLenum ref; x GLint; y GLint; width GLsizei; height GLsizei);
var global glInvalidateNamedFramebufferSubData glInvalidateNamedFramebufferSubData_signature;

def glClearNamedFramebufferiv_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; value GLint ref);
var global glClearNamedFramebufferiv glClearNamedFramebufferiv_signature;

def glClearNamedFramebufferuiv_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; value GLuint ref);
var global glClearNamedFramebufferuiv glClearNamedFramebufferuiv_signature;

def glClearNamedFramebufferfv_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; value GLfloat ref);
var global glClearNamedFramebufferfv glClearNamedFramebufferfv_signature;

def glClearNamedFramebufferfi_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; depth GLfloat; stencil GLint);
var global glClearNamedFramebufferfi glClearNamedFramebufferfi_signature;

def glBlitNamedFramebuffer_signature func(readFramebuffer GLuint; drawFramebuffer GLuint; srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var global glBlitNamedFramebuffer glBlitNamedFramebuffer_signature;

def glCheckNamedFramebufferStatus_signature func(framebuffer GLuint; target GLenum) (result GLenum);
var global glCheckNamedFramebufferStatus glCheckNamedFramebufferStatus_signature;

def glGetNamedFramebufferParameteriv_signature func(framebuffer GLuint; pname GLenum; param GLint ref);
var global glGetNamedFramebufferParameteriv glGetNamedFramebufferParameteriv_signature;

def glGetNamedFramebufferAttachmentParameteriv_signature func(framebuffer GLuint; attachment GLenum; pname GLenum; params GLint ref);
var global glGetNamedFramebufferAttachmentParameteriv glGetNamedFramebufferAttachmentParameteriv_signature;

def glCreateRenderbuffers_signature func(n GLsizei; renderbuffers GLuint ref);
var global glCreateRenderbuffers glCreateRenderbuffers_signature;

def glNamedRenderbufferStorage_signature func(renderbuffer GLuint; internalformat GLenum; width GLsizei; height GLsizei);
var global glNamedRenderbufferStorage glNamedRenderbufferStorage_signature;

def glNamedRenderbufferStorageMultisample_signature func(renderbuffer GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glNamedRenderbufferStorageMultisample glNamedRenderbufferStorageMultisample_signature;

def glGetNamedRenderbufferParameteriv_signature func(renderbuffer GLuint; pname GLenum; params GLint ref);
var global glGetNamedRenderbufferParameteriv glGetNamedRenderbufferParameteriv_signature;

def glCreateTextures_signature func(target GLenum; n GLsizei; textures GLuint ref);
var global glCreateTextures glCreateTextures_signature;

def glTextureBuffer_signature func(texture GLuint; internalformat GLenum; buffer GLuint);
var global glTextureBuffer glTextureBuffer_signature;

def glTextureBufferRange_signature func(texture GLuint; internalformat GLenum; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glTextureBufferRange glTextureBufferRange_signature;

def glTextureStorage1D_signature func(texture GLuint; levels GLsizei; internalformat GLenum; width GLsizei);
var global glTextureStorage1D glTextureStorage1D_signature;

def glTextureStorage2D_signature func(texture GLuint; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glTextureStorage2D glTextureStorage2D_signature;

def glTextureStorage3D_signature func(texture GLuint; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var global glTextureStorage3D glTextureStorage3D_signature;

def glTextureStorage2DMultisample_signature func(texture GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var global glTextureStorage2DMultisample glTextureStorage2DMultisample_signature;

def glTextureStorage3DMultisample_signature func(texture GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var global glTextureStorage3DMultisample glTextureStorage3DMultisample_signature;

def glTextureSubImage1D_signature func(texture GLuint; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTextureSubImage1D glTextureSubImage1D_signature;

def glTextureSubImage2D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTextureSubImage2D glTextureSubImage2D_signature;

def glTextureSubImage3D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTextureSubImage3D glTextureSubImage3D_signature;

def glCompressedTextureSubImage1D_signature func(texture GLuint; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTextureSubImage1D glCompressedTextureSubImage1D_signature;

def glCompressedTextureSubImage2D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTextureSubImage2D glCompressedTextureSubImage2D_signature;

def glCompressedTextureSubImage3D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTextureSubImage3D glCompressedTextureSubImage3D_signature;

def glCopyTextureSubImage1D_signature func(texture GLuint; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var global glCopyTextureSubImage1D glCopyTextureSubImage1D_signature;

def glCopyTextureSubImage2D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTextureSubImage2D glCopyTextureSubImage2D_signature;

def glCopyTextureSubImage3D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTextureSubImage3D glCopyTextureSubImage3D_signature;

def glTextureParameterf_signature func(texture GLuint; pname GLenum; param GLfloat);
var global glTextureParameterf glTextureParameterf_signature;

def glTextureParameterfv_signature func(texture GLuint; pname GLenum; param GLfloat ref);
var global glTextureParameterfv glTextureParameterfv_signature;

def glTextureParameteri_signature func(texture GLuint; pname GLenum; param GLint);
var global glTextureParameteri glTextureParameteri_signature;

def glTextureParameterIiv_signature func(texture GLuint; pname GLenum; params GLint ref);
var global glTextureParameterIiv glTextureParameterIiv_signature;

def glTextureParameterIuiv_signature func(texture GLuint; pname GLenum; params GLuint ref);
var global glTextureParameterIuiv glTextureParameterIuiv_signature;

def glTextureParameteriv_signature func(texture GLuint; pname GLenum; param GLint ref);
var global glTextureParameteriv glTextureParameteriv_signature;

def glGenerateTextureMipmap_signature func(texture GLuint);
var global glGenerateTextureMipmap glGenerateTextureMipmap_signature;

def glBindTextureUnit_signature func(unit GLuint; texture GLuint);
var global glBindTextureUnit glBindTextureUnit_signature;

def glGetTextureImage_signature func(texture GLuint; level GLint; format GLenum; type GLenum; bufSize GLsizei; pixels u8 ref);
var global glGetTextureImage glGetTextureImage_signature;

def glGetCompressedTextureImage_signature func(texture GLuint; level GLint; bufSize GLsizei; pixels u8 ref);
var global glGetCompressedTextureImage glGetCompressedTextureImage_signature;

def glGetTextureLevelParameterfv_signature func(texture GLuint; level GLint; pname GLenum; params GLfloat ref);
var global glGetTextureLevelParameterfv glGetTextureLevelParameterfv_signature;

def glGetTextureLevelParameteriv_signature func(texture GLuint; level GLint; pname GLenum; params GLint ref);
var global glGetTextureLevelParameteriv glGetTextureLevelParameteriv_signature;

def glGetTextureParameterfv_signature func(texture GLuint; pname GLenum; params GLfloat ref);
var global glGetTextureParameterfv glGetTextureParameterfv_signature;

def glGetTextureParameterIiv_signature func(texture GLuint; pname GLenum; params GLint ref);
var global glGetTextureParameterIiv glGetTextureParameterIiv_signature;

def glGetTextureParameterIuiv_signature func(texture GLuint; pname GLenum; params GLuint ref);
var global glGetTextureParameterIuiv glGetTextureParameterIuiv_signature;

def glGetTextureParameteriv_signature func(texture GLuint; pname GLenum; params GLint ref);
var global glGetTextureParameteriv glGetTextureParameteriv_signature;

def glCreateVertexArrays_signature func(n GLsizei; arrays GLuint ref);
var global glCreateVertexArrays glCreateVertexArrays_signature;

def glDisableVertexArrayAttrib_signature func(vaobj GLuint; index GLuint);
var global glDisableVertexArrayAttrib glDisableVertexArrayAttrib_signature;

def glEnableVertexArrayAttrib_signature func(vaobj GLuint; index GLuint);
var global glEnableVertexArrayAttrib glEnableVertexArrayAttrib_signature;

def glVertexArrayElementBuffer_signature func(vaobj GLuint; buffer GLuint);
var global glVertexArrayElementBuffer glVertexArrayElementBuffer_signature;

def glVertexArrayVertexBuffer_signature func(vaobj GLuint; bindingindex GLuint; buffer GLuint; offset GLintptr; stride GLsizei);
var global glVertexArrayVertexBuffer glVertexArrayVertexBuffer_signature;

def glVertexArrayVertexBuffers_signature func(vaobj GLuint; first GLuint; count GLsizei; buffers GLuint ref; offsets GLintptr ref; strides GLsizei ref);
var global glVertexArrayVertexBuffers glVertexArrayVertexBuffers_signature;

def glVertexArrayAttribBinding_signature func(vaobj GLuint; attribindex GLuint; bindingindex GLuint);
var global glVertexArrayAttribBinding glVertexArrayAttribBinding_signature;

def glVertexArrayAttribFormat_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; normalized GLboolean; relativeoffset GLuint);
var global glVertexArrayAttribFormat glVertexArrayAttribFormat_signature;

def glVertexArrayAttribIFormat_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var global glVertexArrayAttribIFormat glVertexArrayAttribIFormat_signature;

def glVertexArrayAttribLFormat_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var global glVertexArrayAttribLFormat glVertexArrayAttribLFormat_signature;

def glVertexArrayBindingDivisor_signature func(vaobj GLuint; bindingindex GLuint; divisor GLuint);
var global glVertexArrayBindingDivisor glVertexArrayBindingDivisor_signature;

def glGetVertexArrayiv_signature func(vaobj GLuint; pname GLenum; param GLint ref);
var global glGetVertexArrayiv glGetVertexArrayiv_signature;

def glGetVertexArrayIndexediv_signature func(vaobj GLuint; index GLuint; pname GLenum; param GLint ref);
var global glGetVertexArrayIndexediv glGetVertexArrayIndexediv_signature;

def glGetVertexArrayIndexed64iv_signature func(vaobj GLuint; index GLuint; pname GLenum; param GLint64 ref);
var global glGetVertexArrayIndexed64iv glGetVertexArrayIndexed64iv_signature;

def glCreateSamplers_signature func(n GLsizei; samplers GLuint ref);
var global glCreateSamplers glCreateSamplers_signature;

def glCreateProgramPipelines_signature func(n GLsizei; pipelines GLuint ref);
var global glCreateProgramPipelines glCreateProgramPipelines_signature;

def glCreateQueries_signature func(target GLenum; n GLsizei; ids GLuint ref);
var global glCreateQueries glCreateQueries_signature;

def glGetQueryBufferObjecti64v_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var global glGetQueryBufferObjecti64v glGetQueryBufferObjecti64v_signature;

def glGetQueryBufferObjectiv_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var global glGetQueryBufferObjectiv glGetQueryBufferObjectiv_signature;

def glGetQueryBufferObjectui64v_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var global glGetQueryBufferObjectui64v glGetQueryBufferObjectui64v_signature;

def glGetQueryBufferObjectuiv_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var global glGetQueryBufferObjectuiv glGetQueryBufferObjectuiv_signature;

def glMemoryBarrierByRegion_signature func(barriers GLbitfield);
var global glMemoryBarrierByRegion glMemoryBarrierByRegion_signature;

def glGetTextureSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; bufSize GLsizei; pixels u8 ref);
var global glGetTextureSubImage glGetTextureSubImage_signature;

def glGetCompressedTextureSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; bufSize GLsizei; pixels u8 ref);
var global glGetCompressedTextureSubImage glGetCompressedTextureSubImage_signature;

def glGetGraphicsResetStatus_signature func() (result GLenum);
var global glGetGraphicsResetStatus glGetGraphicsResetStatus_signature;

def glGetnCompressedTexImage_signature func(target GLenum; lod GLint; bufSize GLsizei; pixels u8 ref);
var global glGetnCompressedTexImage glGetnCompressedTexImage_signature;

def glGetnTexImage_signature func(target GLenum; level GLint; format GLenum; type GLenum; bufSize GLsizei; pixels u8 ref);
var global glGetnTexImage glGetnTexImage_signature;

def glGetnUniformdv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLdouble ref);
var global glGetnUniformdv glGetnUniformdv_signature;

def glGetnUniformfv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLfloat ref);
var global glGetnUniformfv glGetnUniformfv_signature;

def glGetnUniformiv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLint ref);
var global glGetnUniformiv glGetnUniformiv_signature;

def glGetnUniformuiv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLuint ref);
var global glGetnUniformuiv glGetnUniformuiv_signature;

def glReadnPixels_signature func(x GLint; y GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; bufSize GLsizei; data u8 ref);
var global glReadnPixels glReadnPixels_signature;

def glGetnMapdv_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLdouble ref);
var global glGetnMapdv glGetnMapdv_signature;

def glGetnMapfv_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLfloat ref);
var global glGetnMapfv glGetnMapfv_signature;

def glGetnMapiv_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLint ref);
var global glGetnMapiv glGetnMapiv_signature;

def glGetnPixelMapfv_signature func(map GLenum; bufSize GLsizei; values GLfloat ref);
var global glGetnPixelMapfv glGetnPixelMapfv_signature;

def glGetnPixelMapuiv_signature func(map GLenum; bufSize GLsizei; values GLuint ref);
var global glGetnPixelMapuiv glGetnPixelMapuiv_signature;

def glGetnPixelMapusv_signature func(map GLenum; bufSize GLsizei; values GLushort ref);
var global glGetnPixelMapusv glGetnPixelMapusv_signature;

def glGetnPolygonStipple_signature func(bufSize GLsizei; pattern GLubyte ref);
var global glGetnPolygonStipple glGetnPolygonStipple_signature;

def glGetnColorTable_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; table u8 ref);
var global glGetnColorTable glGetnColorTable_signature;

def glGetnConvolutionFilter_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; image u8 ref);
var global glGetnConvolutionFilter glGetnConvolutionFilter_signature;

def glGetnSeparableFilter_signature func(target GLenum; format GLenum; type GLenum; rowBufSize GLsizei; row u8 ref; columnBufSize GLsizei; column u8 ref; span u8 ref);
var global glGetnSeparableFilter glGetnSeparableFilter_signature;

def glGetnHistogram_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var global glGetnHistogram glGetnHistogram_signature;

def glGetnMinmax_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var global glGetnMinmax glGetnMinmax_signature;

def glTextureBarrier_signature func();
var global glTextureBarrier glTextureBarrier_signature;
def GL_VERSION_4_6 = 1;
def GL_SHADER_BINARY_FORMAT_SPIR_V = 0x9551;
def GL_SPIR_V_BINARY = 0x9552;
def GL_PARAMETER_BUFFER = 0x80EE;
def GL_PARAMETER_BUFFER_BINDING = 0x80EF;
def GL_CONTEXT_FLAG_NO_ERROR_BIT = 0x00000008;
def GL_VERTICES_SUBMITTED = 0x82EE;
def GL_PRIMITIVES_SUBMITTED = 0x82EF;
def GL_VERTEX_SHADER_INVOCATIONS = 0x82F0;
def GL_TESS_CONTROL_SHADER_PATCHES = 0x82F1;
def GL_TESS_EVALUATION_SHADER_INVOCATIONS = 0x82F2;
def GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED = 0x82F3;
def GL_FRAGMENT_SHADER_INVOCATIONS = 0x82F4;
def GL_COMPUTE_SHADER_INVOCATIONS = 0x82F5;
def GL_CLIPPING_INPUT_PRIMITIVES = 0x82F6;
def GL_CLIPPING_OUTPUT_PRIMITIVES = 0x82F7;
def GL_POLYGON_OFFSET_CLAMP = 0x8E1B;
def GL_SPIR_V_EXTENSIONS = 0x9553;
def GL_NUM_SPIR_V_EXTENSIONS = 0x9554;
def GL_TEXTURE_MAX_ANISOTROPY = 0x84FE;
def GL_MAX_TEXTURE_MAX_ANISOTROPY = 0x84FF;
def GL_TRANSFORM_FEEDBACK_OVERFLOW = 0x82EC;
def GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW = 0x82ED;

def glSpecializeShader_signature func(shader GLuint; pEntryPoint GLchar ref; numSpecializationConstants GLuint; pConstantIndex GLuint ref; pConstantValue GLuint ref);
var global glSpecializeShader glSpecializeShader_signature;

def glMultiDrawArraysIndirectCount_signature func(mode GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var global glMultiDrawArraysIndirectCount glMultiDrawArraysIndirectCount_signature;

def glMultiDrawElementsIndirectCount_signature func(mode GLenum; type GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var global glMultiDrawElementsIndirectCount glMultiDrawElementsIndirectCount_signature;

def glPolygonOffsetClamp_signature func(factor GLfloat; units GLfloat; clamp GLfloat);
var global glPolygonOffsetClamp glPolygonOffsetClamp_signature;
def GL_ARB_ES2_compatibility = 1;
def GL_ARB_ES3_1_compatibility = 1;
def GL_ARB_ES3_2_compatibility = 1;
def GL_PRIMITIVE_BOUNDING_BOX_ARB = 0x92BE;
def GL_MULTISAMPLE_LINE_WIDTH_RANGE_ARB = 0x9381;
def GL_MULTISAMPLE_LINE_WIDTH_GRANULARITY_ARB = 0x9382;

def glPrimitiveBoundingBoxARB_signature func(minX GLfloat; minY GLfloat; minZ GLfloat; minW GLfloat; maxX GLfloat; maxY GLfloat; maxZ GLfloat; maxW GLfloat);
var global glPrimitiveBoundingBoxARB glPrimitiveBoundingBoxARB_signature;
def GL_ARB_ES3_compatibility = 1;
def GL_ARB_arrays_of_arrays = 1;
def GL_ARB_base_instance = 1;
def GL_ARB_bindless_texture = 1;
def GL_UNSIGNED_INT64_ARB = 0x140F;

def glGetTextureHandleARB_signature func(texture GLuint) (result GLuint64);
var global glGetTextureHandleARB glGetTextureHandleARB_signature;

def glGetTextureSamplerHandleARB_signature func(texture GLuint; sampler GLuint) (result GLuint64);
var global glGetTextureSamplerHandleARB glGetTextureSamplerHandleARB_signature;

def glMakeTextureHandleResidentARB_signature func(handle GLuint64);
var global glMakeTextureHandleResidentARB glMakeTextureHandleResidentARB_signature;

def glMakeTextureHandleNonResidentARB_signature func(handle GLuint64);
var global glMakeTextureHandleNonResidentARB glMakeTextureHandleNonResidentARB_signature;

def glGetImageHandleARB_signature func(texture GLuint; level GLint; layered GLboolean; layer GLint; format GLenum) (result GLuint64);
var global glGetImageHandleARB glGetImageHandleARB_signature;

def glMakeImageHandleResidentARB_signature func(handle GLuint64; access GLenum);
var global glMakeImageHandleResidentARB glMakeImageHandleResidentARB_signature;

def glMakeImageHandleNonResidentARB_signature func(handle GLuint64);
var global glMakeImageHandleNonResidentARB glMakeImageHandleNonResidentARB_signature;

def glUniformHandleui64ARB_signature func(location GLint; value GLuint64);
var global glUniformHandleui64ARB glUniformHandleui64ARB_signature;

def glUniformHandleui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var global glUniformHandleui64vARB glUniformHandleui64vARB_signature;

def glProgramUniformHandleui64ARB_signature func(program GLuint; location GLint; value GLuint64);
var global glProgramUniformHandleui64ARB glProgramUniformHandleui64ARB_signature;

def glProgramUniformHandleui64vARB_signature func(program GLuint; location GLint; count GLsizei; values GLuint64 ref);
var global glProgramUniformHandleui64vARB glProgramUniformHandleui64vARB_signature;

def glIsTextureHandleResidentARB_signature func(handle GLuint64) (result GLboolean);
var global glIsTextureHandleResidentARB glIsTextureHandleResidentARB_signature;

def glIsImageHandleResidentARB_signature func(handle GLuint64) (result GLboolean);
var global glIsImageHandleResidentARB glIsImageHandleResidentARB_signature;

def glVertexAttribL1ui64ARB_signature func(index GLuint; x GLuint64EXT);
var global glVertexAttribL1ui64ARB glVertexAttribL1ui64ARB_signature;

def glVertexAttribL1ui64vARB_signature func(index GLuint; v GLuint64EXT ref);
var global glVertexAttribL1ui64vARB glVertexAttribL1ui64vARB_signature;

def glGetVertexAttribLui64vARB_signature func(index GLuint; pname GLenum; params GLuint64EXT ref);
var global glGetVertexAttribLui64vARB glGetVertexAttribLui64vARB_signature;
def GL_ARB_blend_func_extended = 1;
def GL_ARB_buffer_storage = 1;
def GL_ARB_cl_event = 1;
def GL_SYNC_CL_EVENT_ARB = 0x8240;
def GL_SYNC_CL_EVENT_COMPLETE_ARB = 0x8241;

def glCreateSyncFromCLeventARB_signature func(context _cl_context ref; event _cl_event ref; flags GLbitfield) (result GLsync);
var global glCreateSyncFromCLeventARB glCreateSyncFromCLeventARB_signature;
def GL_ARB_clear_buffer_object = 1;
def GL_ARB_clear_texture = 1;
def GL_ARB_clip_control = 1;
def GL_ARB_color_buffer_float = 1;
def GL_RGBA_FLOAT_MODE_ARB = 0x8820;
def GL_CLAMP_VERTEX_COLOR_ARB = 0x891A;
def GL_CLAMP_FRAGMENT_COLOR_ARB = 0x891B;
def GL_CLAMP_READ_COLOR_ARB = 0x891C;
def GL_FIXED_ONLY_ARB = 0x891D;

def glClampColorARB_signature func(target GLenum; clamp GLenum);
var global glClampColorARB glClampColorARB_signature;
def GL_ARB_compatibility = 1;
def GL_ARB_compressed_texture_pixel_storage = 1;
def GL_ARB_compute_shader = 1;
def GL_ARB_compute_variable_group_size = 1;
def GL_MAX_COMPUTE_VARIABLE_GROUP_INVOCATIONS_ARB = 0x9344;
def GL_MAX_COMPUTE_FIXED_GROUP_INVOCATIONS_ARB = 0x90EB;
def GL_MAX_COMPUTE_VARIABLE_GROUP_SIZE_ARB = 0x9345;
def GL_MAX_COMPUTE_FIXED_GROUP_SIZE_ARB = 0x91BF;

def glDispatchComputeGroupSizeARB_signature func(num_groups_x GLuint; num_groups_y GLuint; num_groups_z GLuint; group_size_x GLuint; group_size_y GLuint; group_size_z GLuint);
var global glDispatchComputeGroupSizeARB glDispatchComputeGroupSizeARB_signature;
def GL_ARB_conditional_render_inverted = 1;
def GL_ARB_conservative_depth = 1;
def GL_ARB_copy_buffer = 1;
def GL_ARB_copy_image = 1;
def GL_ARB_cull_distance = 1;
def GL_ARB_debug_output = 1;

def GLDEBUGPROCARB func(source GLenum; type GLenum; id GLuint; severity GLenum; length GLsizei; message GLchar ref; userParam u8 ref);
def GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB = 0x8242;
def GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243;
def GL_DEBUG_CALLBACK_FUNCTION_ARB = 0x8244;
def GL_DEBUG_CALLBACK_USER_PARAM_ARB = 0x8245;
def GL_DEBUG_SOURCE_API_ARB = 0x8246;
def GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = 0x8247;
def GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = 0x8248;
def GL_DEBUG_SOURCE_THIRD_PARTY_ARB = 0x8249;
def GL_DEBUG_SOURCE_APPLICATION_ARB = 0x824A;
def GL_DEBUG_SOURCE_OTHER_ARB = 0x824B;
def GL_DEBUG_TYPE_ERROR_ARB = 0x824C;
def GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = 0x824D;
def GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = 0x824E;
def GL_DEBUG_TYPE_PORTABILITY_ARB = 0x824F;
def GL_DEBUG_TYPE_PERFORMANCE_ARB = 0x8250;
def GL_DEBUG_TYPE_OTHER_ARB = 0x8251;
def GL_MAX_DEBUG_MESSAGE_LENGTH_ARB = 0x9143;
def GL_MAX_DEBUG_LOGGED_MESSAGES_ARB = 0x9144;
def GL_DEBUG_LOGGED_MESSAGES_ARB = 0x9145;
def GL_DEBUG_SEVERITY_HIGH_ARB = 0x9146;
def GL_DEBUG_SEVERITY_MEDIUM_ARB = 0x9147;
def GL_DEBUG_SEVERITY_LOW_ARB = 0x9148;

def glDebugMessageControlARB_signature func(source GLenum; type GLenum; severity GLenum; count GLsizei; ids GLuint ref; enabled GLboolean);
var global glDebugMessageControlARB glDebugMessageControlARB_signature;

def glDebugMessageInsertARB_signature func(source GLenum; type GLenum; id GLuint; severity GLenum; length GLsizei; buf GLchar ref);
var global glDebugMessageInsertARB glDebugMessageInsertARB_signature;

def glDebugMessageCallbackARB_signature func(callback GLDEBUGPROCARB; userParam u8 ref);
var global glDebugMessageCallbackARB glDebugMessageCallbackARB_signature;

def glGetDebugMessageLogARB_signature func(count GLuint; bufSize GLsizei; sources GLenum ref; types GLenum ref; ids GLuint ref; severities GLenum ref; lengths GLsizei ref; messageLog GLchar ref) (result GLuint);
var global glGetDebugMessageLogARB glGetDebugMessageLogARB_signature;
def GL_ARB_depth_buffer_float = 1;
def GL_ARB_depth_clamp = 1;
def GL_ARB_depth_texture = 1;
def GL_DEPTH_COMPONENT16_ARB = 0x81A5;
def GL_DEPTH_COMPONENT24_ARB = 0x81A6;
def GL_DEPTH_COMPONENT32_ARB = 0x81A7;
def GL_TEXTURE_DEPTH_SIZE_ARB = 0x884A;
def GL_DEPTH_TEXTURE_MODE_ARB = 0x884B;
def GL_ARB_derivative_control = 1;
def GL_ARB_direct_state_access = 1;
def GL_ARB_draw_buffers = 1;
def GL_MAX_DRAW_BUFFERS_ARB = 0x8824;
def GL_DRAW_BUFFER0_ARB = 0x8825;
def GL_DRAW_BUFFER1_ARB = 0x8826;
def GL_DRAW_BUFFER2_ARB = 0x8827;
def GL_DRAW_BUFFER3_ARB = 0x8828;
def GL_DRAW_BUFFER4_ARB = 0x8829;
def GL_DRAW_BUFFER5_ARB = 0x882A;
def GL_DRAW_BUFFER6_ARB = 0x882B;
def GL_DRAW_BUFFER7_ARB = 0x882C;
def GL_DRAW_BUFFER8_ARB = 0x882D;
def GL_DRAW_BUFFER9_ARB = 0x882E;
def GL_DRAW_BUFFER10_ARB = 0x882F;
def GL_DRAW_BUFFER11_ARB = 0x8830;
def GL_DRAW_BUFFER12_ARB = 0x8831;
def GL_DRAW_BUFFER13_ARB = 0x8832;
def GL_DRAW_BUFFER14_ARB = 0x8833;
def GL_DRAW_BUFFER15_ARB = 0x8834;

def glDrawBuffersARB_signature func(n GLsizei; bufs GLenum ref);
var global glDrawBuffersARB glDrawBuffersARB_signature;
def GL_ARB_draw_buffers_blend = 1;

def glBlendEquationiARB_signature func(buf GLuint; mode GLenum);
var global glBlendEquationiARB glBlendEquationiARB_signature;

def glBlendEquationSeparateiARB_signature func(buf GLuint; modeRGB GLenum; modeAlpha GLenum);
var global glBlendEquationSeparateiARB glBlendEquationSeparateiARB_signature;

def glBlendFunciARB_signature func(buf GLuint; src GLenum; dst GLenum);
var global glBlendFunciARB glBlendFunciARB_signature;

def glBlendFuncSeparateiARB_signature func(buf GLuint; srcRGB GLenum; dstRGB GLenum; srcAlpha GLenum; dstAlpha GLenum);
var global glBlendFuncSeparateiARB glBlendFuncSeparateiARB_signature;
def GL_ARB_draw_elements_base_vertex = 1;
def GL_ARB_draw_indirect = 1;
def GL_ARB_draw_instanced = 1;

def glDrawArraysInstancedARB_signature func(mode GLenum; first GLint; count GLsizei; primcount GLsizei);
var global glDrawArraysInstancedARB glDrawArraysInstancedARB_signature;

def glDrawElementsInstancedARB_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; primcount GLsizei);
var global glDrawElementsInstancedARB glDrawElementsInstancedARB_signature;
def GL_ARB_enhanced_layouts = 1;
def GL_ARB_explicit_attrib_location = 1;
def GL_ARB_explicit_uniform_location = 1;
def GL_ARB_fragment_coord_conventions = 1;
def GL_ARB_fragment_layer_viewport = 1;
def GL_ARB_fragment_program = 1;
def GL_FRAGMENT_PROGRAM_ARB = 0x8804;
def GL_PROGRAM_FORMAT_ASCII_ARB = 0x8875;
def GL_PROGRAM_LENGTH_ARB = 0x8627;
def GL_PROGRAM_FORMAT_ARB = 0x8876;
def GL_PROGRAM_BINDING_ARB = 0x8677;
def GL_PROGRAM_INSTRUCTIONS_ARB = 0x88A0;
def GL_MAX_PROGRAM_INSTRUCTIONS_ARB = 0x88A1;
def GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB = 0x88A2;
def GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB = 0x88A3;
def GL_PROGRAM_TEMPORARIES_ARB = 0x88A4;
def GL_MAX_PROGRAM_TEMPORARIES_ARB = 0x88A5;
def GL_PROGRAM_NATIVE_TEMPORARIES_ARB = 0x88A6;
def GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB = 0x88A7;
def GL_PROGRAM_PARAMETERS_ARB = 0x88A8;
def GL_MAX_PROGRAM_PARAMETERS_ARB = 0x88A9;
def GL_PROGRAM_NATIVE_PARAMETERS_ARB = 0x88AA;
def GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB = 0x88AB;
def GL_PROGRAM_ATTRIBS_ARB = 0x88AC;
def GL_MAX_PROGRAM_ATTRIBS_ARB = 0x88AD;
def GL_PROGRAM_NATIVE_ATTRIBS_ARB = 0x88AE;
def GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB = 0x88AF;
def GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB = 0x88B4;
def GL_MAX_PROGRAM_ENV_PARAMETERS_ARB = 0x88B5;
def GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB = 0x88B6;
def GL_PROGRAM_ALU_INSTRUCTIONS_ARB = 0x8805;
def GL_PROGRAM_TEX_INSTRUCTIONS_ARB = 0x8806;
def GL_PROGRAM_TEX_INDIRECTIONS_ARB = 0x8807;
def GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = 0x8808;
def GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = 0x8809;
def GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = 0x880A;
def GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB = 0x880B;
def GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB = 0x880C;
def GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB = 0x880D;
def GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = 0x880E;
def GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = 0x880F;
def GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = 0x8810;
def GL_PROGRAM_STRING_ARB = 0x8628;
def GL_PROGRAM_ERROR_POSITION_ARB = 0x864B;
def GL_CURRENT_MATRIX_ARB = 0x8641;
def GL_TRANSPOSE_CURRENT_MATRIX_ARB = 0x88B7;
def GL_CURRENT_MATRIX_STACK_DEPTH_ARB = 0x8640;
def GL_MAX_PROGRAM_MATRICES_ARB = 0x862F;
def GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB = 0x862E;
def GL_MAX_TEXTURE_COORDS_ARB = 0x8871;
def GL_MAX_TEXTURE_IMAGE_UNITS_ARB = 0x8872;
def GL_PROGRAM_ERROR_STRING_ARB = 0x8874;
def GL_MATRIX0_ARB = 0x88C0;
def GL_MATRIX1_ARB = 0x88C1;
def GL_MATRIX2_ARB = 0x88C2;
def GL_MATRIX3_ARB = 0x88C3;
def GL_MATRIX4_ARB = 0x88C4;
def GL_MATRIX5_ARB = 0x88C5;
def GL_MATRIX6_ARB = 0x88C6;
def GL_MATRIX7_ARB = 0x88C7;
def GL_MATRIX8_ARB = 0x88C8;
def GL_MATRIX9_ARB = 0x88C9;
def GL_MATRIX10_ARB = 0x88CA;
def GL_MATRIX11_ARB = 0x88CB;
def GL_MATRIX12_ARB = 0x88CC;
def GL_MATRIX13_ARB = 0x88CD;
def GL_MATRIX14_ARB = 0x88CE;
def GL_MATRIX15_ARB = 0x88CF;
def GL_MATRIX16_ARB = 0x88D0;
def GL_MATRIX17_ARB = 0x88D1;
def GL_MATRIX18_ARB = 0x88D2;
def GL_MATRIX19_ARB = 0x88D3;
def GL_MATRIX20_ARB = 0x88D4;
def GL_MATRIX21_ARB = 0x88D5;
def GL_MATRIX22_ARB = 0x88D6;
def GL_MATRIX23_ARB = 0x88D7;
def GL_MATRIX24_ARB = 0x88D8;
def GL_MATRIX25_ARB = 0x88D9;
def GL_MATRIX26_ARB = 0x88DA;
def GL_MATRIX27_ARB = 0x88DB;
def GL_MATRIX28_ARB = 0x88DC;
def GL_MATRIX29_ARB = 0x88DD;
def GL_MATRIX30_ARB = 0x88DE;
def GL_MATRIX31_ARB = 0x88DF;

def glProgramStringARB_signature func(target GLenum; format GLenum; len GLsizei; string u8 ref);
var global glProgramStringARB glProgramStringARB_signature;

def glBindProgramARB_signature func(target GLenum; program GLuint);
var global glBindProgramARB glBindProgramARB_signature;

def glDeleteProgramsARB_signature func(n GLsizei; programs GLuint ref);
var global glDeleteProgramsARB glDeleteProgramsARB_signature;

def glGenProgramsARB_signature func(n GLsizei; programs GLuint ref);
var global glGenProgramsARB glGenProgramsARB_signature;

def glProgramEnvParameter4dARB_signature func(target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glProgramEnvParameter4dARB glProgramEnvParameter4dARB_signature;

def glProgramEnvParameter4dvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var global glProgramEnvParameter4dvARB glProgramEnvParameter4dvARB_signature;

def glProgramEnvParameter4fARB_signature func(target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glProgramEnvParameter4fARB glProgramEnvParameter4fARB_signature;

def glProgramEnvParameter4fvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var global glProgramEnvParameter4fvARB glProgramEnvParameter4fvARB_signature;

def glProgramLocalParameter4dARB_signature func(target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glProgramLocalParameter4dARB glProgramLocalParameter4dARB_signature;

def glProgramLocalParameter4dvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var global glProgramLocalParameter4dvARB glProgramLocalParameter4dvARB_signature;

def glProgramLocalParameter4fARB_signature func(target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glProgramLocalParameter4fARB glProgramLocalParameter4fARB_signature;

def glProgramLocalParameter4fvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var global glProgramLocalParameter4fvARB glProgramLocalParameter4fvARB_signature;

def glGetProgramEnvParameterdvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var global glGetProgramEnvParameterdvARB glGetProgramEnvParameterdvARB_signature;

def glGetProgramEnvParameterfvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var global glGetProgramEnvParameterfvARB glGetProgramEnvParameterfvARB_signature;

def glGetProgramLocalParameterdvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var global glGetProgramLocalParameterdvARB glGetProgramLocalParameterdvARB_signature;

def glGetProgramLocalParameterfvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var global glGetProgramLocalParameterfvARB glGetProgramLocalParameterfvARB_signature;

def glGetProgramivARB_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetProgramivARB glGetProgramivARB_signature;

def glGetProgramStringARB_signature func(target GLenum; pname GLenum; string u8 ref);
var global glGetProgramStringARB glGetProgramStringARB_signature;

def glIsProgramARB_signature func(program GLuint) (result GLboolean);
var global glIsProgramARB glIsProgramARB_signature;
def GL_ARB_fragment_program_shadow = 1;
def GL_ARB_fragment_shader = 1;
def GL_FRAGMENT_SHADER_ARB = 0x8B30;
def GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB = 0x8B49;
def GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB = 0x8B8B;
def GL_ARB_fragment_shader_interlock = 1;
def GL_ARB_framebuffer_no_attachments = 1;
def GL_ARB_framebuffer_object = 1;
def GL_ARB_framebuffer_sRGB = 1;
def GL_ARB_geometry_shader4 = 1;
def GL_LINES_ADJACENCY_ARB = 0x000A;
def GL_LINE_STRIP_ADJACENCY_ARB = 0x000B;
def GL_TRIANGLES_ADJACENCY_ARB = 0x000C;
def GL_TRIANGLE_STRIP_ADJACENCY_ARB = 0x000D;
def GL_PROGRAM_POINT_SIZE_ARB = 0x8642;
def GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = 0x8C29;
def GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = 0x8DA7;
def GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8;
def GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = 0x8DA9;
def GL_GEOMETRY_SHADER_ARB = 0x8DD9;
def GL_GEOMETRY_VERTICES_OUT_ARB = 0x8DDA;
def GL_GEOMETRY_INPUT_TYPE_ARB = 0x8DDB;
def GL_GEOMETRY_OUTPUT_TYPE_ARB = 0x8DDC;
def GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = 0x8DDD;
def GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = 0x8DDE;
def GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = 0x8DDF;
def GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = 0x8DE0;
def GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1;

def glProgramParameteriARB_signature func(program GLuint; pname GLenum; value GLint);
var global glProgramParameteriARB glProgramParameteriARB_signature;

def glFramebufferTextureARB_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint);
var global glFramebufferTextureARB glFramebufferTextureARB_signature;

def glFramebufferTextureLayerARB_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; layer GLint);
var global glFramebufferTextureLayerARB glFramebufferTextureLayerARB_signature;

def glFramebufferTextureFaceARB_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; face GLenum);
var global glFramebufferTextureFaceARB glFramebufferTextureFaceARB_signature;
def GL_ARB_get_program_binary = 1;
def GL_ARB_get_texture_sub_image = 1;
def GL_ARB_gl_spirv = 1;
def GL_SHADER_BINARY_FORMAT_SPIR_V_ARB = 0x9551;
def GL_SPIR_V_BINARY_ARB = 0x9552;

def glSpecializeShaderARB_signature func(shader GLuint; pEntryPoint GLchar ref; numSpecializationConstants GLuint; pConstantIndex GLuint ref; pConstantValue GLuint ref);
var global glSpecializeShaderARB glSpecializeShaderARB_signature;
def GL_ARB_gpu_shader5 = 1;
def GL_ARB_gpu_shader_fp64 = 1;
def GL_ARB_gpu_shader_int64 = 1;
def GL_INT64_ARB = 0x140E;
def GL_INT64_VEC2_ARB = 0x8FE9;
def GL_INT64_VEC3_ARB = 0x8FEA;
def GL_INT64_VEC4_ARB = 0x8FEB;
def GL_UNSIGNED_INT64_VEC2_ARB = 0x8FF5;
def GL_UNSIGNED_INT64_VEC3_ARB = 0x8FF6;
def GL_UNSIGNED_INT64_VEC4_ARB = 0x8FF7;

def glUniform1i64ARB_signature func(location GLint; x GLint64);
var global glUniform1i64ARB glUniform1i64ARB_signature;

def glUniform2i64ARB_signature func(location GLint; x GLint64; y GLint64);
var global glUniform2i64ARB glUniform2i64ARB_signature;

def glUniform3i64ARB_signature func(location GLint; x GLint64; y GLint64; z GLint64);
var global glUniform3i64ARB glUniform3i64ARB_signature;

def glUniform4i64ARB_signature func(location GLint; x GLint64; y GLint64; z GLint64; w GLint64);
var global glUniform4i64ARB glUniform4i64ARB_signature;

def glUniform1i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var global glUniform1i64vARB glUniform1i64vARB_signature;

def glUniform2i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var global glUniform2i64vARB glUniform2i64vARB_signature;

def glUniform3i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var global glUniform3i64vARB glUniform3i64vARB_signature;

def glUniform4i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var global glUniform4i64vARB glUniform4i64vARB_signature;

def glUniform1ui64ARB_signature func(location GLint; x GLuint64);
var global glUniform1ui64ARB glUniform1ui64ARB_signature;

def glUniform2ui64ARB_signature func(location GLint; x GLuint64; y GLuint64);
var global glUniform2ui64ARB glUniform2ui64ARB_signature;

def glUniform3ui64ARB_signature func(location GLint; x GLuint64; y GLuint64; z GLuint64);
var global glUniform3ui64ARB glUniform3ui64ARB_signature;

def glUniform4ui64ARB_signature func(location GLint; x GLuint64; y GLuint64; z GLuint64; w GLuint64);
var global glUniform4ui64ARB glUniform4ui64ARB_signature;

def glUniform1ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var global glUniform1ui64vARB glUniform1ui64vARB_signature;

def glUniform2ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var global glUniform2ui64vARB glUniform2ui64vARB_signature;

def glUniform3ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var global glUniform3ui64vARB glUniform3ui64vARB_signature;

def glUniform4ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var global glUniform4ui64vARB glUniform4ui64vARB_signature;

def glGetUniformi64vARB_signature func(program GLuint; location GLint; params GLint64 ref);
var global glGetUniformi64vARB glGetUniformi64vARB_signature;

def glGetUniformui64vARB_signature func(program GLuint; location GLint; params GLuint64 ref);
var global glGetUniformui64vARB glGetUniformui64vARB_signature;

def glGetnUniformi64vARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLint64 ref);
var global glGetnUniformi64vARB glGetnUniformi64vARB_signature;

def glGetnUniformui64vARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLuint64 ref);
var global glGetnUniformui64vARB glGetnUniformui64vARB_signature;

def glProgramUniform1i64ARB_signature func(program GLuint; location GLint; x GLint64);
var global glProgramUniform1i64ARB glProgramUniform1i64ARB_signature;

def glProgramUniform2i64ARB_signature func(program GLuint; location GLint; x GLint64; y GLint64);
var global glProgramUniform2i64ARB glProgramUniform2i64ARB_signature;

def glProgramUniform3i64ARB_signature func(program GLuint; location GLint; x GLint64; y GLint64; z GLint64);
var global glProgramUniform3i64ARB glProgramUniform3i64ARB_signature;

def glProgramUniform4i64ARB_signature func(program GLuint; location GLint; x GLint64; y GLint64; z GLint64; w GLint64);
var global glProgramUniform4i64ARB glProgramUniform4i64ARB_signature;

def glProgramUniform1i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var global glProgramUniform1i64vARB glProgramUniform1i64vARB_signature;

def glProgramUniform2i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var global glProgramUniform2i64vARB glProgramUniform2i64vARB_signature;

def glProgramUniform3i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var global glProgramUniform3i64vARB glProgramUniform3i64vARB_signature;

def glProgramUniform4i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var global glProgramUniform4i64vARB glProgramUniform4i64vARB_signature;

def glProgramUniform1ui64ARB_signature func(program GLuint; location GLint; x GLuint64);
var global glProgramUniform1ui64ARB glProgramUniform1ui64ARB_signature;

def glProgramUniform2ui64ARB_signature func(program GLuint; location GLint; x GLuint64; y GLuint64);
var global glProgramUniform2ui64ARB glProgramUniform2ui64ARB_signature;

def glProgramUniform3ui64ARB_signature func(program GLuint; location GLint; x GLuint64; y GLuint64; z GLuint64);
var global glProgramUniform3ui64ARB glProgramUniform3ui64ARB_signature;

def glProgramUniform4ui64ARB_signature func(program GLuint; location GLint; x GLuint64; y GLuint64; z GLuint64; w GLuint64);
var global glProgramUniform4ui64ARB glProgramUniform4ui64ARB_signature;

def glProgramUniform1ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var global glProgramUniform1ui64vARB glProgramUniform1ui64vARB_signature;

def glProgramUniform2ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var global glProgramUniform2ui64vARB glProgramUniform2ui64vARB_signature;

def glProgramUniform3ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var global glProgramUniform3ui64vARB glProgramUniform3ui64vARB_signature;

def glProgramUniform4ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var global glProgramUniform4ui64vARB glProgramUniform4ui64vARB_signature;
def GL_ARB_half_float_pixel = 1;
def GL_HALF_FLOAT_ARB = 0x140B;
def GL_ARB_half_float_vertex = 1;
def GL_ARB_imaging = 1;
def GL_CONVOLUTION_BORDER_MODE = 0x8013;
def GL_CONVOLUTION_FILTER_SCALE = 0x8014;
def GL_CONVOLUTION_FILTER_BIAS = 0x8015;
def GL_REDUCE = 0x8016;
def GL_CONVOLUTION_FORMAT = 0x8017;
def GL_CONVOLUTION_WIDTH = 0x8018;
def GL_CONVOLUTION_HEIGHT = 0x8019;
def GL_MAX_CONVOLUTION_WIDTH = 0x801A;
def GL_MAX_CONVOLUTION_HEIGHT = 0x801B;
def GL_POST_CONVOLUTION_RED_SCALE = 0x801C;
def GL_POST_CONVOLUTION_GREEN_SCALE = 0x801D;
def GL_POST_CONVOLUTION_BLUE_SCALE = 0x801E;
def GL_POST_CONVOLUTION_ALPHA_SCALE = 0x801F;
def GL_POST_CONVOLUTION_RED_BIAS = 0x8020;
def GL_POST_CONVOLUTION_GREEN_BIAS = 0x8021;
def GL_POST_CONVOLUTION_BLUE_BIAS = 0x8022;
def GL_POST_CONVOLUTION_ALPHA_BIAS = 0x8023;
def GL_HISTOGRAM_WIDTH = 0x8026;
def GL_HISTOGRAM_FORMAT = 0x8027;
def GL_HISTOGRAM_RED_SIZE = 0x8028;
def GL_HISTOGRAM_GREEN_SIZE = 0x8029;
def GL_HISTOGRAM_BLUE_SIZE = 0x802A;
def GL_HISTOGRAM_ALPHA_SIZE = 0x802B;
def GL_HISTOGRAM_LUMINANCE_SIZE = 0x802C;
def GL_HISTOGRAM_SINK = 0x802D;
def GL_MINMAX_FORMAT = 0x802F;
def GL_MINMAX_SINK = 0x8030;
def GL_TABLE_TOO_LARGE = 0x8031;
def GL_COLOR_MATRIX = 0x80B1;
def GL_COLOR_MATRIX_STACK_DEPTH = 0x80B2;
def GL_MAX_COLOR_MATRIX_STACK_DEPTH = 0x80B3;
def GL_POST_COLOR_MATRIX_RED_SCALE = 0x80B4;
def GL_POST_COLOR_MATRIX_GREEN_SCALE = 0x80B5;
def GL_POST_COLOR_MATRIX_BLUE_SCALE = 0x80B6;
def GL_POST_COLOR_MATRIX_ALPHA_SCALE = 0x80B7;
def GL_POST_COLOR_MATRIX_RED_BIAS = 0x80B8;
def GL_POST_COLOR_MATRIX_GREEN_BIAS = 0x80B9;
def GL_POST_COLOR_MATRIX_BLUE_BIAS = 0x80BA;
def GL_POST_COLOR_MATRIX_ALPHA_BIAS = 0x80BB;
def GL_COLOR_TABLE_SCALE = 0x80D6;
def GL_COLOR_TABLE_BIAS = 0x80D7;
def GL_COLOR_TABLE_FORMAT = 0x80D8;
def GL_COLOR_TABLE_WIDTH = 0x80D9;
def GL_COLOR_TABLE_RED_SIZE = 0x80DA;
def GL_COLOR_TABLE_GREEN_SIZE = 0x80DB;
def GL_COLOR_TABLE_BLUE_SIZE = 0x80DC;
def GL_COLOR_TABLE_ALPHA_SIZE = 0x80DD;
def GL_COLOR_TABLE_LUMINANCE_SIZE = 0x80DE;
def GL_COLOR_TABLE_INTENSITY_SIZE = 0x80DF;
def GL_CONSTANT_BORDER = 0x8151;
def GL_REPLICATE_BORDER = 0x8153;
def GL_CONVOLUTION_BORDER_COLOR = 0x8154;

def glColorTable_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; table u8 ref);
var global glColorTable glColorTable_signature;

def glColorTableParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glColorTableParameterfv glColorTableParameterfv_signature;

def glColorTableParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glColorTableParameteriv glColorTableParameteriv_signature;

def glCopyColorTable_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var global glCopyColorTable glCopyColorTable_signature;

def glGetColorTable_signature func(target GLenum; format GLenum; type GLenum; table u8 ref);
var global glGetColorTable glGetColorTable_signature;

def glGetColorTableParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetColorTableParameterfv glGetColorTableParameterfv_signature;

def glGetColorTableParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetColorTableParameteriv glGetColorTableParameteriv_signature;

def glColorSubTable_signature func(target GLenum; start GLsizei; count GLsizei; format GLenum; type GLenum; data u8 ref);
var global glColorSubTable glColorSubTable_signature;

def glCopyColorSubTable_signature func(target GLenum; start GLsizei; x GLint; y GLint; width GLsizei);
var global glCopyColorSubTable glCopyColorSubTable_signature;

def glConvolutionFilter1D_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; image u8 ref);
var global glConvolutionFilter1D glConvolutionFilter1D_signature;

def glConvolutionFilter2D_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; image u8 ref);
var global glConvolutionFilter2D glConvolutionFilter2D_signature;

def glConvolutionParameterf_signature func(target GLenum; pname GLenum; params GLfloat);
var global glConvolutionParameterf glConvolutionParameterf_signature;

def glConvolutionParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glConvolutionParameterfv glConvolutionParameterfv_signature;

def glConvolutionParameteri_signature func(target GLenum; pname GLenum; params GLint);
var global glConvolutionParameteri glConvolutionParameteri_signature;

def glConvolutionParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glConvolutionParameteriv glConvolutionParameteriv_signature;

def glCopyConvolutionFilter1D_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var global glCopyConvolutionFilter1D glCopyConvolutionFilter1D_signature;

def glCopyConvolutionFilter2D_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyConvolutionFilter2D glCopyConvolutionFilter2D_signature;

def glGetConvolutionFilter_signature func(target GLenum; format GLenum; type GLenum; image u8 ref);
var global glGetConvolutionFilter glGetConvolutionFilter_signature;

def glGetConvolutionParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetConvolutionParameterfv glGetConvolutionParameterfv_signature;

def glGetConvolutionParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetConvolutionParameteriv glGetConvolutionParameteriv_signature;

def glGetSeparableFilter_signature func(target GLenum; format GLenum; type GLenum; row u8 ref; column u8 ref; span u8 ref);
var global glGetSeparableFilter glGetSeparableFilter_signature;

def glSeparableFilter2D_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; row u8 ref; column u8 ref);
var global glSeparableFilter2D glSeparableFilter2D_signature;

def glGetHistogram_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var global glGetHistogram glGetHistogram_signature;

def glGetHistogramParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetHistogramParameterfv glGetHistogramParameterfv_signature;

def glGetHistogramParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetHistogramParameteriv glGetHistogramParameteriv_signature;

def glGetMinmax_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var global glGetMinmax glGetMinmax_signature;

def glGetMinmaxParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetMinmaxParameterfv glGetMinmaxParameterfv_signature;

def glGetMinmaxParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetMinmaxParameteriv glGetMinmaxParameteriv_signature;

def glHistogram_signature func(target GLenum; width GLsizei; internalformat GLenum; sink GLboolean);
var global glHistogram glHistogram_signature;

def glMinmax_signature func(target GLenum; internalformat GLenum; sink GLboolean);
var global glMinmax glMinmax_signature;

def glResetHistogram_signature func(target GLenum);
var global glResetHistogram glResetHistogram_signature;

def glResetMinmax_signature func(target GLenum);
var global glResetMinmax glResetMinmax_signature;
def GL_ARB_indirect_parameters = 1;
def GL_PARAMETER_BUFFER_ARB = 0x80EE;
def GL_PARAMETER_BUFFER_BINDING_ARB = 0x80EF;

def glMultiDrawArraysIndirectCountARB_signature func(mode GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var global glMultiDrawArraysIndirectCountARB glMultiDrawArraysIndirectCountARB_signature;

def glMultiDrawElementsIndirectCountARB_signature func(mode GLenum; type GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var global glMultiDrawElementsIndirectCountARB glMultiDrawElementsIndirectCountARB_signature;
def GL_ARB_instanced_arrays = 1;
def GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = 0x88FE;

def glVertexAttribDivisorARB_signature func(index GLuint; divisor GLuint);
var global glVertexAttribDivisorARB glVertexAttribDivisorARB_signature;
def GL_ARB_internalformat_query = 1;
def GL_ARB_internalformat_query2 = 1;
def GL_SRGB_DECODE_ARB = 0x8299;
def GL_VIEW_CLASS_EAC_R11 = 0x9383;
def GL_VIEW_CLASS_EAC_RG11 = 0x9384;
def GL_VIEW_CLASS_ETC2_RGB = 0x9385;
def GL_VIEW_CLASS_ETC2_RGBA = 0x9386;
def GL_VIEW_CLASS_ETC2_EAC_RGBA = 0x9387;
def GL_VIEW_CLASS_ASTC_4x4_RGBA = 0x9388;
def GL_VIEW_CLASS_ASTC_5x4_RGBA = 0x9389;
def GL_VIEW_CLASS_ASTC_5x5_RGBA = 0x938A;
def GL_VIEW_CLASS_ASTC_6x5_RGBA = 0x938B;
def GL_VIEW_CLASS_ASTC_6x6_RGBA = 0x938C;
def GL_VIEW_CLASS_ASTC_8x5_RGBA = 0x938D;
def GL_VIEW_CLASS_ASTC_8x6_RGBA = 0x938E;
def GL_VIEW_CLASS_ASTC_8x8_RGBA = 0x938F;
def GL_VIEW_CLASS_ASTC_10x5_RGBA = 0x9390;
def GL_VIEW_CLASS_ASTC_10x6_RGBA = 0x9391;
def GL_VIEW_CLASS_ASTC_10x8_RGBA = 0x9392;
def GL_VIEW_CLASS_ASTC_10x10_RGBA = 0x9393;
def GL_VIEW_CLASS_ASTC_12x10_RGBA = 0x9394;
def GL_VIEW_CLASS_ASTC_12x12_RGBA = 0x9395;
def GL_ARB_invalidate_subdata = 1;
def GL_ARB_map_buffer_alignment = 1;
def GL_ARB_map_buffer_range = 1;
def GL_ARB_matrix_palette = 1;
def GL_MATRIX_PALETTE_ARB = 0x8840;
def GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = 0x8841;
def GL_MAX_PALETTE_MATRICES_ARB = 0x8842;
def GL_CURRENT_PALETTE_MATRIX_ARB = 0x8843;
def GL_MATRIX_INDEX_ARRAY_ARB = 0x8844;
def GL_CURRENT_MATRIX_INDEX_ARB = 0x8845;
def GL_MATRIX_INDEX_ARRAY_SIZE_ARB = 0x8846;
def GL_MATRIX_INDEX_ARRAY_TYPE_ARB = 0x8847;
def GL_MATRIX_INDEX_ARRAY_STRIDE_ARB = 0x8848;
def GL_MATRIX_INDEX_ARRAY_POINTER_ARB = 0x8849;

def glCurrentPaletteMatrixARB_signature func(index GLint);
var global glCurrentPaletteMatrixARB glCurrentPaletteMatrixARB_signature;

def glMatrixIndexubvARB_signature func(size GLint; indices GLubyte ref);
var global glMatrixIndexubvARB glMatrixIndexubvARB_signature;

def glMatrixIndexusvARB_signature func(size GLint; indices GLushort ref);
var global glMatrixIndexusvARB glMatrixIndexusvARB_signature;

def glMatrixIndexuivARB_signature func(size GLint; indices GLuint ref);
var global glMatrixIndexuivARB glMatrixIndexuivARB_signature;

def glMatrixIndexPointerARB_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glMatrixIndexPointerARB glMatrixIndexPointerARB_signature;
def GL_ARB_multi_bind = 1;
def GL_ARB_multi_draw_indirect = 1;
def GL_ARB_multisample = 1;
def GL_MULTISAMPLE_ARB = 0x809D;
def GL_SAMPLE_ALPHA_TO_COVERAGE_ARB = 0x809E;
def GL_SAMPLE_ALPHA_TO_ONE_ARB = 0x809F;
def GL_SAMPLE_COVERAGE_ARB = 0x80A0;
def GL_SAMPLE_BUFFERS_ARB = 0x80A8;
def GL_SAMPLES_ARB = 0x80A9;
def GL_SAMPLE_COVERAGE_VALUE_ARB = 0x80AA;
def GL_SAMPLE_COVERAGE_INVERT_ARB = 0x80AB;
def GL_MULTISAMPLE_BIT_ARB = 0x20000000;

def glSampleCoverageARB_signature func(value GLfloat; invert GLboolean);
var global glSampleCoverageARB glSampleCoverageARB_signature;
def GL_ARB_multitexture = 1;
def GL_TEXTURE0_ARB = 0x84C0;
def GL_TEXTURE1_ARB = 0x84C1;
def GL_TEXTURE2_ARB = 0x84C2;
def GL_TEXTURE3_ARB = 0x84C3;
def GL_TEXTURE4_ARB = 0x84C4;
def GL_TEXTURE5_ARB = 0x84C5;
def GL_TEXTURE6_ARB = 0x84C6;
def GL_TEXTURE7_ARB = 0x84C7;
def GL_TEXTURE8_ARB = 0x84C8;
def GL_TEXTURE9_ARB = 0x84C9;
def GL_TEXTURE10_ARB = 0x84CA;
def GL_TEXTURE11_ARB = 0x84CB;
def GL_TEXTURE12_ARB = 0x84CC;
def GL_TEXTURE13_ARB = 0x84CD;
def GL_TEXTURE14_ARB = 0x84CE;
def GL_TEXTURE15_ARB = 0x84CF;
def GL_TEXTURE16_ARB = 0x84D0;
def GL_TEXTURE17_ARB = 0x84D1;
def GL_TEXTURE18_ARB = 0x84D2;
def GL_TEXTURE19_ARB = 0x84D3;
def GL_TEXTURE20_ARB = 0x84D4;
def GL_TEXTURE21_ARB = 0x84D5;
def GL_TEXTURE22_ARB = 0x84D6;
def GL_TEXTURE23_ARB = 0x84D7;
def GL_TEXTURE24_ARB = 0x84D8;
def GL_TEXTURE25_ARB = 0x84D9;
def GL_TEXTURE26_ARB = 0x84DA;
def GL_TEXTURE27_ARB = 0x84DB;
def GL_TEXTURE28_ARB = 0x84DC;
def GL_TEXTURE29_ARB = 0x84DD;
def GL_TEXTURE30_ARB = 0x84DE;
def GL_TEXTURE31_ARB = 0x84DF;
def GL_ACTIVE_TEXTURE_ARB = 0x84E0;
def GL_CLIENT_ACTIVE_TEXTURE_ARB = 0x84E1;
def GL_MAX_TEXTURE_UNITS_ARB = 0x84E2;

def glActiveTextureARB_signature func(texture GLenum);
var global glActiveTextureARB glActiveTextureARB_signature;

def glClientActiveTextureARB_signature func(texture GLenum);
var global glClientActiveTextureARB glClientActiveTextureARB_signature;

def glMultiTexCoord1dARB_signature func(target GLenum; s GLdouble);
var global glMultiTexCoord1dARB glMultiTexCoord1dARB_signature;

def glMultiTexCoord1dvARB_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord1dvARB glMultiTexCoord1dvARB_signature;

def glMultiTexCoord1fARB_signature func(target GLenum; s GLfloat);
var global glMultiTexCoord1fARB glMultiTexCoord1fARB_signature;

def glMultiTexCoord1fvARB_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord1fvARB glMultiTexCoord1fvARB_signature;

def glMultiTexCoord1iARB_signature func(target GLenum; s GLint);
var global glMultiTexCoord1iARB glMultiTexCoord1iARB_signature;

def glMultiTexCoord1ivARB_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord1ivARB glMultiTexCoord1ivARB_signature;

def glMultiTexCoord1sARB_signature func(target GLenum; s GLshort);
var global glMultiTexCoord1sARB glMultiTexCoord1sARB_signature;

def glMultiTexCoord1svARB_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord1svARB glMultiTexCoord1svARB_signature;

def glMultiTexCoord2dARB_signature func(target GLenum; s GLdouble; t GLdouble);
var global glMultiTexCoord2dARB glMultiTexCoord2dARB_signature;

def glMultiTexCoord2dvARB_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord2dvARB glMultiTexCoord2dvARB_signature;

def glMultiTexCoord2fARB_signature func(target GLenum; s GLfloat; t GLfloat);
var global glMultiTexCoord2fARB glMultiTexCoord2fARB_signature;

def glMultiTexCoord2fvARB_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord2fvARB glMultiTexCoord2fvARB_signature;

def glMultiTexCoord2iARB_signature func(target GLenum; s GLint; t GLint);
var global glMultiTexCoord2iARB glMultiTexCoord2iARB_signature;

def glMultiTexCoord2ivARB_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord2ivARB glMultiTexCoord2ivARB_signature;

def glMultiTexCoord2sARB_signature func(target GLenum; s GLshort; t GLshort);
var global glMultiTexCoord2sARB glMultiTexCoord2sARB_signature;

def glMultiTexCoord2svARB_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord2svARB glMultiTexCoord2svARB_signature;

def glMultiTexCoord3dARB_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble);
var global glMultiTexCoord3dARB glMultiTexCoord3dARB_signature;

def glMultiTexCoord3dvARB_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord3dvARB glMultiTexCoord3dvARB_signature;

def glMultiTexCoord3fARB_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat);
var global glMultiTexCoord3fARB glMultiTexCoord3fARB_signature;

def glMultiTexCoord3fvARB_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord3fvARB glMultiTexCoord3fvARB_signature;

def glMultiTexCoord3iARB_signature func(target GLenum; s GLint; t GLint; r GLint);
var global glMultiTexCoord3iARB glMultiTexCoord3iARB_signature;

def glMultiTexCoord3ivARB_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord3ivARB glMultiTexCoord3ivARB_signature;

def glMultiTexCoord3sARB_signature func(target GLenum; s GLshort; t GLshort; r GLshort);
var global glMultiTexCoord3sARB glMultiTexCoord3sARB_signature;

def glMultiTexCoord3svARB_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord3svARB glMultiTexCoord3svARB_signature;

def glMultiTexCoord4dARB_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble; q GLdouble);
var global glMultiTexCoord4dARB glMultiTexCoord4dARB_signature;

def glMultiTexCoord4dvARB_signature func(target GLenum; v GLdouble ref);
var global glMultiTexCoord4dvARB glMultiTexCoord4dvARB_signature;

def glMultiTexCoord4fARB_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat; q GLfloat);
var global glMultiTexCoord4fARB glMultiTexCoord4fARB_signature;

def glMultiTexCoord4fvARB_signature func(target GLenum; v GLfloat ref);
var global glMultiTexCoord4fvARB glMultiTexCoord4fvARB_signature;

def glMultiTexCoord4iARB_signature func(target GLenum; s GLint; t GLint; r GLint; q GLint);
var global glMultiTexCoord4iARB glMultiTexCoord4iARB_signature;

def glMultiTexCoord4ivARB_signature func(target GLenum; v GLint ref);
var global glMultiTexCoord4ivARB glMultiTexCoord4ivARB_signature;

def glMultiTexCoord4sARB_signature func(target GLenum; s GLshort; t GLshort; r GLshort; q GLshort);
var global glMultiTexCoord4sARB glMultiTexCoord4sARB_signature;

def glMultiTexCoord4svARB_signature func(target GLenum; v GLshort ref);
var global glMultiTexCoord4svARB glMultiTexCoord4svARB_signature;
def GL_ARB_occlusion_query = 1;
def GL_QUERY_COUNTER_BITS_ARB = 0x8864;
def GL_CURRENT_QUERY_ARB = 0x8865;
def GL_QUERY_RESULT_ARB = 0x8866;
def GL_QUERY_RESULT_AVAILABLE_ARB = 0x8867;
def GL_SAMPLES_PASSED_ARB = 0x8914;

def glGenQueriesARB_signature func(n GLsizei; ids GLuint ref);
var global glGenQueriesARB glGenQueriesARB_signature;

def glDeleteQueriesARB_signature func(n GLsizei; ids GLuint ref);
var global glDeleteQueriesARB glDeleteQueriesARB_signature;

def glIsQueryARB_signature func(id GLuint) (result GLboolean);
var global glIsQueryARB glIsQueryARB_signature;

def glBeginQueryARB_signature func(target GLenum; id GLuint);
var global glBeginQueryARB glBeginQueryARB_signature;

def glEndQueryARB_signature func(target GLenum);
var global glEndQueryARB glEndQueryARB_signature;

def glGetQueryivARB_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetQueryivARB glGetQueryivARB_signature;

def glGetQueryObjectivARB_signature func(id GLuint; pname GLenum; params GLint ref);
var global glGetQueryObjectivARB glGetQueryObjectivARB_signature;

def glGetQueryObjectuivARB_signature func(id GLuint; pname GLenum; params GLuint ref);
var global glGetQueryObjectuivARB glGetQueryObjectuivARB_signature;
def GL_ARB_occlusion_query2 = 1;
def GL_ARB_parallel_shader_compile = 1;
def GL_MAX_SHADER_COMPILER_THREADS_ARB = 0x91B0;
def GL_COMPLETION_STATUS_ARB = 0x91B1;

def glMaxShaderCompilerThreadsARB_signature func(count GLuint);
var global glMaxShaderCompilerThreadsARB glMaxShaderCompilerThreadsARB_signature;
def GL_ARB_pipeline_statistics_query = 1;
def GL_VERTICES_SUBMITTED_ARB = 0x82EE;
def GL_PRIMITIVES_SUBMITTED_ARB = 0x82EF;
def GL_VERTEX_SHADER_INVOCATIONS_ARB = 0x82F0;
def GL_TESS_CONTROL_SHADER_PATCHES_ARB = 0x82F1;
def GL_TESS_EVALUATION_SHADER_INVOCATIONS_ARB = 0x82F2;
def GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED_ARB = 0x82F3;
def GL_FRAGMENT_SHADER_INVOCATIONS_ARB = 0x82F4;
def GL_COMPUTE_SHADER_INVOCATIONS_ARB = 0x82F5;
def GL_CLIPPING_INPUT_PRIMITIVES_ARB = 0x82F6;
def GL_CLIPPING_OUTPUT_PRIMITIVES_ARB = 0x82F7;
def GL_ARB_pixel_buffer_object = 1;
def GL_PIXEL_PACK_BUFFER_ARB = 0x88EB;
def GL_PIXEL_UNPACK_BUFFER_ARB = 0x88EC;
def GL_PIXEL_PACK_BUFFER_BINDING_ARB = 0x88ED;
def GL_PIXEL_UNPACK_BUFFER_BINDING_ARB = 0x88EF;
def GL_ARB_point_parameters = 1;
def GL_POINT_SIZE_MIN_ARB = 0x8126;
def GL_POINT_SIZE_MAX_ARB = 0x8127;
def GL_POINT_FADE_THRESHOLD_SIZE_ARB = 0x8128;
def GL_POINT_DISTANCE_ATTENUATION_ARB = 0x8129;

def glPointParameterfARB_signature func(pname GLenum; param GLfloat);
var global glPointParameterfARB glPointParameterfARB_signature;

def glPointParameterfvARB_signature func(pname GLenum; params GLfloat ref);
var global glPointParameterfvARB glPointParameterfvARB_signature;
def GL_ARB_point_sprite = 1;
def GL_POINT_SPRITE_ARB = 0x8861;
def GL_COORD_REPLACE_ARB = 0x8862;
def GL_ARB_polygon_offset_clamp = 1;
def GL_ARB_post_depth_coverage = 1;
def GL_ARB_program_interface_query = 1;
def GL_ARB_provoking_vertex = 1;
def GL_ARB_query_buffer_object = 1;
def GL_ARB_robust_buffer_access_behavior = 1;
def GL_ARB_robustness = 1;
def GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB = 0x00000004;
def GL_LOSE_CONTEXT_ON_RESET_ARB = 0x8252;
def GL_GUILTY_CONTEXT_RESET_ARB = 0x8253;
def GL_INNOCENT_CONTEXT_RESET_ARB = 0x8254;
def GL_UNKNOWN_CONTEXT_RESET_ARB = 0x8255;
def GL_RESET_NOTIFICATION_STRATEGY_ARB = 0x8256;
def GL_NO_RESET_NOTIFICATION_ARB = 0x8261;

def glGetGraphicsResetStatusARB_signature func() (result GLenum);
var global glGetGraphicsResetStatusARB glGetGraphicsResetStatusARB_signature;

def glGetnTexImageARB_signature func(target GLenum; level GLint; format GLenum; type GLenum; bufSize GLsizei; img u8 ref);
var global glGetnTexImageARB glGetnTexImageARB_signature;

def glReadnPixelsARB_signature func(x GLint; y GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; bufSize GLsizei; data u8 ref);
var global glReadnPixelsARB glReadnPixelsARB_signature;

def glGetnCompressedTexImageARB_signature func(target GLenum; lod GLint; bufSize GLsizei; img u8 ref);
var global glGetnCompressedTexImageARB glGetnCompressedTexImageARB_signature;

def glGetnUniformfvARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLfloat ref);
var global glGetnUniformfvARB glGetnUniformfvARB_signature;

def glGetnUniformivARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLint ref);
var global glGetnUniformivARB glGetnUniformivARB_signature;

def glGetnUniformuivARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLuint ref);
var global glGetnUniformuivARB glGetnUniformuivARB_signature;

def glGetnUniformdvARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLdouble ref);
var global glGetnUniformdvARB glGetnUniformdvARB_signature;

def glGetnMapdvARB_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLdouble ref);
var global glGetnMapdvARB glGetnMapdvARB_signature;

def glGetnMapfvARB_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLfloat ref);
var global glGetnMapfvARB glGetnMapfvARB_signature;

def glGetnMapivARB_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLint ref);
var global glGetnMapivARB glGetnMapivARB_signature;

def glGetnPixelMapfvARB_signature func(map GLenum; bufSize GLsizei; values GLfloat ref);
var global glGetnPixelMapfvARB glGetnPixelMapfvARB_signature;

def glGetnPixelMapuivARB_signature func(map GLenum; bufSize GLsizei; values GLuint ref);
var global glGetnPixelMapuivARB glGetnPixelMapuivARB_signature;

def glGetnPixelMapusvARB_signature func(map GLenum; bufSize GLsizei; values GLushort ref);
var global glGetnPixelMapusvARB glGetnPixelMapusvARB_signature;

def glGetnPolygonStippleARB_signature func(bufSize GLsizei; pattern GLubyte ref);
var global glGetnPolygonStippleARB glGetnPolygonStippleARB_signature;

def glGetnColorTableARB_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; table u8 ref);
var global glGetnColorTableARB glGetnColorTableARB_signature;

def glGetnConvolutionFilterARB_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; image u8 ref);
var global glGetnConvolutionFilterARB glGetnConvolutionFilterARB_signature;

def glGetnSeparableFilterARB_signature func(target GLenum; format GLenum; type GLenum; rowBufSize GLsizei; row u8 ref; columnBufSize GLsizei; column u8 ref; span u8 ref);
var global glGetnSeparableFilterARB glGetnSeparableFilterARB_signature;

def glGetnHistogramARB_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var global glGetnHistogramARB glGetnHistogramARB_signature;

def glGetnMinmaxARB_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var global glGetnMinmaxARB glGetnMinmaxARB_signature;
def GL_ARB_robustness_isolation = 1;
def GL_ARB_sample_locations = 1;
def GL_SAMPLE_LOCATION_SUBPIXEL_BITS_ARB = 0x933D;
def GL_SAMPLE_LOCATION_PIXEL_GRID_WIDTH_ARB = 0x933E;
def GL_SAMPLE_LOCATION_PIXEL_GRID_HEIGHT_ARB = 0x933F;
def GL_PROGRAMMABLE_SAMPLE_LOCATION_TABLE_SIZE_ARB = 0x9340;
def GL_SAMPLE_LOCATION_ARB = 0x8E50;
def GL_PROGRAMMABLE_SAMPLE_LOCATION_ARB = 0x9341;
def GL_FRAMEBUFFER_PROGRAMMABLE_SAMPLE_LOCATIONS_ARB = 0x9342;
def GL_FRAMEBUFFER_SAMPLE_LOCATION_PIXEL_GRID_ARB = 0x9343;

def glFramebufferSampleLocationsfvARB_signature func(target GLenum; start GLuint; count GLsizei; v GLfloat ref);
var global glFramebufferSampleLocationsfvARB glFramebufferSampleLocationsfvARB_signature;

def glNamedFramebufferSampleLocationsfvARB_signature func(framebuffer GLuint; start GLuint; count GLsizei; v GLfloat ref);
var global glNamedFramebufferSampleLocationsfvARB glNamedFramebufferSampleLocationsfvARB_signature;

def glEvaluateDepthValuesARB_signature func();
var global glEvaluateDepthValuesARB glEvaluateDepthValuesARB_signature;
def GL_ARB_sample_shading = 1;
def GL_SAMPLE_SHADING_ARB = 0x8C36;
def GL_MIN_SAMPLE_SHADING_VALUE_ARB = 0x8C37;

def glMinSampleShadingARB_signature func(value GLfloat);
var global glMinSampleShadingARB glMinSampleShadingARB_signature;
def GL_ARB_sampler_objects = 1;
def GL_ARB_seamless_cube_map = 1;
def GL_ARB_seamless_cubemap_per_texture = 1;
def GL_ARB_separate_shader_objects = 1;
def GL_ARB_shader_atomic_counter_ops = 1;
def GL_ARB_shader_atomic_counters = 1;
def GL_ARB_shader_ballot = 1;
def GL_ARB_shader_bit_encoding = 1;
def GL_ARB_shader_clock = 1;
def GL_ARB_shader_draw_parameters = 1;
def GL_ARB_shader_group_vote = 1;
def GL_ARB_shader_image_load_store = 1;
def GL_ARB_shader_image_size = 1;
def GL_ARB_shader_objects = 1;
def GL_PROGRAM_OBJECT_ARB = 0x8B40;
def GL_SHADER_OBJECT_ARB = 0x8B48;
def GL_OBJECT_TYPE_ARB = 0x8B4E;
def GL_OBJECT_SUBTYPE_ARB = 0x8B4F;
def GL_FLOAT_VEC2_ARB = 0x8B50;
def GL_FLOAT_VEC3_ARB = 0x8B51;
def GL_FLOAT_VEC4_ARB = 0x8B52;
def GL_INT_VEC2_ARB = 0x8B53;
def GL_INT_VEC3_ARB = 0x8B54;
def GL_INT_VEC4_ARB = 0x8B55;
def GL_BOOL_ARB = 0x8B56;
def GL_BOOL_VEC2_ARB = 0x8B57;
def GL_BOOL_VEC3_ARB = 0x8B58;
def GL_BOOL_VEC4_ARB = 0x8B59;
def GL_FLOAT_MAT2_ARB = 0x8B5A;
def GL_FLOAT_MAT3_ARB = 0x8B5B;
def GL_FLOAT_MAT4_ARB = 0x8B5C;
def GL_SAMPLER_1D_ARB = 0x8B5D;
def GL_SAMPLER_2D_ARB = 0x8B5E;
def GL_SAMPLER_3D_ARB = 0x8B5F;
def GL_SAMPLER_CUBE_ARB = 0x8B60;
def GL_SAMPLER_1D_SHADOW_ARB = 0x8B61;
def GL_SAMPLER_2D_SHADOW_ARB = 0x8B62;
def GL_SAMPLER_2D_RECT_ARB = 0x8B63;
def GL_SAMPLER_2D_RECT_SHADOW_ARB = 0x8B64;
def GL_OBJECT_DELETE_STATUS_ARB = 0x8B80;
def GL_OBJECT_COMPILE_STATUS_ARB = 0x8B81;
def GL_OBJECT_LINK_STATUS_ARB = 0x8B82;
def GL_OBJECT_VALIDATE_STATUS_ARB = 0x8B83;
def GL_OBJECT_INFO_LOG_LENGTH_ARB = 0x8B84;
def GL_OBJECT_ATTACHED_OBJECTS_ARB = 0x8B85;
def GL_OBJECT_ACTIVE_UNIFORMS_ARB = 0x8B86;
def GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB = 0x8B87;
def GL_OBJECT_SHADER_SOURCE_LENGTH_ARB = 0x8B88;

def glDeleteObjectARB_signature func(obj GLhandleARB);
var global glDeleteObjectARB glDeleteObjectARB_signature;

def glGetHandleARB_signature func(pname GLenum) (result GLhandleARB);
var global glGetHandleARB glGetHandleARB_signature;

def glDetachObjectARB_signature func(containerObj GLhandleARB; attachedObj GLhandleARB);
var global glDetachObjectARB glDetachObjectARB_signature;

def glCreateShaderObjectARB_signature func(shaderType GLenum) (result GLhandleARB);
var global glCreateShaderObjectARB glCreateShaderObjectARB_signature;

def glShaderSourceARB_signature func(shaderObj GLhandleARB; count GLsizei; string GLcharARB ref ref; length GLint ref);
var global glShaderSourceARB glShaderSourceARB_signature;

def glCompileShaderARB_signature func(shaderObj GLhandleARB);
var global glCompileShaderARB glCompileShaderARB_signature;

def glCreateProgramObjectARB_signature func() (result GLhandleARB);
var global glCreateProgramObjectARB glCreateProgramObjectARB_signature;

def glAttachObjectARB_signature func(containerObj GLhandleARB; obj GLhandleARB);
var global glAttachObjectARB glAttachObjectARB_signature;

def glLinkProgramARB_signature func(programObj GLhandleARB);
var global glLinkProgramARB glLinkProgramARB_signature;

def glUseProgramObjectARB_signature func(programObj GLhandleARB);
var global glUseProgramObjectARB glUseProgramObjectARB_signature;

def glValidateProgramARB_signature func(programObj GLhandleARB);
var global glValidateProgramARB glValidateProgramARB_signature;

def glUniform1fARB_signature func(location GLint; v0 GLfloat);
var global glUniform1fARB glUniform1fARB_signature;

def glUniform2fARB_signature func(location GLint; v0 GLfloat; v1 GLfloat);
var global glUniform2fARB glUniform2fARB_signature;

def glUniform3fARB_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var global glUniform3fARB glUniform3fARB_signature;

def glUniform4fARB_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var global glUniform4fARB glUniform4fARB_signature;

def glUniform1iARB_signature func(location GLint; v0 GLint);
var global glUniform1iARB glUniform1iARB_signature;

def glUniform2iARB_signature func(location GLint; v0 GLint; v1 GLint);
var global glUniform2iARB glUniform2iARB_signature;

def glUniform3iARB_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint);
var global glUniform3iARB glUniform3iARB_signature;

def glUniform4iARB_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var global glUniform4iARB glUniform4iARB_signature;

def glUniform1fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform1fvARB glUniform1fvARB_signature;

def glUniform2fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform2fvARB glUniform2fvARB_signature;

def glUniform3fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform3fvARB glUniform3fvARB_signature;

def glUniform4fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var global glUniform4fvARB glUniform4fvARB_signature;

def glUniform1ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform1ivARB glUniform1ivARB_signature;

def glUniform2ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform2ivARB glUniform2ivARB_signature;

def glUniform3ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform3ivARB glUniform3ivARB_signature;

def glUniform4ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var global glUniform4ivARB glUniform4ivARB_signature;

def glUniformMatrix2fvARB_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix2fvARB glUniformMatrix2fvARB_signature;

def glUniformMatrix3fvARB_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix3fvARB glUniformMatrix3fvARB_signature;

def glUniformMatrix4fvARB_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glUniformMatrix4fvARB glUniformMatrix4fvARB_signature;

def glGetObjectParameterfvARB_signature func(obj GLhandleARB; pname GLenum; params GLfloat ref);
var global glGetObjectParameterfvARB glGetObjectParameterfvARB_signature;

def glGetObjectParameterivARB_signature func(obj GLhandleARB; pname GLenum; params GLint ref);
var global glGetObjectParameterivARB glGetObjectParameterivARB_signature;

def glGetInfoLogARB_signature func(obj GLhandleARB; maxLength GLsizei; length GLsizei ref; infoLog GLcharARB ref);
var global glGetInfoLogARB glGetInfoLogARB_signature;

def glGetAttachedObjectsARB_signature func(containerObj GLhandleARB; maxCount GLsizei; count GLsizei ref; obj GLhandleARB ref);
var global glGetAttachedObjectsARB glGetAttachedObjectsARB_signature;

def glGetUniformLocationARB_signature func(programObj GLhandleARB; name GLcharARB ref) (result GLint);
var global glGetUniformLocationARB glGetUniformLocationARB_signature;

def glGetActiveUniformARB_signature func(programObj GLhandleARB; index GLuint; maxLength GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLcharARB ref);
var global glGetActiveUniformARB glGetActiveUniformARB_signature;

def glGetUniformfvARB_signature func(programObj GLhandleARB; location GLint; params GLfloat ref);
var global glGetUniformfvARB glGetUniformfvARB_signature;

def glGetUniformivARB_signature func(programObj GLhandleARB; location GLint; params GLint ref);
var global glGetUniformivARB glGetUniformivARB_signature;

def glGetShaderSourceARB_signature func(obj GLhandleARB; maxLength GLsizei; length GLsizei ref; source GLcharARB ref);
var global glGetShaderSourceARB glGetShaderSourceARB_signature;
def GL_ARB_shader_precision = 1;
def GL_ARB_shader_stencil_export = 1;
def GL_ARB_shader_storage_buffer_object = 1;
def GL_ARB_shader_subroutine = 1;
def GL_ARB_shader_texture_image_samples = 1;
def GL_ARB_shader_texture_lod = 1;
def GL_ARB_shader_viewport_layer_array = 1;
def GL_ARB_shading_language_100 = 1;
def GL_SHADING_LANGUAGE_VERSION_ARB = 0x8B8C;
def GL_ARB_shading_language_420pack = 1;
def GL_ARB_shading_language_include = 1;
def GL_SHADER_INCLUDE_ARB = 0x8DAE;
def GL_NAMED_STRING_LENGTH_ARB = 0x8DE9;
def GL_NAMED_STRING_TYPE_ARB = 0x8DEA;

def glNamedStringARB_signature func(type GLenum; namelen GLint; name GLchar ref; stringlen GLint; string GLchar ref);
var global glNamedStringARB glNamedStringARB_signature;

def glDeleteNamedStringARB_signature func(namelen GLint; name GLchar ref);
var global glDeleteNamedStringARB glDeleteNamedStringARB_signature;

def glCompileShaderIncludeARB_signature func(shader GLuint; count GLsizei; path GLchar ref ref; length GLint ref);
var global glCompileShaderIncludeARB glCompileShaderIncludeARB_signature;

def glIsNamedStringARB_signature func(namelen GLint; name GLchar ref) (result GLboolean);
var global glIsNamedStringARB glIsNamedStringARB_signature;

def glGetNamedStringARB_signature func(namelen GLint; name GLchar ref; bufSize GLsizei; stringlen GLint ref; string GLchar ref);
var global glGetNamedStringARB glGetNamedStringARB_signature;

def glGetNamedStringivARB_signature func(namelen GLint; name GLchar ref; pname GLenum; params GLint ref);
var global glGetNamedStringivARB glGetNamedStringivARB_signature;
def GL_ARB_shading_language_packing = 1;
def GL_ARB_shadow = 1;
def GL_TEXTURE_COMPARE_MODE_ARB = 0x884C;
def GL_TEXTURE_COMPARE_FUNC_ARB = 0x884D;
def GL_COMPARE_R_TO_TEXTURE_ARB = 0x884E;
def GL_ARB_shadow_ambient = 1;
def GL_TEXTURE_COMPARE_FAIL_VALUE_ARB = 0x80BF;
def GL_ARB_sparse_buffer = 1;
def GL_SPARSE_STORAGE_BIT_ARB = 0x0400;
def GL_SPARSE_BUFFER_PAGE_SIZE_ARB = 0x82F8;

def glBufferPageCommitmentARB_signature func(target GLenum; offset GLintptr; size GLsizeiptr; commit GLboolean);
var global glBufferPageCommitmentARB glBufferPageCommitmentARB_signature;

def glNamedBufferPageCommitmentEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; commit GLboolean);
var global glNamedBufferPageCommitmentEXT glNamedBufferPageCommitmentEXT_signature;

def glNamedBufferPageCommitmentARB_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; commit GLboolean);
var global glNamedBufferPageCommitmentARB glNamedBufferPageCommitmentARB_signature;
def GL_ARB_sparse_texture = 1;
def GL_TEXTURE_SPARSE_ARB = 0x91A6;
def GL_VIRTUAL_PAGE_SIZE_INDEX_ARB = 0x91A7;
def GL_NUM_SPARSE_LEVELS_ARB = 0x91AA;
def GL_NUM_VIRTUAL_PAGE_SIZES_ARB = 0x91A8;
def GL_VIRTUAL_PAGE_SIZE_X_ARB = 0x9195;
def GL_VIRTUAL_PAGE_SIZE_Y_ARB = 0x9196;
def GL_VIRTUAL_PAGE_SIZE_Z_ARB = 0x9197;
def GL_MAX_SPARSE_TEXTURE_SIZE_ARB = 0x9198;
def GL_MAX_SPARSE_3D_TEXTURE_SIZE_ARB = 0x9199;
def GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS_ARB = 0x919A;
def GL_SPARSE_TEXTURE_FULL_ARRAY_CUBE_MIPMAPS_ARB = 0x91A9;

def glTexPageCommitmentARB_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; commit GLboolean);
var global glTexPageCommitmentARB glTexPageCommitmentARB_signature;
def GL_ARB_sparse_texture2 = 1;
def GL_ARB_sparse_texture_clamp = 1;
def GL_ARB_spirv_extensions = 1;
def GL_ARB_stencil_texturing = 1;
def GL_ARB_sync = 1;
def GL_ARB_tessellation_shader = 1;
def GL_ARB_texture_barrier = 1;
def GL_ARB_texture_border_clamp = 1;
def GL_CLAMP_TO_BORDER_ARB = 0x812D;
def GL_ARB_texture_buffer_object = 1;
def GL_TEXTURE_BUFFER_ARB = 0x8C2A;
def GL_MAX_TEXTURE_BUFFER_SIZE_ARB = 0x8C2B;
def GL_TEXTURE_BINDING_BUFFER_ARB = 0x8C2C;
def GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = 0x8C2D;
def GL_TEXTURE_BUFFER_FORMAT_ARB = 0x8C2E;

def glTexBufferARB_signature func(target GLenum; internalformat GLenum; buffer GLuint);
var global glTexBufferARB glTexBufferARB_signature;
def GL_ARB_texture_buffer_object_rgb32 = 1;
def GL_ARB_texture_buffer_range = 1;
def GL_ARB_texture_compression = 1;
def GL_COMPRESSED_ALPHA_ARB = 0x84E9;
def GL_COMPRESSED_LUMINANCE_ARB = 0x84EA;
def GL_COMPRESSED_LUMINANCE_ALPHA_ARB = 0x84EB;
def GL_COMPRESSED_INTENSITY_ARB = 0x84EC;
def GL_COMPRESSED_RGB_ARB = 0x84ED;
def GL_COMPRESSED_RGBA_ARB = 0x84EE;
def GL_TEXTURE_COMPRESSION_HINT_ARB = 0x84EF;
def GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = 0x86A0;
def GL_TEXTURE_COMPRESSED_ARB = 0x86A1;
def GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A2;
def GL_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A3;

def glCompressedTexImage3DARB_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var global glCompressedTexImage3DARB glCompressedTexImage3DARB_signature;

def glCompressedTexImage2DARB_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var global glCompressedTexImage2DARB glCompressedTexImage2DARB_signature;

def glCompressedTexImage1DARB_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var global glCompressedTexImage1DARB glCompressedTexImage1DARB_signature;

def glCompressedTexSubImage3DARB_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTexSubImage3DARB glCompressedTexSubImage3DARB_signature;

def glCompressedTexSubImage2DARB_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTexSubImage2DARB glCompressedTexSubImage2DARB_signature;

def glCompressedTexSubImage1DARB_signature func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var global glCompressedTexSubImage1DARB glCompressedTexSubImage1DARB_signature;

def glGetCompressedTexImageARB_signature func(target GLenum; level GLint; img u8 ref);
var global glGetCompressedTexImageARB glGetCompressedTexImageARB_signature;
def GL_ARB_texture_compression_bptc = 1;
def GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C;
def GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D;
def GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E;
def GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F;
def GL_ARB_texture_compression_rgtc = 1;
def GL_ARB_texture_cube_map = 1;
def GL_NORMAL_MAP_ARB = 0x8511;
def GL_REFLECTION_MAP_ARB = 0x8512;
def GL_TEXTURE_CUBE_MAP_ARB = 0x8513;
def GL_TEXTURE_BINDING_CUBE_MAP_ARB = 0x8514;
def GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = 0x8515;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = 0x8516;
def GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = 0x8517;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = 0x8518;
def GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = 0x8519;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = 0x851A;
def GL_PROXY_TEXTURE_CUBE_MAP_ARB = 0x851B;
def GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB = 0x851C;
def GL_ARB_texture_cube_map_array = 1;
def GL_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x9009;
def GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A;
def GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B;
def GL_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900C;
def GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D;
def GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E;
def GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F;
def GL_ARB_texture_env_add = 1;
def GL_ARB_texture_env_combine = 1;
def GL_COMBINE_ARB = 0x8570;
def GL_COMBINE_RGB_ARB = 0x8571;
def GL_COMBINE_ALPHA_ARB = 0x8572;
def GL_SOURCE0_RGB_ARB = 0x8580;
def GL_SOURCE1_RGB_ARB = 0x8581;
def GL_SOURCE2_RGB_ARB = 0x8582;
def GL_SOURCE0_ALPHA_ARB = 0x8588;
def GL_SOURCE1_ALPHA_ARB = 0x8589;
def GL_SOURCE2_ALPHA_ARB = 0x858A;
def GL_OPERAND0_RGB_ARB = 0x8590;
def GL_OPERAND1_RGB_ARB = 0x8591;
def GL_OPERAND2_RGB_ARB = 0x8592;
def GL_OPERAND0_ALPHA_ARB = 0x8598;
def GL_OPERAND1_ALPHA_ARB = 0x8599;
def GL_OPERAND2_ALPHA_ARB = 0x859A;
def GL_RGB_SCALE_ARB = 0x8573;
def GL_ADD_SIGNED_ARB = 0x8574;
def GL_INTERPOLATE_ARB = 0x8575;
def GL_SUBTRACT_ARB = 0x84E7;
def GL_CONSTANT_ARB = 0x8576;
def GL_PRIMARY_COLOR_ARB = 0x8577;
def GL_PREVIOUS_ARB = 0x8578;
def GL_ARB_texture_env_crossbar = 1;
def GL_ARB_texture_env_dot3 = 1;
def GL_DOT3_RGB_ARB = 0x86AE;
def GL_DOT3_RGBA_ARB = 0x86AF;
def GL_ARB_texture_filter_anisotropic = 1;
def GL_ARB_texture_filter_minmax = 1;
def GL_TEXTURE_REDUCTION_MODE_ARB = 0x9366;
def GL_WEIGHTED_AVERAGE_ARB = 0x9367;
def GL_ARB_texture_float = 1;
def GL_TEXTURE_RED_TYPE_ARB = 0x8C10;
def GL_TEXTURE_GREEN_TYPE_ARB = 0x8C11;
def GL_TEXTURE_BLUE_TYPE_ARB = 0x8C12;
def GL_TEXTURE_ALPHA_TYPE_ARB = 0x8C13;
def GL_TEXTURE_LUMINANCE_TYPE_ARB = 0x8C14;
def GL_TEXTURE_INTENSITY_TYPE_ARB = 0x8C15;
def GL_TEXTURE_DEPTH_TYPE_ARB = 0x8C16;
def GL_UNSIGNED_NORMALIZED_ARB = 0x8C17;
def GL_RGBA32F_ARB = 0x8814;
def GL_RGB32F_ARB = 0x8815;
def GL_ALPHA32F_ARB = 0x8816;
def GL_INTENSITY32F_ARB = 0x8817;
def GL_LUMINANCE32F_ARB = 0x8818;
def GL_LUMINANCE_ALPHA32F_ARB = 0x8819;
def GL_RGBA16F_ARB = 0x881A;
def GL_RGB16F_ARB = 0x881B;
def GL_ALPHA16F_ARB = 0x881C;
def GL_INTENSITY16F_ARB = 0x881D;
def GL_LUMINANCE16F_ARB = 0x881E;
def GL_LUMINANCE_ALPHA16F_ARB = 0x881F;
def GL_ARB_texture_gather = 1;
def GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E;
def GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F;
def GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB = 0x8F9F;
def GL_ARB_texture_mirror_clamp_to_edge = 1;
def GL_ARB_texture_mirrored_repeat = 1;
def GL_MIRRORED_REPEAT_ARB = 0x8370;
def GL_ARB_texture_multisample = 1;
def GL_ARB_texture_non_power_of_two = 1;
def GL_ARB_texture_query_levels = 1;
def GL_ARB_texture_query_lod = 1;
def GL_ARB_texture_rectangle = 1;
def GL_TEXTURE_RECTANGLE_ARB = 0x84F5;
def GL_TEXTURE_BINDING_RECTANGLE_ARB = 0x84F6;
def GL_PROXY_TEXTURE_RECTANGLE_ARB = 0x84F7;
def GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB = 0x84F8;
def GL_ARB_texture_rg = 1;
def GL_ARB_texture_rgb10_a2ui = 1;
def GL_ARB_texture_stencil8 = 1;
def GL_ARB_texture_storage = 1;
def GL_ARB_texture_storage_multisample = 1;
def GL_ARB_texture_swizzle = 1;
def GL_ARB_texture_view = 1;
def GL_ARB_timer_query = 1;
def GL_ARB_transform_feedback2 = 1;
def GL_ARB_transform_feedback3 = 1;
def GL_ARB_transform_feedback_instanced = 1;
def GL_ARB_transform_feedback_overflow_query = 1;
def GL_TRANSFORM_FEEDBACK_OVERFLOW_ARB = 0x82EC;
def GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW_ARB = 0x82ED;
def GL_ARB_transpose_matrix = 1;
def GL_TRANSPOSE_MODELVIEW_MATRIX_ARB = 0x84E3;
def GL_TRANSPOSE_PROJECTION_MATRIX_ARB = 0x84E4;
def GL_TRANSPOSE_TEXTURE_MATRIX_ARB = 0x84E5;
def GL_TRANSPOSE_COLOR_MATRIX_ARB = 0x84E6;

def glLoadTransposeMatrixfARB_signature func(m GLfloat ref);
var global glLoadTransposeMatrixfARB glLoadTransposeMatrixfARB_signature;

def glLoadTransposeMatrixdARB_signature func(m GLdouble ref);
var global glLoadTransposeMatrixdARB glLoadTransposeMatrixdARB_signature;

def glMultTransposeMatrixfARB_signature func(m GLfloat ref);
var global glMultTransposeMatrixfARB glMultTransposeMatrixfARB_signature;

def glMultTransposeMatrixdARB_signature func(m GLdouble ref);
var global glMultTransposeMatrixdARB glMultTransposeMatrixdARB_signature;
def GL_ARB_uniform_buffer_object = 1;
def GL_ARB_vertex_array_bgra = 1;
def GL_ARB_vertex_array_object = 1;
def GL_ARB_vertex_attrib_64bit = 1;
def GL_ARB_vertex_attrib_binding = 1;
def GL_ARB_vertex_blend = 1;
def GL_MAX_VERTEX_UNITS_ARB = 0x86A4;
def GL_ACTIVE_VERTEX_UNITS_ARB = 0x86A5;
def GL_WEIGHT_SUM_UNITY_ARB = 0x86A6;
def GL_VERTEX_BLEND_ARB = 0x86A7;
def GL_CURRENT_WEIGHT_ARB = 0x86A8;
def GL_WEIGHT_ARRAY_TYPE_ARB = 0x86A9;
def GL_WEIGHT_ARRAY_STRIDE_ARB = 0x86AA;
def GL_WEIGHT_ARRAY_SIZE_ARB = 0x86AB;
def GL_WEIGHT_ARRAY_POINTER_ARB = 0x86AC;
def GL_WEIGHT_ARRAY_ARB = 0x86AD;
def GL_MODELVIEW0_ARB = 0x1700;
def GL_MODELVIEW1_ARB = 0x850A;
def GL_MODELVIEW2_ARB = 0x8722;
def GL_MODELVIEW3_ARB = 0x8723;
def GL_MODELVIEW4_ARB = 0x8724;
def GL_MODELVIEW5_ARB = 0x8725;
def GL_MODELVIEW6_ARB = 0x8726;
def GL_MODELVIEW7_ARB = 0x8727;
def GL_MODELVIEW8_ARB = 0x8728;
def GL_MODELVIEW9_ARB = 0x8729;
def GL_MODELVIEW10_ARB = 0x872A;
def GL_MODELVIEW11_ARB = 0x872B;
def GL_MODELVIEW12_ARB = 0x872C;
def GL_MODELVIEW13_ARB = 0x872D;
def GL_MODELVIEW14_ARB = 0x872E;
def GL_MODELVIEW15_ARB = 0x872F;
def GL_MODELVIEW16_ARB = 0x8730;
def GL_MODELVIEW17_ARB = 0x8731;
def GL_MODELVIEW18_ARB = 0x8732;
def GL_MODELVIEW19_ARB = 0x8733;
def GL_MODELVIEW20_ARB = 0x8734;
def GL_MODELVIEW21_ARB = 0x8735;
def GL_MODELVIEW22_ARB = 0x8736;
def GL_MODELVIEW23_ARB = 0x8737;
def GL_MODELVIEW24_ARB = 0x8738;
def GL_MODELVIEW25_ARB = 0x8739;
def GL_MODELVIEW26_ARB = 0x873A;
def GL_MODELVIEW27_ARB = 0x873B;
def GL_MODELVIEW28_ARB = 0x873C;
def GL_MODELVIEW29_ARB = 0x873D;
def GL_MODELVIEW30_ARB = 0x873E;
def GL_MODELVIEW31_ARB = 0x873F;

def glWeightbvARB_signature func(size GLint; weights GLbyte ref);
var global glWeightbvARB glWeightbvARB_signature;

def glWeightsvARB_signature func(size GLint; weights GLshort ref);
var global glWeightsvARB glWeightsvARB_signature;

def glWeightivARB_signature func(size GLint; weights GLint ref);
var global glWeightivARB glWeightivARB_signature;

def glWeightfvARB_signature func(size GLint; weights GLfloat ref);
var global glWeightfvARB glWeightfvARB_signature;

def glWeightdvARB_signature func(size GLint; weights GLdouble ref);
var global glWeightdvARB glWeightdvARB_signature;

def glWeightubvARB_signature func(size GLint; weights GLubyte ref);
var global glWeightubvARB glWeightubvARB_signature;

def glWeightusvARB_signature func(size GLint; weights GLushort ref);
var global glWeightusvARB glWeightusvARB_signature;

def glWeightuivARB_signature func(size GLint; weights GLuint ref);
var global glWeightuivARB glWeightuivARB_signature;

def glWeightPointerARB_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glWeightPointerARB glWeightPointerARB_signature;

def glVertexBlendARB_signature func(count GLint);
var global glVertexBlendARB glVertexBlendARB_signature;
def GL_ARB_vertex_buffer_object = 1;
def GL_BUFFER_SIZE_ARB = 0x8764;
def GL_BUFFER_USAGE_ARB = 0x8765;
def GL_ARRAY_BUFFER_ARB = 0x8892;
def GL_ELEMENT_ARRAY_BUFFER_ARB = 0x8893;
def GL_ARRAY_BUFFER_BINDING_ARB = 0x8894;
def GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB = 0x8895;
def GL_VERTEX_ARRAY_BUFFER_BINDING_ARB = 0x8896;
def GL_NORMAL_ARRAY_BUFFER_BINDING_ARB = 0x8897;
def GL_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x8898;
def GL_INDEX_ARRAY_BUFFER_BINDING_ARB = 0x8899;
def GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB = 0x889A;
def GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB = 0x889B;
def GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x889C;
def GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB = 0x889D;
def GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB = 0x889E;
def GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB = 0x889F;
def GL_READ_ONLY_ARB = 0x88B8;
def GL_WRITE_ONLY_ARB = 0x88B9;
def GL_READ_WRITE_ARB = 0x88BA;
def GL_BUFFER_ACCESS_ARB = 0x88BB;
def GL_BUFFER_MAPPED_ARB = 0x88BC;
def GL_BUFFER_MAP_POINTER_ARB = 0x88BD;
def GL_STREAM_DRAW_ARB = 0x88E0;
def GL_STREAM_READ_ARB = 0x88E1;
def GL_STREAM_COPY_ARB = 0x88E2;
def GL_STATIC_DRAW_ARB = 0x88E4;
def GL_STATIC_READ_ARB = 0x88E5;
def GL_STATIC_COPY_ARB = 0x88E6;
def GL_DYNAMIC_DRAW_ARB = 0x88E8;
def GL_DYNAMIC_READ_ARB = 0x88E9;
def GL_DYNAMIC_COPY_ARB = 0x88EA;

def glBindBufferARB_signature func(target GLenum; buffer GLuint);
var global glBindBufferARB glBindBufferARB_signature;

def glDeleteBuffersARB_signature func(n GLsizei; buffers GLuint ref);
var global glDeleteBuffersARB glDeleteBuffersARB_signature;

def glGenBuffersARB_signature func(n GLsizei; buffers GLuint ref);
var global glGenBuffersARB glGenBuffersARB_signature;

def glIsBufferARB_signature func(buffer GLuint) (result GLboolean);
var global glIsBufferARB glIsBufferARB_signature;

def glBufferDataARB_signature func(target GLenum; size GLsizeiptrARB; data u8 ref; usage GLenum);
var global glBufferDataARB glBufferDataARB_signature;

def glBufferSubDataARB_signature func(target GLenum; offset GLintptrARB; size GLsizeiptrARB; data u8 ref);
var global glBufferSubDataARB glBufferSubDataARB_signature;

def glGetBufferSubDataARB_signature func(target GLenum; offset GLintptrARB; size GLsizeiptrARB; data u8 ref);
var global glGetBufferSubDataARB glGetBufferSubDataARB_signature;

def glMapBufferARB_signature func(target GLenum; access GLenum) (result u8 ref);
var global glMapBufferARB glMapBufferARB_signature;

def glUnmapBufferARB_signature func(target GLenum) (result GLboolean);
var global glUnmapBufferARB glUnmapBufferARB_signature;

def glGetBufferParameterivARB_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetBufferParameterivARB glGetBufferParameterivARB_signature;

def glGetBufferPointervARB_signature func(target GLenum; pname GLenum; params u8 ref ref);
var global glGetBufferPointervARB glGetBufferPointervARB_signature;
def GL_ARB_vertex_program = 1;
def GL_COLOR_SUM_ARB = 0x8458;
def GL_VERTEX_PROGRAM_ARB = 0x8620;
def GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB = 0x8622;
def GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB = 0x8623;
def GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB = 0x8624;
def GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB = 0x8625;
def GL_CURRENT_VERTEX_ATTRIB_ARB = 0x8626;
def GL_VERTEX_PROGRAM_POINT_SIZE_ARB = 0x8642;
def GL_VERTEX_PROGRAM_TWO_SIDE_ARB = 0x8643;
def GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB = 0x8645;
def GL_MAX_VERTEX_ATTRIBS_ARB = 0x8869;
def GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB = 0x886A;
def GL_PROGRAM_ADDRESS_REGISTERS_ARB = 0x88B0;
def GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB = 0x88B1;
def GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B2;
def GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B3;

def glVertexAttrib1dARB_signature func(index GLuint; x GLdouble);
var global glVertexAttrib1dARB glVertexAttrib1dARB_signature;

def glVertexAttrib1dvARB_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib1dvARB glVertexAttrib1dvARB_signature;

def glVertexAttrib1fARB_signature func(index GLuint; x GLfloat);
var global glVertexAttrib1fARB glVertexAttrib1fARB_signature;

def glVertexAttrib1fvARB_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib1fvARB glVertexAttrib1fvARB_signature;

def glVertexAttrib1sARB_signature func(index GLuint; x GLshort);
var global glVertexAttrib1sARB glVertexAttrib1sARB_signature;

def glVertexAttrib1svARB_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib1svARB glVertexAttrib1svARB_signature;

def glVertexAttrib2dARB_signature func(index GLuint; x GLdouble; y GLdouble);
var global glVertexAttrib2dARB glVertexAttrib2dARB_signature;

def glVertexAttrib2dvARB_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib2dvARB glVertexAttrib2dvARB_signature;

def glVertexAttrib2fARB_signature func(index GLuint; x GLfloat; y GLfloat);
var global glVertexAttrib2fARB glVertexAttrib2fARB_signature;

def glVertexAttrib2fvARB_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib2fvARB glVertexAttrib2fvARB_signature;

def glVertexAttrib2sARB_signature func(index GLuint; x GLshort; y GLshort);
var global glVertexAttrib2sARB glVertexAttrib2sARB_signature;

def glVertexAttrib2svARB_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib2svARB glVertexAttrib2svARB_signature;

def glVertexAttrib3dARB_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var global glVertexAttrib3dARB glVertexAttrib3dARB_signature;

def glVertexAttrib3dvARB_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib3dvARB glVertexAttrib3dvARB_signature;

def glVertexAttrib3fARB_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat);
var global glVertexAttrib3fARB glVertexAttrib3fARB_signature;

def glVertexAttrib3fvARB_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib3fvARB glVertexAttrib3fvARB_signature;

def glVertexAttrib3sARB_signature func(index GLuint; x GLshort; y GLshort; z GLshort);
var global glVertexAttrib3sARB glVertexAttrib3sARB_signature;

def glVertexAttrib3svARB_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib3svARB glVertexAttrib3svARB_signature;

def glVertexAttrib4NbvARB_signature func(index GLuint; v GLbyte ref);
var global glVertexAttrib4NbvARB glVertexAttrib4NbvARB_signature;

def glVertexAttrib4NivARB_signature func(index GLuint; v GLint ref);
var global glVertexAttrib4NivARB glVertexAttrib4NivARB_signature;

def glVertexAttrib4NsvARB_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib4NsvARB glVertexAttrib4NsvARB_signature;

def glVertexAttrib4NubARB_signature func(index GLuint; x GLubyte; y GLubyte; z GLubyte; w GLubyte);
var global glVertexAttrib4NubARB glVertexAttrib4NubARB_signature;

def glVertexAttrib4NubvARB_signature func(index GLuint; v GLubyte ref);
var global glVertexAttrib4NubvARB glVertexAttrib4NubvARB_signature;

def glVertexAttrib4NuivARB_signature func(index GLuint; v GLuint ref);
var global glVertexAttrib4NuivARB glVertexAttrib4NuivARB_signature;

def glVertexAttrib4NusvARB_signature func(index GLuint; v GLushort ref);
var global glVertexAttrib4NusvARB glVertexAttrib4NusvARB_signature;

def glVertexAttrib4bvARB_signature func(index GLuint; v GLbyte ref);
var global glVertexAttrib4bvARB glVertexAttrib4bvARB_signature;

def glVertexAttrib4dARB_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glVertexAttrib4dARB glVertexAttrib4dARB_signature;

def glVertexAttrib4dvARB_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib4dvARB glVertexAttrib4dvARB_signature;

def glVertexAttrib4fARB_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glVertexAttrib4fARB glVertexAttrib4fARB_signature;

def glVertexAttrib4fvARB_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib4fvARB glVertexAttrib4fvARB_signature;

def glVertexAttrib4ivARB_signature func(index GLuint; v GLint ref);
var global glVertexAttrib4ivARB glVertexAttrib4ivARB_signature;

def glVertexAttrib4sARB_signature func(index GLuint; x GLshort; y GLshort; z GLshort; w GLshort);
var global glVertexAttrib4sARB glVertexAttrib4sARB_signature;

def glVertexAttrib4svARB_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib4svARB glVertexAttrib4svARB_signature;

def glVertexAttrib4ubvARB_signature func(index GLuint; v GLubyte ref);
var global glVertexAttrib4ubvARB glVertexAttrib4ubvARB_signature;

def glVertexAttrib4uivARB_signature func(index GLuint; v GLuint ref);
var global glVertexAttrib4uivARB glVertexAttrib4uivARB_signature;

def glVertexAttrib4usvARB_signature func(index GLuint; v GLushort ref);
var global glVertexAttrib4usvARB glVertexAttrib4usvARB_signature;

def glVertexAttribPointerARB_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; pointer u8 ref);
var global glVertexAttribPointerARB glVertexAttribPointerARB_signature;

def glEnableVertexAttribArrayARB_signature func(index GLuint);
var global glEnableVertexAttribArrayARB glEnableVertexAttribArrayARB_signature;

def glDisableVertexAttribArrayARB_signature func(index GLuint);
var global glDisableVertexAttribArrayARB glDisableVertexAttribArrayARB_signature;

def glGetVertexAttribdvARB_signature func(index GLuint; pname GLenum; params GLdouble ref);
var global glGetVertexAttribdvARB glGetVertexAttribdvARB_signature;

def glGetVertexAttribfvARB_signature func(index GLuint; pname GLenum; params GLfloat ref);
var global glGetVertexAttribfvARB glGetVertexAttribfvARB_signature;

def glGetVertexAttribivARB_signature func(index GLuint; pname GLenum; params GLint ref);
var global glGetVertexAttribivARB glGetVertexAttribivARB_signature;

def glGetVertexAttribPointervARB_signature func(index GLuint; pname GLenum; pointer u8 ref ref);
var global glGetVertexAttribPointervARB glGetVertexAttribPointervARB_signature;
def GL_ARB_vertex_shader = 1;
def GL_VERTEX_SHADER_ARB = 0x8B31;
def GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB = 0x8B4A;
def GL_MAX_VARYING_FLOATS_ARB = 0x8B4B;
def GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = 0x8B4C;
def GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB = 0x8B4D;
def GL_OBJECT_ACTIVE_ATTRIBUTES_ARB = 0x8B89;
def GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB = 0x8B8A;

def glBindAttribLocationARB_signature func(programObj GLhandleARB; index GLuint; name GLcharARB ref);
var global glBindAttribLocationARB glBindAttribLocationARB_signature;

def glGetActiveAttribARB_signature func(programObj GLhandleARB; index GLuint; maxLength GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLcharARB ref);
var global glGetActiveAttribARB glGetActiveAttribARB_signature;

def glGetAttribLocationARB_signature func(programObj GLhandleARB; name GLcharARB ref) (result GLint);
var global glGetAttribLocationARB glGetAttribLocationARB_signature;
def GL_ARB_vertex_type_10f_11f_11f_rev = 1;
def GL_ARB_vertex_type_2_10_10_10_rev = 1;
def GL_ARB_viewport_array = 1;

def glDepthRangeArraydvNV_signature func(first GLuint; count GLsizei; v GLdouble ref);
var global glDepthRangeArraydvNV glDepthRangeArraydvNV_signature;

def glDepthRangeIndexeddNV_signature func(index GLuint; n GLdouble; f GLdouble);
var global glDepthRangeIndexeddNV glDepthRangeIndexeddNV_signature;
def GL_ARB_window_pos = 1;

def glWindowPos2dARB_signature func(x GLdouble; y GLdouble);
var global glWindowPos2dARB glWindowPos2dARB_signature;

def glWindowPos2dvARB_signature func(v GLdouble ref);
var global glWindowPos2dvARB glWindowPos2dvARB_signature;

def glWindowPos2fARB_signature func(x GLfloat; y GLfloat);
var global glWindowPos2fARB glWindowPos2fARB_signature;

def glWindowPos2fvARB_signature func(v GLfloat ref);
var global glWindowPos2fvARB glWindowPos2fvARB_signature;

def glWindowPos2iARB_signature func(x GLint; y GLint);
var global glWindowPos2iARB glWindowPos2iARB_signature;

def glWindowPos2ivARB_signature func(v GLint ref);
var global glWindowPos2ivARB glWindowPos2ivARB_signature;

def glWindowPos2sARB_signature func(x GLshort; y GLshort);
var global glWindowPos2sARB glWindowPos2sARB_signature;

def glWindowPos2svARB_signature func(v GLshort ref);
var global glWindowPos2svARB glWindowPos2svARB_signature;

def glWindowPos3dARB_signature func(x GLdouble; y GLdouble; z GLdouble);
var global glWindowPos3dARB glWindowPos3dARB_signature;

def glWindowPos3dvARB_signature func(v GLdouble ref);
var global glWindowPos3dvARB glWindowPos3dvARB_signature;

def glWindowPos3fARB_signature func(x GLfloat; y GLfloat; z GLfloat);
var global glWindowPos3fARB glWindowPos3fARB_signature;

def glWindowPos3fvARB_signature func(v GLfloat ref);
var global glWindowPos3fvARB glWindowPos3fvARB_signature;

def glWindowPos3iARB_signature func(x GLint; y GLint; z GLint);
var global glWindowPos3iARB glWindowPos3iARB_signature;

def glWindowPos3ivARB_signature func(v GLint ref);
var global glWindowPos3ivARB glWindowPos3ivARB_signature;

def glWindowPos3sARB_signature func(x GLshort; y GLshort; z GLshort);
var global glWindowPos3sARB glWindowPos3sARB_signature;

def glWindowPos3svARB_signature func(v GLshort ref);
var global glWindowPos3svARB glWindowPos3svARB_signature;
def GL_KHR_blend_equation_advanced = 1;
def GL_MULTIPLY_KHR = 0x9294;
def GL_SCREEN_KHR = 0x9295;
def GL_OVERLAY_KHR = 0x9296;
def GL_DARKEN_KHR = 0x9297;
def GL_LIGHTEN_KHR = 0x9298;
def GL_COLORDODGE_KHR = 0x9299;
def GL_COLORBURN_KHR = 0x929A;
def GL_HARDLIGHT_KHR = 0x929B;
def GL_SOFTLIGHT_KHR = 0x929C;
def GL_DIFFERENCE_KHR = 0x929E;
def GL_EXCLUSION_KHR = 0x92A0;
def GL_HSL_HUE_KHR = 0x92AD;
def GL_HSL_SATURATION_KHR = 0x92AE;
def GL_HSL_COLOR_KHR = 0x92AF;
def GL_HSL_LUMINOSITY_KHR = 0x92B0;

def glBlendBarrierKHR_signature func();
var global glBlendBarrierKHR glBlendBarrierKHR_signature;
def GL_KHR_blend_equation_advanced_coherent = 1;
def GL_BLEND_ADVANCED_COHERENT_KHR = 0x9285;
def GL_KHR_context_flush_control = 1;
def GL_KHR_debug = 1;
def GL_KHR_no_error = 1;
def GL_CONTEXT_FLAG_NO_ERROR_BIT_KHR = 0x00000008;
def GL_KHR_parallel_shader_compile = 1;
def GL_MAX_SHADER_COMPILER_THREADS_KHR = 0x91B0;
def GL_COMPLETION_STATUS_KHR = 0x91B1;

def glMaxShaderCompilerThreadsKHR_signature func(count GLuint);
var global glMaxShaderCompilerThreadsKHR glMaxShaderCompilerThreadsKHR_signature;
def GL_KHR_robust_buffer_access_behavior = 1;
def GL_KHR_robustness = 1;
def GL_CONTEXT_ROBUST_ACCESS = 0x90F3;
def GL_KHR_shader_subgroup = 1;
def GL_SUBGROUP_SIZE_KHR = 0x9532;
def GL_SUBGROUP_SUPPORTED_STAGES_KHR = 0x9533;
def GL_SUBGROUP_SUPPORTED_FEATURES_KHR = 0x9534;
def GL_SUBGROUP_QUAD_ALL_STAGES_KHR = 0x9535;
def GL_SUBGROUP_FEATURE_BASIC_BIT_KHR = 0x00000001;
def GL_SUBGROUP_FEATURE_VOTE_BIT_KHR = 0x00000002;
def GL_SUBGROUP_FEATURE_ARITHMETIC_BIT_KHR = 0x00000004;
def GL_SUBGROUP_FEATURE_BALLOT_BIT_KHR = 0x00000008;
def GL_SUBGROUP_FEATURE_SHUFFLE_BIT_KHR = 0x00000010;
def GL_SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT_KHR = 0x00000020;
def GL_SUBGROUP_FEATURE_CLUSTERED_BIT_KHR = 0x00000040;
def GL_SUBGROUP_FEATURE_QUAD_BIT_KHR = 0x00000080;
def GL_KHR_texture_compression_astc_hdr = 1;
def GL_COMPRESSED_RGBA_ASTC_4x4_KHR = 0x93B0;
def GL_COMPRESSED_RGBA_ASTC_5x4_KHR = 0x93B1;
def GL_COMPRESSED_RGBA_ASTC_5x5_KHR = 0x93B2;
def GL_COMPRESSED_RGBA_ASTC_6x5_KHR = 0x93B3;
def GL_COMPRESSED_RGBA_ASTC_6x6_KHR = 0x93B4;
def GL_COMPRESSED_RGBA_ASTC_8x5_KHR = 0x93B5;
def GL_COMPRESSED_RGBA_ASTC_8x6_KHR = 0x93B6;
def GL_COMPRESSED_RGBA_ASTC_8x8_KHR = 0x93B7;
def GL_COMPRESSED_RGBA_ASTC_10x5_KHR = 0x93B8;
def GL_COMPRESSED_RGBA_ASTC_10x6_KHR = 0x93B9;
def GL_COMPRESSED_RGBA_ASTC_10x8_KHR = 0x93BA;
def GL_COMPRESSED_RGBA_ASTC_10x10_KHR = 0x93BB;
def GL_COMPRESSED_RGBA_ASTC_12x10_KHR = 0x93BC;
def GL_COMPRESSED_RGBA_ASTC_12x12_KHR = 0x93BD;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR = 0x93D0;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR = 0x93D1;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR = 0x93D2;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR = 0x93D3;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR = 0x93D4;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR = 0x93D5;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR = 0x93D6;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR = 0x93D7;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR = 0x93D8;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR = 0x93D9;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR = 0x93DA;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR = 0x93DB;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR = 0x93DC;
def GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR = 0x93DD;
def GL_KHR_texture_compression_astc_ldr = 1;
def GL_KHR_texture_compression_astc_sliced_3d = 1;
def GL_OES_byte_coordinates = 1;

def glMultiTexCoord1bOES_signature func(texture GLenum; s GLbyte);
var global glMultiTexCoord1bOES glMultiTexCoord1bOES_signature;

def glMultiTexCoord1bvOES_signature func(texture GLenum; coords GLbyte ref);
var global glMultiTexCoord1bvOES glMultiTexCoord1bvOES_signature;

def glMultiTexCoord2bOES_signature func(texture GLenum; s GLbyte; t GLbyte);
var global glMultiTexCoord2bOES glMultiTexCoord2bOES_signature;

def glMultiTexCoord2bvOES_signature func(texture GLenum; coords GLbyte ref);
var global glMultiTexCoord2bvOES glMultiTexCoord2bvOES_signature;

def glMultiTexCoord3bOES_signature func(texture GLenum; s GLbyte; t GLbyte; r GLbyte);
var global glMultiTexCoord3bOES glMultiTexCoord3bOES_signature;

def glMultiTexCoord3bvOES_signature func(texture GLenum; coords GLbyte ref);
var global glMultiTexCoord3bvOES glMultiTexCoord3bvOES_signature;

def glMultiTexCoord4bOES_signature func(texture GLenum; s GLbyte; t GLbyte; r GLbyte; q GLbyte);
var global glMultiTexCoord4bOES glMultiTexCoord4bOES_signature;

def glMultiTexCoord4bvOES_signature func(texture GLenum; coords GLbyte ref);
var global glMultiTexCoord4bvOES glMultiTexCoord4bvOES_signature;

def glTexCoord1bOES_signature func(s GLbyte);
var global glTexCoord1bOES glTexCoord1bOES_signature;

def glTexCoord1bvOES_signature func(coords GLbyte ref);
var global glTexCoord1bvOES glTexCoord1bvOES_signature;

def glTexCoord2bOES_signature func(s GLbyte; t GLbyte);
var global glTexCoord2bOES glTexCoord2bOES_signature;

def glTexCoord2bvOES_signature func(coords GLbyte ref);
var global glTexCoord2bvOES glTexCoord2bvOES_signature;

def glTexCoord3bOES_signature func(s GLbyte; t GLbyte; r GLbyte);
var global glTexCoord3bOES glTexCoord3bOES_signature;

def glTexCoord3bvOES_signature func(coords GLbyte ref);
var global glTexCoord3bvOES glTexCoord3bvOES_signature;

def glTexCoord4bOES_signature func(s GLbyte; t GLbyte; r GLbyte; q GLbyte);
var global glTexCoord4bOES glTexCoord4bOES_signature;

def glTexCoord4bvOES_signature func(coords GLbyte ref);
var global glTexCoord4bvOES glTexCoord4bvOES_signature;

def glVertex2bOES_signature func(x GLbyte; y GLbyte);
var global glVertex2bOES glVertex2bOES_signature;

def glVertex2bvOES_signature func(coords GLbyte ref);
var global glVertex2bvOES glVertex2bvOES_signature;

def glVertex3bOES_signature func(x GLbyte; y GLbyte; z GLbyte);
var global glVertex3bOES glVertex3bOES_signature;

def glVertex3bvOES_signature func(coords GLbyte ref);
var global glVertex3bvOES glVertex3bvOES_signature;

def glVertex4bOES_signature func(x GLbyte; y GLbyte; z GLbyte; w GLbyte);
var global glVertex4bOES glVertex4bOES_signature;

def glVertex4bvOES_signature func(coords GLbyte ref);
var global glVertex4bvOES glVertex4bvOES_signature;
def GL_OES_compressed_paletted_texture = 1;
def GL_PALETTE4_RGB8_OES = 0x8B90;
def GL_PALETTE4_RGBA8_OES = 0x8B91;
def GL_PALETTE4_R5_G6_B5_OES = 0x8B92;
def GL_PALETTE4_RGBA4_OES = 0x8B93;
def GL_PALETTE4_RGB5_A1_OES = 0x8B94;
def GL_PALETTE8_RGB8_OES = 0x8B95;
def GL_PALETTE8_RGBA8_OES = 0x8B96;
def GL_PALETTE8_R5_G6_B5_OES = 0x8B97;
def GL_PALETTE8_RGBA4_OES = 0x8B98;
def GL_PALETTE8_RGB5_A1_OES = 0x8B99;
def GL_OES_fixed_point = 1;
def GL_FIXED_OES = 0x140C;

def glAlphaFuncxOES_signature func(func GLenum; ref GLfixed);
var global glAlphaFuncxOES glAlphaFuncxOES_signature;

def glClearColorxOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var global glClearColorxOES glClearColorxOES_signature;

def glClearDepthxOES_signature func(depth GLfixed);
var global glClearDepthxOES glClearDepthxOES_signature;

def glClipPlanexOES_signature func(plane GLenum; equation GLfixed ref);
var global glClipPlanexOES glClipPlanexOES_signature;

def glColor4xOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var global glColor4xOES glColor4xOES_signature;

def glDepthRangexOES_signature func(n GLfixed; f GLfixed);
var global glDepthRangexOES glDepthRangexOES_signature;

def glFogxOES_signature func(pname GLenum; param GLfixed);
var global glFogxOES glFogxOES_signature;

def glFogxvOES_signature func(pname GLenum; param GLfixed ref);
var global glFogxvOES glFogxvOES_signature;

def glFrustumxOES_signature func(l GLfixed; r GLfixed; b GLfixed; t GLfixed; n GLfixed; f GLfixed);
var global glFrustumxOES glFrustumxOES_signature;

def glGetClipPlanexOES_signature func(plane GLenum; equation GLfixed ref);
var global glGetClipPlanexOES glGetClipPlanexOES_signature;

def glGetFixedvOES_signature func(pname GLenum; params GLfixed ref);
var global glGetFixedvOES glGetFixedvOES_signature;

def glGetTexEnvxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glGetTexEnvxvOES glGetTexEnvxvOES_signature;

def glGetTexParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glGetTexParameterxvOES glGetTexParameterxvOES_signature;

def glLightModelxOES_signature func(pname GLenum; param GLfixed);
var global glLightModelxOES glLightModelxOES_signature;

def glLightModelxvOES_signature func(pname GLenum; param GLfixed ref);
var global glLightModelxvOES glLightModelxvOES_signature;

def glLightxOES_signature func(light GLenum; pname GLenum; param GLfixed);
var global glLightxOES glLightxOES_signature;

def glLightxvOES_signature func(light GLenum; pname GLenum; params GLfixed ref);
var global glLightxvOES glLightxvOES_signature;

def glLineWidthxOES_signature func(width GLfixed);
var global glLineWidthxOES glLineWidthxOES_signature;

def glLoadMatrixxOES_signature func(m GLfixed ref);
var global glLoadMatrixxOES glLoadMatrixxOES_signature;

def glMaterialxOES_signature func(face GLenum; pname GLenum; param GLfixed);
var global glMaterialxOES glMaterialxOES_signature;

def glMaterialxvOES_signature func(face GLenum; pname GLenum; param GLfixed ref);
var global glMaterialxvOES glMaterialxvOES_signature;

def glMultMatrixxOES_signature func(m GLfixed ref);
var global glMultMatrixxOES glMultMatrixxOES_signature;

def glMultiTexCoord4xOES_signature func(texture GLenum; s GLfixed; t GLfixed; r GLfixed; q GLfixed);
var global glMultiTexCoord4xOES glMultiTexCoord4xOES_signature;

def glNormal3xOES_signature func(nx GLfixed; ny GLfixed; nz GLfixed);
var global glNormal3xOES glNormal3xOES_signature;

def glOrthoxOES_signature func(l GLfixed; r GLfixed; b GLfixed; t GLfixed; n GLfixed; f GLfixed);
var global glOrthoxOES glOrthoxOES_signature;

def glPointParameterxvOES_signature func(pname GLenum; params GLfixed ref);
var global glPointParameterxvOES glPointParameterxvOES_signature;

def glPointSizexOES_signature func(size GLfixed);
var global glPointSizexOES glPointSizexOES_signature;

def glPolygonOffsetxOES_signature func(factor GLfixed; units GLfixed);
var global glPolygonOffsetxOES glPolygonOffsetxOES_signature;

def glRotatexOES_signature func(angle GLfixed; x GLfixed; y GLfixed; z GLfixed);
var global glRotatexOES glRotatexOES_signature;

def glScalexOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var global glScalexOES glScalexOES_signature;

def glTexEnvxOES_signature func(target GLenum; pname GLenum; param GLfixed);
var global glTexEnvxOES glTexEnvxOES_signature;

def glTexEnvxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glTexEnvxvOES glTexEnvxvOES_signature;

def glTexParameterxOES_signature func(target GLenum; pname GLenum; param GLfixed);
var global glTexParameterxOES glTexParameterxOES_signature;

def glTexParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glTexParameterxvOES glTexParameterxvOES_signature;

def glTranslatexOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var global glTranslatexOES glTranslatexOES_signature;

def glAccumxOES_signature func(op GLenum; value GLfixed);
var global glAccumxOES glAccumxOES_signature;

def glBitmapxOES_signature func(width GLsizei; height GLsizei; xorig GLfixed; yorig GLfixed; xmove GLfixed; ymove GLfixed; bitmap GLubyte ref);
var global glBitmapxOES glBitmapxOES_signature;

def glBlendColorxOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var global glBlendColorxOES glBlendColorxOES_signature;

def glClearAccumxOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var global glClearAccumxOES glClearAccumxOES_signature;

def glColor3xOES_signature func(red GLfixed; green GLfixed; blue GLfixed);
var global glColor3xOES glColor3xOES_signature;

def glColor3xvOES_signature func(components GLfixed ref);
var global glColor3xvOES glColor3xvOES_signature;

def glColor4xvOES_signature func(components GLfixed ref);
var global glColor4xvOES glColor4xvOES_signature;

def glConvolutionParameterxOES_signature func(target GLenum; pname GLenum; param GLfixed);
var global glConvolutionParameterxOES glConvolutionParameterxOES_signature;

def glConvolutionParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glConvolutionParameterxvOES glConvolutionParameterxvOES_signature;

def glEvalCoord1xOES_signature func(u GLfixed);
var global glEvalCoord1xOES glEvalCoord1xOES_signature;

def glEvalCoord1xvOES_signature func(coords GLfixed ref);
var global glEvalCoord1xvOES glEvalCoord1xvOES_signature;

def glEvalCoord2xOES_signature func(u GLfixed; v GLfixed);
var global glEvalCoord2xOES glEvalCoord2xOES_signature;

def glEvalCoord2xvOES_signature func(coords GLfixed ref);
var global glEvalCoord2xvOES glEvalCoord2xvOES_signature;

def glFeedbackBufferxOES_signature func(n GLsizei; type GLenum; buffer GLfixed ref);
var global glFeedbackBufferxOES glFeedbackBufferxOES_signature;

def glGetConvolutionParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glGetConvolutionParameterxvOES glGetConvolutionParameterxvOES_signature;

def glGetHistogramParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var global glGetHistogramParameterxvOES glGetHistogramParameterxvOES_signature;

def glGetLightxOES_signature func(light GLenum; pname GLenum; params GLfixed ref);
var global glGetLightxOES glGetLightxOES_signature;

def glGetMapxvOES_signature func(target GLenum; query GLenum; v GLfixed ref);
var global glGetMapxvOES glGetMapxvOES_signature;

def glGetMaterialxOES_signature func(face GLenum; pname GLenum; param GLfixed);
var global glGetMaterialxOES glGetMaterialxOES_signature;

def glGetPixelMapxv_signature func(map GLenum; size GLint; values GLfixed ref);
var global glGetPixelMapxv glGetPixelMapxv_signature;

def glGetTexGenxvOES_signature func(coord GLenum; pname GLenum; params GLfixed ref);
var global glGetTexGenxvOES glGetTexGenxvOES_signature;

def glGetTexLevelParameterxvOES_signature func(target GLenum; level GLint; pname GLenum; params GLfixed ref);
var global glGetTexLevelParameterxvOES glGetTexLevelParameterxvOES_signature;

def glIndexxOES_signature func(component GLfixed);
var global glIndexxOES glIndexxOES_signature;

def glIndexxvOES_signature func(component GLfixed ref);
var global glIndexxvOES glIndexxvOES_signature;

def glLoadTransposeMatrixxOES_signature func(m GLfixed ref);
var global glLoadTransposeMatrixxOES glLoadTransposeMatrixxOES_signature;

def glMap1xOES_signature func(target GLenum; u1 GLfixed; u2 GLfixed; stride GLint; order GLint; points GLfixed);
var global glMap1xOES glMap1xOES_signature;

def glMap2xOES_signature func(target GLenum; u1 GLfixed; u2 GLfixed; ustride GLint; uorder GLint; v1 GLfixed; v2 GLfixed; vstride GLint; vorder GLint; points GLfixed);
var global glMap2xOES glMap2xOES_signature;

def glMapGrid1xOES_signature func(n GLint; u1 GLfixed; u2 GLfixed);
var global glMapGrid1xOES glMapGrid1xOES_signature;

def glMapGrid2xOES_signature func(n GLint; u1 GLfixed; u2 GLfixed; v1 GLfixed; v2 GLfixed);
var global glMapGrid2xOES glMapGrid2xOES_signature;

def glMultTransposeMatrixxOES_signature func(m GLfixed ref);
var global glMultTransposeMatrixxOES glMultTransposeMatrixxOES_signature;

def glMultiTexCoord1xOES_signature func(texture GLenum; s GLfixed);
var global glMultiTexCoord1xOES glMultiTexCoord1xOES_signature;

def glMultiTexCoord1xvOES_signature func(texture GLenum; coords GLfixed ref);
var global glMultiTexCoord1xvOES glMultiTexCoord1xvOES_signature;

def glMultiTexCoord2xOES_signature func(texture GLenum; s GLfixed; t GLfixed);
var global glMultiTexCoord2xOES glMultiTexCoord2xOES_signature;

def glMultiTexCoord2xvOES_signature func(texture GLenum; coords GLfixed ref);
var global glMultiTexCoord2xvOES glMultiTexCoord2xvOES_signature;

def glMultiTexCoord3xOES_signature func(texture GLenum; s GLfixed; t GLfixed; r GLfixed);
var global glMultiTexCoord3xOES glMultiTexCoord3xOES_signature;

def glMultiTexCoord3xvOES_signature func(texture GLenum; coords GLfixed ref);
var global glMultiTexCoord3xvOES glMultiTexCoord3xvOES_signature;

def glMultiTexCoord4xvOES_signature func(texture GLenum; coords GLfixed ref);
var global glMultiTexCoord4xvOES glMultiTexCoord4xvOES_signature;

def glNormal3xvOES_signature func(coords GLfixed ref);
var global glNormal3xvOES glNormal3xvOES_signature;

def glPassThroughxOES_signature func(token GLfixed);
var global glPassThroughxOES glPassThroughxOES_signature;

def glPixelMapx_signature func(map GLenum; size GLint; values GLfixed ref);
var global glPixelMapx glPixelMapx_signature;

def glPixelStorex_signature func(pname GLenum; param GLfixed);
var global glPixelStorex glPixelStorex_signature;

def glPixelTransferxOES_signature func(pname GLenum; param GLfixed);
var global glPixelTransferxOES glPixelTransferxOES_signature;

def glPixelZoomxOES_signature func(xfactor GLfixed; yfactor GLfixed);
var global glPixelZoomxOES glPixelZoomxOES_signature;

def glPrioritizeTexturesxOES_signature func(n GLsizei; textures GLuint ref; priorities GLfixed ref);
var global glPrioritizeTexturesxOES glPrioritizeTexturesxOES_signature;

def glRasterPos2xOES_signature func(x GLfixed; y GLfixed);
var global glRasterPos2xOES glRasterPos2xOES_signature;

def glRasterPos2xvOES_signature func(coords GLfixed ref);
var global glRasterPos2xvOES glRasterPos2xvOES_signature;

def glRasterPos3xOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var global glRasterPos3xOES glRasterPos3xOES_signature;

def glRasterPos3xvOES_signature func(coords GLfixed ref);
var global glRasterPos3xvOES glRasterPos3xvOES_signature;

def glRasterPos4xOES_signature func(x GLfixed; y GLfixed; z GLfixed; w GLfixed);
var global glRasterPos4xOES glRasterPos4xOES_signature;

def glRasterPos4xvOES_signature func(coords GLfixed ref);
var global glRasterPos4xvOES glRasterPos4xvOES_signature;

def glRectxOES_signature func(x1 GLfixed; y1 GLfixed; x2 GLfixed; y2 GLfixed);
var global glRectxOES glRectxOES_signature;

def glRectxvOES_signature func(v1 GLfixed ref; v2 GLfixed ref);
var global glRectxvOES glRectxvOES_signature;

def glTexCoord1xOES_signature func(s GLfixed);
var global glTexCoord1xOES glTexCoord1xOES_signature;

def glTexCoord1xvOES_signature func(coords GLfixed ref);
var global glTexCoord1xvOES glTexCoord1xvOES_signature;

def glTexCoord2xOES_signature func(s GLfixed; t GLfixed);
var global glTexCoord2xOES glTexCoord2xOES_signature;

def glTexCoord2xvOES_signature func(coords GLfixed ref);
var global glTexCoord2xvOES glTexCoord2xvOES_signature;

def glTexCoord3xOES_signature func(s GLfixed; t GLfixed; r GLfixed);
var global glTexCoord3xOES glTexCoord3xOES_signature;

def glTexCoord3xvOES_signature func(coords GLfixed ref);
var global glTexCoord3xvOES glTexCoord3xvOES_signature;

def glTexCoord4xOES_signature func(s GLfixed; t GLfixed; r GLfixed; q GLfixed);
var global glTexCoord4xOES glTexCoord4xOES_signature;

def glTexCoord4xvOES_signature func(coords GLfixed ref);
var global glTexCoord4xvOES glTexCoord4xvOES_signature;

def glTexGenxOES_signature func(coord GLenum; pname GLenum; param GLfixed);
var global glTexGenxOES glTexGenxOES_signature;

def glTexGenxvOES_signature func(coord GLenum; pname GLenum; params GLfixed ref);
var global glTexGenxvOES glTexGenxvOES_signature;

def glVertex2xOES_signature func(x GLfixed);
var global glVertex2xOES glVertex2xOES_signature;

def glVertex2xvOES_signature func(coords GLfixed ref);
var global glVertex2xvOES glVertex2xvOES_signature;

def glVertex3xOES_signature func(x GLfixed; y GLfixed);
var global glVertex3xOES glVertex3xOES_signature;

def glVertex3xvOES_signature func(coords GLfixed ref);
var global glVertex3xvOES glVertex3xvOES_signature;

def glVertex4xOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var global glVertex4xOES glVertex4xOES_signature;

def glVertex4xvOES_signature func(coords GLfixed ref);
var global glVertex4xvOES glVertex4xvOES_signature;
def GL_OES_query_matrix = 1;

def glQueryMatrixxOES_signature func(mantissa GLfixed ref; exponent GLint ref) (result GLbitfield);
var global glQueryMatrixxOES glQueryMatrixxOES_signature;
def GL_OES_read_format = 1;
def GL_IMPLEMENTATION_COLOR_READ_TYPE_OES = 0x8B9A;
def GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES = 0x8B9B;
def GL_OES_single_precision = 1;

def glClearDepthfOES_signature func(depth GLclampf);
var global glClearDepthfOES glClearDepthfOES_signature;

def glClipPlanefOES_signature func(plane GLenum; equation GLfloat ref);
var global glClipPlanefOES glClipPlanefOES_signature;

def glDepthRangefOES_signature func(n GLclampf; f GLclampf);
var global glDepthRangefOES glDepthRangefOES_signature;

def glFrustumfOES_signature func(l GLfloat; r GLfloat; b GLfloat; t GLfloat; n GLfloat; f GLfloat);
var global glFrustumfOES glFrustumfOES_signature;

def glGetClipPlanefOES_signature func(plane GLenum; equation GLfloat ref);
var global glGetClipPlanefOES glGetClipPlanefOES_signature;

def glOrthofOES_signature func(l GLfloat; r GLfloat; b GLfloat; t GLfloat; n GLfloat; f GLfloat);
var global glOrthofOES glOrthofOES_signature;
def GL_3DFX_multisample = 1;
def GL_MULTISAMPLE_3DFX = 0x86B2;
def GL_SAMPLE_BUFFERS_3DFX = 0x86B3;
def GL_SAMPLES_3DFX = 0x86B4;
def GL_MULTISAMPLE_BIT_3DFX = 0x20000000;
def GL_3DFX_tbuffer = 1;

def glTbufferMask3DFX_signature func(mask GLuint);
var global glTbufferMask3DFX glTbufferMask3DFX_signature;
def GL_3DFX_texture_compression_FXT1 = 1;
def GL_COMPRESSED_RGB_FXT1_3DFX = 0x86B0;
def GL_COMPRESSED_RGBA_FXT1_3DFX = 0x86B1;
def GL_AMD_blend_minmax_factor = 1;
def GL_FACTOR_MIN_AMD = 0x901C;
def GL_FACTOR_MAX_AMD = 0x901D;
def GL_AMD_conservative_depth = 1;
def GL_AMD_debug_output = 1;

def GLDEBUGPROCAMD func(id GLuint; category GLenum; severity GLenum; length GLsizei; message GLchar ref; userParam u8 ref);
def GL_MAX_DEBUG_MESSAGE_LENGTH_AMD = 0x9143;
def GL_MAX_DEBUG_LOGGED_MESSAGES_AMD = 0x9144;
def GL_DEBUG_LOGGED_MESSAGES_AMD = 0x9145;
def GL_DEBUG_SEVERITY_HIGH_AMD = 0x9146;
def GL_DEBUG_SEVERITY_MEDIUM_AMD = 0x9147;
def GL_DEBUG_SEVERITY_LOW_AMD = 0x9148;
def GL_DEBUG_CATEGORY_API_ERROR_AMD = 0x9149;
def GL_DEBUG_CATEGORY_WINDOW_SYSTEM_AMD = 0x914A;
def GL_DEBUG_CATEGORY_DEPRECATION_AMD = 0x914B;
def GL_DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD = 0x914C;
def GL_DEBUG_CATEGORY_PERFORMANCE_AMD = 0x914D;
def GL_DEBUG_CATEGORY_SHADER_COMPILER_AMD = 0x914E;
def GL_DEBUG_CATEGORY_APPLICATION_AMD = 0x914F;
def GL_DEBUG_CATEGORY_OTHER_AMD = 0x9150;

def glDebugMessageEnableAMD_signature func(category GLenum; severity GLenum; count GLsizei; ids GLuint ref; enabled GLboolean);
var global glDebugMessageEnableAMD glDebugMessageEnableAMD_signature;

def glDebugMessageInsertAMD_signature func(category GLenum; severity GLenum; id GLuint; length GLsizei; buf GLchar ref);
var global glDebugMessageInsertAMD glDebugMessageInsertAMD_signature;

def glDebugMessageCallbackAMD_signature func(callback GLDEBUGPROCAMD; userParam u8 ref);
var global glDebugMessageCallbackAMD glDebugMessageCallbackAMD_signature;

def glGetDebugMessageLogAMD_signature func(count GLuint; bufSize GLsizei; categories GLenum ref; severities GLuint ref; ids GLuint ref; lengths GLsizei ref; message GLchar ref) (result GLuint);
var global glGetDebugMessageLogAMD glGetDebugMessageLogAMD_signature;
def GL_AMD_depth_clamp_separate = 1;
def GL_DEPTH_CLAMP_NEAR_AMD = 0x901E;
def GL_DEPTH_CLAMP_FAR_AMD = 0x901F;
def GL_AMD_draw_buffers_blend = 1;

def glBlendFuncIndexedAMD_signature func(buf GLuint; src GLenum; dst GLenum);
var global glBlendFuncIndexedAMD glBlendFuncIndexedAMD_signature;

def glBlendFuncSeparateIndexedAMD_signature func(buf GLuint; srcRGB GLenum; dstRGB GLenum; srcAlpha GLenum; dstAlpha GLenum);
var global glBlendFuncSeparateIndexedAMD glBlendFuncSeparateIndexedAMD_signature;

def glBlendEquationIndexedAMD_signature func(buf GLuint; mode GLenum);
var global glBlendEquationIndexedAMD glBlendEquationIndexedAMD_signature;

def glBlendEquationSeparateIndexedAMD_signature func(buf GLuint; modeRGB GLenum; modeAlpha GLenum);
var global glBlendEquationSeparateIndexedAMD glBlendEquationSeparateIndexedAMD_signature;
def GL_AMD_framebuffer_multisample_advanced = 1;
def GL_RENDERBUFFER_STORAGE_SAMPLES_AMD = 0x91B2;
def GL_MAX_COLOR_FRAMEBUFFER_SAMPLES_AMD = 0x91B3;
def GL_MAX_COLOR_FRAMEBUFFER_STORAGE_SAMPLES_AMD = 0x91B4;
def GL_MAX_DEPTH_STENCIL_FRAMEBUFFER_SAMPLES_AMD = 0x91B5;
def GL_NUM_SUPPORTED_MULTISAMPLE_MODES_AMD = 0x91B6;
def GL_SUPPORTED_MULTISAMPLE_MODES_AMD = 0x91B7;

def glRenderbufferStorageMultisampleAdvancedAMD_signature func(target GLenum; samples GLsizei; storageSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glRenderbufferStorageMultisampleAdvancedAMD glRenderbufferStorageMultisampleAdvancedAMD_signature;

def glNamedRenderbufferStorageMultisampleAdvancedAMD_signature func(renderbuffer GLuint; samples GLsizei; storageSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glNamedRenderbufferStorageMultisampleAdvancedAMD glNamedRenderbufferStorageMultisampleAdvancedAMD_signature;
def GL_AMD_framebuffer_sample_positions = 1;
def GL_SUBSAMPLE_DISTANCE_AMD = 0x883F;
def GL_PIXELS_PER_SAMPLE_PATTERN_X_AMD = 0x91AE;
def GL_PIXELS_PER_SAMPLE_PATTERN_Y_AMD = 0x91AF;
def GL_ALL_PIXELS_AMD = 0xFFFFFFFF;

def glFramebufferSamplePositionsfvAMD_signature func(target GLenum; numsamples GLuint; pixelindex GLuint; values GLfloat ref);
var global glFramebufferSamplePositionsfvAMD glFramebufferSamplePositionsfvAMD_signature;

def glNamedFramebufferSamplePositionsfvAMD_signature func(framebuffer GLuint; numsamples GLuint; pixelindex GLuint; values GLfloat ref);
var global glNamedFramebufferSamplePositionsfvAMD glNamedFramebufferSamplePositionsfvAMD_signature;

def glGetFramebufferParameterfvAMD_signature func(target GLenum; pname GLenum; numsamples GLuint; pixelindex GLuint; size GLsizei; values GLfloat ref);
var global glGetFramebufferParameterfvAMD glGetFramebufferParameterfvAMD_signature;

def glGetNamedFramebufferParameterfvAMD_signature func(framebuffer GLuint; pname GLenum; numsamples GLuint; pixelindex GLuint; size GLsizei; values GLfloat ref);
var global glGetNamedFramebufferParameterfvAMD glGetNamedFramebufferParameterfvAMD_signature;
def GL_AMD_gcn_shader = 1;
def GL_AMD_gpu_shader_half_float = 1;
def GL_FLOAT16_NV = 0x8FF8;
def GL_FLOAT16_VEC2_NV = 0x8FF9;
def GL_FLOAT16_VEC3_NV = 0x8FFA;
def GL_FLOAT16_VEC4_NV = 0x8FFB;
def GL_FLOAT16_MAT2_AMD = 0x91C5;
def GL_FLOAT16_MAT3_AMD = 0x91C6;
def GL_FLOAT16_MAT4_AMD = 0x91C7;
def GL_FLOAT16_MAT2x3_AMD = 0x91C8;
def GL_FLOAT16_MAT2x4_AMD = 0x91C9;
def GL_FLOAT16_MAT3x2_AMD = 0x91CA;
def GL_FLOAT16_MAT3x4_AMD = 0x91CB;
def GL_FLOAT16_MAT4x2_AMD = 0x91CC;
def GL_FLOAT16_MAT4x3_AMD = 0x91CD;
def GL_AMD_gpu_shader_int16 = 1;
def GL_AMD_gpu_shader_int64 = 1;
def GL_INT64_NV = 0x140E;
def GL_UNSIGNED_INT64_NV = 0x140F;
def GL_INT8_NV = 0x8FE0;
def GL_INT8_VEC2_NV = 0x8FE1;
def GL_INT8_VEC3_NV = 0x8FE2;
def GL_INT8_VEC4_NV = 0x8FE3;
def GL_INT16_NV = 0x8FE4;
def GL_INT16_VEC2_NV = 0x8FE5;
def GL_INT16_VEC3_NV = 0x8FE6;
def GL_INT16_VEC4_NV = 0x8FE7;
def GL_INT64_VEC2_NV = 0x8FE9;
def GL_INT64_VEC3_NV = 0x8FEA;
def GL_INT64_VEC4_NV = 0x8FEB;
def GL_UNSIGNED_INT8_NV = 0x8FEC;
def GL_UNSIGNED_INT8_VEC2_NV = 0x8FED;
def GL_UNSIGNED_INT8_VEC3_NV = 0x8FEE;
def GL_UNSIGNED_INT8_VEC4_NV = 0x8FEF;
def GL_UNSIGNED_INT16_NV = 0x8FF0;
def GL_UNSIGNED_INT16_VEC2_NV = 0x8FF1;
def GL_UNSIGNED_INT16_VEC3_NV = 0x8FF2;
def GL_UNSIGNED_INT16_VEC4_NV = 0x8FF3;
def GL_UNSIGNED_INT64_VEC2_NV = 0x8FF5;
def GL_UNSIGNED_INT64_VEC3_NV = 0x8FF6;
def GL_UNSIGNED_INT64_VEC4_NV = 0x8FF7;

def glUniform1i64NV_signature func(location GLint; x GLint64EXT);
var global glUniform1i64NV glUniform1i64NV_signature;

def glUniform2i64NV_signature func(location GLint; x GLint64EXT; y GLint64EXT);
var global glUniform2i64NV glUniform2i64NV_signature;

def glUniform3i64NV_signature func(location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT);
var global glUniform3i64NV glUniform3i64NV_signature;

def glUniform4i64NV_signature func(location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT; w GLint64EXT);
var global glUniform4i64NV glUniform4i64NV_signature;

def glUniform1i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var global glUniform1i64vNV glUniform1i64vNV_signature;

def glUniform2i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var global glUniform2i64vNV glUniform2i64vNV_signature;

def glUniform3i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var global glUniform3i64vNV glUniform3i64vNV_signature;

def glUniform4i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var global glUniform4i64vNV glUniform4i64vNV_signature;

def glUniform1ui64NV_signature func(location GLint; x GLuint64EXT);
var global glUniform1ui64NV glUniform1ui64NV_signature;

def glUniform2ui64NV_signature func(location GLint; x GLuint64EXT; y GLuint64EXT);
var global glUniform2ui64NV glUniform2ui64NV_signature;

def glUniform3ui64NV_signature func(location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT);
var global glUniform3ui64NV glUniform3ui64NV_signature;

def glUniform4ui64NV_signature func(location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT; w GLuint64EXT);
var global glUniform4ui64NV glUniform4ui64NV_signature;

def glUniform1ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var global glUniform1ui64vNV glUniform1ui64vNV_signature;

def glUniform2ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var global glUniform2ui64vNV glUniform2ui64vNV_signature;

def glUniform3ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var global glUniform3ui64vNV glUniform3ui64vNV_signature;

def glUniform4ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var global glUniform4ui64vNV glUniform4ui64vNV_signature;

def glGetUniformi64vNV_signature func(program GLuint; location GLint; params GLint64EXT ref);
var global glGetUniformi64vNV glGetUniformi64vNV_signature;

def glGetUniformui64vNV_signature func(program GLuint; location GLint; params GLuint64EXT ref);
var global glGetUniformui64vNV glGetUniformui64vNV_signature;

def glProgramUniform1i64NV_signature func(program GLuint; location GLint; x GLint64EXT);
var global glProgramUniform1i64NV glProgramUniform1i64NV_signature;

def glProgramUniform2i64NV_signature func(program GLuint; location GLint; x GLint64EXT; y GLint64EXT);
var global glProgramUniform2i64NV glProgramUniform2i64NV_signature;

def glProgramUniform3i64NV_signature func(program GLuint; location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT);
var global glProgramUniform3i64NV glProgramUniform3i64NV_signature;

def glProgramUniform4i64NV_signature func(program GLuint; location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT; w GLint64EXT);
var global glProgramUniform4i64NV glProgramUniform4i64NV_signature;

def glProgramUniform1i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var global glProgramUniform1i64vNV glProgramUniform1i64vNV_signature;

def glProgramUniform2i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var global glProgramUniform2i64vNV glProgramUniform2i64vNV_signature;

def glProgramUniform3i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var global glProgramUniform3i64vNV glProgramUniform3i64vNV_signature;

def glProgramUniform4i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var global glProgramUniform4i64vNV glProgramUniform4i64vNV_signature;

def glProgramUniform1ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT);
var global glProgramUniform1ui64NV glProgramUniform1ui64NV_signature;

def glProgramUniform2ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT; y GLuint64EXT);
var global glProgramUniform2ui64NV glProgramUniform2ui64NV_signature;

def glProgramUniform3ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT);
var global glProgramUniform3ui64NV glProgramUniform3ui64NV_signature;

def glProgramUniform4ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT; w GLuint64EXT);
var global glProgramUniform4ui64NV glProgramUniform4ui64NV_signature;

def glProgramUniform1ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var global glProgramUniform1ui64vNV glProgramUniform1ui64vNV_signature;

def glProgramUniform2ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var global glProgramUniform2ui64vNV glProgramUniform2ui64vNV_signature;

def glProgramUniform3ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var global glProgramUniform3ui64vNV glProgramUniform3ui64vNV_signature;

def glProgramUniform4ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var global glProgramUniform4ui64vNV glProgramUniform4ui64vNV_signature;
def GL_AMD_interleaved_elements = 1;
def GL_VERTEX_ELEMENT_SWIZZLE_AMD = 0x91A4;
def GL_VERTEX_ID_SWIZZLE_AMD = 0x91A5;

def glVertexAttribParameteriAMD_signature func(index GLuint; pname GLenum; param GLint);
var global glVertexAttribParameteriAMD glVertexAttribParameteriAMD_signature;
def GL_AMD_multi_draw_indirect = 1;

def glMultiDrawArraysIndirectAMD_signature func(mode GLenum; indirect u8 ref; primcount GLsizei; stride GLsizei);
var global glMultiDrawArraysIndirectAMD glMultiDrawArraysIndirectAMD_signature;

def glMultiDrawElementsIndirectAMD_signature func(mode GLenum; type GLenum; indirect u8 ref; primcount GLsizei; stride GLsizei);
var global glMultiDrawElementsIndirectAMD glMultiDrawElementsIndirectAMD_signature;
def GL_AMD_name_gen_delete = 1;
def GL_DATA_BUFFER_AMD = 0x9151;
def GL_PERFORMANCE_MONITOR_AMD = 0x9152;
def GL_QUERY_OBJECT_AMD = 0x9153;
def GL_VERTEX_ARRAY_OBJECT_AMD = 0x9154;
def GL_SAMPLER_OBJECT_AMD = 0x9155;

def glGenNamesAMD_signature func(identifier GLenum; num GLuint; names GLuint ref);
var global glGenNamesAMD glGenNamesAMD_signature;

def glDeleteNamesAMD_signature func(identifier GLenum; num GLuint; names GLuint ref);
var global glDeleteNamesAMD glDeleteNamesAMD_signature;

def glIsNameAMD_signature func(identifier GLenum; name GLuint) (result GLboolean);
var global glIsNameAMD glIsNameAMD_signature;
def GL_AMD_occlusion_query_event = 1;
def GL_OCCLUSION_QUERY_EVENT_MASK_AMD = 0x874F;
def GL_QUERY_DEPTH_PASS_EVENT_BIT_AMD = 0x00000001;
def GL_QUERY_DEPTH_FAIL_EVENT_BIT_AMD = 0x00000002;
def GL_QUERY_STENCIL_FAIL_EVENT_BIT_AMD = 0x00000004;
def GL_QUERY_DEPTH_BOUNDS_FAIL_EVENT_BIT_AMD = 0x00000008;
def GL_QUERY_ALL_EVENT_BITS_AMD = 0xFFFFFFFF;

def glQueryObjectParameteruiAMD_signature func(target GLenum; id GLuint; pname GLenum; param GLuint);
var global glQueryObjectParameteruiAMD glQueryObjectParameteruiAMD_signature;
def GL_AMD_performance_monitor = 1;
def GL_COUNTER_TYPE_AMD = 0x8BC0;
def GL_COUNTER_RANGE_AMD = 0x8BC1;
def GL_UNSIGNED_INT64_AMD = 0x8BC2;
def GL_PERCENTAGE_AMD = 0x8BC3;
def GL_PERFMON_RESULT_AVAILABLE_AMD = 0x8BC4;
def GL_PERFMON_RESULT_SIZE_AMD = 0x8BC5;
def GL_PERFMON_RESULT_AMD = 0x8BC6;

def glGetPerfMonitorGroupsAMD_signature func(numGroups GLint ref; groupsSize GLsizei; groups GLuint ref);
var global glGetPerfMonitorGroupsAMD glGetPerfMonitorGroupsAMD_signature;

def glGetPerfMonitorCountersAMD_signature func(group GLuint; numCounters GLint ref; maxActiveCounters GLint ref; counterSize GLsizei; counters GLuint ref);
var global glGetPerfMonitorCountersAMD glGetPerfMonitorCountersAMD_signature;

def glGetPerfMonitorGroupStringAMD_signature func(group GLuint; bufSize GLsizei; length GLsizei ref; groupString GLchar ref);
var global glGetPerfMonitorGroupStringAMD glGetPerfMonitorGroupStringAMD_signature;

def glGetPerfMonitorCounterStringAMD_signature func(group GLuint; counter GLuint; bufSize GLsizei; length GLsizei ref; counterString GLchar ref);
var global glGetPerfMonitorCounterStringAMD glGetPerfMonitorCounterStringAMD_signature;

def glGetPerfMonitorCounterInfoAMD_signature func(group GLuint; counter GLuint; pname GLenum; data u8 ref);
var global glGetPerfMonitorCounterInfoAMD glGetPerfMonitorCounterInfoAMD_signature;

def glGenPerfMonitorsAMD_signature func(n GLsizei; monitors GLuint ref);
var global glGenPerfMonitorsAMD glGenPerfMonitorsAMD_signature;

def glDeletePerfMonitorsAMD_signature func(n GLsizei; monitors GLuint ref);
var global glDeletePerfMonitorsAMD glDeletePerfMonitorsAMD_signature;

def glSelectPerfMonitorCountersAMD_signature func(monitor GLuint; enable GLboolean; group GLuint; numCounters GLint; counterList GLuint ref);
var global glSelectPerfMonitorCountersAMD glSelectPerfMonitorCountersAMD_signature;

def glBeginPerfMonitorAMD_signature func(monitor GLuint);
var global glBeginPerfMonitorAMD glBeginPerfMonitorAMD_signature;

def glEndPerfMonitorAMD_signature func(monitor GLuint);
var global glEndPerfMonitorAMD glEndPerfMonitorAMD_signature;

def glGetPerfMonitorCounterDataAMD_signature func(monitor GLuint; pname GLenum; dataSize GLsizei; data GLuint ref; bytesWritten GLint ref);
var global glGetPerfMonitorCounterDataAMD glGetPerfMonitorCounterDataAMD_signature;
def GL_AMD_pinned_memory = 1;
def GL_EXTERNAL_VIRTUAL_MEMORY_BUFFER_AMD = 0x9160;
def GL_AMD_query_buffer_object = 1;
def GL_QUERY_BUFFER_AMD = 0x9192;
def GL_QUERY_BUFFER_BINDING_AMD = 0x9193;
def GL_QUERY_RESULT_NO_WAIT_AMD = 0x9194;
def GL_AMD_sample_positions = 1;

def glSetMultisamplefvAMD_signature func(pname GLenum; index GLuint; val GLfloat ref);
var global glSetMultisamplefvAMD glSetMultisamplefvAMD_signature;
def GL_AMD_seamless_cubemap_per_texture = 1;
def GL_AMD_shader_atomic_counter_ops = 1;
def GL_AMD_shader_ballot = 1;
def GL_AMD_shader_explicit_vertex_parameter = 1;
def GL_AMD_shader_gpu_shader_half_float_fetch = 1;
def GL_AMD_shader_image_load_store_lod = 1;
def GL_AMD_shader_stencil_export = 1;
def GL_AMD_shader_trinary_minmax = 1;
def GL_AMD_sparse_texture = 1;
def GL_VIRTUAL_PAGE_SIZE_X_AMD = 0x9195;
def GL_VIRTUAL_PAGE_SIZE_Y_AMD = 0x9196;
def GL_VIRTUAL_PAGE_SIZE_Z_AMD = 0x9197;
def GL_MAX_SPARSE_TEXTURE_SIZE_AMD = 0x9198;
def GL_MAX_SPARSE_3D_TEXTURE_SIZE_AMD = 0x9199;
def GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS = 0x919A;
def GL_MIN_SPARSE_LEVEL_AMD = 0x919B;
def GL_MIN_LOD_WARNING_AMD = 0x919C;
def GL_TEXTURE_STORAGE_SPARSE_BIT_AMD = 0x00000001;

def glTexStorageSparseAMD_signature func(target GLenum; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; layers GLsizei; flags GLbitfield);
var global glTexStorageSparseAMD glTexStorageSparseAMD_signature;

def glTextureStorageSparseAMD_signature func(texture GLuint; target GLenum; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; layers GLsizei; flags GLbitfield);
var global glTextureStorageSparseAMD glTextureStorageSparseAMD_signature;
def GL_AMD_stencil_operation_extended = 1;
def GL_SET_AMD = 0x874A;
def GL_REPLACE_VALUE_AMD = 0x874B;
def GL_STENCIL_OP_VALUE_AMD = 0x874C;
def GL_STENCIL_BACK_OP_VALUE_AMD = 0x874D;

def glStencilOpValueAMD_signature func(face GLenum; value GLuint);
var global glStencilOpValueAMD glStencilOpValueAMD_signature;
def GL_AMD_texture_gather_bias_lod = 1;
def GL_AMD_texture_texture4 = 1;
def GL_AMD_transform_feedback3_lines_triangles = 1;
def GL_AMD_transform_feedback4 = 1;
def GL_STREAM_RASTERIZATION_AMD = 0x91A0;
def GL_AMD_vertex_shader_layer = 1;
def GL_AMD_vertex_shader_tessellator = 1;
def GL_SAMPLER_BUFFER_AMD = 0x9001;
def GL_INT_SAMPLER_BUFFER_AMD = 0x9002;
def GL_UNSIGNED_INT_SAMPLER_BUFFER_AMD = 0x9003;
def GL_TESSELLATION_MODE_AMD = 0x9004;
def GL_TESSELLATION_FACTOR_AMD = 0x9005;
def GL_DISCRETE_AMD = 0x9006;
def GL_CONTINUOUS_AMD = 0x9007;

def glTessellationFactorAMD_signature func(factor GLfloat);
var global glTessellationFactorAMD glTessellationFactorAMD_signature;

def glTessellationModeAMD_signature func(mode GLenum);
var global glTessellationModeAMD glTessellationModeAMD_signature;
def GL_AMD_vertex_shader_viewport_index = 1;
def GL_APPLE_aux_depth_stencil = 1;
def GL_AUX_DEPTH_STENCIL_APPLE = 0x8A14;
def GL_APPLE_client_storage = 1;
def GL_UNPACK_CLIENT_STORAGE_APPLE = 0x85B2;
def GL_APPLE_element_array = 1;
def GL_ELEMENT_ARRAY_APPLE = 0x8A0C;
def GL_ELEMENT_ARRAY_TYPE_APPLE = 0x8A0D;
def GL_ELEMENT_ARRAY_POINTER_APPLE = 0x8A0E;

def glElementPointerAPPLE_signature func(type GLenum; pointer u8 ref);
var global glElementPointerAPPLE glElementPointerAPPLE_signature;

def glDrawElementArrayAPPLE_signature func(mode GLenum; first GLint; count GLsizei);
var global glDrawElementArrayAPPLE glDrawElementArrayAPPLE_signature;

def glDrawRangeElementArrayAPPLE_signature func(mode GLenum; start GLuint; end GLuint; first GLint; count GLsizei);
var global glDrawRangeElementArrayAPPLE glDrawRangeElementArrayAPPLE_signature;

def glMultiDrawElementArrayAPPLE_signature func(mode GLenum; first GLint ref; count GLsizei ref; primcount GLsizei);
var global glMultiDrawElementArrayAPPLE glMultiDrawElementArrayAPPLE_signature;

def glMultiDrawRangeElementArrayAPPLE_signature func(mode GLenum; start GLuint; end GLuint; first GLint ref; count GLsizei ref; primcount GLsizei);
var global glMultiDrawRangeElementArrayAPPLE glMultiDrawRangeElementArrayAPPLE_signature;
def GL_APPLE_fence = 1;
def GL_DRAW_PIXELS_APPLE = 0x8A0A;
def GL_FENCE_APPLE = 0x8A0B;

def glGenFencesAPPLE_signature func(n GLsizei; fences GLuint ref);
var global glGenFencesAPPLE glGenFencesAPPLE_signature;

def glDeleteFencesAPPLE_signature func(n GLsizei; fences GLuint ref);
var global glDeleteFencesAPPLE glDeleteFencesAPPLE_signature;

def glSetFenceAPPLE_signature func(fence GLuint);
var global glSetFenceAPPLE glSetFenceAPPLE_signature;

def glIsFenceAPPLE_signature func(fence GLuint) (result GLboolean);
var global glIsFenceAPPLE glIsFenceAPPLE_signature;

def glTestFenceAPPLE_signature func(fence GLuint) (result GLboolean);
var global glTestFenceAPPLE glTestFenceAPPLE_signature;

def glFinishFenceAPPLE_signature func(fence GLuint);
var global glFinishFenceAPPLE glFinishFenceAPPLE_signature;

def glTestObjectAPPLE_signature func(object GLenum; name GLuint) (result GLboolean);
var global glTestObjectAPPLE glTestObjectAPPLE_signature;

def glFinishObjectAPPLE_signature func(object GLenum; name GLint);
var global glFinishObjectAPPLE glFinishObjectAPPLE_signature;
def GL_APPLE_float_pixels = 1;
def GL_HALF_APPLE = 0x140B;
def GL_RGBA_FLOAT32_APPLE = 0x8814;
def GL_RGB_FLOAT32_APPLE = 0x8815;
def GL_ALPHA_FLOAT32_APPLE = 0x8816;
def GL_INTENSITY_FLOAT32_APPLE = 0x8817;
def GL_LUMINANCE_FLOAT32_APPLE = 0x8818;
def GL_LUMINANCE_ALPHA_FLOAT32_APPLE = 0x8819;
def GL_RGBA_FLOAT16_APPLE = 0x881A;
def GL_RGB_FLOAT16_APPLE = 0x881B;
def GL_ALPHA_FLOAT16_APPLE = 0x881C;
def GL_INTENSITY_FLOAT16_APPLE = 0x881D;
def GL_LUMINANCE_FLOAT16_APPLE = 0x881E;
def GL_LUMINANCE_ALPHA_FLOAT16_APPLE = 0x881F;
def GL_COLOR_FLOAT_APPLE = 0x8A0F;
def GL_APPLE_flush_buffer_range = 1;
def GL_BUFFER_SERIALIZED_MODIFY_APPLE = 0x8A12;
def GL_BUFFER_FLUSHING_UNMAP_APPLE = 0x8A13;

def glBufferParameteriAPPLE_signature func(target GLenum; pname GLenum; param GLint);
var global glBufferParameteriAPPLE glBufferParameteriAPPLE_signature;

def glFlushMappedBufferRangeAPPLE_signature func(target GLenum; offset GLintptr; size GLsizeiptr);
var global glFlushMappedBufferRangeAPPLE glFlushMappedBufferRangeAPPLE_signature;
def GL_APPLE_object_purgeable = 1;
def GL_BUFFER_OBJECT_APPLE = 0x85B3;
def GL_RELEASED_APPLE = 0x8A19;
def GL_VOLATILE_APPLE = 0x8A1A;
def GL_RETAINED_APPLE = 0x8A1B;
def GL_UNDEFINED_APPLE = 0x8A1C;
def GL_PURGEABLE_APPLE = 0x8A1D;

def glObjectPurgeableAPPLE_signature func(objectType GLenum; name GLuint; option GLenum) (result GLenum);
var global glObjectPurgeableAPPLE glObjectPurgeableAPPLE_signature;

def glObjectUnpurgeableAPPLE_signature func(objectType GLenum; name GLuint; option GLenum) (result GLenum);
var global glObjectUnpurgeableAPPLE glObjectUnpurgeableAPPLE_signature;

def glGetObjectParameterivAPPLE_signature func(objectType GLenum; name GLuint; pname GLenum; params GLint ref);
var global glGetObjectParameterivAPPLE glGetObjectParameterivAPPLE_signature;
def GL_APPLE_rgb_422 = 1;
def GL_RGB_422_APPLE = 0x8A1F;
def GL_UNSIGNED_SHORT_8_8_APPLE = 0x85BA;
def GL_UNSIGNED_SHORT_8_8_REV_APPLE = 0x85BB;
def GL_RGB_RAW_422_APPLE = 0x8A51;
def GL_APPLE_row_bytes = 1;
def GL_PACK_ROW_BYTES_APPLE = 0x8A15;
def GL_UNPACK_ROW_BYTES_APPLE = 0x8A16;
def GL_APPLE_specular_vector = 1;
def GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE = 0x85B0;
def GL_APPLE_texture_range = 1;
def GL_TEXTURE_RANGE_LENGTH_APPLE = 0x85B7;
def GL_TEXTURE_RANGE_POINTER_APPLE = 0x85B8;
def GL_TEXTURE_STORAGE_HINT_APPLE = 0x85BC;
def GL_STORAGE_PRIVATE_APPLE = 0x85BD;
def GL_STORAGE_CACHED_APPLE = 0x85BE;
def GL_STORAGE_SHARED_APPLE = 0x85BF;

def glTextureRangeAPPLE_signature func(target GLenum; length GLsizei; pointer u8 ref);
var global glTextureRangeAPPLE glTextureRangeAPPLE_signature;

def glGetTexParameterPointervAPPLE_signature func(target GLenum; pname GLenum; params u8 ref ref);
var global glGetTexParameterPointervAPPLE glGetTexParameterPointervAPPLE_signature;
def GL_APPLE_transform_hint = 1;
def GL_TRANSFORM_HINT_APPLE = 0x85B1;
def GL_APPLE_vertex_array_object = 1;
def GL_VERTEX_ARRAY_BINDING_APPLE = 0x85B5;

def glBindVertexArrayAPPLE_signature func(array GLuint);
var global glBindVertexArrayAPPLE glBindVertexArrayAPPLE_signature;

def glDeleteVertexArraysAPPLE_signature func(n GLsizei; arrays GLuint ref);
var global glDeleteVertexArraysAPPLE glDeleteVertexArraysAPPLE_signature;

def glGenVertexArraysAPPLE_signature func(n GLsizei; arrays GLuint ref);
var global glGenVertexArraysAPPLE glGenVertexArraysAPPLE_signature;

def glIsVertexArrayAPPLE_signature func(array GLuint) (result GLboolean);
var global glIsVertexArrayAPPLE glIsVertexArrayAPPLE_signature;
def GL_APPLE_vertex_array_range = 1;
def GL_VERTEX_ARRAY_RANGE_APPLE = 0x851D;
def GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE = 0x851E;
def GL_VERTEX_ARRAY_STORAGE_HINT_APPLE = 0x851F;
def GL_VERTEX_ARRAY_RANGE_POINTER_APPLE = 0x8521;
def GL_STORAGE_CLIENT_APPLE = 0x85B4;

def glVertexArrayRangeAPPLE_signature func(length GLsizei; pointer u8 ref);
var global glVertexArrayRangeAPPLE glVertexArrayRangeAPPLE_signature;

def glFlushVertexArrayRangeAPPLE_signature func(length GLsizei; pointer u8 ref);
var global glFlushVertexArrayRangeAPPLE glFlushVertexArrayRangeAPPLE_signature;

def glVertexArrayParameteriAPPLE_signature func(pname GLenum; param GLint);
var global glVertexArrayParameteriAPPLE glVertexArrayParameteriAPPLE_signature;
def GL_APPLE_vertex_program_evaluators = 1;
def GL_VERTEX_ATTRIB_MAP1_APPLE = 0x8A00;
def GL_VERTEX_ATTRIB_MAP2_APPLE = 0x8A01;
def GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE = 0x8A02;
def GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE = 0x8A03;
def GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE = 0x8A04;
def GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE = 0x8A05;
def GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE = 0x8A06;
def GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE = 0x8A07;
def GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE = 0x8A08;
def GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE = 0x8A09;

def glEnableVertexAttribAPPLE_signature func(index GLuint; pname GLenum);
var global glEnableVertexAttribAPPLE glEnableVertexAttribAPPLE_signature;

def glDisableVertexAttribAPPLE_signature func(index GLuint; pname GLenum);
var global glDisableVertexAttribAPPLE glDisableVertexAttribAPPLE_signature;

def glIsVertexAttribEnabledAPPLE_signature func(index GLuint; pname GLenum) (result GLboolean);
var global glIsVertexAttribEnabledAPPLE glIsVertexAttribEnabledAPPLE_signature;

def glMapVertexAttrib1dAPPLE_signature func(index GLuint; size GLuint; u1 GLdouble; u2 GLdouble; stride GLint; order GLint; points GLdouble ref);
var global glMapVertexAttrib1dAPPLE glMapVertexAttrib1dAPPLE_signature;

def glMapVertexAttrib1fAPPLE_signature func(index GLuint; size GLuint; u1 GLfloat; u2 GLfloat; stride GLint; order GLint; points GLfloat ref);
var global glMapVertexAttrib1fAPPLE glMapVertexAttrib1fAPPLE_signature;

def glMapVertexAttrib2dAPPLE_signature func(index GLuint; size GLuint; u1 GLdouble; u2 GLdouble; ustride GLint; uorder GLint; v1 GLdouble; v2 GLdouble; vstride GLint; vorder GLint; points GLdouble ref);
var global glMapVertexAttrib2dAPPLE glMapVertexAttrib2dAPPLE_signature;

def glMapVertexAttrib2fAPPLE_signature func(index GLuint; size GLuint; u1 GLfloat; u2 GLfloat; ustride GLint; uorder GLint; v1 GLfloat; v2 GLfloat; vstride GLint; vorder GLint; points GLfloat ref);
var global glMapVertexAttrib2fAPPLE glMapVertexAttrib2fAPPLE_signature;
def GL_APPLE_ycbcr_422 = 1;
def GL_YCBCR_422_APPLE = 0x85B9;
def GL_ATI_draw_buffers = 1;
def GL_MAX_DRAW_BUFFERS_ATI = 0x8824;
def GL_DRAW_BUFFER0_ATI = 0x8825;
def GL_DRAW_BUFFER1_ATI = 0x8826;
def GL_DRAW_BUFFER2_ATI = 0x8827;
def GL_DRAW_BUFFER3_ATI = 0x8828;
def GL_DRAW_BUFFER4_ATI = 0x8829;
def GL_DRAW_BUFFER5_ATI = 0x882A;
def GL_DRAW_BUFFER6_ATI = 0x882B;
def GL_DRAW_BUFFER7_ATI = 0x882C;
def GL_DRAW_BUFFER8_ATI = 0x882D;
def GL_DRAW_BUFFER9_ATI = 0x882E;
def GL_DRAW_BUFFER10_ATI = 0x882F;
def GL_DRAW_BUFFER11_ATI = 0x8830;
def GL_DRAW_BUFFER12_ATI = 0x8831;
def GL_DRAW_BUFFER13_ATI = 0x8832;
def GL_DRAW_BUFFER14_ATI = 0x8833;
def GL_DRAW_BUFFER15_ATI = 0x8834;

def glDrawBuffersATI_signature func(n GLsizei; bufs GLenum ref);
var global glDrawBuffersATI glDrawBuffersATI_signature;
def GL_ATI_element_array = 1;
def GL_ELEMENT_ARRAY_ATI = 0x8768;
def GL_ELEMENT_ARRAY_TYPE_ATI = 0x8769;
def GL_ELEMENT_ARRAY_POINTER_ATI = 0x876A;

def glElementPointerATI_signature func(type GLenum; pointer u8 ref);
var global glElementPointerATI glElementPointerATI_signature;

def glDrawElementArrayATI_signature func(mode GLenum; count GLsizei);
var global glDrawElementArrayATI glDrawElementArrayATI_signature;

def glDrawRangeElementArrayATI_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei);
var global glDrawRangeElementArrayATI glDrawRangeElementArrayATI_signature;
def GL_ATI_envmap_bumpmap = 1;
def GL_BUMP_ROT_MATRIX_ATI = 0x8775;
def GL_BUMP_ROT_MATRIX_SIZE_ATI = 0x8776;
def GL_BUMP_NUM_TEX_UNITS_ATI = 0x8777;
def GL_BUMP_TEX_UNITS_ATI = 0x8778;
def GL_DUDV_ATI = 0x8779;
def GL_DU8DV8_ATI = 0x877A;
def GL_BUMP_ENVMAP_ATI = 0x877B;
def GL_BUMP_TARGET_ATI = 0x877C;

def glTexBumpParameterivATI_signature func(pname GLenum; param GLint ref);
var global glTexBumpParameterivATI glTexBumpParameterivATI_signature;

def glTexBumpParameterfvATI_signature func(pname GLenum; param GLfloat ref);
var global glTexBumpParameterfvATI glTexBumpParameterfvATI_signature;

def glGetTexBumpParameterivATI_signature func(pname GLenum; param GLint ref);
var global glGetTexBumpParameterivATI glGetTexBumpParameterivATI_signature;

def glGetTexBumpParameterfvATI_signature func(pname GLenum; param GLfloat ref);
var global glGetTexBumpParameterfvATI glGetTexBumpParameterfvATI_signature;
def GL_ATI_fragment_shader = 1;
def GL_FRAGMENT_SHADER_ATI = 0x8920;
def GL_REG_0_ATI = 0x8921;
def GL_REG_1_ATI = 0x8922;
def GL_REG_2_ATI = 0x8923;
def GL_REG_3_ATI = 0x8924;
def GL_REG_4_ATI = 0x8925;
def GL_REG_5_ATI = 0x8926;
def GL_REG_6_ATI = 0x8927;
def GL_REG_7_ATI = 0x8928;
def GL_REG_8_ATI = 0x8929;
def GL_REG_9_ATI = 0x892A;
def GL_REG_10_ATI = 0x892B;
def GL_REG_11_ATI = 0x892C;
def GL_REG_12_ATI = 0x892D;
def GL_REG_13_ATI = 0x892E;
def GL_REG_14_ATI = 0x892F;
def GL_REG_15_ATI = 0x8930;
def GL_REG_16_ATI = 0x8931;
def GL_REG_17_ATI = 0x8932;
def GL_REG_18_ATI = 0x8933;
def GL_REG_19_ATI = 0x8934;
def GL_REG_20_ATI = 0x8935;
def GL_REG_21_ATI = 0x8936;
def GL_REG_22_ATI = 0x8937;
def GL_REG_23_ATI = 0x8938;
def GL_REG_24_ATI = 0x8939;
def GL_REG_25_ATI = 0x893A;
def GL_REG_26_ATI = 0x893B;
def GL_REG_27_ATI = 0x893C;
def GL_REG_28_ATI = 0x893D;
def GL_REG_29_ATI = 0x893E;
def GL_REG_30_ATI = 0x893F;
def GL_REG_31_ATI = 0x8940;
def GL_CON_0_ATI = 0x8941;
def GL_CON_1_ATI = 0x8942;
def GL_CON_2_ATI = 0x8943;
def GL_CON_3_ATI = 0x8944;
def GL_CON_4_ATI = 0x8945;
def GL_CON_5_ATI = 0x8946;
def GL_CON_6_ATI = 0x8947;
def GL_CON_7_ATI = 0x8948;
def GL_CON_8_ATI = 0x8949;
def GL_CON_9_ATI = 0x894A;
def GL_CON_10_ATI = 0x894B;
def GL_CON_11_ATI = 0x894C;
def GL_CON_12_ATI = 0x894D;
def GL_CON_13_ATI = 0x894E;
def GL_CON_14_ATI = 0x894F;
def GL_CON_15_ATI = 0x8950;
def GL_CON_16_ATI = 0x8951;
def GL_CON_17_ATI = 0x8952;
def GL_CON_18_ATI = 0x8953;
def GL_CON_19_ATI = 0x8954;
def GL_CON_20_ATI = 0x8955;
def GL_CON_21_ATI = 0x8956;
def GL_CON_22_ATI = 0x8957;
def GL_CON_23_ATI = 0x8958;
def GL_CON_24_ATI = 0x8959;
def GL_CON_25_ATI = 0x895A;
def GL_CON_26_ATI = 0x895B;
def GL_CON_27_ATI = 0x895C;
def GL_CON_28_ATI = 0x895D;
def GL_CON_29_ATI = 0x895E;
def GL_CON_30_ATI = 0x895F;
def GL_CON_31_ATI = 0x8960;
def GL_MOV_ATI = 0x8961;
def GL_ADD_ATI = 0x8963;
def GL_MUL_ATI = 0x8964;
def GL_SUB_ATI = 0x8965;
def GL_DOT3_ATI = 0x8966;
def GL_DOT4_ATI = 0x8967;
def GL_MAD_ATI = 0x8968;
def GL_LERP_ATI = 0x8969;
def GL_CND_ATI = 0x896A;
def GL_CND0_ATI = 0x896B;
def GL_DOT2_ADD_ATI = 0x896C;
def GL_SECONDARY_INTERPOLATOR_ATI = 0x896D;
def GL_NUM_FRAGMENT_REGISTERS_ATI = 0x896E;
def GL_NUM_FRAGMENT_CONSTANTS_ATI = 0x896F;
def GL_NUM_PASSES_ATI = 0x8970;
def GL_NUM_INSTRUCTIONS_PER_PASS_ATI = 0x8971;
def GL_NUM_INSTRUCTIONS_TOTAL_ATI = 0x8972;
def GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI = 0x8973;
def GL_NUM_LOOPBACK_COMPONENTS_ATI = 0x8974;
def GL_COLOR_ALPHA_PAIRING_ATI = 0x8975;
def GL_SWIZZLE_STR_ATI = 0x8976;
def GL_SWIZZLE_STQ_ATI = 0x8977;
def GL_SWIZZLE_STR_DR_ATI = 0x8978;
def GL_SWIZZLE_STQ_DQ_ATI = 0x8979;
def GL_SWIZZLE_STRQ_ATI = 0x897A;
def GL_SWIZZLE_STRQ_DQ_ATI = 0x897B;
def GL_RED_BIT_ATI = 0x00000001;
def GL_GREEN_BIT_ATI = 0x00000002;
def GL_BLUE_BIT_ATI = 0x00000004;
def GL_2X_BIT_ATI = 0x00000001;
def GL_4X_BIT_ATI = 0x00000002;
def GL_8X_BIT_ATI = 0x00000004;
def GL_HALF_BIT_ATI = 0x00000008;
def GL_QUARTER_BIT_ATI = 0x00000010;
def GL_EIGHTH_BIT_ATI = 0x00000020;
def GL_SATURATE_BIT_ATI = 0x00000040;
def GL_COMP_BIT_ATI = 0x00000002;
def GL_NEGATE_BIT_ATI = 0x00000004;
def GL_BIAS_BIT_ATI = 0x00000008;

def glGenFragmentShadersATI_signature func(range GLuint) (result GLuint);
var global glGenFragmentShadersATI glGenFragmentShadersATI_signature;

def glBindFragmentShaderATI_signature func(id GLuint);
var global glBindFragmentShaderATI glBindFragmentShaderATI_signature;

def glDeleteFragmentShaderATI_signature func(id GLuint);
var global glDeleteFragmentShaderATI glDeleteFragmentShaderATI_signature;

def glBeginFragmentShaderATI_signature func();
var global glBeginFragmentShaderATI glBeginFragmentShaderATI_signature;

def glEndFragmentShaderATI_signature func();
var global glEndFragmentShaderATI glEndFragmentShaderATI_signature;

def glPassTexCoordATI_signature func(dst GLuint; coord GLuint; swizzle GLenum);
var global glPassTexCoordATI glPassTexCoordATI_signature;

def glSampleMapATI_signature func(dst GLuint; interp GLuint; swizzle GLenum);
var global glSampleMapATI glSampleMapATI_signature;

def glColorFragmentOp1ATI_signature func(op GLenum; dst GLuint; dstMask GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint);
var global glColorFragmentOp1ATI glColorFragmentOp1ATI_signature;

def glColorFragmentOp2ATI_signature func(op GLenum; dst GLuint; dstMask GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint);
var global glColorFragmentOp2ATI glColorFragmentOp2ATI_signature;

def glColorFragmentOp3ATI_signature func(op GLenum; dst GLuint; dstMask GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint; arg3 GLuint; arg3Rep GLuint; arg3Mod GLuint);
var global glColorFragmentOp3ATI glColorFragmentOp3ATI_signature;

def glAlphaFragmentOp1ATI_signature func(op GLenum; dst GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint);
var global glAlphaFragmentOp1ATI glAlphaFragmentOp1ATI_signature;

def glAlphaFragmentOp2ATI_signature func(op GLenum; dst GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint);
var global glAlphaFragmentOp2ATI glAlphaFragmentOp2ATI_signature;

def glAlphaFragmentOp3ATI_signature func(op GLenum; dst GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint; arg3 GLuint; arg3Rep GLuint; arg3Mod GLuint);
var global glAlphaFragmentOp3ATI glAlphaFragmentOp3ATI_signature;

def glSetFragmentShaderConstantATI_signature func(dst GLuint; value GLfloat ref);
var global glSetFragmentShaderConstantATI glSetFragmentShaderConstantATI_signature;
def GL_ATI_map_object_buffer = 1;

def glMapObjectBufferATI_signature func(buffer GLuint) (result u8 ref);
var global glMapObjectBufferATI glMapObjectBufferATI_signature;

def glUnmapObjectBufferATI_signature func(buffer GLuint);
var global glUnmapObjectBufferATI glUnmapObjectBufferATI_signature;
def GL_ATI_meminfo = 1;
def GL_VBO_FREE_MEMORY_ATI = 0x87FB;
def GL_TEXTURE_FREE_MEMORY_ATI = 0x87FC;
def GL_RENDERBUFFER_FREE_MEMORY_ATI = 0x87FD;
def GL_ATI_pixel_format_float = 1;
def GL_RGBA_FLOAT_MODE_ATI = 0x8820;
def GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI = 0x8835;
def GL_ATI_pn_triangles = 1;
def GL_PN_TRIANGLES_ATI = 0x87F0;
def GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F1;
def GL_PN_TRIANGLES_POINT_MODE_ATI = 0x87F2;
def GL_PN_TRIANGLES_NORMAL_MODE_ATI = 0x87F3;
def GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F4;
def GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI = 0x87F5;
def GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI = 0x87F6;
def GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI = 0x87F7;
def GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI = 0x87F8;

def glPNTrianglesiATI_signature func(pname GLenum; param GLint);
var global glPNTrianglesiATI glPNTrianglesiATI_signature;

def glPNTrianglesfATI_signature func(pname GLenum; param GLfloat);
var global glPNTrianglesfATI glPNTrianglesfATI_signature;
def GL_ATI_separate_stencil = 1;
def GL_STENCIL_BACK_FUNC_ATI = 0x8800;
def GL_STENCIL_BACK_FAIL_ATI = 0x8801;
def GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI = 0x8802;
def GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI = 0x8803;

def glStencilOpSeparateATI_signature func(face GLenum; sfail GLenum; dpfail GLenum; dppass GLenum);
var global glStencilOpSeparateATI glStencilOpSeparateATI_signature;

def glStencilFuncSeparateATI_signature func(frontfunc GLenum; backfunc GLenum; ref GLint; mask GLuint);
var global glStencilFuncSeparateATI glStencilFuncSeparateATI_signature;
def GL_ATI_text_fragment_shader = 1;
def GL_TEXT_FRAGMENT_SHADER_ATI = 0x8200;
def GL_ATI_texture_env_combine3 = 1;
def GL_MODULATE_ADD_ATI = 0x8744;
def GL_MODULATE_SIGNED_ADD_ATI = 0x8745;
def GL_MODULATE_SUBTRACT_ATI = 0x8746;
def GL_ATI_texture_float = 1;
def GL_RGBA_FLOAT32_ATI = 0x8814;
def GL_RGB_FLOAT32_ATI = 0x8815;
def GL_ALPHA_FLOAT32_ATI = 0x8816;
def GL_INTENSITY_FLOAT32_ATI = 0x8817;
def GL_LUMINANCE_FLOAT32_ATI = 0x8818;
def GL_LUMINANCE_ALPHA_FLOAT32_ATI = 0x8819;
def GL_RGBA_FLOAT16_ATI = 0x881A;
def GL_RGB_FLOAT16_ATI = 0x881B;
def GL_ALPHA_FLOAT16_ATI = 0x881C;
def GL_INTENSITY_FLOAT16_ATI = 0x881D;
def GL_LUMINANCE_FLOAT16_ATI = 0x881E;
def GL_LUMINANCE_ALPHA_FLOAT16_ATI = 0x881F;
def GL_ATI_texture_mirror_once = 1;
def GL_MIRROR_CLAMP_ATI = 0x8742;
def GL_MIRROR_CLAMP_TO_EDGE_ATI = 0x8743;
def GL_ATI_vertex_array_object = 1;
def GL_STATIC_ATI = 0x8760;
def GL_DYNAMIC_ATI = 0x8761;
def GL_PRESERVE_ATI = 0x8762;
def GL_DISCARD_ATI = 0x8763;
def GL_OBJECT_BUFFER_SIZE_ATI = 0x8764;
def GL_OBJECT_BUFFER_USAGE_ATI = 0x8765;
def GL_ARRAY_OBJECT_BUFFER_ATI = 0x8766;
def GL_ARRAY_OBJECT_OFFSET_ATI = 0x8767;

def glNewObjectBufferATI_signature func(size GLsizei; pointer u8 ref; usage GLenum) (result GLuint);
var global glNewObjectBufferATI glNewObjectBufferATI_signature;

def glIsObjectBufferATI_signature func(buffer GLuint) (result GLboolean);
var global glIsObjectBufferATI glIsObjectBufferATI_signature;

def glUpdateObjectBufferATI_signature func(buffer GLuint; offset GLuint; size GLsizei; pointer u8 ref; preserve GLenum);
var global glUpdateObjectBufferATI glUpdateObjectBufferATI_signature;

def glGetObjectBufferfvATI_signature func(buffer GLuint; pname GLenum; params GLfloat ref);
var global glGetObjectBufferfvATI glGetObjectBufferfvATI_signature;

def glGetObjectBufferivATI_signature func(buffer GLuint; pname GLenum; params GLint ref);
var global glGetObjectBufferivATI glGetObjectBufferivATI_signature;

def glFreeObjectBufferATI_signature func(buffer GLuint);
var global glFreeObjectBufferATI glFreeObjectBufferATI_signature;

def glArrayObjectATI_signature func(array GLenum; size GLint; type GLenum; stride GLsizei; buffer GLuint; offset GLuint);
var global glArrayObjectATI glArrayObjectATI_signature;

def glGetArrayObjectfvATI_signature func(array GLenum; pname GLenum; params GLfloat ref);
var global glGetArrayObjectfvATI glGetArrayObjectfvATI_signature;

def glGetArrayObjectivATI_signature func(array GLenum; pname GLenum; params GLint ref);
var global glGetArrayObjectivATI glGetArrayObjectivATI_signature;

def glVariantArrayObjectATI_signature func(id GLuint; type GLenum; stride GLsizei; buffer GLuint; offset GLuint);
var global glVariantArrayObjectATI glVariantArrayObjectATI_signature;

def glGetVariantArrayObjectfvATI_signature func(id GLuint; pname GLenum; params GLfloat ref);
var global glGetVariantArrayObjectfvATI glGetVariantArrayObjectfvATI_signature;

def glGetVariantArrayObjectivATI_signature func(id GLuint; pname GLenum; params GLint ref);
var global glGetVariantArrayObjectivATI glGetVariantArrayObjectivATI_signature;
def GL_ATI_vertex_attrib_array_object = 1;

def glVertexAttribArrayObjectATI_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; buffer GLuint; offset GLuint);
var global glVertexAttribArrayObjectATI glVertexAttribArrayObjectATI_signature;

def glGetVertexAttribArrayObjectfvATI_signature func(index GLuint; pname GLenum; params GLfloat ref);
var global glGetVertexAttribArrayObjectfvATI glGetVertexAttribArrayObjectfvATI_signature;

def glGetVertexAttribArrayObjectivATI_signature func(index GLuint; pname GLenum; params GLint ref);
var global glGetVertexAttribArrayObjectivATI glGetVertexAttribArrayObjectivATI_signature;
def GL_ATI_vertex_streams = 1;
def GL_MAX_VERTEX_STREAMS_ATI = 0x876B;
def GL_VERTEX_STREAM0_ATI = 0x876C;
def GL_VERTEX_STREAM1_ATI = 0x876D;
def GL_VERTEX_STREAM2_ATI = 0x876E;
def GL_VERTEX_STREAM3_ATI = 0x876F;
def GL_VERTEX_STREAM4_ATI = 0x8770;
def GL_VERTEX_STREAM5_ATI = 0x8771;
def GL_VERTEX_STREAM6_ATI = 0x8772;
def GL_VERTEX_STREAM7_ATI = 0x8773;
def GL_VERTEX_SOURCE_ATI = 0x8774;

def glVertexStream1sATI_signature func(stream GLenum; x GLshort);
var global glVertexStream1sATI glVertexStream1sATI_signature;

def glVertexStream1svATI_signature func(stream GLenum; coords GLshort ref);
var global glVertexStream1svATI glVertexStream1svATI_signature;

def glVertexStream1iATI_signature func(stream GLenum; x GLint);
var global glVertexStream1iATI glVertexStream1iATI_signature;

def glVertexStream1ivATI_signature func(stream GLenum; coords GLint ref);
var global glVertexStream1ivATI glVertexStream1ivATI_signature;

def glVertexStream1fATI_signature func(stream GLenum; x GLfloat);
var global glVertexStream1fATI glVertexStream1fATI_signature;

def glVertexStream1fvATI_signature func(stream GLenum; coords GLfloat ref);
var global glVertexStream1fvATI glVertexStream1fvATI_signature;

def glVertexStream1dATI_signature func(stream GLenum; x GLdouble);
var global glVertexStream1dATI glVertexStream1dATI_signature;

def glVertexStream1dvATI_signature func(stream GLenum; coords GLdouble ref);
var global glVertexStream1dvATI glVertexStream1dvATI_signature;

def glVertexStream2sATI_signature func(stream GLenum; x GLshort; y GLshort);
var global glVertexStream2sATI glVertexStream2sATI_signature;

def glVertexStream2svATI_signature func(stream GLenum; coords GLshort ref);
var global glVertexStream2svATI glVertexStream2svATI_signature;

def glVertexStream2iATI_signature func(stream GLenum; x GLint; y GLint);
var global glVertexStream2iATI glVertexStream2iATI_signature;

def glVertexStream2ivATI_signature func(stream GLenum; coords GLint ref);
var global glVertexStream2ivATI glVertexStream2ivATI_signature;

def glVertexStream2fATI_signature func(stream GLenum; x GLfloat; y GLfloat);
var global glVertexStream2fATI glVertexStream2fATI_signature;

def glVertexStream2fvATI_signature func(stream GLenum; coords GLfloat ref);
var global glVertexStream2fvATI glVertexStream2fvATI_signature;

def glVertexStream2dATI_signature func(stream GLenum; x GLdouble; y GLdouble);
var global glVertexStream2dATI glVertexStream2dATI_signature;

def glVertexStream2dvATI_signature func(stream GLenum; coords GLdouble ref);
var global glVertexStream2dvATI glVertexStream2dvATI_signature;

def glVertexStream3sATI_signature func(stream GLenum; x GLshort; y GLshort; z GLshort);
var global glVertexStream3sATI glVertexStream3sATI_signature;

def glVertexStream3svATI_signature func(stream GLenum; coords GLshort ref);
var global glVertexStream3svATI glVertexStream3svATI_signature;

def glVertexStream3iATI_signature func(stream GLenum; x GLint; y GLint; z GLint);
var global glVertexStream3iATI glVertexStream3iATI_signature;

def glVertexStream3ivATI_signature func(stream GLenum; coords GLint ref);
var global glVertexStream3ivATI glVertexStream3ivATI_signature;

def glVertexStream3fATI_signature func(stream GLenum; x GLfloat; y GLfloat; z GLfloat);
var global glVertexStream3fATI glVertexStream3fATI_signature;

def glVertexStream3fvATI_signature func(stream GLenum; coords GLfloat ref);
var global glVertexStream3fvATI glVertexStream3fvATI_signature;

def glVertexStream3dATI_signature func(stream GLenum; x GLdouble; y GLdouble; z GLdouble);
var global glVertexStream3dATI glVertexStream3dATI_signature;

def glVertexStream3dvATI_signature func(stream GLenum; coords GLdouble ref);
var global glVertexStream3dvATI glVertexStream3dvATI_signature;

def glVertexStream4sATI_signature func(stream GLenum; x GLshort; y GLshort; z GLshort; w GLshort);
var global glVertexStream4sATI glVertexStream4sATI_signature;

def glVertexStream4svATI_signature func(stream GLenum; coords GLshort ref);
var global glVertexStream4svATI glVertexStream4svATI_signature;

def glVertexStream4iATI_signature func(stream GLenum; x GLint; y GLint; z GLint; w GLint);
var global glVertexStream4iATI glVertexStream4iATI_signature;

def glVertexStream4ivATI_signature func(stream GLenum; coords GLint ref);
var global glVertexStream4ivATI glVertexStream4ivATI_signature;

def glVertexStream4fATI_signature func(stream GLenum; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glVertexStream4fATI glVertexStream4fATI_signature;

def glVertexStream4fvATI_signature func(stream GLenum; coords GLfloat ref);
var global glVertexStream4fvATI glVertexStream4fvATI_signature;

def glVertexStream4dATI_signature func(stream GLenum; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glVertexStream4dATI glVertexStream4dATI_signature;

def glVertexStream4dvATI_signature func(stream GLenum; coords GLdouble ref);
var global glVertexStream4dvATI glVertexStream4dvATI_signature;

def glNormalStream3bATI_signature func(stream GLenum; nx GLbyte; ny GLbyte; nz GLbyte);
var global glNormalStream3bATI glNormalStream3bATI_signature;

def glNormalStream3bvATI_signature func(stream GLenum; coords GLbyte ref);
var global glNormalStream3bvATI glNormalStream3bvATI_signature;

def glNormalStream3sATI_signature func(stream GLenum; nx GLshort; ny GLshort; nz GLshort);
var global glNormalStream3sATI glNormalStream3sATI_signature;

def glNormalStream3svATI_signature func(stream GLenum; coords GLshort ref);
var global glNormalStream3svATI glNormalStream3svATI_signature;

def glNormalStream3iATI_signature func(stream GLenum; nx GLint; ny GLint; nz GLint);
var global glNormalStream3iATI glNormalStream3iATI_signature;

def glNormalStream3ivATI_signature func(stream GLenum; coords GLint ref);
var global glNormalStream3ivATI glNormalStream3ivATI_signature;

def glNormalStream3fATI_signature func(stream GLenum; nx GLfloat; ny GLfloat; nz GLfloat);
var global glNormalStream3fATI glNormalStream3fATI_signature;

def glNormalStream3fvATI_signature func(stream GLenum; coords GLfloat ref);
var global glNormalStream3fvATI glNormalStream3fvATI_signature;

def glNormalStream3dATI_signature func(stream GLenum; nx GLdouble; ny GLdouble; nz GLdouble);
var global glNormalStream3dATI glNormalStream3dATI_signature;

def glNormalStream3dvATI_signature func(stream GLenum; coords GLdouble ref);
var global glNormalStream3dvATI glNormalStream3dvATI_signature;

def glClientActiveVertexStreamATI_signature func(stream GLenum);
var global glClientActiveVertexStreamATI glClientActiveVertexStreamATI_signature;

def glVertexBlendEnviATI_signature func(pname GLenum; param GLint);
var global glVertexBlendEnviATI glVertexBlendEnviATI_signature;

def glVertexBlendEnvfATI_signature func(pname GLenum; param GLfloat);
var global glVertexBlendEnvfATI glVertexBlendEnvfATI_signature;
def GL_EXT_422_pixels = 1;
def GL_422_EXT = 0x80CC;
def GL_422_REV_EXT = 0x80CD;
def GL_422_AVERAGE_EXT = 0x80CE;
def GL_422_REV_AVERAGE_EXT = 0x80CF;
def GL_EXT_EGL_image_storage = 1;

def glEGLImageTargetTexStorageEXT_signature func(target GLenum; image GLeglImageOES; attrib_list GLint ref);
var global glEGLImageTargetTexStorageEXT glEGLImageTargetTexStorageEXT_signature;

def glEGLImageTargetTextureStorageEXT_signature func(texture GLuint; image GLeglImageOES; attrib_list GLint ref);
var global glEGLImageTargetTextureStorageEXT glEGLImageTargetTextureStorageEXT_signature;
def GL_EXT_EGL_sync = 1;
def GL_EXT_abgr = 1;
def GL_ABGR_EXT = 0x8000;
def GL_EXT_bindable_uniform = 1;
def GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT = 0x8DE2;
def GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT = 0x8DE3;
def GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT = 0x8DE4;
def GL_MAX_BINDABLE_UNIFORM_SIZE_EXT = 0x8DED;
def GL_UNIFORM_BUFFER_EXT = 0x8DEE;
def GL_UNIFORM_BUFFER_BINDING_EXT = 0x8DEF;

def glUniformBufferEXT_signature func(program GLuint; location GLint; buffer GLuint);
var global glUniformBufferEXT glUniformBufferEXT_signature;

def glGetUniformBufferSizeEXT_signature func(program GLuint; location GLint) (result GLint);
var global glGetUniformBufferSizeEXT glGetUniformBufferSizeEXT_signature;

def glGetUniformOffsetEXT_signature func(program GLuint; location GLint) (result GLintptr);
var global glGetUniformOffsetEXT glGetUniformOffsetEXT_signature;
def GL_EXT_blend_color = 1;
def GL_CONSTANT_COLOR_EXT = 0x8001;
def GL_ONE_MINUS_CONSTANT_COLOR_EXT = 0x8002;
def GL_CONSTANT_ALPHA_EXT = 0x8003;
def GL_ONE_MINUS_CONSTANT_ALPHA_EXT = 0x8004;
def GL_BLEND_COLOR_EXT = 0x8005;

def glBlendColorEXT_signature func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat);
var global glBlendColorEXT glBlendColorEXT_signature;
def GL_EXT_blend_equation_separate = 1;
def GL_BLEND_EQUATION_RGB_EXT = 0x8009;
def GL_BLEND_EQUATION_ALPHA_EXT = 0x883D;

def glBlendEquationSeparateEXT_signature func(modeRGB GLenum; modeAlpha GLenum);
var global glBlendEquationSeparateEXT glBlendEquationSeparateEXT_signature;
def GL_EXT_blend_func_separate = 1;
def GL_BLEND_DST_RGB_EXT = 0x80C8;
def GL_BLEND_SRC_RGB_EXT = 0x80C9;
def GL_BLEND_DST_ALPHA_EXT = 0x80CA;
def GL_BLEND_SRC_ALPHA_EXT = 0x80CB;

def glBlendFuncSeparateEXT_signature func(sfactorRGB GLenum; dfactorRGB GLenum; sfactorAlpha GLenum; dfactorAlpha GLenum);
var global glBlendFuncSeparateEXT glBlendFuncSeparateEXT_signature;
def GL_EXT_blend_logic_op = 1;
def GL_EXT_blend_minmax = 1;
def GL_MIN_EXT = 0x8007;
def GL_MAX_EXT = 0x8008;
def GL_FUNC_ADD_EXT = 0x8006;
def GL_BLEND_EQUATION_EXT = 0x8009;

def glBlendEquationEXT_signature func(mode GLenum);
var global glBlendEquationEXT glBlendEquationEXT_signature;
def GL_EXT_blend_subtract = 1;
def GL_FUNC_SUBTRACT_EXT = 0x800A;
def GL_FUNC_REVERSE_SUBTRACT_EXT = 0x800B;
def GL_EXT_clip_volume_hint = 1;
def GL_CLIP_VOLUME_CLIPPING_HINT_EXT = 0x80F0;
def GL_EXT_cmyka = 1;
def GL_CMYK_EXT = 0x800C;
def GL_CMYKA_EXT = 0x800D;
def GL_PACK_CMYK_HINT_EXT = 0x800E;
def GL_UNPACK_CMYK_HINT_EXT = 0x800F;
def GL_EXT_color_subtable = 1;

def glColorSubTableEXT_signature func(target GLenum; start GLsizei; count GLsizei; format GLenum; type GLenum; data u8 ref);
var global glColorSubTableEXT glColorSubTableEXT_signature;

def glCopyColorSubTableEXT_signature func(target GLenum; start GLsizei; x GLint; y GLint; width GLsizei);
var global glCopyColorSubTableEXT glCopyColorSubTableEXT_signature;
def GL_EXT_compiled_vertex_array = 1;
def GL_ARRAY_ELEMENT_LOCK_FIRST_EXT = 0x81A8;
def GL_ARRAY_ELEMENT_LOCK_COUNT_EXT = 0x81A9;

def glLockArraysEXT_signature func(first GLint; count GLsizei);
var global glLockArraysEXT glLockArraysEXT_signature;

def glUnlockArraysEXT_signature func();
var global glUnlockArraysEXT glUnlockArraysEXT_signature;
def GL_EXT_convolution = 1;
def GL_CONVOLUTION_1D_EXT = 0x8010;
def GL_CONVOLUTION_2D_EXT = 0x8011;
def GL_SEPARABLE_2D_EXT = 0x8012;
def GL_CONVOLUTION_BORDER_MODE_EXT = 0x8013;
def GL_CONVOLUTION_FILTER_SCALE_EXT = 0x8014;
def GL_CONVOLUTION_FILTER_BIAS_EXT = 0x8015;
def GL_REDUCE_EXT = 0x8016;
def GL_CONVOLUTION_FORMAT_EXT = 0x8017;
def GL_CONVOLUTION_WIDTH_EXT = 0x8018;
def GL_CONVOLUTION_HEIGHT_EXT = 0x8019;
def GL_MAX_CONVOLUTION_WIDTH_EXT = 0x801A;
def GL_MAX_CONVOLUTION_HEIGHT_EXT = 0x801B;
def GL_POST_CONVOLUTION_RED_SCALE_EXT = 0x801C;
def GL_POST_CONVOLUTION_GREEN_SCALE_EXT = 0x801D;
def GL_POST_CONVOLUTION_BLUE_SCALE_EXT = 0x801E;
def GL_POST_CONVOLUTION_ALPHA_SCALE_EXT = 0x801F;
def GL_POST_CONVOLUTION_RED_BIAS_EXT = 0x8020;
def GL_POST_CONVOLUTION_GREEN_BIAS_EXT = 0x8021;
def GL_POST_CONVOLUTION_BLUE_BIAS_EXT = 0x8022;
def GL_POST_CONVOLUTION_ALPHA_BIAS_EXT = 0x8023;

def glConvolutionFilter1DEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; image u8 ref);
var global glConvolutionFilter1DEXT glConvolutionFilter1DEXT_signature;

def glConvolutionFilter2DEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; image u8 ref);
var global glConvolutionFilter2DEXT glConvolutionFilter2DEXT_signature;

def glConvolutionParameterfEXT_signature func(target GLenum; pname GLenum; params GLfloat);
var global glConvolutionParameterfEXT glConvolutionParameterfEXT_signature;

def glConvolutionParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glConvolutionParameterfvEXT glConvolutionParameterfvEXT_signature;

def glConvolutionParameteriEXT_signature func(target GLenum; pname GLenum; params GLint);
var global glConvolutionParameteriEXT glConvolutionParameteriEXT_signature;

def glConvolutionParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glConvolutionParameterivEXT glConvolutionParameterivEXT_signature;

def glCopyConvolutionFilter1DEXT_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var global glCopyConvolutionFilter1DEXT glCopyConvolutionFilter1DEXT_signature;

def glCopyConvolutionFilter2DEXT_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyConvolutionFilter2DEXT glCopyConvolutionFilter2DEXT_signature;

def glGetConvolutionFilterEXT_signature func(target GLenum; format GLenum; type GLenum; image u8 ref);
var global glGetConvolutionFilterEXT glGetConvolutionFilterEXT_signature;

def glGetConvolutionParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetConvolutionParameterfvEXT glGetConvolutionParameterfvEXT_signature;

def glGetConvolutionParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetConvolutionParameterivEXT glGetConvolutionParameterivEXT_signature;

def glGetSeparableFilterEXT_signature func(target GLenum; format GLenum; type GLenum; row u8 ref; column u8 ref; span u8 ref);
var global glGetSeparableFilterEXT glGetSeparableFilterEXT_signature;

def glSeparableFilter2DEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; row u8 ref; column u8 ref);
var global glSeparableFilter2DEXT glSeparableFilter2DEXT_signature;
def GL_EXT_coordinate_frame = 1;
def GL_TANGENT_ARRAY_EXT = 0x8439;
def GL_BINORMAL_ARRAY_EXT = 0x843A;
def GL_CURRENT_TANGENT_EXT = 0x843B;
def GL_CURRENT_BINORMAL_EXT = 0x843C;
def GL_TANGENT_ARRAY_TYPE_EXT = 0x843E;
def GL_TANGENT_ARRAY_STRIDE_EXT = 0x843F;
def GL_BINORMAL_ARRAY_TYPE_EXT = 0x8440;
def GL_BINORMAL_ARRAY_STRIDE_EXT = 0x8441;
def GL_TANGENT_ARRAY_POINTER_EXT = 0x8442;
def GL_BINORMAL_ARRAY_POINTER_EXT = 0x8443;
def GL_MAP1_TANGENT_EXT = 0x8444;
def GL_MAP2_TANGENT_EXT = 0x8445;
def GL_MAP1_BINORMAL_EXT = 0x8446;
def GL_MAP2_BINORMAL_EXT = 0x8447;

def glTangent3bEXT_signature func(tx GLbyte; ty GLbyte; tz GLbyte);
var global glTangent3bEXT glTangent3bEXT_signature;

def glTangent3bvEXT_signature func(v GLbyte ref);
var global glTangent3bvEXT glTangent3bvEXT_signature;

def glTangent3dEXT_signature func(tx GLdouble; ty GLdouble; tz GLdouble);
var global glTangent3dEXT glTangent3dEXT_signature;

def glTangent3dvEXT_signature func(v GLdouble ref);
var global glTangent3dvEXT glTangent3dvEXT_signature;

def glTangent3fEXT_signature func(tx GLfloat; ty GLfloat; tz GLfloat);
var global glTangent3fEXT glTangent3fEXT_signature;

def glTangent3fvEXT_signature func(v GLfloat ref);
var global glTangent3fvEXT glTangent3fvEXT_signature;

def glTangent3iEXT_signature func(tx GLint; ty GLint; tz GLint);
var global glTangent3iEXT glTangent3iEXT_signature;

def glTangent3ivEXT_signature func(v GLint ref);
var global glTangent3ivEXT glTangent3ivEXT_signature;

def glTangent3sEXT_signature func(tx GLshort; ty GLshort; tz GLshort);
var global glTangent3sEXT glTangent3sEXT_signature;

def glTangent3svEXT_signature func(v GLshort ref);
var global glTangent3svEXT glTangent3svEXT_signature;

def glBinormal3bEXT_signature func(bx GLbyte; by GLbyte; bz GLbyte);
var global glBinormal3bEXT glBinormal3bEXT_signature;

def glBinormal3bvEXT_signature func(v GLbyte ref);
var global glBinormal3bvEXT glBinormal3bvEXT_signature;

def glBinormal3dEXT_signature func(bx GLdouble; by GLdouble; bz GLdouble);
var global glBinormal3dEXT glBinormal3dEXT_signature;

def glBinormal3dvEXT_signature func(v GLdouble ref);
var global glBinormal3dvEXT glBinormal3dvEXT_signature;

def glBinormal3fEXT_signature func(bx GLfloat; by GLfloat; bz GLfloat);
var global glBinormal3fEXT glBinormal3fEXT_signature;

def glBinormal3fvEXT_signature func(v GLfloat ref);
var global glBinormal3fvEXT glBinormal3fvEXT_signature;

def glBinormal3iEXT_signature func(bx GLint; by GLint; bz GLint);
var global glBinormal3iEXT glBinormal3iEXT_signature;

def glBinormal3ivEXT_signature func(v GLint ref);
var global glBinormal3ivEXT glBinormal3ivEXT_signature;

def glBinormal3sEXT_signature func(bx GLshort; by GLshort; bz GLshort);
var global glBinormal3sEXT glBinormal3sEXT_signature;

def glBinormal3svEXT_signature func(v GLshort ref);
var global glBinormal3svEXT glBinormal3svEXT_signature;

def glTangentPointerEXT_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var global glTangentPointerEXT glTangentPointerEXT_signature;

def glBinormalPointerEXT_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var global glBinormalPointerEXT glBinormalPointerEXT_signature;
def GL_EXT_copy_texture = 1;

def glCopyTexImage1DEXT_signature func(target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; border GLint);
var global glCopyTexImage1DEXT glCopyTexImage1DEXT_signature;

def glCopyTexImage2DEXT_signature func(target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint);
var global glCopyTexImage2DEXT glCopyTexImage2DEXT_signature;

def glCopyTexSubImage1DEXT_signature func(target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var global glCopyTexSubImage1DEXT glCopyTexSubImage1DEXT_signature;

def glCopyTexSubImage2DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTexSubImage2DEXT glCopyTexSubImage2DEXT_signature;

def glCopyTexSubImage3DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTexSubImage3DEXT glCopyTexSubImage3DEXT_signature;
def GL_EXT_cull_vertex = 1;
def GL_CULL_VERTEX_EXT = 0x81AA;
def GL_CULL_VERTEX_EYE_POSITION_EXT = 0x81AB;
def GL_CULL_VERTEX_OBJECT_POSITION_EXT = 0x81AC;

def glCullParameterdvEXT_signature func(pname GLenum; params GLdouble ref);
var global glCullParameterdvEXT glCullParameterdvEXT_signature;

def glCullParameterfvEXT_signature func(pname GLenum; params GLfloat ref);
var global glCullParameterfvEXT glCullParameterfvEXT_signature;
def GL_EXT_debug_label = 1;
def GL_PROGRAM_PIPELINE_OBJECT_EXT = 0x8A4F;
def GL_PROGRAM_OBJECT_EXT = 0x8B40;
def GL_SHADER_OBJECT_EXT = 0x8B48;
def GL_BUFFER_OBJECT_EXT = 0x9151;
def GL_QUERY_OBJECT_EXT = 0x9153;
def GL_VERTEX_ARRAY_OBJECT_EXT = 0x9154;

def glLabelObjectEXT_signature func(type GLenum; object GLuint; length GLsizei; label GLchar ref);
var global glLabelObjectEXT glLabelObjectEXT_signature;

def glGetObjectLabelEXT_signature func(type GLenum; object GLuint; bufSize GLsizei; length GLsizei ref; label GLchar ref);
var global glGetObjectLabelEXT glGetObjectLabelEXT_signature;
def GL_EXT_debug_marker = 1;

def glInsertEventMarkerEXT_signature func(length GLsizei; marker GLchar ref);
var global glInsertEventMarkerEXT glInsertEventMarkerEXT_signature;

def glPushGroupMarkerEXT_signature func(length GLsizei; marker GLchar ref);
var global glPushGroupMarkerEXT glPushGroupMarkerEXT_signature;

def glPopGroupMarkerEXT_signature func();
var global glPopGroupMarkerEXT glPopGroupMarkerEXT_signature;
def GL_EXT_depth_bounds_test = 1;
def GL_DEPTH_BOUNDS_TEST_EXT = 0x8890;
def GL_DEPTH_BOUNDS_EXT = 0x8891;

def glDepthBoundsEXT_signature func(zmin GLclampd; zmax GLclampd);
var global glDepthBoundsEXT glDepthBoundsEXT_signature;
def GL_EXT_direct_state_access = 1;
def GL_PROGRAM_MATRIX_EXT = 0x8E2D;
def GL_TRANSPOSE_PROGRAM_MATRIX_EXT = 0x8E2E;
def GL_PROGRAM_MATRIX_STACK_DEPTH_EXT = 0x8E2F;

def glMatrixLoadfEXT_signature func(mode GLenum; m GLfloat ref);
var global glMatrixLoadfEXT glMatrixLoadfEXT_signature;

def glMatrixLoaddEXT_signature func(mode GLenum; m GLdouble ref);
var global glMatrixLoaddEXT glMatrixLoaddEXT_signature;

def glMatrixMultfEXT_signature func(mode GLenum; m GLfloat ref);
var global glMatrixMultfEXT glMatrixMultfEXT_signature;

def glMatrixMultdEXT_signature func(mode GLenum; m GLdouble ref);
var global glMatrixMultdEXT glMatrixMultdEXT_signature;

def glMatrixLoadIdentityEXT_signature func(mode GLenum);
var global glMatrixLoadIdentityEXT glMatrixLoadIdentityEXT_signature;

def glMatrixRotatefEXT_signature func(mode GLenum; angle GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glMatrixRotatefEXT glMatrixRotatefEXT_signature;

def glMatrixRotatedEXT_signature func(mode GLenum; angle GLdouble; x GLdouble; y GLdouble; z GLdouble);
var global glMatrixRotatedEXT glMatrixRotatedEXT_signature;

def glMatrixScalefEXT_signature func(mode GLenum; x GLfloat; y GLfloat; z GLfloat);
var global glMatrixScalefEXT glMatrixScalefEXT_signature;

def glMatrixScaledEXT_signature func(mode GLenum; x GLdouble; y GLdouble; z GLdouble);
var global glMatrixScaledEXT glMatrixScaledEXT_signature;

def glMatrixTranslatefEXT_signature func(mode GLenum; x GLfloat; y GLfloat; z GLfloat);
var global glMatrixTranslatefEXT glMatrixTranslatefEXT_signature;

def glMatrixTranslatedEXT_signature func(mode GLenum; x GLdouble; y GLdouble; z GLdouble);
var global glMatrixTranslatedEXT glMatrixTranslatedEXT_signature;

def glMatrixFrustumEXT_signature func(mode GLenum; left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble);
var global glMatrixFrustumEXT glMatrixFrustumEXT_signature;

def glMatrixOrthoEXT_signature func(mode GLenum; left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble);
var global glMatrixOrthoEXT glMatrixOrthoEXT_signature;

def glMatrixPopEXT_signature func(mode GLenum);
var global glMatrixPopEXT glMatrixPopEXT_signature;

def glMatrixPushEXT_signature func(mode GLenum);
var global glMatrixPushEXT glMatrixPushEXT_signature;

def glClientAttribDefaultEXT_signature func(mask GLbitfield);
var global glClientAttribDefaultEXT glClientAttribDefaultEXT_signature;

def glPushClientAttribDefaultEXT_signature func(mask GLbitfield);
var global glPushClientAttribDefaultEXT glPushClientAttribDefaultEXT_signature;

def glTextureParameterfEXT_signature func(texture GLuint; target GLenum; pname GLenum; param GLfloat);
var global glTextureParameterfEXT glTextureParameterfEXT_signature;

def glTextureParameterfvEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLfloat ref);
var global glTextureParameterfvEXT glTextureParameterfvEXT_signature;

def glTextureParameteriEXT_signature func(texture GLuint; target GLenum; pname GLenum; param GLint);
var global glTextureParameteriEXT glTextureParameteriEXT_signature;

def glTextureParameterivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var global glTextureParameterivEXT glTextureParameterivEXT_signature;

def glTextureImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLint; width GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glTextureImage1DEXT glTextureImage1DEXT_signature;

def glTextureImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glTextureImage2DEXT glTextureImage2DEXT_signature;

def glTextureSubImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTextureSubImage1DEXT glTextureSubImage1DEXT_signature;

def glTextureSubImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTextureSubImage2DEXT glTextureSubImage2DEXT_signature;

def glCopyTextureImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; border GLint);
var global glCopyTextureImage1DEXT glCopyTextureImage1DEXT_signature;

def glCopyTextureImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint);
var global glCopyTextureImage2DEXT glCopyTextureImage2DEXT_signature;

def glCopyTextureSubImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var global glCopyTextureSubImage1DEXT glCopyTextureSubImage1DEXT_signature;

def glCopyTextureSubImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTextureSubImage2DEXT glCopyTextureSubImage2DEXT_signature;

def glGetTextureImageEXT_signature func(texture GLuint; target GLenum; level GLint; format GLenum; type GLenum; pixels u8 ref);
var global glGetTextureImageEXT glGetTextureImageEXT_signature;

def glGetTextureParameterfvEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLfloat ref);
var global glGetTextureParameterfvEXT glGetTextureParameterfvEXT_signature;

def glGetTextureParameterivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var global glGetTextureParameterivEXT glGetTextureParameterivEXT_signature;

def glGetTextureLevelParameterfvEXT_signature func(texture GLuint; target GLenum; level GLint; pname GLenum; params GLfloat ref);
var global glGetTextureLevelParameterfvEXT glGetTextureLevelParameterfvEXT_signature;

def glGetTextureLevelParameterivEXT_signature func(texture GLuint; target GLenum; level GLint; pname GLenum; params GLint ref);
var global glGetTextureLevelParameterivEXT glGetTextureLevelParameterivEXT_signature;

def glTextureImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glTextureImage3DEXT glTextureImage3DEXT_signature;

def glTextureSubImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTextureSubImage3DEXT glTextureSubImage3DEXT_signature;

def glCopyTextureSubImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyTextureSubImage3DEXT glCopyTextureSubImage3DEXT_signature;

def glBindMultiTextureEXT_signature func(texunit GLenum; target GLenum; texture GLuint);
var global glBindMultiTextureEXT glBindMultiTextureEXT_signature;

def glMultiTexCoordPointerEXT_signature func(texunit GLenum; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glMultiTexCoordPointerEXT glMultiTexCoordPointerEXT_signature;

def glMultiTexEnvfEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLfloat);
var global glMultiTexEnvfEXT glMultiTexEnvfEXT_signature;

def glMultiTexEnvfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var global glMultiTexEnvfvEXT glMultiTexEnvfvEXT_signature;

def glMultiTexEnviEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLint);
var global glMultiTexEnviEXT glMultiTexEnviEXT_signature;

def glMultiTexEnvivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var global glMultiTexEnvivEXT glMultiTexEnvivEXT_signature;

def glMultiTexGendEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; param GLdouble);
var global glMultiTexGendEXT glMultiTexGendEXT_signature;

def glMultiTexGendvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLdouble ref);
var global glMultiTexGendvEXT glMultiTexGendvEXT_signature;

def glMultiTexGenfEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; param GLfloat);
var global glMultiTexGenfEXT glMultiTexGenfEXT_signature;

def glMultiTexGenfvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLfloat ref);
var global glMultiTexGenfvEXT glMultiTexGenfvEXT_signature;

def glMultiTexGeniEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; param GLint);
var global glMultiTexGeniEXT glMultiTexGeniEXT_signature;

def glMultiTexGenivEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLint ref);
var global glMultiTexGenivEXT glMultiTexGenivEXT_signature;

def glGetMultiTexEnvfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var global glGetMultiTexEnvfvEXT glGetMultiTexEnvfvEXT_signature;

def glGetMultiTexEnvivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var global glGetMultiTexEnvivEXT glGetMultiTexEnvivEXT_signature;

def glGetMultiTexGendvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLdouble ref);
var global glGetMultiTexGendvEXT glGetMultiTexGendvEXT_signature;

def glGetMultiTexGenfvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLfloat ref);
var global glGetMultiTexGenfvEXT glGetMultiTexGenfvEXT_signature;

def glGetMultiTexGenivEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLint ref);
var global glGetMultiTexGenivEXT glGetMultiTexGenivEXT_signature;

def glMultiTexParameteriEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLint);
var global glMultiTexParameteriEXT glMultiTexParameteriEXT_signature;

def glMultiTexParameterivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var global glMultiTexParameterivEXT glMultiTexParameterivEXT_signature;

def glMultiTexParameterfEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLfloat);
var global glMultiTexParameterfEXT glMultiTexParameterfEXT_signature;

def glMultiTexParameterfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var global glMultiTexParameterfvEXT glMultiTexParameterfvEXT_signature;

def glMultiTexImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLint; width GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glMultiTexImage1DEXT glMultiTexImage1DEXT_signature;

def glMultiTexImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glMultiTexImage2DEXT glMultiTexImage2DEXT_signature;

def glMultiTexSubImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glMultiTexSubImage1DEXT glMultiTexSubImage1DEXT_signature;

def glMultiTexSubImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glMultiTexSubImage2DEXT glMultiTexSubImage2DEXT_signature;

def glCopyMultiTexImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; border GLint);
var global glCopyMultiTexImage1DEXT glCopyMultiTexImage1DEXT_signature;

def glCopyMultiTexImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint);
var global glCopyMultiTexImage2DEXT glCopyMultiTexImage2DEXT_signature;

def glCopyMultiTexSubImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var global glCopyMultiTexSubImage1DEXT glCopyMultiTexSubImage1DEXT_signature;

def glCopyMultiTexSubImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyMultiTexSubImage2DEXT glCopyMultiTexSubImage2DEXT_signature;

def glGetMultiTexImageEXT_signature func(texunit GLenum; target GLenum; level GLint; format GLenum; type GLenum; pixels u8 ref);
var global glGetMultiTexImageEXT glGetMultiTexImageEXT_signature;

def glGetMultiTexParameterfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var global glGetMultiTexParameterfvEXT glGetMultiTexParameterfvEXT_signature;

def glGetMultiTexParameterivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var global glGetMultiTexParameterivEXT glGetMultiTexParameterivEXT_signature;

def glGetMultiTexLevelParameterfvEXT_signature func(texunit GLenum; target GLenum; level GLint; pname GLenum; params GLfloat ref);
var global glGetMultiTexLevelParameterfvEXT glGetMultiTexLevelParameterfvEXT_signature;

def glGetMultiTexLevelParameterivEXT_signature func(texunit GLenum; target GLenum; level GLint; pname GLenum; params GLint ref);
var global glGetMultiTexLevelParameterivEXT glGetMultiTexLevelParameterivEXT_signature;

def glMultiTexImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glMultiTexImage3DEXT glMultiTexImage3DEXT_signature;

def glMultiTexSubImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glMultiTexSubImage3DEXT glMultiTexSubImage3DEXT_signature;

def glCopyMultiTexSubImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var global glCopyMultiTexSubImage3DEXT glCopyMultiTexSubImage3DEXT_signature;

def glEnableClientStateIndexedEXT_signature func(array GLenum; index GLuint);
var global glEnableClientStateIndexedEXT glEnableClientStateIndexedEXT_signature;

def glDisableClientStateIndexedEXT_signature func(array GLenum; index GLuint);
var global glDisableClientStateIndexedEXT glDisableClientStateIndexedEXT_signature;

def glGetFloatIndexedvEXT_signature func(target GLenum; index GLuint; data GLfloat ref);
var global glGetFloatIndexedvEXT glGetFloatIndexedvEXT_signature;

def glGetDoubleIndexedvEXT_signature func(target GLenum; index GLuint; data GLdouble ref);
var global glGetDoubleIndexedvEXT glGetDoubleIndexedvEXT_signature;

def glGetPointerIndexedvEXT_signature func(target GLenum; index GLuint; data u8 ref ref);
var global glGetPointerIndexedvEXT glGetPointerIndexedvEXT_signature;

def glEnableIndexedEXT_signature func(target GLenum; index GLuint);
var global glEnableIndexedEXT glEnableIndexedEXT_signature;

def glDisableIndexedEXT_signature func(target GLenum; index GLuint);
var global glDisableIndexedEXT glDisableIndexedEXT_signature;

def glIsEnabledIndexedEXT_signature func(target GLenum; index GLuint) (result GLboolean);
var global glIsEnabledIndexedEXT glIsEnabledIndexedEXT_signature;

def glGetIntegerIndexedvEXT_signature func(target GLenum; index GLuint; data GLint ref);
var global glGetIntegerIndexedvEXT glGetIntegerIndexedvEXT_signature;

def glGetBooleanIndexedvEXT_signature func(target GLenum; index GLuint; data GLboolean ref);
var global glGetBooleanIndexedvEXT glGetBooleanIndexedvEXT_signature;

def glCompressedTextureImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var global glCompressedTextureImage3DEXT glCompressedTextureImage3DEXT_signature;

def glCompressedTextureImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var global glCompressedTextureImage2DEXT glCompressedTextureImage2DEXT_signature;

def glCompressedTextureImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var global glCompressedTextureImage1DEXT glCompressedTextureImage1DEXT_signature;

def glCompressedTextureSubImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var global glCompressedTextureSubImage3DEXT glCompressedTextureSubImage3DEXT_signature;

def glCompressedTextureSubImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var global glCompressedTextureSubImage2DEXT glCompressedTextureSubImage2DEXT_signature;

def glCompressedTextureSubImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var global glCompressedTextureSubImage1DEXT glCompressedTextureSubImage1DEXT_signature;

def glGetCompressedTextureImageEXT_signature func(texture GLuint; target GLenum; lod GLint; img u8 ref);
var global glGetCompressedTextureImageEXT glGetCompressedTextureImageEXT_signature;

def glCompressedMultiTexImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var global glCompressedMultiTexImage3DEXT glCompressedMultiTexImage3DEXT_signature;

def glCompressedMultiTexImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var global glCompressedMultiTexImage2DEXT glCompressedMultiTexImage2DEXT_signature;

def glCompressedMultiTexImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var global glCompressedMultiTexImage1DEXT glCompressedMultiTexImage1DEXT_signature;

def glCompressedMultiTexSubImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var global glCompressedMultiTexSubImage3DEXT glCompressedMultiTexSubImage3DEXT_signature;

def glCompressedMultiTexSubImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var global glCompressedMultiTexSubImage2DEXT glCompressedMultiTexSubImage2DEXT_signature;

def glCompressedMultiTexSubImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var global glCompressedMultiTexSubImage1DEXT glCompressedMultiTexSubImage1DEXT_signature;

def glGetCompressedMultiTexImageEXT_signature func(texunit GLenum; target GLenum; lod GLint; img u8 ref);
var global glGetCompressedMultiTexImageEXT glGetCompressedMultiTexImageEXT_signature;

def glMatrixLoadTransposefEXT_signature func(mode GLenum; m GLfloat ref);
var global glMatrixLoadTransposefEXT glMatrixLoadTransposefEXT_signature;

def glMatrixLoadTransposedEXT_signature func(mode GLenum; m GLdouble ref);
var global glMatrixLoadTransposedEXT glMatrixLoadTransposedEXT_signature;

def glMatrixMultTransposefEXT_signature func(mode GLenum; m GLfloat ref);
var global glMatrixMultTransposefEXT glMatrixMultTransposefEXT_signature;

def glMatrixMultTransposedEXT_signature func(mode GLenum; m GLdouble ref);
var global glMatrixMultTransposedEXT glMatrixMultTransposedEXT_signature;

def glNamedBufferDataEXT_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; usage GLenum);
var global glNamedBufferDataEXT glNamedBufferDataEXT_signature;

def glNamedBufferSubDataEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glNamedBufferSubDataEXT glNamedBufferSubDataEXT_signature;

def glMapNamedBufferEXT_signature func(buffer GLuint; access GLenum) (result u8 ref);
var global glMapNamedBufferEXT glMapNamedBufferEXT_signature;

def glUnmapNamedBufferEXT_signature func(buffer GLuint) (result GLboolean);
var global glUnmapNamedBufferEXT glUnmapNamedBufferEXT_signature;

def glGetNamedBufferParameterivEXT_signature func(buffer GLuint; pname GLenum; params GLint ref);
var global glGetNamedBufferParameterivEXT glGetNamedBufferParameterivEXT_signature;

def glGetNamedBufferPointervEXT_signature func(buffer GLuint; pname GLenum; params u8 ref ref);
var global glGetNamedBufferPointervEXT glGetNamedBufferPointervEXT_signature;

def glGetNamedBufferSubDataEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glGetNamedBufferSubDataEXT glGetNamedBufferSubDataEXT_signature;

def glProgramUniform1fEXT_signature func(program GLuint; location GLint; v0 GLfloat);
var global glProgramUniform1fEXT glProgramUniform1fEXT_signature;

def glProgramUniform2fEXT_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat);
var global glProgramUniform2fEXT glProgramUniform2fEXT_signature;

def glProgramUniform3fEXT_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var global glProgramUniform3fEXT glProgramUniform3fEXT_signature;

def glProgramUniform4fEXT_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var global glProgramUniform4fEXT glProgramUniform4fEXT_signature;

def glProgramUniform1iEXT_signature func(program GLuint; location GLint; v0 GLint);
var global glProgramUniform1iEXT glProgramUniform1iEXT_signature;

def glProgramUniform2iEXT_signature func(program GLuint; location GLint; v0 GLint; v1 GLint);
var global glProgramUniform2iEXT glProgramUniform2iEXT_signature;

def glProgramUniform3iEXT_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint);
var global glProgramUniform3iEXT glProgramUniform3iEXT_signature;

def glProgramUniform4iEXT_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var global glProgramUniform4iEXT glProgramUniform4iEXT_signature;

def glProgramUniform1fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform1fvEXT glProgramUniform1fvEXT_signature;

def glProgramUniform2fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform2fvEXT glProgramUniform2fvEXT_signature;

def glProgramUniform3fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform3fvEXT glProgramUniform3fvEXT_signature;

def glProgramUniform4fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var global glProgramUniform4fvEXT glProgramUniform4fvEXT_signature;

def glProgramUniform1ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform1ivEXT glProgramUniform1ivEXT_signature;

def glProgramUniform2ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform2ivEXT glProgramUniform2ivEXT_signature;

def glProgramUniform3ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform3ivEXT glProgramUniform3ivEXT_signature;

def glProgramUniform4ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var global glProgramUniform4ivEXT glProgramUniform4ivEXT_signature;

def glProgramUniformMatrix2fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix2fvEXT glProgramUniformMatrix2fvEXT_signature;

def glProgramUniformMatrix3fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix3fvEXT glProgramUniformMatrix3fvEXT_signature;

def glProgramUniformMatrix4fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix4fvEXT glProgramUniformMatrix4fvEXT_signature;

def glProgramUniformMatrix2x3fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix2x3fvEXT glProgramUniformMatrix2x3fvEXT_signature;

def glProgramUniformMatrix3x2fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix3x2fvEXT glProgramUniformMatrix3x2fvEXT_signature;

def glProgramUniformMatrix2x4fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix2x4fvEXT glProgramUniformMatrix2x4fvEXT_signature;

def glProgramUniformMatrix4x2fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix4x2fvEXT glProgramUniformMatrix4x2fvEXT_signature;

def glProgramUniformMatrix3x4fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix3x4fvEXT glProgramUniformMatrix3x4fvEXT_signature;

def glProgramUniformMatrix4x3fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var global glProgramUniformMatrix4x3fvEXT glProgramUniformMatrix4x3fvEXT_signature;

def glTextureBufferEXT_signature func(texture GLuint; target GLenum; internalformat GLenum; buffer GLuint);
var global glTextureBufferEXT glTextureBufferEXT_signature;

def glMultiTexBufferEXT_signature func(texunit GLenum; target GLenum; internalformat GLenum; buffer GLuint);
var global glMultiTexBufferEXT glMultiTexBufferEXT_signature;

def glTextureParameterIivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var global glTextureParameterIivEXT glTextureParameterIivEXT_signature;

def glTextureParameterIuivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLuint ref);
var global glTextureParameterIuivEXT glTextureParameterIuivEXT_signature;

def glGetTextureParameterIivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var global glGetTextureParameterIivEXT glGetTextureParameterIivEXT_signature;

def glGetTextureParameterIuivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLuint ref);
var global glGetTextureParameterIuivEXT glGetTextureParameterIuivEXT_signature;

def glMultiTexParameterIivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var global glMultiTexParameterIivEXT glMultiTexParameterIivEXT_signature;

def glMultiTexParameterIuivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLuint ref);
var global glMultiTexParameterIuivEXT glMultiTexParameterIuivEXT_signature;

def glGetMultiTexParameterIivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var global glGetMultiTexParameterIivEXT glGetMultiTexParameterIivEXT_signature;

def glGetMultiTexParameterIuivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLuint ref);
var global glGetMultiTexParameterIuivEXT glGetMultiTexParameterIuivEXT_signature;

def glProgramUniform1uiEXT_signature func(program GLuint; location GLint; v0 GLuint);
var global glProgramUniform1uiEXT glProgramUniform1uiEXT_signature;

def glProgramUniform2uiEXT_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint);
var global glProgramUniform2uiEXT glProgramUniform2uiEXT_signature;

def glProgramUniform3uiEXT_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var global glProgramUniform3uiEXT glProgramUniform3uiEXT_signature;

def glProgramUniform4uiEXT_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var global glProgramUniform4uiEXT glProgramUniform4uiEXT_signature;

def glProgramUniform1uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform1uivEXT glProgramUniform1uivEXT_signature;

def glProgramUniform2uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform2uivEXT glProgramUniform2uivEXT_signature;

def glProgramUniform3uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform3uivEXT glProgramUniform3uivEXT_signature;

def glProgramUniform4uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var global glProgramUniform4uivEXT glProgramUniform4uivEXT_signature;

def glNamedProgramLocalParameters4fvEXT_signature func(program GLuint; target GLenum; index GLuint; count GLsizei; params GLfloat ref);
var global glNamedProgramLocalParameters4fvEXT glNamedProgramLocalParameters4fvEXT_signature;

def glNamedProgramLocalParameterI4iEXT_signature func(program GLuint; target GLenum; index GLuint; x GLint; y GLint; z GLint; w GLint);
var global glNamedProgramLocalParameterI4iEXT glNamedProgramLocalParameterI4iEXT_signature;

def glNamedProgramLocalParameterI4ivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLint ref);
var global glNamedProgramLocalParameterI4ivEXT glNamedProgramLocalParameterI4ivEXT_signature;

def glNamedProgramLocalParametersI4ivEXT_signature func(program GLuint; target GLenum; index GLuint; count GLsizei; params GLint ref);
var global glNamedProgramLocalParametersI4ivEXT glNamedProgramLocalParametersI4ivEXT_signature;

def glNamedProgramLocalParameterI4uiEXT_signature func(program GLuint; target GLenum; index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var global glNamedProgramLocalParameterI4uiEXT glNamedProgramLocalParameterI4uiEXT_signature;

def glNamedProgramLocalParameterI4uivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLuint ref);
var global glNamedProgramLocalParameterI4uivEXT glNamedProgramLocalParameterI4uivEXT_signature;

def glNamedProgramLocalParametersI4uivEXT_signature func(program GLuint; target GLenum; index GLuint; count GLsizei; params GLuint ref);
var global glNamedProgramLocalParametersI4uivEXT glNamedProgramLocalParametersI4uivEXT_signature;

def glGetNamedProgramLocalParameterIivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLint ref);
var global glGetNamedProgramLocalParameterIivEXT glGetNamedProgramLocalParameterIivEXT_signature;

def glGetNamedProgramLocalParameterIuivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLuint ref);
var global glGetNamedProgramLocalParameterIuivEXT glGetNamedProgramLocalParameterIuivEXT_signature;

def glEnableClientStateiEXT_signature func(array GLenum; index GLuint);
var global glEnableClientStateiEXT glEnableClientStateiEXT_signature;

def glDisableClientStateiEXT_signature func(array GLenum; index GLuint);
var global glDisableClientStateiEXT glDisableClientStateiEXT_signature;

def glGetFloati_vEXT_signature func(pname GLenum; index GLuint; params GLfloat ref);
var global glGetFloati_vEXT glGetFloati_vEXT_signature;

def glGetDoublei_vEXT_signature func(pname GLenum; index GLuint; params GLdouble ref);
var global glGetDoublei_vEXT glGetDoublei_vEXT_signature;

def glGetPointeri_vEXT_signature func(pname GLenum; index GLuint; params u8 ref ref);
var global glGetPointeri_vEXT glGetPointeri_vEXT_signature;

def glNamedProgramStringEXT_signature func(program GLuint; target GLenum; format GLenum; len GLsizei; string u8 ref);
var global glNamedProgramStringEXT glNamedProgramStringEXT_signature;

def glNamedProgramLocalParameter4dEXT_signature func(program GLuint; target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glNamedProgramLocalParameter4dEXT glNamedProgramLocalParameter4dEXT_signature;

def glNamedProgramLocalParameter4dvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLdouble ref);
var global glNamedProgramLocalParameter4dvEXT glNamedProgramLocalParameter4dvEXT_signature;

def glNamedProgramLocalParameter4fEXT_signature func(program GLuint; target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glNamedProgramLocalParameter4fEXT glNamedProgramLocalParameter4fEXT_signature;

def glNamedProgramLocalParameter4fvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLfloat ref);
var global glNamedProgramLocalParameter4fvEXT glNamedProgramLocalParameter4fvEXT_signature;

def glGetNamedProgramLocalParameterdvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLdouble ref);
var global glGetNamedProgramLocalParameterdvEXT glGetNamedProgramLocalParameterdvEXT_signature;

def glGetNamedProgramLocalParameterfvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLfloat ref);
var global glGetNamedProgramLocalParameterfvEXT glGetNamedProgramLocalParameterfvEXT_signature;

def glGetNamedProgramivEXT_signature func(program GLuint; target GLenum; pname GLenum; params GLint ref);
var global glGetNamedProgramivEXT glGetNamedProgramivEXT_signature;

def glGetNamedProgramStringEXT_signature func(program GLuint; target GLenum; pname GLenum; string u8 ref);
var global glGetNamedProgramStringEXT glGetNamedProgramStringEXT_signature;

def glNamedRenderbufferStorageEXT_signature func(renderbuffer GLuint; internalformat GLenum; width GLsizei; height GLsizei);
var global glNamedRenderbufferStorageEXT glNamedRenderbufferStorageEXT_signature;

def glGetNamedRenderbufferParameterivEXT_signature func(renderbuffer GLuint; pname GLenum; params GLint ref);
var global glGetNamedRenderbufferParameterivEXT glGetNamedRenderbufferParameterivEXT_signature;

def glNamedRenderbufferStorageMultisampleEXT_signature func(renderbuffer GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glNamedRenderbufferStorageMultisampleEXT glNamedRenderbufferStorageMultisampleEXT_signature;

def glNamedRenderbufferStorageMultisampleCoverageEXT_signature func(renderbuffer GLuint; coverageSamples GLsizei; colorSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glNamedRenderbufferStorageMultisampleCoverageEXT glNamedRenderbufferStorageMultisampleCoverageEXT_signature;

def glCheckNamedFramebufferStatusEXT_signature func(framebuffer GLuint; target GLenum) (result GLenum);
var global glCheckNamedFramebufferStatusEXT glCheckNamedFramebufferStatusEXT_signature;

def glNamedFramebufferTexture1DEXT_signature func(framebuffer GLuint; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var global glNamedFramebufferTexture1DEXT glNamedFramebufferTexture1DEXT_signature;

def glNamedFramebufferTexture2DEXT_signature func(framebuffer GLuint; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var global glNamedFramebufferTexture2DEXT glNamedFramebufferTexture2DEXT_signature;

def glNamedFramebufferTexture3DEXT_signature func(framebuffer GLuint; attachment GLenum; textarget GLenum; texture GLuint; level GLint; zoffset GLint);
var global glNamedFramebufferTexture3DEXT glNamedFramebufferTexture3DEXT_signature;

def glNamedFramebufferRenderbufferEXT_signature func(framebuffer GLuint; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var global glNamedFramebufferRenderbufferEXT glNamedFramebufferRenderbufferEXT_signature;

def glGetNamedFramebufferAttachmentParameterivEXT_signature func(framebuffer GLuint; attachment GLenum; pname GLenum; params GLint ref);
var global glGetNamedFramebufferAttachmentParameterivEXT glGetNamedFramebufferAttachmentParameterivEXT_signature;

def glGenerateTextureMipmapEXT_signature func(texture GLuint; target GLenum);
var global glGenerateTextureMipmapEXT glGenerateTextureMipmapEXT_signature;

def glGenerateMultiTexMipmapEXT_signature func(texunit GLenum; target GLenum);
var global glGenerateMultiTexMipmapEXT glGenerateMultiTexMipmapEXT_signature;

def glFramebufferDrawBufferEXT_signature func(framebuffer GLuint; mode GLenum);
var global glFramebufferDrawBufferEXT glFramebufferDrawBufferEXT_signature;

def glFramebufferDrawBuffersEXT_signature func(framebuffer GLuint; n GLsizei; bufs GLenum ref);
var global glFramebufferDrawBuffersEXT glFramebufferDrawBuffersEXT_signature;

def glFramebufferReadBufferEXT_signature func(framebuffer GLuint; mode GLenum);
var global glFramebufferReadBufferEXT glFramebufferReadBufferEXT_signature;

def glGetFramebufferParameterivEXT_signature func(framebuffer GLuint; pname GLenum; params GLint ref);
var global glGetFramebufferParameterivEXT glGetFramebufferParameterivEXT_signature;

def glNamedCopyBufferSubDataEXT_signature func(readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var global glNamedCopyBufferSubDataEXT glNamedCopyBufferSubDataEXT_signature;

def glNamedFramebufferTextureEXT_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint);
var global glNamedFramebufferTextureEXT glNamedFramebufferTextureEXT_signature;

def glNamedFramebufferTextureLayerEXT_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint; layer GLint);
var global glNamedFramebufferTextureLayerEXT glNamedFramebufferTextureLayerEXT_signature;

def glNamedFramebufferTextureFaceEXT_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint; face GLenum);
var global glNamedFramebufferTextureFaceEXT glNamedFramebufferTextureFaceEXT_signature;

def glTextureRenderbufferEXT_signature func(texture GLuint; target GLenum; renderbuffer GLuint);
var global glTextureRenderbufferEXT glTextureRenderbufferEXT_signature;

def glMultiTexRenderbufferEXT_signature func(texunit GLenum; target GLenum; renderbuffer GLuint);
var global glMultiTexRenderbufferEXT glMultiTexRenderbufferEXT_signature;

def glVertexArrayVertexOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayVertexOffsetEXT glVertexArrayVertexOffsetEXT_signature;

def glVertexArrayColorOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayColorOffsetEXT glVertexArrayColorOffsetEXT_signature;

def glVertexArrayEdgeFlagOffsetEXT_signature func(vaobj GLuint; buffer GLuint; stride GLsizei; offset GLintptr);
var global glVertexArrayEdgeFlagOffsetEXT glVertexArrayEdgeFlagOffsetEXT_signature;

def glVertexArrayIndexOffsetEXT_signature func(vaobj GLuint; buffer GLuint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayIndexOffsetEXT glVertexArrayIndexOffsetEXT_signature;

def glVertexArrayNormalOffsetEXT_signature func(vaobj GLuint; buffer GLuint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayNormalOffsetEXT glVertexArrayNormalOffsetEXT_signature;

def glVertexArrayTexCoordOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayTexCoordOffsetEXT glVertexArrayTexCoordOffsetEXT_signature;

def glVertexArrayMultiTexCoordOffsetEXT_signature func(vaobj GLuint; buffer GLuint; texunit GLenum; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayMultiTexCoordOffsetEXT glVertexArrayMultiTexCoordOffsetEXT_signature;

def glVertexArrayFogCoordOffsetEXT_signature func(vaobj GLuint; buffer GLuint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayFogCoordOffsetEXT glVertexArrayFogCoordOffsetEXT_signature;

def glVertexArraySecondaryColorOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArraySecondaryColorOffsetEXT glVertexArraySecondaryColorOffsetEXT_signature;

def glVertexArrayVertexAttribOffsetEXT_signature func(vaobj GLuint; buffer GLuint; index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; offset GLintptr);
var global glVertexArrayVertexAttribOffsetEXT glVertexArrayVertexAttribOffsetEXT_signature;

def glVertexArrayVertexAttribIOffsetEXT_signature func(vaobj GLuint; buffer GLuint; index GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayVertexAttribIOffsetEXT glVertexArrayVertexAttribIOffsetEXT_signature;

def glEnableVertexArrayEXT_signature func(vaobj GLuint; array GLenum);
var global glEnableVertexArrayEXT glEnableVertexArrayEXT_signature;

def glDisableVertexArrayEXT_signature func(vaobj GLuint; array GLenum);
var global glDisableVertexArrayEXT glDisableVertexArrayEXT_signature;

def glEnableVertexArrayAttribEXT_signature func(vaobj GLuint; index GLuint);
var global glEnableVertexArrayAttribEXT glEnableVertexArrayAttribEXT_signature;

def glDisableVertexArrayAttribEXT_signature func(vaobj GLuint; index GLuint);
var global glDisableVertexArrayAttribEXT glDisableVertexArrayAttribEXT_signature;

def glGetVertexArrayIntegervEXT_signature func(vaobj GLuint; pname GLenum; param GLint ref);
var global glGetVertexArrayIntegervEXT glGetVertexArrayIntegervEXT_signature;

def glGetVertexArrayPointervEXT_signature func(vaobj GLuint; pname GLenum; param u8 ref ref);
var global glGetVertexArrayPointervEXT glGetVertexArrayPointervEXT_signature;

def glGetVertexArrayIntegeri_vEXT_signature func(vaobj GLuint; index GLuint; pname GLenum; param GLint ref);
var global glGetVertexArrayIntegeri_vEXT glGetVertexArrayIntegeri_vEXT_signature;

def glGetVertexArrayPointeri_vEXT_signature func(vaobj GLuint; index GLuint; pname GLenum; param u8 ref ref);
var global glGetVertexArrayPointeri_vEXT glGetVertexArrayPointeri_vEXT_signature;

def glMapNamedBufferRangeEXT_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr; access GLbitfield) (result u8 ref);
var global glMapNamedBufferRangeEXT glMapNamedBufferRangeEXT_signature;

def glFlushMappedNamedBufferRangeEXT_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr);
var global glFlushMappedNamedBufferRangeEXT glFlushMappedNamedBufferRangeEXT_signature;

def glNamedBufferStorageEXT_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; flags GLbitfield);
var global glNamedBufferStorageEXT glNamedBufferStorageEXT_signature;

def glClearNamedBufferDataEXT_signature func(buffer GLuint; internalformat GLenum; format GLenum; type GLenum; data u8 ref);
var global glClearNamedBufferDataEXT glClearNamedBufferDataEXT_signature;

def glClearNamedBufferSubDataEXT_signature func(buffer GLuint; internalformat GLenum; offset GLsizeiptr; size GLsizeiptr; format GLenum; type GLenum; data u8 ref);
var global glClearNamedBufferSubDataEXT glClearNamedBufferSubDataEXT_signature;

def glNamedFramebufferParameteriEXT_signature func(framebuffer GLuint; pname GLenum; param GLint);
var global glNamedFramebufferParameteriEXT glNamedFramebufferParameteriEXT_signature;

def glGetNamedFramebufferParameterivEXT_signature func(framebuffer GLuint; pname GLenum; params GLint ref);
var global glGetNamedFramebufferParameterivEXT glGetNamedFramebufferParameterivEXT_signature;

def glProgramUniform1dEXT_signature func(program GLuint; location GLint; x GLdouble);
var global glProgramUniform1dEXT glProgramUniform1dEXT_signature;

def glProgramUniform2dEXT_signature func(program GLuint; location GLint; x GLdouble; y GLdouble);
var global glProgramUniform2dEXT glProgramUniform2dEXT_signature;

def glProgramUniform3dEXT_signature func(program GLuint; location GLint; x GLdouble; y GLdouble; z GLdouble);
var global glProgramUniform3dEXT glProgramUniform3dEXT_signature;

def glProgramUniform4dEXT_signature func(program GLuint; location GLint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glProgramUniform4dEXT glProgramUniform4dEXT_signature;

def glProgramUniform1dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform1dvEXT glProgramUniform1dvEXT_signature;

def glProgramUniform2dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform2dvEXT glProgramUniform2dvEXT_signature;

def glProgramUniform3dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform3dvEXT glProgramUniform3dvEXT_signature;

def glProgramUniform4dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var global glProgramUniform4dvEXT glProgramUniform4dvEXT_signature;

def glProgramUniformMatrix2dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix2dvEXT glProgramUniformMatrix2dvEXT_signature;

def glProgramUniformMatrix3dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix3dvEXT glProgramUniformMatrix3dvEXT_signature;

def glProgramUniformMatrix4dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix4dvEXT glProgramUniformMatrix4dvEXT_signature;

def glProgramUniformMatrix2x3dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix2x3dvEXT glProgramUniformMatrix2x3dvEXT_signature;

def glProgramUniformMatrix2x4dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix2x4dvEXT glProgramUniformMatrix2x4dvEXT_signature;

def glProgramUniformMatrix3x2dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix3x2dvEXT glProgramUniformMatrix3x2dvEXT_signature;

def glProgramUniformMatrix3x4dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix3x4dvEXT glProgramUniformMatrix3x4dvEXT_signature;

def glProgramUniformMatrix4x2dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix4x2dvEXT glProgramUniformMatrix4x2dvEXT_signature;

def glProgramUniformMatrix4x3dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var global glProgramUniformMatrix4x3dvEXT glProgramUniformMatrix4x3dvEXT_signature;

def glTextureBufferRangeEXT_signature func(texture GLuint; target GLenum; internalformat GLenum; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glTextureBufferRangeEXT glTextureBufferRangeEXT_signature;

def glTextureStorage1DEXT_signature func(texture GLuint; target GLenum; levels GLsizei; internalformat GLenum; width GLsizei);
var global glTextureStorage1DEXT glTextureStorage1DEXT_signature;

def glTextureStorage2DEXT_signature func(texture GLuint; target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glTextureStorage2DEXT glTextureStorage2DEXT_signature;

def glTextureStorage3DEXT_signature func(texture GLuint; target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var global glTextureStorage3DEXT glTextureStorage3DEXT_signature;

def glTextureStorage2DMultisampleEXT_signature func(texture GLuint; target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var global glTextureStorage2DMultisampleEXT glTextureStorage2DMultisampleEXT_signature;

def glTextureStorage3DMultisampleEXT_signature func(texture GLuint; target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var global glTextureStorage3DMultisampleEXT glTextureStorage3DMultisampleEXT_signature;

def glVertexArrayBindVertexBufferEXT_signature func(vaobj GLuint; bindingindex GLuint; buffer GLuint; offset GLintptr; stride GLsizei);
var global glVertexArrayBindVertexBufferEXT glVertexArrayBindVertexBufferEXT_signature;

def glVertexArrayVertexAttribFormatEXT_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; normalized GLboolean; relativeoffset GLuint);
var global glVertexArrayVertexAttribFormatEXT glVertexArrayVertexAttribFormatEXT_signature;

def glVertexArrayVertexAttribIFormatEXT_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var global glVertexArrayVertexAttribIFormatEXT glVertexArrayVertexAttribIFormatEXT_signature;

def glVertexArrayVertexAttribLFormatEXT_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var global glVertexArrayVertexAttribLFormatEXT glVertexArrayVertexAttribLFormatEXT_signature;

def glVertexArrayVertexAttribBindingEXT_signature func(vaobj GLuint; attribindex GLuint; bindingindex GLuint);
var global glVertexArrayVertexAttribBindingEXT glVertexArrayVertexAttribBindingEXT_signature;

def glVertexArrayVertexBindingDivisorEXT_signature func(vaobj GLuint; bindingindex GLuint; divisor GLuint);
var global glVertexArrayVertexBindingDivisorEXT glVertexArrayVertexBindingDivisorEXT_signature;

def glVertexArrayVertexAttribLOffsetEXT_signature func(vaobj GLuint; buffer GLuint; index GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var global glVertexArrayVertexAttribLOffsetEXT glVertexArrayVertexAttribLOffsetEXT_signature;

def glTexturePageCommitmentEXT_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; commit GLboolean);
var global glTexturePageCommitmentEXT glTexturePageCommitmentEXT_signature;

def glVertexArrayVertexAttribDivisorEXT_signature func(vaobj GLuint; index GLuint; divisor GLuint);
var global glVertexArrayVertexAttribDivisorEXT glVertexArrayVertexAttribDivisorEXT_signature;
def GL_EXT_draw_buffers2 = 1;

def glColorMaskIndexedEXT_signature func(index GLuint; r GLboolean; g GLboolean; b GLboolean; a GLboolean);
var global glColorMaskIndexedEXT glColorMaskIndexedEXT_signature;
def GL_EXT_draw_instanced = 1;

def glDrawArraysInstancedEXT_signature func(mode GLenum; start GLint; count GLsizei; primcount GLsizei);
var global glDrawArraysInstancedEXT glDrawArraysInstancedEXT_signature;

def glDrawElementsInstancedEXT_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; primcount GLsizei);
var global glDrawElementsInstancedEXT glDrawElementsInstancedEXT_signature;
def GL_EXT_draw_range_elements = 1;
def GL_MAX_ELEMENTS_VERTICES_EXT = 0x80E8;
def GL_MAX_ELEMENTS_INDICES_EXT = 0x80E9;

def glDrawRangeElementsEXT_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei; type GLenum; indices u8 ref);
var global glDrawRangeElementsEXT glDrawRangeElementsEXT_signature;
def GL_EXT_external_buffer = 1;

def glBufferStorageExternalEXT_signature func(target GLenum; offset GLintptr; size GLsizeiptr; clientBuffer GLeglClientBufferEXT; flags GLbitfield);
var global glBufferStorageExternalEXT glBufferStorageExternalEXT_signature;

def glNamedBufferStorageExternalEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; clientBuffer GLeglClientBufferEXT; flags GLbitfield);
var global glNamedBufferStorageExternalEXT glNamedBufferStorageExternalEXT_signature;
def GL_EXT_fog_coord = 1;
def GL_FOG_COORDINATE_SOURCE_EXT = 0x8450;
def GL_FOG_COORDINATE_EXT = 0x8451;
def GL_FRAGMENT_DEPTH_EXT = 0x8452;
def GL_CURRENT_FOG_COORDINATE_EXT = 0x8453;
def GL_FOG_COORDINATE_ARRAY_TYPE_EXT = 0x8454;
def GL_FOG_COORDINATE_ARRAY_STRIDE_EXT = 0x8455;
def GL_FOG_COORDINATE_ARRAY_POINTER_EXT = 0x8456;
def GL_FOG_COORDINATE_ARRAY_EXT = 0x8457;

def glFogCoordfEXT_signature func(coord GLfloat);
var global glFogCoordfEXT glFogCoordfEXT_signature;

def glFogCoordfvEXT_signature func(coord GLfloat ref);
var global glFogCoordfvEXT glFogCoordfvEXT_signature;

def glFogCoorddEXT_signature func(coord GLdouble);
var global glFogCoorddEXT glFogCoorddEXT_signature;

def glFogCoorddvEXT_signature func(coord GLdouble ref);
var global glFogCoorddvEXT glFogCoorddvEXT_signature;

def glFogCoordPointerEXT_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var global glFogCoordPointerEXT glFogCoordPointerEXT_signature;
def GL_EXT_framebuffer_blit = 1;
def GL_READ_FRAMEBUFFER_EXT = 0x8CA8;
def GL_DRAW_FRAMEBUFFER_EXT = 0x8CA9;
def GL_DRAW_FRAMEBUFFER_BINDING_EXT = 0x8CA6;
def GL_READ_FRAMEBUFFER_BINDING_EXT = 0x8CAA;

def glBlitFramebufferEXT_signature func(srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var global glBlitFramebufferEXT glBlitFramebufferEXT_signature;
def GL_EXT_framebuffer_multisample = 1;
def GL_RENDERBUFFER_SAMPLES_EXT = 0x8CAB;
def GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT = 0x8D56;
def GL_MAX_SAMPLES_EXT = 0x8D57;

def glRenderbufferStorageMultisampleEXT_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glRenderbufferStorageMultisampleEXT glRenderbufferStorageMultisampleEXT_signature;
def GL_EXT_framebuffer_multisample_blit_scaled = 1;
def GL_SCALED_RESOLVE_FASTEST_EXT = 0x90BA;
def GL_SCALED_RESOLVE_NICEST_EXT = 0x90BB;
def GL_EXT_framebuffer_object = 1;
def GL_INVALID_FRAMEBUFFER_OPERATION_EXT = 0x0506;
def GL_MAX_RENDERBUFFER_SIZE_EXT = 0x84E8;
def GL_FRAMEBUFFER_BINDING_EXT = 0x8CA6;
def GL_RENDERBUFFER_BINDING_EXT = 0x8CA7;
def GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT = 0x8CD0;
def GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT = 0x8CD1;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT = 0x8CD2;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = 0x8CD3;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = 0x8CD4;
def GL_FRAMEBUFFER_COMPLETE_EXT = 0x8CD5;
def GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT = 0x8CD6;
def GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = 0x8CD7;
def GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT = 0x8CD9;
def GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT = 0x8CDA;
def GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT = 0x8CDB;
def GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT = 0x8CDC;
def GL_FRAMEBUFFER_UNSUPPORTED_EXT = 0x8CDD;
def GL_MAX_COLOR_ATTACHMENTS_EXT = 0x8CDF;
def GL_COLOR_ATTACHMENT0_EXT = 0x8CE0;
def GL_COLOR_ATTACHMENT1_EXT = 0x8CE1;
def GL_COLOR_ATTACHMENT2_EXT = 0x8CE2;
def GL_COLOR_ATTACHMENT3_EXT = 0x8CE3;
def GL_COLOR_ATTACHMENT4_EXT = 0x8CE4;
def GL_COLOR_ATTACHMENT5_EXT = 0x8CE5;
def GL_COLOR_ATTACHMENT6_EXT = 0x8CE6;
def GL_COLOR_ATTACHMENT7_EXT = 0x8CE7;
def GL_COLOR_ATTACHMENT8_EXT = 0x8CE8;
def GL_COLOR_ATTACHMENT9_EXT = 0x8CE9;
def GL_COLOR_ATTACHMENT10_EXT = 0x8CEA;
def GL_COLOR_ATTACHMENT11_EXT = 0x8CEB;
def GL_COLOR_ATTACHMENT12_EXT = 0x8CEC;
def GL_COLOR_ATTACHMENT13_EXT = 0x8CED;
def GL_COLOR_ATTACHMENT14_EXT = 0x8CEE;
def GL_COLOR_ATTACHMENT15_EXT = 0x8CEF;
def GL_DEPTH_ATTACHMENT_EXT = 0x8D00;
def GL_STENCIL_ATTACHMENT_EXT = 0x8D20;
def GL_FRAMEBUFFER_EXT = 0x8D40;
def GL_RENDERBUFFER_EXT = 0x8D41;
def GL_RENDERBUFFER_WIDTH_EXT = 0x8D42;
def GL_RENDERBUFFER_HEIGHT_EXT = 0x8D43;
def GL_RENDERBUFFER_INTERNAL_FORMAT_EXT = 0x8D44;
def GL_STENCIL_INDEX1_EXT = 0x8D46;
def GL_STENCIL_INDEX4_EXT = 0x8D47;
def GL_STENCIL_INDEX8_EXT = 0x8D48;
def GL_STENCIL_INDEX16_EXT = 0x8D49;
def GL_RENDERBUFFER_RED_SIZE_EXT = 0x8D50;
def GL_RENDERBUFFER_GREEN_SIZE_EXT = 0x8D51;
def GL_RENDERBUFFER_BLUE_SIZE_EXT = 0x8D52;
def GL_RENDERBUFFER_ALPHA_SIZE_EXT = 0x8D53;
def GL_RENDERBUFFER_DEPTH_SIZE_EXT = 0x8D54;
def GL_RENDERBUFFER_STENCIL_SIZE_EXT = 0x8D55;

def glIsRenderbufferEXT_signature func(renderbuffer GLuint) (result GLboolean);
var global glIsRenderbufferEXT glIsRenderbufferEXT_signature;

def glBindRenderbufferEXT_signature func(target GLenum; renderbuffer GLuint);
var global glBindRenderbufferEXT glBindRenderbufferEXT_signature;

def glDeleteRenderbuffersEXT_signature func(n GLsizei; renderbuffers GLuint ref);
var global glDeleteRenderbuffersEXT glDeleteRenderbuffersEXT_signature;

def glGenRenderbuffersEXT_signature func(n GLsizei; renderbuffers GLuint ref);
var global glGenRenderbuffersEXT glGenRenderbuffersEXT_signature;

def glRenderbufferStorageEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei);
var global glRenderbufferStorageEXT glRenderbufferStorageEXT_signature;

def glGetRenderbufferParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetRenderbufferParameterivEXT glGetRenderbufferParameterivEXT_signature;

def glIsFramebufferEXT_signature func(framebuffer GLuint) (result GLboolean);
var global glIsFramebufferEXT glIsFramebufferEXT_signature;

def glBindFramebufferEXT_signature func(target GLenum; framebuffer GLuint);
var global glBindFramebufferEXT glBindFramebufferEXT_signature;

def glDeleteFramebuffersEXT_signature func(n GLsizei; framebuffers GLuint ref);
var global glDeleteFramebuffersEXT glDeleteFramebuffersEXT_signature;

def glGenFramebuffersEXT_signature func(n GLsizei; framebuffers GLuint ref);
var global glGenFramebuffersEXT glGenFramebuffersEXT_signature;

def glCheckFramebufferStatusEXT_signature func(target GLenum) (result GLenum);
var global glCheckFramebufferStatusEXT glCheckFramebufferStatusEXT_signature;

def glFramebufferTexture1DEXT_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var global glFramebufferTexture1DEXT glFramebufferTexture1DEXT_signature;

def glFramebufferTexture2DEXT_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var global glFramebufferTexture2DEXT glFramebufferTexture2DEXT_signature;

def glFramebufferTexture3DEXT_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint; zoffset GLint);
var global glFramebufferTexture3DEXT glFramebufferTexture3DEXT_signature;

def glFramebufferRenderbufferEXT_signature func(target GLenum; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var global glFramebufferRenderbufferEXT glFramebufferRenderbufferEXT_signature;

def glGetFramebufferAttachmentParameterivEXT_signature func(target GLenum; attachment GLenum; pname GLenum; params GLint ref);
var global glGetFramebufferAttachmentParameterivEXT glGetFramebufferAttachmentParameterivEXT_signature;

def glGenerateMipmapEXT_signature func(target GLenum);
var global glGenerateMipmapEXT glGenerateMipmapEXT_signature;
def GL_EXT_framebuffer_sRGB = 1;
def GL_FRAMEBUFFER_SRGB_EXT = 0x8DB9;
def GL_FRAMEBUFFER_SRGB_CAPABLE_EXT = 0x8DBA;
def GL_EXT_geometry_shader4 = 1;
def GL_GEOMETRY_SHADER_EXT = 0x8DD9;
def GL_GEOMETRY_VERTICES_OUT_EXT = 0x8DDA;
def GL_GEOMETRY_INPUT_TYPE_EXT = 0x8DDB;
def GL_GEOMETRY_OUTPUT_TYPE_EXT = 0x8DDC;
def GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT = 0x8C29;
def GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT = 0x8DDD;
def GL_MAX_VERTEX_VARYING_COMPONENTS_EXT = 0x8DDE;
def GL_MAX_VARYING_COMPONENTS_EXT = 0x8B4B;
def GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT = 0x8DDF;
def GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT = 0x8DE0;
def GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT = 0x8DE1;
def GL_LINES_ADJACENCY_EXT = 0x000A;
def GL_LINE_STRIP_ADJACENCY_EXT = 0x000B;
def GL_TRIANGLES_ADJACENCY_EXT = 0x000C;
def GL_TRIANGLE_STRIP_ADJACENCY_EXT = 0x000D;
def GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT = 0x8DA8;
def GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT = 0x8DA9;
def GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT = 0x8DA7;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = 0x8CD4;
def GL_PROGRAM_POINT_SIZE_EXT = 0x8642;

def glProgramParameteriEXT_signature func(program GLuint; pname GLenum; value GLint);
var global glProgramParameteriEXT glProgramParameteriEXT_signature;
def GL_EXT_gpu_program_parameters = 1;

def glProgramEnvParameters4fvEXT_signature func(target GLenum; index GLuint; count GLsizei; params GLfloat ref);
var global glProgramEnvParameters4fvEXT glProgramEnvParameters4fvEXT_signature;

def glProgramLocalParameters4fvEXT_signature func(target GLenum; index GLuint; count GLsizei; params GLfloat ref);
var global glProgramLocalParameters4fvEXT glProgramLocalParameters4fvEXT_signature;
def GL_EXT_gpu_shader4 = 1;
def GL_SAMPLER_1D_ARRAY_EXT = 0x8DC0;
def GL_SAMPLER_2D_ARRAY_EXT = 0x8DC1;
def GL_SAMPLER_BUFFER_EXT = 0x8DC2;
def GL_SAMPLER_1D_ARRAY_SHADOW_EXT = 0x8DC3;
def GL_SAMPLER_2D_ARRAY_SHADOW_EXT = 0x8DC4;
def GL_SAMPLER_CUBE_SHADOW_EXT = 0x8DC5;
def GL_UNSIGNED_INT_VEC2_EXT = 0x8DC6;
def GL_UNSIGNED_INT_VEC3_EXT = 0x8DC7;
def GL_UNSIGNED_INT_VEC4_EXT = 0x8DC8;
def GL_INT_SAMPLER_1D_EXT = 0x8DC9;
def GL_INT_SAMPLER_2D_EXT = 0x8DCA;
def GL_INT_SAMPLER_3D_EXT = 0x8DCB;
def GL_INT_SAMPLER_CUBE_EXT = 0x8DCC;
def GL_INT_SAMPLER_2D_RECT_EXT = 0x8DCD;
def GL_INT_SAMPLER_1D_ARRAY_EXT = 0x8DCE;
def GL_INT_SAMPLER_2D_ARRAY_EXT = 0x8DCF;
def GL_INT_SAMPLER_BUFFER_EXT = 0x8DD0;
def GL_UNSIGNED_INT_SAMPLER_1D_EXT = 0x8DD1;
def GL_UNSIGNED_INT_SAMPLER_2D_EXT = 0x8DD2;
def GL_UNSIGNED_INT_SAMPLER_3D_EXT = 0x8DD3;
def GL_UNSIGNED_INT_SAMPLER_CUBE_EXT = 0x8DD4;
def GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT = 0x8DD5;
def GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT = 0x8DD6;
def GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT = 0x8DD7;
def GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT = 0x8DD8;
def GL_MIN_PROGRAM_TEXEL_OFFSET_EXT = 0x8904;
def GL_MAX_PROGRAM_TEXEL_OFFSET_EXT = 0x8905;
def GL_VERTEX_ATTRIB_ARRAY_INTEGER_EXT = 0x88FD;

def glGetUniformuivEXT_signature func(program GLuint; location GLint; params GLuint ref);
var global glGetUniformuivEXT glGetUniformuivEXT_signature;

def glBindFragDataLocationEXT_signature func(program GLuint; color GLuint; name GLchar ref);
var global glBindFragDataLocationEXT glBindFragDataLocationEXT_signature;

def glGetFragDataLocationEXT_signature func(program GLuint; name GLchar ref) (result GLint);
var global glGetFragDataLocationEXT glGetFragDataLocationEXT_signature;

def glUniform1uiEXT_signature func(location GLint; v0 GLuint);
var global glUniform1uiEXT glUniform1uiEXT_signature;

def glUniform2uiEXT_signature func(location GLint; v0 GLuint; v1 GLuint);
var global glUniform2uiEXT glUniform2uiEXT_signature;

def glUniform3uiEXT_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var global glUniform3uiEXT glUniform3uiEXT_signature;

def glUniform4uiEXT_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var global glUniform4uiEXT glUniform4uiEXT_signature;

def glUniform1uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform1uivEXT glUniform1uivEXT_signature;

def glUniform2uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform2uivEXT glUniform2uivEXT_signature;

def glUniform3uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform3uivEXT glUniform3uivEXT_signature;

def glUniform4uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var global glUniform4uivEXT glUniform4uivEXT_signature;

def glVertexAttribI1iEXT_signature func(index GLuint; x GLint);
var global glVertexAttribI1iEXT glVertexAttribI1iEXT_signature;

def glVertexAttribI2iEXT_signature func(index GLuint; x GLint; y GLint);
var global glVertexAttribI2iEXT glVertexAttribI2iEXT_signature;

def glVertexAttribI3iEXT_signature func(index GLuint; x GLint; y GLint; z GLint);
var global glVertexAttribI3iEXT glVertexAttribI3iEXT_signature;

def glVertexAttribI4iEXT_signature func(index GLuint; x GLint; y GLint; z GLint; w GLint);
var global glVertexAttribI4iEXT glVertexAttribI4iEXT_signature;

def glVertexAttribI1uiEXT_signature func(index GLuint; x GLuint);
var global glVertexAttribI1uiEXT glVertexAttribI1uiEXT_signature;

def glVertexAttribI2uiEXT_signature func(index GLuint; x GLuint; y GLuint);
var global glVertexAttribI2uiEXT glVertexAttribI2uiEXT_signature;

def glVertexAttribI3uiEXT_signature func(index GLuint; x GLuint; y GLuint; z GLuint);
var global glVertexAttribI3uiEXT glVertexAttribI3uiEXT_signature;

def glVertexAttribI4uiEXT_signature func(index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var global glVertexAttribI4uiEXT glVertexAttribI4uiEXT_signature;

def glVertexAttribI1ivEXT_signature func(index GLuint; v GLint ref);
var global glVertexAttribI1ivEXT glVertexAttribI1ivEXT_signature;

def glVertexAttribI2ivEXT_signature func(index GLuint; v GLint ref);
var global glVertexAttribI2ivEXT glVertexAttribI2ivEXT_signature;

def glVertexAttribI3ivEXT_signature func(index GLuint; v GLint ref);
var global glVertexAttribI3ivEXT glVertexAttribI3ivEXT_signature;

def glVertexAttribI4ivEXT_signature func(index GLuint; v GLint ref);
var global glVertexAttribI4ivEXT glVertexAttribI4ivEXT_signature;

def glVertexAttribI1uivEXT_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI1uivEXT glVertexAttribI1uivEXT_signature;

def glVertexAttribI2uivEXT_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI2uivEXT glVertexAttribI2uivEXT_signature;

def glVertexAttribI3uivEXT_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI3uivEXT glVertexAttribI3uivEXT_signature;

def glVertexAttribI4uivEXT_signature func(index GLuint; v GLuint ref);
var global glVertexAttribI4uivEXT glVertexAttribI4uivEXT_signature;

def glVertexAttribI4bvEXT_signature func(index GLuint; v GLbyte ref);
var global glVertexAttribI4bvEXT glVertexAttribI4bvEXT_signature;

def glVertexAttribI4svEXT_signature func(index GLuint; v GLshort ref);
var global glVertexAttribI4svEXT glVertexAttribI4svEXT_signature;

def glVertexAttribI4ubvEXT_signature func(index GLuint; v GLubyte ref);
var global glVertexAttribI4ubvEXT glVertexAttribI4ubvEXT_signature;

def glVertexAttribI4usvEXT_signature func(index GLuint; v GLushort ref);
var global glVertexAttribI4usvEXT glVertexAttribI4usvEXT_signature;

def glVertexAttribIPointerEXT_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glVertexAttribIPointerEXT glVertexAttribIPointerEXT_signature;

def glGetVertexAttribIivEXT_signature func(index GLuint; pname GLenum; params GLint ref);
var global glGetVertexAttribIivEXT glGetVertexAttribIivEXT_signature;

def glGetVertexAttribIuivEXT_signature func(index GLuint; pname GLenum; params GLuint ref);
var global glGetVertexAttribIuivEXT glGetVertexAttribIuivEXT_signature;
def GL_EXT_histogram = 1;
def GL_HISTOGRAM_EXT = 0x8024;
def GL_PROXY_HISTOGRAM_EXT = 0x8025;
def GL_HISTOGRAM_WIDTH_EXT = 0x8026;
def GL_HISTOGRAM_FORMAT_EXT = 0x8027;
def GL_HISTOGRAM_RED_SIZE_EXT = 0x8028;
def GL_HISTOGRAM_GREEN_SIZE_EXT = 0x8029;
def GL_HISTOGRAM_BLUE_SIZE_EXT = 0x802A;
def GL_HISTOGRAM_ALPHA_SIZE_EXT = 0x802B;
def GL_HISTOGRAM_LUMINANCE_SIZE_EXT = 0x802C;
def GL_HISTOGRAM_SINK_EXT = 0x802D;
def GL_MINMAX_EXT = 0x802E;
def GL_MINMAX_FORMAT_EXT = 0x802F;
def GL_MINMAX_SINK_EXT = 0x8030;
def GL_TABLE_TOO_LARGE_EXT = 0x8031;

def glGetHistogramEXT_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var global glGetHistogramEXT glGetHistogramEXT_signature;

def glGetHistogramParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetHistogramParameterfvEXT glGetHistogramParameterfvEXT_signature;

def glGetHistogramParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetHistogramParameterivEXT glGetHistogramParameterivEXT_signature;

def glGetMinmaxEXT_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var global glGetMinmaxEXT glGetMinmaxEXT_signature;

def glGetMinmaxParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetMinmaxParameterfvEXT glGetMinmaxParameterfvEXT_signature;

def glGetMinmaxParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetMinmaxParameterivEXT glGetMinmaxParameterivEXT_signature;

def glHistogramEXT_signature func(target GLenum; width GLsizei; internalformat GLenum; sink GLboolean);
var global glHistogramEXT glHistogramEXT_signature;

def glMinmaxEXT_signature func(target GLenum; internalformat GLenum; sink GLboolean);
var global glMinmaxEXT glMinmaxEXT_signature;

def glResetHistogramEXT_signature func(target GLenum);
var global glResetHistogramEXT glResetHistogramEXT_signature;

def glResetMinmaxEXT_signature func(target GLenum);
var global glResetMinmaxEXT glResetMinmaxEXT_signature;
def GL_EXT_index_array_formats = 1;
def GL_IUI_V2F_EXT = 0x81AD;
def GL_IUI_V3F_EXT = 0x81AE;
def GL_IUI_N3F_V2F_EXT = 0x81AF;
def GL_IUI_N3F_V3F_EXT = 0x81B0;
def GL_T2F_IUI_V2F_EXT = 0x81B1;
def GL_T2F_IUI_V3F_EXT = 0x81B2;
def GL_T2F_IUI_N3F_V2F_EXT = 0x81B3;
def GL_T2F_IUI_N3F_V3F_EXT = 0x81B4;
def GL_EXT_index_func = 1;
def GL_INDEX_TEST_EXT = 0x81B5;
def GL_INDEX_TEST_FUNC_EXT = 0x81B6;
def GL_INDEX_TEST_REF_EXT = 0x81B7;

def glIndexFuncEXT_signature func(func GLenum; ref GLclampf);
var global glIndexFuncEXT glIndexFuncEXT_signature;
def GL_EXT_index_material = 1;
def GL_INDEX_MATERIAL_EXT = 0x81B8;
def GL_INDEX_MATERIAL_PARAMETER_EXT = 0x81B9;
def GL_INDEX_MATERIAL_FACE_EXT = 0x81BA;

def glIndexMaterialEXT_signature func(face GLenum; mode GLenum);
var global glIndexMaterialEXT glIndexMaterialEXT_signature;
def GL_EXT_index_texture = 1;
def GL_EXT_light_texture = 1;
def GL_FRAGMENT_MATERIAL_EXT = 0x8349;
def GL_FRAGMENT_NORMAL_EXT = 0x834A;
def GL_FRAGMENT_COLOR_EXT = 0x834C;
def GL_ATTENUATION_EXT = 0x834D;
def GL_SHADOW_ATTENUATION_EXT = 0x834E;
def GL_TEXTURE_APPLICATION_MODE_EXT = 0x834F;
def GL_TEXTURE_LIGHT_EXT = 0x8350;
def GL_TEXTURE_MATERIAL_FACE_EXT = 0x8351;
def GL_TEXTURE_MATERIAL_PARAMETER_EXT = 0x8352;

def glApplyTextureEXT_signature func(mode GLenum);
var global glApplyTextureEXT glApplyTextureEXT_signature;

def glTextureLightEXT_signature func(pname GLenum);
var global glTextureLightEXT glTextureLightEXT_signature;

def glTextureMaterialEXT_signature func(face GLenum; mode GLenum);
var global glTextureMaterialEXT glTextureMaterialEXT_signature;
def GL_EXT_memory_object = 1;
def GL_TEXTURE_TILING_EXT = 0x9580;
def GL_DEDICATED_MEMORY_OBJECT_EXT = 0x9581;
def GL_PROTECTED_MEMORY_OBJECT_EXT = 0x959B;
def GL_NUM_TILING_TYPES_EXT = 0x9582;
def GL_TILING_TYPES_EXT = 0x9583;
def GL_OPTIMAL_TILING_EXT = 0x9584;
def GL_LINEAR_TILING_EXT = 0x9585;
def GL_NUM_DEVICE_UUIDS_EXT = 0x9596;
def GL_DEVICE_UUID_EXT = 0x9597;
def GL_DRIVER_UUID_EXT = 0x9598;
def GL_UUID_SIZE_EXT = 16;

def glGetUnsignedBytevEXT_signature func(pname GLenum; data GLubyte ref);
var global glGetUnsignedBytevEXT glGetUnsignedBytevEXT_signature;

def glGetUnsignedBytei_vEXT_signature func(target GLenum; index GLuint; data GLubyte ref);
var global glGetUnsignedBytei_vEXT glGetUnsignedBytei_vEXT_signature;

def glDeleteMemoryObjectsEXT_signature func(n GLsizei; memoryObjects GLuint ref);
var global glDeleteMemoryObjectsEXT glDeleteMemoryObjectsEXT_signature;

def glIsMemoryObjectEXT_signature func(memoryObject GLuint) (result GLboolean);
var global glIsMemoryObjectEXT glIsMemoryObjectEXT_signature;

def glCreateMemoryObjectsEXT_signature func(n GLsizei; memoryObjects GLuint ref);
var global glCreateMemoryObjectsEXT glCreateMemoryObjectsEXT_signature;

def glMemoryObjectParameterivEXT_signature func(memoryObject GLuint; pname GLenum; params GLint ref);
var global glMemoryObjectParameterivEXT glMemoryObjectParameterivEXT_signature;

def glGetMemoryObjectParameterivEXT_signature func(memoryObject GLuint; pname GLenum; params GLint ref);
var global glGetMemoryObjectParameterivEXT glGetMemoryObjectParameterivEXT_signature;

def glTexStorageMem2DEXT_signature func(target GLenum; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; memory GLuint; offset GLuint64);
var global glTexStorageMem2DEXT glTexStorageMem2DEXT_signature;

def glTexStorageMem2DMultisampleEXT_signature func(target GLenum; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var global glTexStorageMem2DMultisampleEXT glTexStorageMem2DMultisampleEXT_signature;

def glTexStorageMem3DEXT_signature func(target GLenum; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64);
var global glTexStorageMem3DEXT glTexStorageMem3DEXT_signature;

def glTexStorageMem3DMultisampleEXT_signature func(target GLenum; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var global glTexStorageMem3DMultisampleEXT glTexStorageMem3DMultisampleEXT_signature;

def glBufferStorageMemEXT_signature func(target GLenum; size GLsizeiptr; memory GLuint; offset GLuint64);
var global glBufferStorageMemEXT glBufferStorageMemEXT_signature;

def glTextureStorageMem2DEXT_signature func(texture GLuint; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; memory GLuint; offset GLuint64);
var global glTextureStorageMem2DEXT glTextureStorageMem2DEXT_signature;

def glTextureStorageMem2DMultisampleEXT_signature func(texture GLuint; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var global glTextureStorageMem2DMultisampleEXT glTextureStorageMem2DMultisampleEXT_signature;

def glTextureStorageMem3DEXT_signature func(texture GLuint; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64);
var global glTextureStorageMem3DEXT glTextureStorageMem3DEXT_signature;

def glTextureStorageMem3DMultisampleEXT_signature func(texture GLuint; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var global glTextureStorageMem3DMultisampleEXT glTextureStorageMem3DMultisampleEXT_signature;

def glNamedBufferStorageMemEXT_signature func(buffer GLuint; size GLsizeiptr; memory GLuint; offset GLuint64);
var global glNamedBufferStorageMemEXT glNamedBufferStorageMemEXT_signature;

def glTexStorageMem1DEXT_signature func(target GLenum; levels GLsizei; internalFormat GLenum; width GLsizei; memory GLuint; offset GLuint64);
var global glTexStorageMem1DEXT glTexStorageMem1DEXT_signature;

def glTextureStorageMem1DEXT_signature func(texture GLuint; levels GLsizei; internalFormat GLenum; width GLsizei; memory GLuint; offset GLuint64);
var global glTextureStorageMem1DEXT glTextureStorageMem1DEXT_signature;
def GL_EXT_memory_object_fd = 1;
def GL_HANDLE_TYPE_OPAQUE_FD_EXT = 0x9586;

def glImportMemoryFdEXT_signature func(memory GLuint; size GLuint64; handleType GLenum; fd GLint);
var global glImportMemoryFdEXT glImportMemoryFdEXT_signature;
def GL_EXT_memory_object_win32 = 1;
def GL_HANDLE_TYPE_OPAQUE_WIN32_EXT = 0x9587;
def GL_HANDLE_TYPE_OPAQUE_WIN32_KMT_EXT = 0x9588;
def GL_DEVICE_LUID_EXT = 0x9599;
def GL_DEVICE_NODE_MASK_EXT = 0x959A;
def GL_LUID_SIZE_EXT = 8;
def GL_HANDLE_TYPE_D3D12_TILEPOOL_EXT = 0x9589;
def GL_HANDLE_TYPE_D3D12_RESOURCE_EXT = 0x958A;
def GL_HANDLE_TYPE_D3D11_IMAGE_EXT = 0x958B;
def GL_HANDLE_TYPE_D3D11_IMAGE_KMT_EXT = 0x958C;

def glImportMemoryWin32HandleEXT_signature func(memory GLuint; size GLuint64; handleType GLenum; handle u8 ref);
var global glImportMemoryWin32HandleEXT glImportMemoryWin32HandleEXT_signature;

def glImportMemoryWin32NameEXT_signature func(memory GLuint; size GLuint64; handleType GLenum; name u8 ref);
var global glImportMemoryWin32NameEXT glImportMemoryWin32NameEXT_signature;
def GL_EXT_misc_attribute = 1;
def GL_EXT_multi_draw_arrays = 1;

def glMultiDrawArraysEXT_signature func(mode GLenum; first GLint ref; count GLsizei ref; primcount GLsizei);
var global glMultiDrawArraysEXT glMultiDrawArraysEXT_signature;

def glMultiDrawElementsEXT_signature func(mode GLenum; count GLsizei ref; type GLenum; indices u8 ref ref; primcount GLsizei);
var global glMultiDrawElementsEXT glMultiDrawElementsEXT_signature;
def GL_EXT_multisample = 1;
def GL_MULTISAMPLE_EXT = 0x809D;
def GL_SAMPLE_ALPHA_TO_MASK_EXT = 0x809E;
def GL_SAMPLE_ALPHA_TO_ONE_EXT = 0x809F;
def GL_SAMPLE_MASK_EXT = 0x80A0;
def GL_1PASS_EXT = 0x80A1;
def GL_2PASS_0_EXT = 0x80A2;
def GL_2PASS_1_EXT = 0x80A3;
def GL_4PASS_0_EXT = 0x80A4;
def GL_4PASS_1_EXT = 0x80A5;
def GL_4PASS_2_EXT = 0x80A6;
def GL_4PASS_3_EXT = 0x80A7;
def GL_SAMPLE_BUFFERS_EXT = 0x80A8;
def GL_SAMPLES_EXT = 0x80A9;
def GL_SAMPLE_MASK_VALUE_EXT = 0x80AA;
def GL_SAMPLE_MASK_INVERT_EXT = 0x80AB;
def GL_SAMPLE_PATTERN_EXT = 0x80AC;
def GL_MULTISAMPLE_BIT_EXT = 0x20000000;

def glSampleMaskEXT_signature func(value GLclampf; invert GLboolean);
var global glSampleMaskEXT glSampleMaskEXT_signature;

def glSamplePatternEXT_signature func(pattern GLenum);
var global glSamplePatternEXT glSamplePatternEXT_signature;
def GL_EXT_multiview_tessellation_geometry_shader = 1;
def GL_EXT_multiview_texture_multisample = 1;
def GL_EXT_multiview_timer_query = 1;
def GL_EXT_packed_depth_stencil = 1;
def GL_DEPTH_STENCIL_EXT = 0x84F9;
def GL_UNSIGNED_INT_24_8_EXT = 0x84FA;
def GL_DEPTH24_STENCIL8_EXT = 0x88F0;
def GL_TEXTURE_STENCIL_SIZE_EXT = 0x88F1;
def GL_EXT_packed_float = 1;
def GL_R11F_G11F_B10F_EXT = 0x8C3A;
def GL_UNSIGNED_INT_10F_11F_11F_REV_EXT = 0x8C3B;
def GL_RGBA_SIGNED_COMPONENTS_EXT = 0x8C3C;
def GL_EXT_packed_pixels = 1;
def GL_UNSIGNED_BYTE_3_3_2_EXT = 0x8032;
def GL_UNSIGNED_SHORT_4_4_4_4_EXT = 0x8033;
def GL_UNSIGNED_SHORT_5_5_5_1_EXT = 0x8034;
def GL_UNSIGNED_INT_8_8_8_8_EXT = 0x8035;
def GL_UNSIGNED_INT_10_10_10_2_EXT = 0x8036;
def GL_TEXTURE_INDEX_SIZE_EXT = 0x80ED;

def glColorTableEXT_signature func(target GLenum; internalFormat GLenum; width GLsizei; format GLenum; type GLenum; table u8 ref);
var global glColorTableEXT glColorTableEXT_signature;

def glGetColorTableEXT_signature func(target GLenum; format GLenum; type GLenum; data u8 ref);
var global glGetColorTableEXT glGetColorTableEXT_signature;

def glGetColorTableParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetColorTableParameterivEXT glGetColorTableParameterivEXT_signature;

def glGetColorTableParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetColorTableParameterfvEXT glGetColorTableParameterfvEXT_signature;
def GL_EXT_pixel_buffer_object = 1;
def GL_PIXEL_PACK_BUFFER_EXT = 0x88EB;
def GL_PIXEL_UNPACK_BUFFER_EXT = 0x88EC;
def GL_PIXEL_PACK_BUFFER_BINDING_EXT = 0x88ED;
def GL_PIXEL_UNPACK_BUFFER_BINDING_EXT = 0x88EF;
def GL_EXT_pixel_transform = 1;
def GL_PIXEL_TRANSFORM_2D_EXT = 0x8330;
def GL_PIXEL_MAG_FILTER_EXT = 0x8331;
def GL_PIXEL_MIN_FILTER_EXT = 0x8332;
def GL_PIXEL_CUBIC_WEIGHT_EXT = 0x8333;
def GL_CUBIC_EXT = 0x8334;
def GL_AVERAGE_EXT = 0x8335;
def GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8336;
def GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8337;
def GL_PIXEL_TRANSFORM_2D_MATRIX_EXT = 0x8338;

def glPixelTransformParameteriEXT_signature func(target GLenum; pname GLenum; param GLint);
var global glPixelTransformParameteriEXT glPixelTransformParameteriEXT_signature;

def glPixelTransformParameterfEXT_signature func(target GLenum; pname GLenum; param GLfloat);
var global glPixelTransformParameterfEXT glPixelTransformParameterfEXT_signature;

def glPixelTransformParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glPixelTransformParameterivEXT glPixelTransformParameterivEXT_signature;

def glPixelTransformParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glPixelTransformParameterfvEXT glPixelTransformParameterfvEXT_signature;

def glGetPixelTransformParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetPixelTransformParameterivEXT glGetPixelTransformParameterivEXT_signature;

def glGetPixelTransformParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetPixelTransformParameterfvEXT glGetPixelTransformParameterfvEXT_signature;
def GL_EXT_pixel_transform_color_table = 1;
def GL_EXT_point_parameters = 1;
def GL_POINT_SIZE_MIN_EXT = 0x8126;
def GL_POINT_SIZE_MAX_EXT = 0x8127;
def GL_POINT_FADE_THRESHOLD_SIZE_EXT = 0x8128;
def GL_DISTANCE_ATTENUATION_EXT = 0x8129;

def glPointParameterfEXT_signature func(pname GLenum; param GLfloat);
var global glPointParameterfEXT glPointParameterfEXT_signature;

def glPointParameterfvEXT_signature func(pname GLenum; params GLfloat ref);
var global glPointParameterfvEXT glPointParameterfvEXT_signature;
def GL_EXT_polygon_offset = 1;
def GL_POLYGON_OFFSET_EXT = 0x8037;
def GL_POLYGON_OFFSET_FACTOR_EXT = 0x8038;
def GL_POLYGON_OFFSET_BIAS_EXT = 0x8039;

def glPolygonOffsetEXT_signature func(factor GLfloat; bias GLfloat);
var global glPolygonOffsetEXT glPolygonOffsetEXT_signature;
def GL_EXT_polygon_offset_clamp = 1;
def GL_POLYGON_OFFSET_CLAMP_EXT = 0x8E1B;

def glPolygonOffsetClampEXT_signature func(factor GLfloat; units GLfloat; clamp GLfloat);
var global glPolygonOffsetClampEXT glPolygonOffsetClampEXT_signature;
def GL_EXT_post_depth_coverage = 1;
def GL_EXT_provoking_vertex = 1;
def GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION_EXT = 0x8E4C;
def GL_FIRST_VERTEX_CONVENTION_EXT = 0x8E4D;
def GL_LAST_VERTEX_CONVENTION_EXT = 0x8E4E;
def GL_PROVOKING_VERTEX_EXT = 0x8E4F;

def glProvokingVertexEXT_signature func(mode GLenum);
var global glProvokingVertexEXT glProvokingVertexEXT_signature;
def GL_EXT_raster_multisample = 1;
def GL_RASTER_MULTISAMPLE_EXT = 0x9327;
def GL_RASTER_SAMPLES_EXT = 0x9328;
def GL_MAX_RASTER_SAMPLES_EXT = 0x9329;
def GL_RASTER_FIXED_SAMPLE_LOCATIONS_EXT = 0x932A;
def GL_MULTISAMPLE_RASTERIZATION_ALLOWED_EXT = 0x932B;
def GL_EFFECTIVE_RASTER_SAMPLES_EXT = 0x932C;

def glRasterSamplesEXT_signature func(samples GLuint; fixedsamplelocations GLboolean);
var global glRasterSamplesEXT glRasterSamplesEXT_signature;
def GL_EXT_rescale_normal = 1;
def GL_RESCALE_NORMAL_EXT = 0x803A;
def GL_EXT_secondary_color = 1;
def GL_COLOR_SUM_EXT = 0x8458;
def GL_CURRENT_SECONDARY_COLOR_EXT = 0x8459;
def GL_SECONDARY_COLOR_ARRAY_SIZE_EXT = 0x845A;
def GL_SECONDARY_COLOR_ARRAY_TYPE_EXT = 0x845B;
def GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT = 0x845C;
def GL_SECONDARY_COLOR_ARRAY_POINTER_EXT = 0x845D;
def GL_SECONDARY_COLOR_ARRAY_EXT = 0x845E;

def glSecondaryColor3bEXT_signature func(red GLbyte; green GLbyte; blue GLbyte);
var global glSecondaryColor3bEXT glSecondaryColor3bEXT_signature;

def glSecondaryColor3bvEXT_signature func(v GLbyte ref);
var global glSecondaryColor3bvEXT glSecondaryColor3bvEXT_signature;

def glSecondaryColor3dEXT_signature func(red GLdouble; green GLdouble; blue GLdouble);
var global glSecondaryColor3dEXT glSecondaryColor3dEXT_signature;

def glSecondaryColor3dvEXT_signature func(v GLdouble ref);
var global glSecondaryColor3dvEXT glSecondaryColor3dvEXT_signature;

def glSecondaryColor3fEXT_signature func(red GLfloat; green GLfloat; blue GLfloat);
var global glSecondaryColor3fEXT glSecondaryColor3fEXT_signature;

def glSecondaryColor3fvEXT_signature func(v GLfloat ref);
var global glSecondaryColor3fvEXT glSecondaryColor3fvEXT_signature;

def glSecondaryColor3iEXT_signature func(red GLint; green GLint; blue GLint);
var global glSecondaryColor3iEXT glSecondaryColor3iEXT_signature;

def glSecondaryColor3ivEXT_signature func(v GLint ref);
var global glSecondaryColor3ivEXT glSecondaryColor3ivEXT_signature;

def glSecondaryColor3sEXT_signature func(red GLshort; green GLshort; blue GLshort);
var global glSecondaryColor3sEXT glSecondaryColor3sEXT_signature;

def glSecondaryColor3svEXT_signature func(v GLshort ref);
var global glSecondaryColor3svEXT glSecondaryColor3svEXT_signature;

def glSecondaryColor3ubEXT_signature func(red GLubyte; green GLubyte; blue GLubyte);
var global glSecondaryColor3ubEXT glSecondaryColor3ubEXT_signature;

def glSecondaryColor3ubvEXT_signature func(v GLubyte ref);
var global glSecondaryColor3ubvEXT glSecondaryColor3ubvEXT_signature;

def glSecondaryColor3uiEXT_signature func(red GLuint; green GLuint; blue GLuint);
var global glSecondaryColor3uiEXT glSecondaryColor3uiEXT_signature;

def glSecondaryColor3uivEXT_signature func(v GLuint ref);
var global glSecondaryColor3uivEXT glSecondaryColor3uivEXT_signature;

def glSecondaryColor3usEXT_signature func(red GLushort; green GLushort; blue GLushort);
var global glSecondaryColor3usEXT glSecondaryColor3usEXT_signature;

def glSecondaryColor3usvEXT_signature func(v GLushort ref);
var global glSecondaryColor3usvEXT glSecondaryColor3usvEXT_signature;

def glSecondaryColorPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glSecondaryColorPointerEXT glSecondaryColorPointerEXT_signature;
def GL_EXT_semaphore = 1;
def GL_LAYOUT_GENERAL_EXT = 0x958D;
def GL_LAYOUT_COLOR_ATTACHMENT_EXT = 0x958E;
def GL_LAYOUT_DEPTH_STENCIL_ATTACHMENT_EXT = 0x958F;
def GL_LAYOUT_DEPTH_STENCIL_READ_ONLY_EXT = 0x9590;
def GL_LAYOUT_SHADER_READ_ONLY_EXT = 0x9591;
def GL_LAYOUT_TRANSFER_SRC_EXT = 0x9592;
def GL_LAYOUT_TRANSFER_DST_EXT = 0x9593;
def GL_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_EXT = 0x9530;
def GL_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_EXT = 0x9531;

def glGenSemaphoresEXT_signature func(n GLsizei; semaphores GLuint ref);
var global glGenSemaphoresEXT glGenSemaphoresEXT_signature;

def glDeleteSemaphoresEXT_signature func(n GLsizei; semaphores GLuint ref);
var global glDeleteSemaphoresEXT glDeleteSemaphoresEXT_signature;

def glIsSemaphoreEXT_signature func(semaphore GLuint) (result GLboolean);
var global glIsSemaphoreEXT glIsSemaphoreEXT_signature;

def glSemaphoreParameterui64vEXT_signature func(semaphore GLuint; pname GLenum; params GLuint64 ref);
var global glSemaphoreParameterui64vEXT glSemaphoreParameterui64vEXT_signature;

def glGetSemaphoreParameterui64vEXT_signature func(semaphore GLuint; pname GLenum; params GLuint64 ref);
var global glGetSemaphoreParameterui64vEXT glGetSemaphoreParameterui64vEXT_signature;

def glWaitSemaphoreEXT_signature func(semaphore GLuint; numBufferBarriers GLuint; buffers GLuint ref; numTextureBarriers GLuint; textures GLuint ref; srcLayouts GLenum ref);
var global glWaitSemaphoreEXT glWaitSemaphoreEXT_signature;

def glSignalSemaphoreEXT_signature func(semaphore GLuint; numBufferBarriers GLuint; buffers GLuint ref; numTextureBarriers GLuint; textures GLuint ref; dstLayouts GLenum ref);
var global glSignalSemaphoreEXT glSignalSemaphoreEXT_signature;
def GL_EXT_semaphore_fd = 1;

def glImportSemaphoreFdEXT_signature func(semaphore GLuint; handleType GLenum; fd GLint);
var global glImportSemaphoreFdEXT glImportSemaphoreFdEXT_signature;
def GL_EXT_semaphore_win32 = 1;
def GL_HANDLE_TYPE_D3D12_FENCE_EXT = 0x9594;
def GL_D3D12_FENCE_VALUE_EXT = 0x9595;

def glImportSemaphoreWin32HandleEXT_signature func(semaphore GLuint; handleType GLenum; handle u8 ref);
var global glImportSemaphoreWin32HandleEXT glImportSemaphoreWin32HandleEXT_signature;

def glImportSemaphoreWin32NameEXT_signature func(semaphore GLuint; handleType GLenum; name u8 ref);
var global glImportSemaphoreWin32NameEXT glImportSemaphoreWin32NameEXT_signature;
def GL_EXT_separate_shader_objects = 1;
def GL_ACTIVE_PROGRAM_EXT = 0x8B8D;

def glUseShaderProgramEXT_signature func(type GLenum; program GLuint);
var global glUseShaderProgramEXT glUseShaderProgramEXT_signature;

def glActiveProgramEXT_signature func(program GLuint);
var global glActiveProgramEXT glActiveProgramEXT_signature;

def glCreateShaderProgramEXT_signature func(type GLenum; string GLchar ref) (result GLuint);
var global glCreateShaderProgramEXT glCreateShaderProgramEXT_signature;
def GL_EXT_separate_specular_color = 1;
def GL_LIGHT_MODEL_COLOR_CONTROL_EXT = 0x81F8;
def GL_SINGLE_COLOR_EXT = 0x81F9;
def GL_SEPARATE_SPECULAR_COLOR_EXT = 0x81FA;
def GL_EXT_shader_framebuffer_fetch = 1;
def GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT = 0x8A52;
def GL_EXT_shader_framebuffer_fetch_non_coherent = 1;

def glFramebufferFetchBarrierEXT_signature func();
var global glFramebufferFetchBarrierEXT glFramebufferFetchBarrierEXT_signature;
def GL_EXT_shader_image_load_formatted = 1;
def GL_EXT_shader_image_load_store = 1;
def GL_MAX_IMAGE_UNITS_EXT = 0x8F38;
def GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS_EXT = 0x8F39;
def GL_IMAGE_BINDING_NAME_EXT = 0x8F3A;
def GL_IMAGE_BINDING_LEVEL_EXT = 0x8F3B;
def GL_IMAGE_BINDING_LAYERED_EXT = 0x8F3C;
def GL_IMAGE_BINDING_LAYER_EXT = 0x8F3D;
def GL_IMAGE_BINDING_ACCESS_EXT = 0x8F3E;
def GL_IMAGE_1D_EXT = 0x904C;
def GL_IMAGE_2D_EXT = 0x904D;
def GL_IMAGE_3D_EXT = 0x904E;
def GL_IMAGE_2D_RECT_EXT = 0x904F;
def GL_IMAGE_CUBE_EXT = 0x9050;
def GL_IMAGE_BUFFER_EXT = 0x9051;
def GL_IMAGE_1D_ARRAY_EXT = 0x9052;
def GL_IMAGE_2D_ARRAY_EXT = 0x9053;
def GL_IMAGE_CUBE_MAP_ARRAY_EXT = 0x9054;
def GL_IMAGE_2D_MULTISAMPLE_EXT = 0x9055;
def GL_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = 0x9056;
def GL_INT_IMAGE_1D_EXT = 0x9057;
def GL_INT_IMAGE_2D_EXT = 0x9058;
def GL_INT_IMAGE_3D_EXT = 0x9059;
def GL_INT_IMAGE_2D_RECT_EXT = 0x905A;
def GL_INT_IMAGE_CUBE_EXT = 0x905B;
def GL_INT_IMAGE_BUFFER_EXT = 0x905C;
def GL_INT_IMAGE_1D_ARRAY_EXT = 0x905D;
def GL_INT_IMAGE_2D_ARRAY_EXT = 0x905E;
def GL_INT_IMAGE_CUBE_MAP_ARRAY_EXT = 0x905F;
def GL_INT_IMAGE_2D_MULTISAMPLE_EXT = 0x9060;
def GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = 0x9061;
def GL_UNSIGNED_INT_IMAGE_1D_EXT = 0x9062;
def GL_UNSIGNED_INT_IMAGE_2D_EXT = 0x9063;
def GL_UNSIGNED_INT_IMAGE_3D_EXT = 0x9064;
def GL_UNSIGNED_INT_IMAGE_2D_RECT_EXT = 0x9065;
def GL_UNSIGNED_INT_IMAGE_CUBE_EXT = 0x9066;
def GL_UNSIGNED_INT_IMAGE_BUFFER_EXT = 0x9067;
def GL_UNSIGNED_INT_IMAGE_1D_ARRAY_EXT = 0x9068;
def GL_UNSIGNED_INT_IMAGE_2D_ARRAY_EXT = 0x9069;
def GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT = 0x906A;
def GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_EXT = 0x906B;
def GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = 0x906C;
def GL_MAX_IMAGE_SAMPLES_EXT = 0x906D;
def GL_IMAGE_BINDING_FORMAT_EXT = 0x906E;
def GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT_EXT = 0x00000001;
def GL_ELEMENT_ARRAY_BARRIER_BIT_EXT = 0x00000002;
def GL_UNIFORM_BARRIER_BIT_EXT = 0x00000004;
def GL_TEXTURE_FETCH_BARRIER_BIT_EXT = 0x00000008;
def GL_SHADER_IMAGE_ACCESS_BARRIER_BIT_EXT = 0x00000020;
def GL_COMMAND_BARRIER_BIT_EXT = 0x00000040;
def GL_PIXEL_BUFFER_BARRIER_BIT_EXT = 0x00000080;
def GL_TEXTURE_UPDATE_BARRIER_BIT_EXT = 0x00000100;
def GL_BUFFER_UPDATE_BARRIER_BIT_EXT = 0x00000200;
def GL_FRAMEBUFFER_BARRIER_BIT_EXT = 0x00000400;
def GL_TRANSFORM_FEEDBACK_BARRIER_BIT_EXT = 0x00000800;
def GL_ATOMIC_COUNTER_BARRIER_BIT_EXT = 0x00001000;
def GL_ALL_BARRIER_BITS_EXT = 0xFFFFFFFF;

def glBindImageTextureEXT_signature func(index GLuint; texture GLuint; level GLint; layered GLboolean; layer GLint; access GLenum; format GLint);
var global glBindImageTextureEXT glBindImageTextureEXT_signature;

def glMemoryBarrierEXT_signature func(barriers GLbitfield);
var global glMemoryBarrierEXT glMemoryBarrierEXT_signature;
def GL_EXT_shader_integer_mix = 1;
def GL_EXT_shadow_funcs = 1;
def GL_EXT_shared_texture_palette = 1;
def GL_SHARED_TEXTURE_PALETTE_EXT = 0x81FB;
def GL_EXT_sparse_texture2 = 1;
def GL_EXT_stencil_clear_tag = 1;
def GL_STENCIL_TAG_BITS_EXT = 0x88F2;
def GL_STENCIL_CLEAR_TAG_VALUE_EXT = 0x88F3;

def glStencilClearTagEXT_signature func(stencilTagBits GLsizei; stencilClearTag GLuint);
var global glStencilClearTagEXT glStencilClearTagEXT_signature;
def GL_EXT_stencil_two_side = 1;
def GL_STENCIL_TEST_TWO_SIDE_EXT = 0x8910;
def GL_ACTIVE_STENCIL_FACE_EXT = 0x8911;

def glActiveStencilFaceEXT_signature func(face GLenum);
var global glActiveStencilFaceEXT glActiveStencilFaceEXT_signature;
def GL_EXT_stencil_wrap = 1;
def GL_INCR_WRAP_EXT = 0x8507;
def GL_DECR_WRAP_EXT = 0x8508;
def GL_EXT_subtexture = 1;

def glTexSubImage1DEXT_signature func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTexSubImage1DEXT glTexSubImage1DEXT_signature;

def glTexSubImage2DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTexSubImage2DEXT glTexSubImage2DEXT_signature;
def GL_EXT_texture = 1;
def GL_ALPHA4_EXT = 0x803B;
def GL_ALPHA8_EXT = 0x803C;
def GL_ALPHA12_EXT = 0x803D;
def GL_ALPHA16_EXT = 0x803E;
def GL_LUMINANCE4_EXT = 0x803F;
def GL_LUMINANCE8_EXT = 0x8040;
def GL_LUMINANCE12_EXT = 0x8041;
def GL_LUMINANCE16_EXT = 0x8042;
def GL_LUMINANCE4_ALPHA4_EXT = 0x8043;
def GL_LUMINANCE6_ALPHA2_EXT = 0x8044;
def GL_LUMINANCE8_ALPHA8_EXT = 0x8045;
def GL_LUMINANCE12_ALPHA4_EXT = 0x8046;
def GL_LUMINANCE12_ALPHA12_EXT = 0x8047;
def GL_LUMINANCE16_ALPHA16_EXT = 0x8048;
def GL_INTENSITY_EXT = 0x8049;
def GL_INTENSITY4_EXT = 0x804A;
def GL_INTENSITY8_EXT = 0x804B;
def GL_INTENSITY12_EXT = 0x804C;
def GL_INTENSITY16_EXT = 0x804D;
def GL_RGB2_EXT = 0x804E;
def GL_RGB4_EXT = 0x804F;
def GL_RGB5_EXT = 0x8050;
def GL_RGB8_EXT = 0x8051;
def GL_RGB10_EXT = 0x8052;
def GL_RGB12_EXT = 0x8053;
def GL_RGB16_EXT = 0x8054;
def GL_RGBA2_EXT = 0x8055;
def GL_RGBA4_EXT = 0x8056;
def GL_RGB5_A1_EXT = 0x8057;
def GL_RGBA8_EXT = 0x8058;
def GL_RGB10_A2_EXT = 0x8059;
def GL_RGBA12_EXT = 0x805A;
def GL_RGBA16_EXT = 0x805B;
def GL_TEXTURE_RED_SIZE_EXT = 0x805C;
def GL_TEXTURE_GREEN_SIZE_EXT = 0x805D;
def GL_TEXTURE_BLUE_SIZE_EXT = 0x805E;
def GL_TEXTURE_ALPHA_SIZE_EXT = 0x805F;
def GL_TEXTURE_LUMINANCE_SIZE_EXT = 0x8060;
def GL_TEXTURE_INTENSITY_SIZE_EXT = 0x8061;
def GL_REPLACE_EXT = 0x8062;
def GL_PROXY_TEXTURE_1D_EXT = 0x8063;
def GL_PROXY_TEXTURE_2D_EXT = 0x8064;
def GL_TEXTURE_TOO_LARGE_EXT = 0x8065;
def GL_EXT_texture3D = 1;
def GL_PACK_SKIP_IMAGES_EXT = 0x806B;
def GL_PACK_IMAGE_HEIGHT_EXT = 0x806C;
def GL_UNPACK_SKIP_IMAGES_EXT = 0x806D;
def GL_UNPACK_IMAGE_HEIGHT_EXT = 0x806E;
def GL_TEXTURE_3D_EXT = 0x806F;
def GL_PROXY_TEXTURE_3D_EXT = 0x8070;
def GL_TEXTURE_DEPTH_EXT = 0x8071;
def GL_TEXTURE_WRAP_R_EXT = 0x8072;
def GL_MAX_3D_TEXTURE_SIZE_EXT = 0x8073;

def glTexImage3DEXT_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glTexImage3DEXT glTexImage3DEXT_signature;

def glTexSubImage3DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTexSubImage3DEXT glTexSubImage3DEXT_signature;
def GL_EXT_texture_array = 1;
def GL_TEXTURE_1D_ARRAY_EXT = 0x8C18;
def GL_PROXY_TEXTURE_1D_ARRAY_EXT = 0x8C19;
def GL_TEXTURE_2D_ARRAY_EXT = 0x8C1A;
def GL_PROXY_TEXTURE_2D_ARRAY_EXT = 0x8C1B;
def GL_TEXTURE_BINDING_1D_ARRAY_EXT = 0x8C1C;
def GL_TEXTURE_BINDING_2D_ARRAY_EXT = 0x8C1D;
def GL_MAX_ARRAY_TEXTURE_LAYERS_EXT = 0x88FF;
def GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT = 0x884E;

def glFramebufferTextureLayerEXT_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; layer GLint);
var global glFramebufferTextureLayerEXT glFramebufferTextureLayerEXT_signature;
def GL_EXT_texture_buffer_object = 1;
def GL_TEXTURE_BUFFER_EXT = 0x8C2A;
def GL_MAX_TEXTURE_BUFFER_SIZE_EXT = 0x8C2B;
def GL_TEXTURE_BINDING_BUFFER_EXT = 0x8C2C;
def GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT = 0x8C2D;
def GL_TEXTURE_BUFFER_FORMAT_EXT = 0x8C2E;

def glTexBufferEXT_signature func(target GLenum; internalformat GLenum; buffer GLuint);
var global glTexBufferEXT glTexBufferEXT_signature;
def GL_EXT_texture_compression_latc = 1;
def GL_COMPRESSED_LUMINANCE_LATC1_EXT = 0x8C70;
def GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT = 0x8C71;
def GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT = 0x8C72;
def GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT = 0x8C73;
def GL_EXT_texture_compression_rgtc = 1;
def GL_COMPRESSED_RED_RGTC1_EXT = 0x8DBB;
def GL_COMPRESSED_SIGNED_RED_RGTC1_EXT = 0x8DBC;
def GL_COMPRESSED_RED_GREEN_RGTC2_EXT = 0x8DBD;
def GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT = 0x8DBE;
def GL_EXT_texture_compression_s3tc = 1;
def GL_COMPRESSED_RGB_S3TC_DXT1_EXT = 0x83F0;
def GL_COMPRESSED_RGBA_S3TC_DXT1_EXT = 0x83F1;
def GL_COMPRESSED_RGBA_S3TC_DXT3_EXT = 0x83F2;
def GL_COMPRESSED_RGBA_S3TC_DXT5_EXT = 0x83F3;
def GL_EXT_texture_cube_map = 1;
def GL_NORMAL_MAP_EXT = 0x8511;
def GL_REFLECTION_MAP_EXT = 0x8512;
def GL_TEXTURE_CUBE_MAP_EXT = 0x8513;
def GL_TEXTURE_BINDING_CUBE_MAP_EXT = 0x8514;
def GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT = 0x8515;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT = 0x8516;
def GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT = 0x8517;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT = 0x8518;
def GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT = 0x8519;
def GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT = 0x851A;
def GL_PROXY_TEXTURE_CUBE_MAP_EXT = 0x851B;
def GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT = 0x851C;
def GL_EXT_texture_env_add = 1;
def GL_EXT_texture_env_combine = 1;
def GL_COMBINE_EXT = 0x8570;
def GL_COMBINE_RGB_EXT = 0x8571;
def GL_COMBINE_ALPHA_EXT = 0x8572;
def GL_RGB_SCALE_EXT = 0x8573;
def GL_ADD_SIGNED_EXT = 0x8574;
def GL_INTERPOLATE_EXT = 0x8575;
def GL_CONSTANT_EXT = 0x8576;
def GL_PRIMARY_COLOR_EXT = 0x8577;
def GL_PREVIOUS_EXT = 0x8578;
def GL_SOURCE0_RGB_EXT = 0x8580;
def GL_SOURCE1_RGB_EXT = 0x8581;
def GL_SOURCE2_RGB_EXT = 0x8582;
def GL_SOURCE0_ALPHA_EXT = 0x8588;
def GL_SOURCE1_ALPHA_EXT = 0x8589;
def GL_SOURCE2_ALPHA_EXT = 0x858A;
def GL_OPERAND0_RGB_EXT = 0x8590;
def GL_OPERAND1_RGB_EXT = 0x8591;
def GL_OPERAND2_RGB_EXT = 0x8592;
def GL_OPERAND0_ALPHA_EXT = 0x8598;
def GL_OPERAND1_ALPHA_EXT = 0x8599;
def GL_OPERAND2_ALPHA_EXT = 0x859A;
def GL_EXT_texture_env_dot3 = 1;
def GL_DOT3_RGB_EXT = 0x8740;
def GL_DOT3_RGBA_EXT = 0x8741;
def GL_EXT_texture_filter_anisotropic = 1;
def GL_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FE;
def GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FF;
def GL_EXT_texture_filter_minmax = 1;
def GL_TEXTURE_REDUCTION_MODE_EXT = 0x9366;
def GL_WEIGHTED_AVERAGE_EXT = 0x9367;
def GL_EXT_texture_integer = 1;
def GL_RGBA32UI_EXT = 0x8D70;
def GL_RGB32UI_EXT = 0x8D71;
def GL_ALPHA32UI_EXT = 0x8D72;
def GL_INTENSITY32UI_EXT = 0x8D73;
def GL_LUMINANCE32UI_EXT = 0x8D74;
def GL_LUMINANCE_ALPHA32UI_EXT = 0x8D75;
def GL_RGBA16UI_EXT = 0x8D76;
def GL_RGB16UI_EXT = 0x8D77;
def GL_ALPHA16UI_EXT = 0x8D78;
def GL_INTENSITY16UI_EXT = 0x8D79;
def GL_LUMINANCE16UI_EXT = 0x8D7A;
def GL_LUMINANCE_ALPHA16UI_EXT = 0x8D7B;
def GL_RGBA8UI_EXT = 0x8D7C;
def GL_RGB8UI_EXT = 0x8D7D;
def GL_ALPHA8UI_EXT = 0x8D7E;
def GL_INTENSITY8UI_EXT = 0x8D7F;
def GL_LUMINANCE8UI_EXT = 0x8D80;
def GL_LUMINANCE_ALPHA8UI_EXT = 0x8D81;
def GL_RGBA32I_EXT = 0x8D82;
def GL_RGB32I_EXT = 0x8D83;
def GL_ALPHA32I_EXT = 0x8D84;
def GL_INTENSITY32I_EXT = 0x8D85;
def GL_LUMINANCE32I_EXT = 0x8D86;
def GL_LUMINANCE_ALPHA32I_EXT = 0x8D87;
def GL_RGBA16I_EXT = 0x8D88;
def GL_RGB16I_EXT = 0x8D89;
def GL_ALPHA16I_EXT = 0x8D8A;
def GL_INTENSITY16I_EXT = 0x8D8B;
def GL_LUMINANCE16I_EXT = 0x8D8C;
def GL_LUMINANCE_ALPHA16I_EXT = 0x8D8D;
def GL_RGBA8I_EXT = 0x8D8E;
def GL_RGB8I_EXT = 0x8D8F;
def GL_ALPHA8I_EXT = 0x8D90;
def GL_INTENSITY8I_EXT = 0x8D91;
def GL_LUMINANCE8I_EXT = 0x8D92;
def GL_LUMINANCE_ALPHA8I_EXT = 0x8D93;
def GL_RED_INTEGER_EXT = 0x8D94;
def GL_GREEN_INTEGER_EXT = 0x8D95;
def GL_BLUE_INTEGER_EXT = 0x8D96;
def GL_ALPHA_INTEGER_EXT = 0x8D97;
def GL_RGB_INTEGER_EXT = 0x8D98;
def GL_RGBA_INTEGER_EXT = 0x8D99;
def GL_BGR_INTEGER_EXT = 0x8D9A;
def GL_BGRA_INTEGER_EXT = 0x8D9B;
def GL_LUMINANCE_INTEGER_EXT = 0x8D9C;
def GL_LUMINANCE_ALPHA_INTEGER_EXT = 0x8D9D;
def GL_RGBA_INTEGER_MODE_EXT = 0x8D9E;

def glTexParameterIivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glTexParameterIivEXT glTexParameterIivEXT_signature;

def glTexParameterIuivEXT_signature func(target GLenum; pname GLenum; params GLuint ref);
var global glTexParameterIuivEXT glTexParameterIuivEXT_signature;

def glGetTexParameterIivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetTexParameterIivEXT glGetTexParameterIivEXT_signature;

def glGetTexParameterIuivEXT_signature func(target GLenum; pname GLenum; params GLuint ref);
var global glGetTexParameterIuivEXT glGetTexParameterIuivEXT_signature;

def glClearColorIiEXT_signature func(red GLint; green GLint; blue GLint; alpha GLint);
var global glClearColorIiEXT glClearColorIiEXT_signature;

def glClearColorIuiEXT_signature func(red GLuint; green GLuint; blue GLuint; alpha GLuint);
var global glClearColorIuiEXT glClearColorIuiEXT_signature;
def GL_EXT_texture_lod_bias = 1;
def GL_MAX_TEXTURE_LOD_BIAS_EXT = 0x84FD;
def GL_TEXTURE_FILTER_CONTROL_EXT = 0x8500;
def GL_TEXTURE_LOD_BIAS_EXT = 0x8501;
def GL_EXT_texture_mirror_clamp = 1;
def GL_MIRROR_CLAMP_EXT = 0x8742;
def GL_MIRROR_CLAMP_TO_EDGE_EXT = 0x8743;
def GL_MIRROR_CLAMP_TO_BORDER_EXT = 0x8912;
def GL_EXT_texture_object = 1;
def GL_TEXTURE_PRIORITY_EXT = 0x8066;
def GL_TEXTURE_RESIDENT_EXT = 0x8067;
def GL_TEXTURE_1D_BINDING_EXT = 0x8068;
def GL_TEXTURE_2D_BINDING_EXT = 0x8069;
def GL_TEXTURE_3D_BINDING_EXT = 0x806A;

def glAreTexturesResidentEXT_signature func(n GLsizei; textures GLuint ref; residences GLboolean ref) (result GLboolean);
var global glAreTexturesResidentEXT glAreTexturesResidentEXT_signature;

def glBindTextureEXT_signature func(target GLenum; texture GLuint);
var global glBindTextureEXT glBindTextureEXT_signature;

def glDeleteTexturesEXT_signature func(n GLsizei; textures GLuint ref);
var global glDeleteTexturesEXT glDeleteTexturesEXT_signature;

def glGenTexturesEXT_signature func(n GLsizei; textures GLuint ref);
var global glGenTexturesEXT glGenTexturesEXT_signature;

def glIsTextureEXT_signature func(texture GLuint) (result GLboolean);
var global glIsTextureEXT glIsTextureEXT_signature;

def glPrioritizeTexturesEXT_signature func(n GLsizei; textures GLuint ref; priorities GLclampf ref);
var global glPrioritizeTexturesEXT glPrioritizeTexturesEXT_signature;
def GL_EXT_texture_perturb_normal = 1;
def GL_PERTURB_EXT = 0x85AE;
def GL_TEXTURE_NORMAL_EXT = 0x85AF;

def glTextureNormalEXT_signature func(mode GLenum);
var global glTextureNormalEXT glTextureNormalEXT_signature;
def GL_EXT_texture_sRGB = 1;
def GL_SRGB_EXT = 0x8C40;
def GL_SRGB8_EXT = 0x8C41;
def GL_SRGB_ALPHA_EXT = 0x8C42;
def GL_SRGB8_ALPHA8_EXT = 0x8C43;
def GL_SLUMINANCE_ALPHA_EXT = 0x8C44;
def GL_SLUMINANCE8_ALPHA8_EXT = 0x8C45;
def GL_SLUMINANCE_EXT = 0x8C46;
def GL_SLUMINANCE8_EXT = 0x8C47;
def GL_COMPRESSED_SRGB_EXT = 0x8C48;
def GL_COMPRESSED_SRGB_ALPHA_EXT = 0x8C49;
def GL_COMPRESSED_SLUMINANCE_EXT = 0x8C4A;
def GL_COMPRESSED_SLUMINANCE_ALPHA_EXT = 0x8C4B;
def GL_COMPRESSED_SRGB_S3TC_DXT1_EXT = 0x8C4C;
def GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT = 0x8C4D;
def GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT = 0x8C4E;
def GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT = 0x8C4F;
def GL_EXT_texture_sRGB_R8 = 1;
def GL_SR8_EXT = 0x8FBD;
def GL_EXT_texture_sRGB_RG8 = 1;
def GL_SRG8_EXT = 0x8FBE;
def GL_EXT_texture_sRGB_decode = 1;
def GL_TEXTURE_SRGB_DECODE_EXT = 0x8A48;
def GL_DECODE_EXT = 0x8A49;
def GL_SKIP_DECODE_EXT = 0x8A4A;
def GL_EXT_texture_shadow_lod = 1;
def GL_EXT_texture_shared_exponent = 1;
def GL_RGB9_E5_EXT = 0x8C3D;
def GL_UNSIGNED_INT_5_9_9_9_REV_EXT = 0x8C3E;
def GL_TEXTURE_SHARED_SIZE_EXT = 0x8C3F;
def GL_EXT_texture_snorm = 1;
def GL_ALPHA_SNORM = 0x9010;
def GL_LUMINANCE_SNORM = 0x9011;
def GL_LUMINANCE_ALPHA_SNORM = 0x9012;
def GL_INTENSITY_SNORM = 0x9013;
def GL_ALPHA8_SNORM = 0x9014;
def GL_LUMINANCE8_SNORM = 0x9015;
def GL_LUMINANCE8_ALPHA8_SNORM = 0x9016;
def GL_INTENSITY8_SNORM = 0x9017;
def GL_ALPHA16_SNORM = 0x9018;
def GL_LUMINANCE16_SNORM = 0x9019;
def GL_LUMINANCE16_ALPHA16_SNORM = 0x901A;
def GL_INTENSITY16_SNORM = 0x901B;
def GL_RED_SNORM = 0x8F90;
def GL_RG_SNORM = 0x8F91;
def GL_RGB_SNORM = 0x8F92;
def GL_RGBA_SNORM = 0x8F93;
def GL_EXT_texture_storage = 1;
def GL_TEXTURE_IMMUTABLE_FORMAT_EXT = 0x912F;
def GL_RGBA32F_EXT = 0x8814;
def GL_RGB32F_EXT = 0x8815;
def GL_ALPHA32F_EXT = 0x8816;
def GL_LUMINANCE32F_EXT = 0x8818;
def GL_LUMINANCE_ALPHA32F_EXT = 0x8819;
def GL_RGBA16F_EXT = 0x881A;
def GL_RGB16F_EXT = 0x881B;
def GL_ALPHA16F_EXT = 0x881C;
def GL_LUMINANCE16F_EXT = 0x881E;
def GL_LUMINANCE_ALPHA16F_EXT = 0x881F;
def GL_BGRA8_EXT = 0x93A1;
def GL_R8_EXT = 0x8229;
def GL_RG8_EXT = 0x822B;
def GL_R32F_EXT = 0x822E;
def GL_RG32F_EXT = 0x8230;
def GL_R16F_EXT = 0x822D;
def GL_RG16F_EXT = 0x822F;

def glTexStorage1DEXT_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei);
var global glTexStorage1DEXT glTexStorage1DEXT_signature;

def glTexStorage2DEXT_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glTexStorage2DEXT glTexStorage2DEXT_signature;

def glTexStorage3DEXT_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var global glTexStorage3DEXT glTexStorage3DEXT_signature;
def GL_EXT_texture_swizzle = 1;
def GL_TEXTURE_SWIZZLE_R_EXT = 0x8E42;
def GL_TEXTURE_SWIZZLE_G_EXT = 0x8E43;
def GL_TEXTURE_SWIZZLE_B_EXT = 0x8E44;
def GL_TEXTURE_SWIZZLE_A_EXT = 0x8E45;
def GL_TEXTURE_SWIZZLE_RGBA_EXT = 0x8E46;
def GL_EXT_timer_query = 1;
def GL_TIME_ELAPSED_EXT = 0x88BF;

def glGetQueryObjecti64vEXT_signature func(id GLuint; pname GLenum; params GLint64 ref);
var global glGetQueryObjecti64vEXT glGetQueryObjecti64vEXT_signature;

def glGetQueryObjectui64vEXT_signature func(id GLuint; pname GLenum; params GLuint64 ref);
var global glGetQueryObjectui64vEXT glGetQueryObjectui64vEXT_signature;
def GL_EXT_transform_feedback = 1;
def GL_TRANSFORM_FEEDBACK_BUFFER_EXT = 0x8C8E;
def GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT = 0x8C84;
def GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT = 0x8C85;
def GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT = 0x8C8F;
def GL_INTERLEAVED_ATTRIBS_EXT = 0x8C8C;
def GL_SEPARATE_ATTRIBS_EXT = 0x8C8D;
def GL_PRIMITIVES_GENERATED_EXT = 0x8C87;
def GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT = 0x8C88;
def GL_RASTERIZER_DISCARD_EXT = 0x8C89;
def GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT = 0x8C8A;
def GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT = 0x8C8B;
def GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT = 0x8C80;
def GL_TRANSFORM_FEEDBACK_VARYINGS_EXT = 0x8C83;
def GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT = 0x8C7F;
def GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT = 0x8C76;

def glBeginTransformFeedbackEXT_signature func(primitiveMode GLenum);
var global glBeginTransformFeedbackEXT glBeginTransformFeedbackEXT_signature;

def glEndTransformFeedbackEXT_signature func();
var global glEndTransformFeedbackEXT glEndTransformFeedbackEXT_signature;

def glBindBufferRangeEXT_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glBindBufferRangeEXT glBindBufferRangeEXT_signature;

def glBindBufferOffsetEXT_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr);
var global glBindBufferOffsetEXT glBindBufferOffsetEXT_signature;

def glBindBufferBaseEXT_signature func(target GLenum; index GLuint; buffer GLuint);
var global glBindBufferBaseEXT glBindBufferBaseEXT_signature;

def glTransformFeedbackVaryingsEXT_signature func(program GLuint; count GLsizei; varyings GLchar ref ref; bufferMode GLenum);
var global glTransformFeedbackVaryingsEXT glTransformFeedbackVaryingsEXT_signature;

def glGetTransformFeedbackVaryingEXT_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLsizei ref; type GLenum ref; name GLchar ref);
var global glGetTransformFeedbackVaryingEXT glGetTransformFeedbackVaryingEXT_signature;

def glArrayElementEXT_signature func(i GLint);
var global glArrayElementEXT glArrayElementEXT_signature;

def glColorPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var global glColorPointerEXT glColorPointerEXT_signature;

def glDrawArraysEXT_signature func(mode GLenum; first GLint; count GLsizei);
var global glDrawArraysEXT glDrawArraysEXT_signature;

def glEdgeFlagPointerEXT_signature func(stride GLsizei; count GLsizei; pointer GLboolean ref);
var global glEdgeFlagPointerEXT glEdgeFlagPointerEXT_signature;

def glGetPointervEXT_signature func(pname GLenum; params u8 ref ref);
var global glGetPointervEXT glGetPointervEXT_signature;

def glIndexPointerEXT_signature func(type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var global glIndexPointerEXT glIndexPointerEXT_signature;

def glNormalPointerEXT_signature func(type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var global glNormalPointerEXT glNormalPointerEXT_signature;

def glTexCoordPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var global glTexCoordPointerEXT glTexCoordPointerEXT_signature;

def glVertexPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var global glVertexPointerEXT glVertexPointerEXT_signature;
def GL_EXT_vertex_array_bgra = 1;
def GL_EXT_vertex_attrib_64bit = 1;
def GL_DOUBLE_VEC2_EXT = 0x8FFC;
def GL_DOUBLE_VEC3_EXT = 0x8FFD;
def GL_DOUBLE_VEC4_EXT = 0x8FFE;
def GL_DOUBLE_MAT2_EXT = 0x8F46;
def GL_DOUBLE_MAT3_EXT = 0x8F47;
def GL_DOUBLE_MAT4_EXT = 0x8F48;
def GL_DOUBLE_MAT2x3_EXT = 0x8F49;
def GL_DOUBLE_MAT2x4_EXT = 0x8F4A;
def GL_DOUBLE_MAT3x2_EXT = 0x8F4B;
def GL_DOUBLE_MAT3x4_EXT = 0x8F4C;
def GL_DOUBLE_MAT4x2_EXT = 0x8F4D;
def GL_DOUBLE_MAT4x3_EXT = 0x8F4E;

def glVertexAttribL1dEXT_signature func(index GLuint; x GLdouble);
var global glVertexAttribL1dEXT glVertexAttribL1dEXT_signature;

def glVertexAttribL2dEXT_signature func(index GLuint; x GLdouble; y GLdouble);
var global glVertexAttribL2dEXT glVertexAttribL2dEXT_signature;

def glVertexAttribL3dEXT_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var global glVertexAttribL3dEXT glVertexAttribL3dEXT_signature;

def glVertexAttribL4dEXT_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glVertexAttribL4dEXT glVertexAttribL4dEXT_signature;

def glVertexAttribL1dvEXT_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL1dvEXT glVertexAttribL1dvEXT_signature;

def glVertexAttribL2dvEXT_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL2dvEXT glVertexAttribL2dvEXT_signature;

def glVertexAttribL3dvEXT_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL3dvEXT glVertexAttribL3dvEXT_signature;

def glVertexAttribL4dvEXT_signature func(index GLuint; v GLdouble ref);
var global glVertexAttribL4dvEXT glVertexAttribL4dvEXT_signature;

def glVertexAttribLPointerEXT_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glVertexAttribLPointerEXT glVertexAttribLPointerEXT_signature;

def glGetVertexAttribLdvEXT_signature func(index GLuint; pname GLenum; params GLdouble ref);
var global glGetVertexAttribLdvEXT glGetVertexAttribLdvEXT_signature;
def GL_EXT_vertex_shader = 1;
def GL_VERTEX_SHADER_EXT = 0x8780;
def GL_VERTEX_SHADER_BINDING_EXT = 0x8781;
def GL_OP_INDEX_EXT = 0x8782;
def GL_OP_NEGATE_EXT = 0x8783;
def GL_OP_DOT3_EXT = 0x8784;
def GL_OP_DOT4_EXT = 0x8785;
def GL_OP_MUL_EXT = 0x8786;
def GL_OP_ADD_EXT = 0x8787;
def GL_OP_MADD_EXT = 0x8788;
def GL_OP_FRAC_EXT = 0x8789;
def GL_OP_MAX_EXT = 0x878A;
def GL_OP_MIN_EXT = 0x878B;
def GL_OP_SET_GE_EXT = 0x878C;
def GL_OP_SET_LT_EXT = 0x878D;
def GL_OP_CLAMP_EXT = 0x878E;
def GL_OP_FLOOR_EXT = 0x878F;
def GL_OP_ROUND_EXT = 0x8790;
def GL_OP_EXP_BASE_2_EXT = 0x8791;
def GL_OP_LOG_BASE_2_EXT = 0x8792;
def GL_OP_POWER_EXT = 0x8793;
def GL_OP_RECIP_EXT = 0x8794;
def GL_OP_RECIP_SQRT_EXT = 0x8795;
def GL_OP_SUB_EXT = 0x8796;
def GL_OP_CROSS_PRODUCT_EXT = 0x8797;
def GL_OP_MULTIPLY_MATRIX_EXT = 0x8798;
def GL_OP_MOV_EXT = 0x8799;
def GL_OUTPUT_VERTEX_EXT = 0x879A;
def GL_OUTPUT_COLOR0_EXT = 0x879B;
def GL_OUTPUT_COLOR1_EXT = 0x879C;
def GL_OUTPUT_TEXTURE_COORD0_EXT = 0x879D;
def GL_OUTPUT_TEXTURE_COORD1_EXT = 0x879E;
def GL_OUTPUT_TEXTURE_COORD2_EXT = 0x879F;
def GL_OUTPUT_TEXTURE_COORD3_EXT = 0x87A0;
def GL_OUTPUT_TEXTURE_COORD4_EXT = 0x87A1;
def GL_OUTPUT_TEXTURE_COORD5_EXT = 0x87A2;
def GL_OUTPUT_TEXTURE_COORD6_EXT = 0x87A3;
def GL_OUTPUT_TEXTURE_COORD7_EXT = 0x87A4;
def GL_OUTPUT_TEXTURE_COORD8_EXT = 0x87A5;
def GL_OUTPUT_TEXTURE_COORD9_EXT = 0x87A6;
def GL_OUTPUT_TEXTURE_COORD10_EXT = 0x87A7;
def GL_OUTPUT_TEXTURE_COORD11_EXT = 0x87A8;
def GL_OUTPUT_TEXTURE_COORD12_EXT = 0x87A9;
def GL_OUTPUT_TEXTURE_COORD13_EXT = 0x87AA;
def GL_OUTPUT_TEXTURE_COORD14_EXT = 0x87AB;
def GL_OUTPUT_TEXTURE_COORD15_EXT = 0x87AC;
def GL_OUTPUT_TEXTURE_COORD16_EXT = 0x87AD;
def GL_OUTPUT_TEXTURE_COORD17_EXT = 0x87AE;
def GL_OUTPUT_TEXTURE_COORD18_EXT = 0x87AF;
def GL_OUTPUT_TEXTURE_COORD19_EXT = 0x87B0;
def GL_OUTPUT_TEXTURE_COORD20_EXT = 0x87B1;
def GL_OUTPUT_TEXTURE_COORD21_EXT = 0x87B2;
def GL_OUTPUT_TEXTURE_COORD22_EXT = 0x87B3;
def GL_OUTPUT_TEXTURE_COORD23_EXT = 0x87B4;
def GL_OUTPUT_TEXTURE_COORD24_EXT = 0x87B5;
def GL_OUTPUT_TEXTURE_COORD25_EXT = 0x87B6;
def GL_OUTPUT_TEXTURE_COORD26_EXT = 0x87B7;
def GL_OUTPUT_TEXTURE_COORD27_EXT = 0x87B8;
def GL_OUTPUT_TEXTURE_COORD28_EXT = 0x87B9;
def GL_OUTPUT_TEXTURE_COORD29_EXT = 0x87BA;
def GL_OUTPUT_TEXTURE_COORD30_EXT = 0x87BB;
def GL_OUTPUT_TEXTURE_COORD31_EXT = 0x87BC;
def GL_OUTPUT_FOG_EXT = 0x87BD;
def GL_SCALAR_EXT = 0x87BE;
def GL_VECTOR_EXT = 0x87BF;
def GL_MATRIX_EXT = 0x87C0;
def GL_VARIANT_EXT = 0x87C1;
def GL_INVARIANT_EXT = 0x87C2;
def GL_LOCAL_CONSTANT_EXT = 0x87C3;
def GL_LOCAL_EXT = 0x87C4;
def GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87C5;
def GL_MAX_VERTEX_SHADER_VARIANTS_EXT = 0x87C6;
def GL_MAX_VERTEX_SHADER_INVARIANTS_EXT = 0x87C7;
def GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87C8;
def GL_MAX_VERTEX_SHADER_LOCALS_EXT = 0x87C9;
def GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CA;
def GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT = 0x87CB;
def GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87CC;
def GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT = 0x87CD;
def GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT = 0x87CE;
def GL_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CF;
def GL_VERTEX_SHADER_VARIANTS_EXT = 0x87D0;
def GL_VERTEX_SHADER_INVARIANTS_EXT = 0x87D1;
def GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87D2;
def GL_VERTEX_SHADER_LOCALS_EXT = 0x87D3;
def GL_VERTEX_SHADER_OPTIMIZED_EXT = 0x87D4;
def GL_X_EXT = 0x87D5;
def GL_Y_EXT = 0x87D6;
def GL_Z_EXT = 0x87D7;
def GL_W_EXT = 0x87D8;
def GL_NEGATIVE_X_EXT = 0x87D9;
def GL_NEGATIVE_Y_EXT = 0x87DA;
def GL_NEGATIVE_Z_EXT = 0x87DB;
def GL_NEGATIVE_W_EXT = 0x87DC;
def GL_ZERO_EXT = 0x87DD;
def GL_ONE_EXT = 0x87DE;
def GL_NEGATIVE_ONE_EXT = 0x87DF;
def GL_NORMALIZED_RANGE_EXT = 0x87E0;
def GL_FULL_RANGE_EXT = 0x87E1;
def GL_CURRENT_VERTEX_EXT = 0x87E2;
def GL_MVP_MATRIX_EXT = 0x87E3;
def GL_VARIANT_VALUE_EXT = 0x87E4;
def GL_VARIANT_DATATYPE_EXT = 0x87E5;
def GL_VARIANT_ARRAY_STRIDE_EXT = 0x87E6;
def GL_VARIANT_ARRAY_TYPE_EXT = 0x87E7;
def GL_VARIANT_ARRAY_EXT = 0x87E8;
def GL_VARIANT_ARRAY_POINTER_EXT = 0x87E9;
def GL_INVARIANT_VALUE_EXT = 0x87EA;
def GL_INVARIANT_DATATYPE_EXT = 0x87EB;
def GL_LOCAL_CONSTANT_VALUE_EXT = 0x87EC;
def GL_LOCAL_CONSTANT_DATATYPE_EXT = 0x87ED;

def glBeginVertexShaderEXT_signature func();
var global glBeginVertexShaderEXT glBeginVertexShaderEXT_signature;

def glEndVertexShaderEXT_signature func();
var global glEndVertexShaderEXT glEndVertexShaderEXT_signature;

def glBindVertexShaderEXT_signature func(id GLuint);
var global glBindVertexShaderEXT glBindVertexShaderEXT_signature;

def glGenVertexShadersEXT_signature func(range GLuint) (result GLuint);
var global glGenVertexShadersEXT glGenVertexShadersEXT_signature;

def glDeleteVertexShaderEXT_signature func(id GLuint);
var global glDeleteVertexShaderEXT glDeleteVertexShaderEXT_signature;

def glShaderOp1EXT_signature func(op GLenum; res GLuint; arg1 GLuint);
var global glShaderOp1EXT glShaderOp1EXT_signature;

def glShaderOp2EXT_signature func(op GLenum; res GLuint; arg1 GLuint; arg2 GLuint);
var global glShaderOp2EXT glShaderOp2EXT_signature;

def glShaderOp3EXT_signature func(op GLenum; res GLuint; arg1 GLuint; arg2 GLuint; arg3 GLuint);
var global glShaderOp3EXT glShaderOp3EXT_signature;

def glSwizzleEXT_signature func(res GLuint; in GLuint; outX GLenum; outY GLenum; outZ GLenum; outW GLenum);
var global glSwizzleEXT glSwizzleEXT_signature;

def glWriteMaskEXT_signature func(res GLuint; in GLuint; outX GLenum; outY GLenum; outZ GLenum; outW GLenum);
var global glWriteMaskEXT glWriteMaskEXT_signature;

def glInsertComponentEXT_signature func(res GLuint; src GLuint; num GLuint);
var global glInsertComponentEXT glInsertComponentEXT_signature;

def glExtractComponentEXT_signature func(res GLuint; src GLuint; num GLuint);
var global glExtractComponentEXT glExtractComponentEXT_signature;

def glGenSymbolsEXT_signature func(datatype GLenum; storagetype GLenum; range GLenum; components GLuint) (result GLuint);
var global glGenSymbolsEXT glGenSymbolsEXT_signature;

def glSetInvariantEXT_signature func(id GLuint; type GLenum; addr u8 ref);
var global glSetInvariantEXT glSetInvariantEXT_signature;

def glSetLocalConstantEXT_signature func(id GLuint; type GLenum; addr u8 ref);
var global glSetLocalConstantEXT glSetLocalConstantEXT_signature;

def glVariantbvEXT_signature func(id GLuint; addr GLbyte ref);
var global glVariantbvEXT glVariantbvEXT_signature;

def glVariantsvEXT_signature func(id GLuint; addr GLshort ref);
var global glVariantsvEXT glVariantsvEXT_signature;

def glVariantivEXT_signature func(id GLuint; addr GLint ref);
var global glVariantivEXT glVariantivEXT_signature;

def glVariantfvEXT_signature func(id GLuint; addr GLfloat ref);
var global glVariantfvEXT glVariantfvEXT_signature;

def glVariantdvEXT_signature func(id GLuint; addr GLdouble ref);
var global glVariantdvEXT glVariantdvEXT_signature;

def glVariantubvEXT_signature func(id GLuint; addr GLubyte ref);
var global glVariantubvEXT glVariantubvEXT_signature;

def glVariantusvEXT_signature func(id GLuint; addr GLushort ref);
var global glVariantusvEXT glVariantusvEXT_signature;

def glVariantuivEXT_signature func(id GLuint; addr GLuint ref);
var global glVariantuivEXT glVariantuivEXT_signature;

def glVariantPointerEXT_signature func(id GLuint; type GLenum; stride GLuint; addr u8 ref);
var global glVariantPointerEXT glVariantPointerEXT_signature;

def glEnableVariantClientStateEXT_signature func(id GLuint);
var global glEnableVariantClientStateEXT glEnableVariantClientStateEXT_signature;

def glDisableVariantClientStateEXT_signature func(id GLuint);
var global glDisableVariantClientStateEXT glDisableVariantClientStateEXT_signature;

def glBindLightParameterEXT_signature func(light GLenum; value GLenum) (result GLuint);
var global glBindLightParameterEXT glBindLightParameterEXT_signature;

def glBindMaterialParameterEXT_signature func(face GLenum; value GLenum) (result GLuint);
var global glBindMaterialParameterEXT glBindMaterialParameterEXT_signature;

def glBindTexGenParameterEXT_signature func(unit GLenum; coord GLenum; value GLenum) (result GLuint);
var global glBindTexGenParameterEXT glBindTexGenParameterEXT_signature;

def glBindTextureUnitParameterEXT_signature func(unit GLenum; value GLenum) (result GLuint);
var global glBindTextureUnitParameterEXT glBindTextureUnitParameterEXT_signature;

def glBindParameterEXT_signature func(value GLenum) (result GLuint);
var global glBindParameterEXT glBindParameterEXT_signature;

def glIsVariantEnabledEXT_signature func(id GLuint; cap GLenum) (result GLboolean);
var global glIsVariantEnabledEXT glIsVariantEnabledEXT_signature;

def glGetVariantBooleanvEXT_signature func(id GLuint; value GLenum; data GLboolean ref);
var global glGetVariantBooleanvEXT glGetVariantBooleanvEXT_signature;

def glGetVariantIntegervEXT_signature func(id GLuint; value GLenum; data GLint ref);
var global glGetVariantIntegervEXT glGetVariantIntegervEXT_signature;

def glGetVariantFloatvEXT_signature func(id GLuint; value GLenum; data GLfloat ref);
var global glGetVariantFloatvEXT glGetVariantFloatvEXT_signature;

def glGetVariantPointervEXT_signature func(id GLuint; value GLenum; data u8 ref ref);
var global glGetVariantPointervEXT glGetVariantPointervEXT_signature;

def glGetInvariantBooleanvEXT_signature func(id GLuint; value GLenum; data GLboolean ref);
var global glGetInvariantBooleanvEXT glGetInvariantBooleanvEXT_signature;

def glGetInvariantIntegervEXT_signature func(id GLuint; value GLenum; data GLint ref);
var global glGetInvariantIntegervEXT glGetInvariantIntegervEXT_signature;

def glGetInvariantFloatvEXT_signature func(id GLuint; value GLenum; data GLfloat ref);
var global glGetInvariantFloatvEXT glGetInvariantFloatvEXT_signature;

def glGetLocalConstantBooleanvEXT_signature func(id GLuint; value GLenum; data GLboolean ref);
var global glGetLocalConstantBooleanvEXT glGetLocalConstantBooleanvEXT_signature;

def glGetLocalConstantIntegervEXT_signature func(id GLuint; value GLenum; data GLint ref);
var global glGetLocalConstantIntegervEXT glGetLocalConstantIntegervEXT_signature;

def glGetLocalConstantFloatvEXT_signature func(id GLuint; value GLenum; data GLfloat ref);
var global glGetLocalConstantFloatvEXT glGetLocalConstantFloatvEXT_signature;
def GL_EXT_vertex_weighting = 1;
def GL_MODELVIEW0_STACK_DEPTH_EXT = 0x0BA3;
def GL_MODELVIEW1_STACK_DEPTH_EXT = 0x8502;
def GL_MODELVIEW0_MATRIX_EXT = 0x0BA6;
def GL_MODELVIEW1_MATRIX_EXT = 0x8506;
def GL_VERTEX_WEIGHTING_EXT = 0x8509;
def GL_MODELVIEW0_EXT = 0x1700;
def GL_MODELVIEW1_EXT = 0x850A;
def GL_CURRENT_VERTEX_WEIGHT_EXT = 0x850B;
def GL_VERTEX_WEIGHT_ARRAY_EXT = 0x850C;
def GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT = 0x850D;
def GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT = 0x850E;
def GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT = 0x850F;
def GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT = 0x8510;

def glVertexWeightfEXT_signature func(weight GLfloat);
var global glVertexWeightfEXT glVertexWeightfEXT_signature;

def glVertexWeightfvEXT_signature func(weight GLfloat ref);
var global glVertexWeightfvEXT glVertexWeightfvEXT_signature;

def glVertexWeightPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glVertexWeightPointerEXT glVertexWeightPointerEXT_signature;
def GL_EXT_win32_keyed_mutex = 1;

def glAcquireKeyedMutexWin32EXT_signature func(memory GLuint; key GLuint64; timeout GLuint) (result GLboolean);
var global glAcquireKeyedMutexWin32EXT glAcquireKeyedMutexWin32EXT_signature;

def glReleaseKeyedMutexWin32EXT_signature func(memory GLuint; key GLuint64) (result GLboolean);
var global glReleaseKeyedMutexWin32EXT glReleaseKeyedMutexWin32EXT_signature;
def GL_EXT_window_rectangles = 1;
def GL_INCLUSIVE_EXT = 0x8F10;
def GL_EXCLUSIVE_EXT = 0x8F11;
def GL_WINDOW_RECTANGLE_EXT = 0x8F12;
def GL_WINDOW_RECTANGLE_MODE_EXT = 0x8F13;
def GL_MAX_WINDOW_RECTANGLES_EXT = 0x8F14;
def GL_NUM_WINDOW_RECTANGLES_EXT = 0x8F15;

def glWindowRectanglesEXT_signature func(mode GLenum; count GLsizei; box GLint ref);
var global glWindowRectanglesEXT glWindowRectanglesEXT_signature;
def GL_EXT_x11_sync_object = 1;
def GL_SYNC_X11_FENCE_EXT = 0x90E1;

def glImportSyncEXT_signature func(external_sync_type GLenum; external_sync GLintptr; flags GLbitfield) (result GLsync);
var global glImportSyncEXT glImportSyncEXT_signature;
def GL_GREMEDY_frame_terminator = 1;

def glFrameTerminatorGREMEDY_signature func();
var global glFrameTerminatorGREMEDY glFrameTerminatorGREMEDY_signature;
def GL_GREMEDY_string_marker = 1;

def glStringMarkerGREMEDY_signature func(len GLsizei; string u8 ref);
var global glStringMarkerGREMEDY glStringMarkerGREMEDY_signature;
def GL_HP_convolution_border_modes = 1;
def GL_IGNORE_BORDER_HP = 0x8150;
def GL_CONSTANT_BORDER_HP = 0x8151;
def GL_REPLICATE_BORDER_HP = 0x8153;
def GL_CONVOLUTION_BORDER_COLOR_HP = 0x8154;
def GL_HP_image_transform = 1;
def GL_IMAGE_SCALE_X_HP = 0x8155;
def GL_IMAGE_SCALE_Y_HP = 0x8156;
def GL_IMAGE_TRANSLATE_X_HP = 0x8157;
def GL_IMAGE_TRANSLATE_Y_HP = 0x8158;
def GL_IMAGE_ROTATE_ANGLE_HP = 0x8159;
def GL_IMAGE_ROTATE_ORIGIN_X_HP = 0x815A;
def GL_IMAGE_ROTATE_ORIGIN_Y_HP = 0x815B;
def GL_IMAGE_MAG_FILTER_HP = 0x815C;
def GL_IMAGE_MIN_FILTER_HP = 0x815D;
def GL_IMAGE_CUBIC_WEIGHT_HP = 0x815E;
def GL_CUBIC_HP = 0x815F;
def GL_AVERAGE_HP = 0x8160;
def GL_IMAGE_TRANSFORM_2D_HP = 0x8161;
def GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8162;
def GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8163;

def glImageTransformParameteriHP_signature func(target GLenum; pname GLenum; param GLint);
var global glImageTransformParameteriHP glImageTransformParameteriHP_signature;

def glImageTransformParameterfHP_signature func(target GLenum; pname GLenum; param GLfloat);
var global glImageTransformParameterfHP glImageTransformParameterfHP_signature;

def glImageTransformParameterivHP_signature func(target GLenum; pname GLenum; params GLint ref);
var global glImageTransformParameterivHP glImageTransformParameterivHP_signature;

def glImageTransformParameterfvHP_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glImageTransformParameterfvHP glImageTransformParameterfvHP_signature;

def glGetImageTransformParameterivHP_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetImageTransformParameterivHP glGetImageTransformParameterivHP_signature;

def glGetImageTransformParameterfvHP_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetImageTransformParameterfvHP glGetImageTransformParameterfvHP_signature;
def GL_HP_occlusion_test = 1;
def GL_OCCLUSION_TEST_HP = 0x8165;
def GL_OCCLUSION_TEST_RESULT_HP = 0x8166;
def GL_HP_texture_lighting = 1;
def GL_TEXTURE_LIGHTING_MODE_HP = 0x8167;
def GL_TEXTURE_POST_SPECULAR_HP = 0x8168;
def GL_TEXTURE_PRE_SPECULAR_HP = 0x8169;
def GL_IBM_cull_vertex = 1;
def GL_CULL_VERTEX_IBM = 103050;
def GL_IBM_multimode_draw_arrays = 1;

def glMultiModeDrawArraysIBM_signature func(mode GLenum ref; first GLint ref; count GLsizei ref; primcount GLsizei; modestride GLint);
var global glMultiModeDrawArraysIBM glMultiModeDrawArraysIBM_signature;

def glMultiModeDrawElementsIBM_signature func(mode GLenum ref; count GLsizei ref; type GLenum; indices u8 ref ref; primcount GLsizei; modestride GLint);
var global glMultiModeDrawElementsIBM glMultiModeDrawElementsIBM_signature;
def GL_IBM_rasterpos_clip = 1;
def GL_RASTER_POSITION_UNCLIPPED_IBM = 0x19262;
def GL_IBM_static_data = 1;
def GL_ALL_STATIC_DATA_IBM = 103060;
def GL_STATIC_VERTEX_ARRAY_IBM = 103061;

def glFlushStaticDataIBM_signature func(target GLenum);
var global glFlushStaticDataIBM glFlushStaticDataIBM_signature;
def GL_IBM_texture_mirrored_repeat = 1;
def GL_MIRRORED_REPEAT_IBM = 0x8370;
def GL_IBM_vertex_array_lists = 1;
def GL_VERTEX_ARRAY_LIST_IBM = 103070;
def GL_NORMAL_ARRAY_LIST_IBM = 103071;
def GL_COLOR_ARRAY_LIST_IBM = 103072;
def GL_INDEX_ARRAY_LIST_IBM = 103073;
def GL_TEXTURE_COORD_ARRAY_LIST_IBM = 103074;
def GL_EDGE_FLAG_ARRAY_LIST_IBM = 103075;
def GL_FOG_COORDINATE_ARRAY_LIST_IBM = 103076;
def GL_SECONDARY_COLOR_ARRAY_LIST_IBM = 103077;
def GL_VERTEX_ARRAY_LIST_STRIDE_IBM = 103080;
def GL_NORMAL_ARRAY_LIST_STRIDE_IBM = 103081;
def GL_COLOR_ARRAY_LIST_STRIDE_IBM = 103082;
def GL_INDEX_ARRAY_LIST_STRIDE_IBM = 103083;
def GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM = 103084;
def GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM = 103085;
def GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM = 103086;
def GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM = 103087;

def glColorPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glColorPointerListIBM glColorPointerListIBM_signature;

def glSecondaryColorPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glSecondaryColorPointerListIBM glSecondaryColorPointerListIBM_signature;

def glEdgeFlagPointerListIBM_signature func(stride GLint; pointer GLboolean ref ref; ptrstride GLint);
var global glEdgeFlagPointerListIBM glEdgeFlagPointerListIBM_signature;

def glFogCoordPointerListIBM_signature func(type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glFogCoordPointerListIBM glFogCoordPointerListIBM_signature;

def glIndexPointerListIBM_signature func(type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glIndexPointerListIBM glIndexPointerListIBM_signature;

def glNormalPointerListIBM_signature func(type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glNormalPointerListIBM glNormalPointerListIBM_signature;

def glTexCoordPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glTexCoordPointerListIBM glTexCoordPointerListIBM_signature;

def glVertexPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var global glVertexPointerListIBM glVertexPointerListIBM_signature;
def GL_INGR_blend_func_separate = 1;

def glBlendFuncSeparateINGR_signature func(sfactorRGB GLenum; dfactorRGB GLenum; sfactorAlpha GLenum; dfactorAlpha GLenum);
var global glBlendFuncSeparateINGR glBlendFuncSeparateINGR_signature;
def GL_INGR_color_clamp = 1;
def GL_RED_MIN_CLAMP_INGR = 0x8560;
def GL_GREEN_MIN_CLAMP_INGR = 0x8561;
def GL_BLUE_MIN_CLAMP_INGR = 0x8562;
def GL_ALPHA_MIN_CLAMP_INGR = 0x8563;
def GL_RED_MAX_CLAMP_INGR = 0x8564;
def GL_GREEN_MAX_CLAMP_INGR = 0x8565;
def GL_BLUE_MAX_CLAMP_INGR = 0x8566;
def GL_ALPHA_MAX_CLAMP_INGR = 0x8567;
def GL_INGR_interlace_read = 1;
def GL_INTERLACE_READ_INGR = 0x8568;
def GL_INTEL_blackhole_render = 1;
def GL_BLACKHOLE_RENDER_INTEL = 0x83FC;
def GL_INTEL_conservative_rasterization = 1;
def GL_CONSERVATIVE_RASTERIZATION_INTEL = 0x83FE;
def GL_INTEL_fragment_shader_ordering = 1;
def GL_INTEL_framebuffer_CMAA = 1;

def glApplyFramebufferAttachmentCMAAINTEL_signature func();
var global glApplyFramebufferAttachmentCMAAINTEL glApplyFramebufferAttachmentCMAAINTEL_signature;
def GL_INTEL_map_texture = 1;
def GL_TEXTURE_MEMORY_LAYOUT_INTEL = 0x83FF;
def GL_LAYOUT_DEFAULT_INTEL = 0;
def GL_LAYOUT_LINEAR_INTEL = 1;
def GL_LAYOUT_LINEAR_CPU_CACHED_INTEL = 2;

def glSyncTextureINTEL_signature func(texture GLuint);
var global glSyncTextureINTEL glSyncTextureINTEL_signature;

def glUnmapTexture2DINTEL_signature func(texture GLuint; level GLint);
var global glUnmapTexture2DINTEL glUnmapTexture2DINTEL_signature;

def glMapTexture2DINTEL_signature func(texture GLuint; level GLint; access GLbitfield; stride GLint ref; layout GLenum ref) (result u8 ref);
var global glMapTexture2DINTEL glMapTexture2DINTEL_signature;
def GL_INTEL_parallel_arrays = 1;
def GL_PARALLEL_ARRAYS_INTEL = 0x83F4;
def GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F5;
def GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F6;
def GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F7;
def GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F8;

def glVertexPointervINTEL_signature func(size GLint; type GLenum; pointer u8 ref ref);
var global glVertexPointervINTEL glVertexPointervINTEL_signature;

def glNormalPointervINTEL_signature func(type GLenum; pointer u8 ref ref);
var global glNormalPointervINTEL glNormalPointervINTEL_signature;

def glColorPointervINTEL_signature func(size GLint; type GLenum; pointer u8 ref ref);
var global glColorPointervINTEL glColorPointervINTEL_signature;

def glTexCoordPointervINTEL_signature func(size GLint; type GLenum; pointer u8 ref ref);
var global glTexCoordPointervINTEL glTexCoordPointervINTEL_signature;
def GL_INTEL_performance_query = 1;
def GL_PERFQUERY_SINGLE_CONTEXT_INTEL = 0x00000000;
def GL_PERFQUERY_GLOBAL_CONTEXT_INTEL = 0x00000001;
def GL_PERFQUERY_WAIT_INTEL = 0x83FB;
def GL_PERFQUERY_FLUSH_INTEL = 0x83FA;
def GL_PERFQUERY_DONOT_FLUSH_INTEL = 0x83F9;
def GL_PERFQUERY_COUNTER_EVENT_INTEL = 0x94F0;
def GL_PERFQUERY_COUNTER_DURATION_NORM_INTEL = 0x94F1;
def GL_PERFQUERY_COUNTER_DURATION_RAW_INTEL = 0x94F2;
def GL_PERFQUERY_COUNTER_THROUGHPUT_INTEL = 0x94F3;
def GL_PERFQUERY_COUNTER_RAW_INTEL = 0x94F4;
def GL_PERFQUERY_COUNTER_TIMESTAMP_INTEL = 0x94F5;
def GL_PERFQUERY_COUNTER_DATA_UINT32_INTEL = 0x94F8;
def GL_PERFQUERY_COUNTER_DATA_UINT64_INTEL = 0x94F9;
def GL_PERFQUERY_COUNTER_DATA_FLOAT_INTEL = 0x94FA;
def GL_PERFQUERY_COUNTER_DATA_DOUBLE_INTEL = 0x94FB;
def GL_PERFQUERY_COUNTER_DATA_BOOL32_INTEL = 0x94FC;
def GL_PERFQUERY_QUERY_NAME_LENGTH_MAX_INTEL = 0x94FD;
def GL_PERFQUERY_COUNTER_NAME_LENGTH_MAX_INTEL = 0x94FE;
def GL_PERFQUERY_COUNTER_DESC_LENGTH_MAX_INTEL = 0x94FF;
def GL_PERFQUERY_GPA_EXTENDED_COUNTERS_INTEL = 0x9500;

def glBeginPerfQueryINTEL_signature func(queryHandle GLuint);
var global glBeginPerfQueryINTEL glBeginPerfQueryINTEL_signature;

def glCreatePerfQueryINTEL_signature func(queryId GLuint; queryHandle GLuint ref);
var global glCreatePerfQueryINTEL glCreatePerfQueryINTEL_signature;

def glDeletePerfQueryINTEL_signature func(queryHandle GLuint);
var global glDeletePerfQueryINTEL glDeletePerfQueryINTEL_signature;

def glEndPerfQueryINTEL_signature func(queryHandle GLuint);
var global glEndPerfQueryINTEL glEndPerfQueryINTEL_signature;

def glGetFirstPerfQueryIdINTEL_signature func(queryId GLuint ref);
var global glGetFirstPerfQueryIdINTEL glGetFirstPerfQueryIdINTEL_signature;

def glGetNextPerfQueryIdINTEL_signature func(queryId GLuint; nextQueryId GLuint ref);
var global glGetNextPerfQueryIdINTEL glGetNextPerfQueryIdINTEL_signature;

def glGetPerfCounterInfoINTEL_signature func(queryId GLuint; counterId GLuint; counterNameLength GLuint; counterName GLchar ref; counterDescLength GLuint; counterDesc GLchar ref; counterOffset GLuint ref; counterDataSize GLuint ref; counterTypeEnum GLuint ref; counterDataTypeEnum GLuint ref; rawCounterMaxValue GLuint64 ref);
var global glGetPerfCounterInfoINTEL glGetPerfCounterInfoINTEL_signature;

def glGetPerfQueryDataINTEL_signature func(queryHandle GLuint; flags GLuint; dataSize GLsizei; data u8 ref; bytesWritten GLuint ref);
var global glGetPerfQueryDataINTEL glGetPerfQueryDataINTEL_signature;

def glGetPerfQueryIdByNameINTEL_signature func(queryName GLchar ref; queryId GLuint ref);
var global glGetPerfQueryIdByNameINTEL glGetPerfQueryIdByNameINTEL_signature;

def glGetPerfQueryInfoINTEL_signature func(queryId GLuint; queryNameLength GLuint; queryName GLchar ref; dataSize GLuint ref; noCounters GLuint ref; noInstances GLuint ref; capsMask GLuint ref);
var global glGetPerfQueryInfoINTEL glGetPerfQueryInfoINTEL_signature;
def GL_MESAX_texture_stack = 1;
def GL_TEXTURE_1D_STACK_MESAX = 0x8759;
def GL_TEXTURE_2D_STACK_MESAX = 0x875A;
def GL_PROXY_TEXTURE_1D_STACK_MESAX = 0x875B;
def GL_PROXY_TEXTURE_2D_STACK_MESAX = 0x875C;
def GL_TEXTURE_1D_STACK_BINDING_MESAX = 0x875D;
def GL_TEXTURE_2D_STACK_BINDING_MESAX = 0x875E;
def GL_MESA_framebuffer_flip_x = 1;
def GL_FRAMEBUFFER_FLIP_X_MESA = 0x8BBC;
def GL_MESA_framebuffer_flip_y = 1;
def GL_FRAMEBUFFER_FLIP_Y_MESA = 0x8BBB;

def glFramebufferParameteriMESA_signature func(target GLenum; pname GLenum; param GLint);
var global glFramebufferParameteriMESA glFramebufferParameteriMESA_signature;

def glGetFramebufferParameterivMESA_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetFramebufferParameterivMESA glGetFramebufferParameterivMESA_signature;
def GL_MESA_framebuffer_swap_xy = 1;
def GL_FRAMEBUFFER_SWAP_XY_MESA = 0x8BBD;
def GL_MESA_pack_invert = 1;
def GL_PACK_INVERT_MESA = 0x8758;
def GL_MESA_program_binary_formats = 1;
def GL_PROGRAM_BINARY_FORMAT_MESA = 0x875F;
def GL_MESA_resize_buffers = 1;

def glResizeBuffersMESA_signature func();
var global glResizeBuffersMESA glResizeBuffersMESA_signature;
def GL_MESA_shader_integer_functions = 1;
def GL_MESA_tile_raster_order = 1;
def GL_TILE_RASTER_ORDER_FIXED_MESA = 0x8BB8;
def GL_TILE_RASTER_ORDER_INCREASING_X_MESA = 0x8BB9;
def GL_TILE_RASTER_ORDER_INCREASING_Y_MESA = 0x8BBA;
def GL_MESA_window_pos = 1;

def glWindowPos2dMESA_signature func(x GLdouble; y GLdouble);
var global glWindowPos2dMESA glWindowPos2dMESA_signature;

def glWindowPos2dvMESA_signature func(v GLdouble ref);
var global glWindowPos2dvMESA glWindowPos2dvMESA_signature;

def glWindowPos2fMESA_signature func(x GLfloat; y GLfloat);
var global glWindowPos2fMESA glWindowPos2fMESA_signature;

def glWindowPos2fvMESA_signature func(v GLfloat ref);
var global glWindowPos2fvMESA glWindowPos2fvMESA_signature;

def glWindowPos2iMESA_signature func(x GLint; y GLint);
var global glWindowPos2iMESA glWindowPos2iMESA_signature;

def glWindowPos2ivMESA_signature func(v GLint ref);
var global glWindowPos2ivMESA glWindowPos2ivMESA_signature;

def glWindowPos2sMESA_signature func(x GLshort; y GLshort);
var global glWindowPos2sMESA glWindowPos2sMESA_signature;

def glWindowPos2svMESA_signature func(v GLshort ref);
var global glWindowPos2svMESA glWindowPos2svMESA_signature;

def glWindowPos3dMESA_signature func(x GLdouble; y GLdouble; z GLdouble);
var global glWindowPos3dMESA glWindowPos3dMESA_signature;

def glWindowPos3dvMESA_signature func(v GLdouble ref);
var global glWindowPos3dvMESA glWindowPos3dvMESA_signature;

def glWindowPos3fMESA_signature func(x GLfloat; y GLfloat; z GLfloat);
var global glWindowPos3fMESA glWindowPos3fMESA_signature;

def glWindowPos3fvMESA_signature func(v GLfloat ref);
var global glWindowPos3fvMESA glWindowPos3fvMESA_signature;

def glWindowPos3iMESA_signature func(x GLint; y GLint; z GLint);
var global glWindowPos3iMESA glWindowPos3iMESA_signature;

def glWindowPos3ivMESA_signature func(v GLint ref);
var global glWindowPos3ivMESA glWindowPos3ivMESA_signature;

def glWindowPos3sMESA_signature func(x GLshort; y GLshort; z GLshort);
var global glWindowPos3sMESA glWindowPos3sMESA_signature;

def glWindowPos3svMESA_signature func(v GLshort ref);
var global glWindowPos3svMESA glWindowPos3svMESA_signature;

def glWindowPos4dMESA_signature func(x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glWindowPos4dMESA glWindowPos4dMESA_signature;

def glWindowPos4dvMESA_signature func(v GLdouble ref);
var global glWindowPos4dvMESA glWindowPos4dvMESA_signature;

def glWindowPos4fMESA_signature func(x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glWindowPos4fMESA glWindowPos4fMESA_signature;

def glWindowPos4fvMESA_signature func(v GLfloat ref);
var global glWindowPos4fvMESA glWindowPos4fvMESA_signature;

def glWindowPos4iMESA_signature func(x GLint; y GLint; z GLint; w GLint);
var global glWindowPos4iMESA glWindowPos4iMESA_signature;

def glWindowPos4ivMESA_signature func(v GLint ref);
var global glWindowPos4ivMESA glWindowPos4ivMESA_signature;

def glWindowPos4sMESA_signature func(x GLshort; y GLshort; z GLshort; w GLshort);
var global glWindowPos4sMESA glWindowPos4sMESA_signature;

def glWindowPos4svMESA_signature func(v GLshort ref);
var global glWindowPos4svMESA glWindowPos4svMESA_signature;
def GL_MESA_ycbcr_texture = 1;
def GL_UNSIGNED_SHORT_8_8_MESA = 0x85BA;
def GL_UNSIGNED_SHORT_8_8_REV_MESA = 0x85BB;
def GL_YCBCR_MESA = 0x8757;
def GL_NVX_blend_equation_advanced_multi_draw_buffers = 1;
def GL_NVX_conditional_render = 1;

def glBeginConditionalRenderNVX_signature func(id GLuint);
var global glBeginConditionalRenderNVX glBeginConditionalRenderNVX_signature;

def glEndConditionalRenderNVX_signature func();
var global glEndConditionalRenderNVX glEndConditionalRenderNVX_signature;
def GL_NVX_gpu_memory_info = 1;
def GL_GPU_MEMORY_INFO_DEDICATED_VIDMEM_NVX = 0x9047;
def GL_GPU_MEMORY_INFO_TOTAL_AVAILABLE_MEMORY_NVX = 0x9048;
def GL_GPU_MEMORY_INFO_CURRENT_AVAILABLE_VIDMEM_NVX = 0x9049;
def GL_GPU_MEMORY_INFO_EVICTION_COUNT_NVX = 0x904A;
def GL_GPU_MEMORY_INFO_EVICTED_MEMORY_NVX = 0x904B;
def GL_NVX_gpu_multicast2 = 1;
def GL_UPLOAD_GPU_MASK_NVX = 0x954A;

def glUploadGpuMaskNVX_signature func(mask GLbitfield);
var global glUploadGpuMaskNVX glUploadGpuMaskNVX_signature;

def glMulticastViewportArrayvNVX_signature func(gpu GLuint; first GLuint; count GLsizei; v GLfloat ref);
var global glMulticastViewportArrayvNVX glMulticastViewportArrayvNVX_signature;

def glMulticastViewportPositionWScaleNVX_signature func(gpu GLuint; index GLuint; xcoeff GLfloat; ycoeff GLfloat);
var global glMulticastViewportPositionWScaleNVX glMulticastViewportPositionWScaleNVX_signature;

def glMulticastScissorArrayvNVX_signature func(gpu GLuint; first GLuint; count GLsizei; v GLint ref);
var global glMulticastScissorArrayvNVX glMulticastScissorArrayvNVX_signature;

def glAsyncCopyBufferSubDataNVX_signature func(waitSemaphoreCount GLsizei; waitSemaphoreArray GLuint ref; fenceValueArray GLuint64 ref; readGpu GLuint; writeGpuMask GLbitfield; readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr; signalSemaphoreCount GLsizei; signalSemaphoreArray GLuint ref; signalValueArray GLuint64 ref) (result GLuint);
var global glAsyncCopyBufferSubDataNVX glAsyncCopyBufferSubDataNVX_signature;

def glAsyncCopyImageSubDataNVX_signature func(waitSemaphoreCount GLsizei; waitSemaphoreArray GLuint ref; waitValueArray GLuint64 ref; srcGpu GLuint; dstGpuMask GLbitfield; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; srcWidth GLsizei; srcHeight GLsizei; srcDepth GLsizei; signalSemaphoreCount GLsizei; signalSemaphoreArray GLuint ref; signalValueArray GLuint64 ref) (result GLuint);
var global glAsyncCopyImageSubDataNVX glAsyncCopyImageSubDataNVX_signature;
def GL_NVX_linked_gpu_multicast = 1;
def GL_LGPU_SEPARATE_STORAGE_BIT_NVX = 0x0800;
def GL_MAX_LGPU_GPUS_NVX = 0x92BA;

def glLGPUNamedBufferSubDataNVX_signature func(gpuMask GLbitfield; buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glLGPUNamedBufferSubDataNVX glLGPUNamedBufferSubDataNVX_signature;

def glLGPUCopyImageSubDataNVX_signature func(sourceGpu GLuint; destinationGpuMask GLbitfield; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srxY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; width GLsizei; height GLsizei; depth GLsizei);
var global glLGPUCopyImageSubDataNVX glLGPUCopyImageSubDataNVX_signature;

def glLGPUInterlockNVX_signature func();
var global glLGPUInterlockNVX glLGPUInterlockNVX_signature;
def GL_NVX_progress_fence = 1;

def glCreateProgressFenceNVX_signature func() (result GLuint);
var global glCreateProgressFenceNVX glCreateProgressFenceNVX_signature;

def glSignalSemaphoreui64NVX_signature func(signalGpu GLuint; fenceObjectCount GLsizei; semaphoreArray GLuint ref; fenceValueArray GLuint64 ref);
var global glSignalSemaphoreui64NVX glSignalSemaphoreui64NVX_signature;

def glWaitSemaphoreui64NVX_signature func(waitGpu GLuint; fenceObjectCount GLsizei; semaphoreArray GLuint ref; fenceValueArray GLuint64 ref);
var global glWaitSemaphoreui64NVX glWaitSemaphoreui64NVX_signature;

def glClientWaitSemaphoreui64NVX_signature func(fenceObjectCount GLsizei; semaphoreArray GLuint ref; fenceValueArray GLuint64 ref);
var global glClientWaitSemaphoreui64NVX glClientWaitSemaphoreui64NVX_signature;
def GL_NV_alpha_to_coverage_dither_control = 1;
def GL_ALPHA_TO_COVERAGE_DITHER_DEFAULT_NV = 0x934D;
def GL_ALPHA_TO_COVERAGE_DITHER_ENABLE_NV = 0x934E;
def GL_ALPHA_TO_COVERAGE_DITHER_DISABLE_NV = 0x934F;
def GL_ALPHA_TO_COVERAGE_DITHER_MODE_NV = 0x92BF;

def glAlphaToCoverageDitherControlNV_signature func(mode GLenum);
var global glAlphaToCoverageDitherControlNV glAlphaToCoverageDitherControlNV_signature;
def GL_NV_bindless_multi_draw_indirect = 1;

def glMultiDrawArraysIndirectBindlessNV_signature func(mode GLenum; indirect u8 ref; drawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var global glMultiDrawArraysIndirectBindlessNV glMultiDrawArraysIndirectBindlessNV_signature;

def glMultiDrawElementsIndirectBindlessNV_signature func(mode GLenum; type GLenum; indirect u8 ref; drawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var global glMultiDrawElementsIndirectBindlessNV glMultiDrawElementsIndirectBindlessNV_signature;
def GL_NV_bindless_multi_draw_indirect_count = 1;

def glMultiDrawArraysIndirectBindlessCountNV_signature func(mode GLenum; indirect u8 ref; drawCount GLsizei; maxDrawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var global glMultiDrawArraysIndirectBindlessCountNV glMultiDrawArraysIndirectBindlessCountNV_signature;

def glMultiDrawElementsIndirectBindlessCountNV_signature func(mode GLenum; type GLenum; indirect u8 ref; drawCount GLsizei; maxDrawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var global glMultiDrawElementsIndirectBindlessCountNV glMultiDrawElementsIndirectBindlessCountNV_signature;
def GL_NV_bindless_texture = 1;

def glGetTextureHandleNV_signature func(texture GLuint) (result GLuint64);
var global glGetTextureHandleNV glGetTextureHandleNV_signature;

def glGetTextureSamplerHandleNV_signature func(texture GLuint; sampler GLuint) (result GLuint64);
var global glGetTextureSamplerHandleNV glGetTextureSamplerHandleNV_signature;

def glMakeTextureHandleResidentNV_signature func(handle GLuint64);
var global glMakeTextureHandleResidentNV glMakeTextureHandleResidentNV_signature;

def glMakeTextureHandleNonResidentNV_signature func(handle GLuint64);
var global glMakeTextureHandleNonResidentNV glMakeTextureHandleNonResidentNV_signature;

def glGetImageHandleNV_signature func(texture GLuint; level GLint; layered GLboolean; layer GLint; format GLenum) (result GLuint64);
var global glGetImageHandleNV glGetImageHandleNV_signature;

def glMakeImageHandleResidentNV_signature func(handle GLuint64; access GLenum);
var global glMakeImageHandleResidentNV glMakeImageHandleResidentNV_signature;

def glMakeImageHandleNonResidentNV_signature func(handle GLuint64);
var global glMakeImageHandleNonResidentNV glMakeImageHandleNonResidentNV_signature;

def glUniformHandleui64NV_signature func(location GLint; value GLuint64);
var global glUniformHandleui64NV glUniformHandleui64NV_signature;

def glUniformHandleui64vNV_signature func(location GLint; count GLsizei; value GLuint64 ref);
var global glUniformHandleui64vNV glUniformHandleui64vNV_signature;

def glProgramUniformHandleui64NV_signature func(program GLuint; location GLint; value GLuint64);
var global glProgramUniformHandleui64NV glProgramUniformHandleui64NV_signature;

def glProgramUniformHandleui64vNV_signature func(program GLuint; location GLint; count GLsizei; values GLuint64 ref);
var global glProgramUniformHandleui64vNV glProgramUniformHandleui64vNV_signature;

def glIsTextureHandleResidentNV_signature func(handle GLuint64) (result GLboolean);
var global glIsTextureHandleResidentNV glIsTextureHandleResidentNV_signature;

def glIsImageHandleResidentNV_signature func(handle GLuint64) (result GLboolean);
var global glIsImageHandleResidentNV glIsImageHandleResidentNV_signature;
def GL_NV_blend_equation_advanced = 1;
def GL_BLEND_OVERLAP_NV = 0x9281;
def GL_BLEND_PREMULTIPLIED_SRC_NV = 0x9280;
def GL_BLUE_NV = 0x1905;
def GL_COLORBURN_NV = 0x929A;
def GL_COLORDODGE_NV = 0x9299;
def GL_CONJOINT_NV = 0x9284;
def GL_CONTRAST_NV = 0x92A1;
def GL_DARKEN_NV = 0x9297;
def GL_DIFFERENCE_NV = 0x929E;
def GL_DISJOINT_NV = 0x9283;
def GL_DST_ATOP_NV = 0x928F;
def GL_DST_IN_NV = 0x928B;
def GL_DST_NV = 0x9287;
def GL_DST_OUT_NV = 0x928D;
def GL_DST_OVER_NV = 0x9289;
def GL_EXCLUSION_NV = 0x92A0;
def GL_GREEN_NV = 0x1904;
def GL_HARDLIGHT_NV = 0x929B;
def GL_HARDMIX_NV = 0x92A9;
def GL_HSL_COLOR_NV = 0x92AF;
def GL_HSL_HUE_NV = 0x92AD;
def GL_HSL_LUMINOSITY_NV = 0x92B0;
def GL_HSL_SATURATION_NV = 0x92AE;
def GL_INVERT_OVG_NV = 0x92B4;
def GL_INVERT_RGB_NV = 0x92A3;
def GL_LIGHTEN_NV = 0x9298;
def GL_LINEARBURN_NV = 0x92A5;
def GL_LINEARDODGE_NV = 0x92A4;
def GL_LINEARLIGHT_NV = 0x92A7;
def GL_MINUS_CLAMPED_NV = 0x92B3;
def GL_MINUS_NV = 0x929F;
def GL_MULTIPLY_NV = 0x9294;
def GL_OVERLAY_NV = 0x9296;
def GL_PINLIGHT_NV = 0x92A8;
def GL_PLUS_CLAMPED_ALPHA_NV = 0x92B2;
def GL_PLUS_CLAMPED_NV = 0x92B1;
def GL_PLUS_DARKER_NV = 0x9292;
def GL_PLUS_NV = 0x9291;
def GL_RED_NV = 0x1903;
def GL_SCREEN_NV = 0x9295;
def GL_SOFTLIGHT_NV = 0x929C;
def GL_SRC_ATOP_NV = 0x928E;
def GL_SRC_IN_NV = 0x928A;
def GL_SRC_NV = 0x9286;
def GL_SRC_OUT_NV = 0x928C;
def GL_SRC_OVER_NV = 0x9288;
def GL_UNCORRELATED_NV = 0x9282;
def GL_VIVIDLIGHT_NV = 0x92A6;
def GL_XOR_NV = 0x1506;

def glBlendParameteriNV_signature func(pname GLenum; value GLint);
var global glBlendParameteriNV glBlendParameteriNV_signature;

def glBlendBarrierNV_signature func();
var global glBlendBarrierNV glBlendBarrierNV_signature;
def GL_NV_blend_equation_advanced_coherent = 1;
def GL_BLEND_ADVANCED_COHERENT_NV = 0x9285;
def GL_NV_blend_minmax_factor = 1;
def GL_NV_blend_square = 1;
def GL_NV_clip_space_w_scaling = 1;
def GL_VIEWPORT_POSITION_W_SCALE_NV = 0x937C;
def GL_VIEWPORT_POSITION_W_SCALE_X_COEFF_NV = 0x937D;
def GL_VIEWPORT_POSITION_W_SCALE_Y_COEFF_NV = 0x937E;

def glViewportPositionWScaleNV_signature func(index GLuint; xcoeff GLfloat; ycoeff GLfloat);
var global glViewportPositionWScaleNV glViewportPositionWScaleNV_signature;
def GL_NV_command_list = 1;
def GL_TERMINATE_SEQUENCE_COMMAND_NV = 0x0000;
def GL_NOP_COMMAND_NV = 0x0001;
def GL_DRAW_ELEMENTS_COMMAND_NV = 0x0002;
def GL_DRAW_ARRAYS_COMMAND_NV = 0x0003;
def GL_DRAW_ELEMENTS_STRIP_COMMAND_NV = 0x0004;
def GL_DRAW_ARRAYS_STRIP_COMMAND_NV = 0x0005;
def GL_DRAW_ELEMENTS_INSTANCED_COMMAND_NV = 0x0006;
def GL_DRAW_ARRAYS_INSTANCED_COMMAND_NV = 0x0007;
def GL_ELEMENT_ADDRESS_COMMAND_NV = 0x0008;
def GL_ATTRIBUTE_ADDRESS_COMMAND_NV = 0x0009;
def GL_UNIFORM_ADDRESS_COMMAND_NV = 0x000A;
def GL_BLEND_COLOR_COMMAND_NV = 0x000B;
def GL_STENCIL_REF_COMMAND_NV = 0x000C;
def GL_LINE_WIDTH_COMMAND_NV = 0x000D;
def GL_POLYGON_OFFSET_COMMAND_NV = 0x000E;
def GL_ALPHA_REF_COMMAND_NV = 0x000F;
def GL_VIEWPORT_COMMAND_NV = 0x0010;
def GL_SCISSOR_COMMAND_NV = 0x0011;
def GL_FRONT_FACE_COMMAND_NV = 0x0012;

def glCreateStatesNV_signature func(n GLsizei; states GLuint ref);
var global glCreateStatesNV glCreateStatesNV_signature;

def glDeleteStatesNV_signature func(n GLsizei; states GLuint ref);
var global glDeleteStatesNV glDeleteStatesNV_signature;

def glIsStateNV_signature func(state GLuint) (result GLboolean);
var global glIsStateNV glIsStateNV_signature;

def glStateCaptureNV_signature func(state GLuint; mode GLenum);
var global glStateCaptureNV glStateCaptureNV_signature;

def glGetCommandHeaderNV_signature func(tokenID GLenum; size GLuint) (result GLuint);
var global glGetCommandHeaderNV glGetCommandHeaderNV_signature;

def glGetStageIndexNV_signature func(shadertype GLenum) (result GLushort);
var global glGetStageIndexNV glGetStageIndexNV_signature;

def glDrawCommandsNV_signature func(primitiveMode GLenum; buffer GLuint; indirects GLintptr ref; sizes GLsizei ref; count GLuint);
var global glDrawCommandsNV glDrawCommandsNV_signature;

def glDrawCommandsAddressNV_signature func(primitiveMode GLenum; indirects GLuint64 ref; sizes GLsizei ref; count GLuint);
var global glDrawCommandsAddressNV glDrawCommandsAddressNV_signature;

def glDrawCommandsStatesNV_signature func(buffer GLuint; indirects GLintptr ref; sizes GLsizei ref; states GLuint ref; fbos GLuint ref; count GLuint);
var global glDrawCommandsStatesNV glDrawCommandsStatesNV_signature;

def glDrawCommandsStatesAddressNV_signature func(indirects GLuint64 ref; sizes GLsizei ref; states GLuint ref; fbos GLuint ref; count GLuint);
var global glDrawCommandsStatesAddressNV glDrawCommandsStatesAddressNV_signature;

def glCreateCommandListsNV_signature func(n GLsizei; lists GLuint ref);
var global glCreateCommandListsNV glCreateCommandListsNV_signature;

def glDeleteCommandListsNV_signature func(n GLsizei; lists GLuint ref);
var global glDeleteCommandListsNV glDeleteCommandListsNV_signature;

def glIsCommandListNV_signature func(list GLuint) (result GLboolean);
var global glIsCommandListNV glIsCommandListNV_signature;

def glListDrawCommandsStatesClientNV_signature func(list GLuint; segment GLuint; indirects u8 ref ref; sizes GLsizei ref; states GLuint ref; fbos GLuint ref; count GLuint);
var global glListDrawCommandsStatesClientNV glListDrawCommandsStatesClientNV_signature;

def glCommandListSegmentsNV_signature func(list GLuint; segments GLuint);
var global glCommandListSegmentsNV glCommandListSegmentsNV_signature;

def glCompileCommandListNV_signature func(list GLuint);
var global glCompileCommandListNV glCompileCommandListNV_signature;

def glCallCommandListNV_signature func(list GLuint);
var global glCallCommandListNV glCallCommandListNV_signature;
def GL_NV_compute_program5 = 1;
def GL_COMPUTE_PROGRAM_NV = 0x90FB;
def GL_COMPUTE_PROGRAM_PARAMETER_BUFFER_NV = 0x90FC;
def GL_NV_compute_shader_derivatives = 1;
def GL_NV_conditional_render = 1;
def GL_QUERY_WAIT_NV = 0x8E13;
def GL_QUERY_NO_WAIT_NV = 0x8E14;
def GL_QUERY_BY_REGION_WAIT_NV = 0x8E15;
def GL_QUERY_BY_REGION_NO_WAIT_NV = 0x8E16;

def glBeginConditionalRenderNV_signature func(id GLuint; mode GLenum);
var global glBeginConditionalRenderNV glBeginConditionalRenderNV_signature;

def glEndConditionalRenderNV_signature func();
var global glEndConditionalRenderNV glEndConditionalRenderNV_signature;
def GL_NV_conservative_raster = 1;
def GL_CONSERVATIVE_RASTERIZATION_NV = 0x9346;
def GL_SUBPIXEL_PRECISION_BIAS_X_BITS_NV = 0x9347;
def GL_SUBPIXEL_PRECISION_BIAS_Y_BITS_NV = 0x9348;
def GL_MAX_SUBPIXEL_PRECISION_BIAS_BITS_NV = 0x9349;

def glSubpixelPrecisionBiasNV_signature func(xbits GLuint; ybits GLuint);
var global glSubpixelPrecisionBiasNV glSubpixelPrecisionBiasNV_signature;
def GL_NV_conservative_raster_dilate = 1;
def GL_CONSERVATIVE_RASTER_DILATE_NV = 0x9379;
def GL_CONSERVATIVE_RASTER_DILATE_RANGE_NV = 0x937A;
def GL_CONSERVATIVE_RASTER_DILATE_GRANULARITY_NV = 0x937B;

def glConservativeRasterParameterfNV_signature func(pname GLenum; value GLfloat);
var global glConservativeRasterParameterfNV glConservativeRasterParameterfNV_signature;
def GL_NV_conservative_raster_pre_snap = 1;
def GL_CONSERVATIVE_RASTER_MODE_PRE_SNAP_NV = 0x9550;
def GL_NV_conservative_raster_pre_snap_triangles = 1;
def GL_CONSERVATIVE_RASTER_MODE_NV = 0x954D;
def GL_CONSERVATIVE_RASTER_MODE_POST_SNAP_NV = 0x954E;
def GL_CONSERVATIVE_RASTER_MODE_PRE_SNAP_TRIANGLES_NV = 0x954F;

def glConservativeRasterParameteriNV_signature func(pname GLenum; param GLint);
var global glConservativeRasterParameteriNV glConservativeRasterParameteriNV_signature;
def GL_NV_conservative_raster_underestimation = 1;
def GL_NV_copy_depth_to_color = 1;
def GL_DEPTH_STENCIL_TO_RGBA_NV = 0x886E;
def GL_DEPTH_STENCIL_TO_BGRA_NV = 0x886F;
def GL_NV_copy_image = 1;

def glCopyImageSubDataNV_signature func(srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; width GLsizei; height GLsizei; depth GLsizei);
var global glCopyImageSubDataNV glCopyImageSubDataNV_signature;
def GL_NV_deep_texture3D = 1;
def GL_MAX_DEEP_3D_TEXTURE_WIDTH_HEIGHT_NV = 0x90D0;
def GL_MAX_DEEP_3D_TEXTURE_DEPTH_NV = 0x90D1;
def GL_NV_depth_buffer_float = 1;
def GL_DEPTH_COMPONENT32F_NV = 0x8DAB;
def GL_DEPTH32F_STENCIL8_NV = 0x8DAC;
def GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV = 0x8DAD;
def GL_DEPTH_BUFFER_FLOAT_MODE_NV = 0x8DAF;

def glDepthRangedNV_signature func(zNear GLdouble; zFar GLdouble);
var global glDepthRangedNV glDepthRangedNV_signature;

def glClearDepthdNV_signature func(depth GLdouble);
var global glClearDepthdNV glClearDepthdNV_signature;

def glDepthBoundsdNV_signature func(zmin GLdouble; zmax GLdouble);
var global glDepthBoundsdNV glDepthBoundsdNV_signature;
def GL_NV_depth_clamp = 1;
def GL_DEPTH_CLAMP_NV = 0x864F;
def GL_NV_draw_texture = 1;

def glDrawTextureNV_signature func(texture GLuint; sampler GLuint; x0 GLfloat; y0 GLfloat; x1 GLfloat; y1 GLfloat; z GLfloat; s0 GLfloat; t0 GLfloat; s1 GLfloat; t1 GLfloat);
var global glDrawTextureNV glDrawTextureNV_signature;
def GL_NV_draw_vulkan_image = 1;

def GLVULKANPROCNV func();

def glDrawVkImageNV_signature func(vkImage GLuint64; sampler GLuint; x0 GLfloat; y0 GLfloat; x1 GLfloat; y1 GLfloat; z GLfloat; s0 GLfloat; t0 GLfloat; s1 GLfloat; t1 GLfloat);
var global glDrawVkImageNV glDrawVkImageNV_signature;

def glGetVkProcAddrNV_signature func(name GLchar ref) (result GLVULKANPROCNV);
var global glGetVkProcAddrNV glGetVkProcAddrNV_signature;

def glWaitVkSemaphoreNV_signature func(vkSemaphore GLuint64);
var global glWaitVkSemaphoreNV glWaitVkSemaphoreNV_signature;

def glSignalVkSemaphoreNV_signature func(vkSemaphore GLuint64);
var global glSignalVkSemaphoreNV glSignalVkSemaphoreNV_signature;

def glSignalVkFenceNV_signature func(vkFence GLuint64);
var global glSignalVkFenceNV glSignalVkFenceNV_signature;
def GL_NV_evaluators = 1;
def GL_EVAL_2D_NV = 0x86C0;
def GL_EVAL_TRIANGULAR_2D_NV = 0x86C1;
def GL_MAP_TESSELLATION_NV = 0x86C2;
def GL_MAP_ATTRIB_U_ORDER_NV = 0x86C3;
def GL_MAP_ATTRIB_V_ORDER_NV = 0x86C4;
def GL_EVAL_FRACTIONAL_TESSELLATION_NV = 0x86C5;
def GL_EVAL_VERTEX_ATTRIB0_NV = 0x86C6;
def GL_EVAL_VERTEX_ATTRIB1_NV = 0x86C7;
def GL_EVAL_VERTEX_ATTRIB2_NV = 0x86C8;
def GL_EVAL_VERTEX_ATTRIB3_NV = 0x86C9;
def GL_EVAL_VERTEX_ATTRIB4_NV = 0x86CA;
def GL_EVAL_VERTEX_ATTRIB5_NV = 0x86CB;
def GL_EVAL_VERTEX_ATTRIB6_NV = 0x86CC;
def GL_EVAL_VERTEX_ATTRIB7_NV = 0x86CD;
def GL_EVAL_VERTEX_ATTRIB8_NV = 0x86CE;
def GL_EVAL_VERTEX_ATTRIB9_NV = 0x86CF;
def GL_EVAL_VERTEX_ATTRIB10_NV = 0x86D0;
def GL_EVAL_VERTEX_ATTRIB11_NV = 0x86D1;
def GL_EVAL_VERTEX_ATTRIB12_NV = 0x86D2;
def GL_EVAL_VERTEX_ATTRIB13_NV = 0x86D3;
def GL_EVAL_VERTEX_ATTRIB14_NV = 0x86D4;
def GL_EVAL_VERTEX_ATTRIB15_NV = 0x86D5;
def GL_MAX_MAP_TESSELLATION_NV = 0x86D6;
def GL_MAX_RATIONAL_EVAL_ORDER_NV = 0x86D7;

def glMapControlPointsNV_signature func(target GLenum; index GLuint; type GLenum; ustride GLsizei; vstride GLsizei; uorder GLint; vorder GLint; packed GLboolean; points u8 ref);
var global glMapControlPointsNV glMapControlPointsNV_signature;

def glMapParameterivNV_signature func(target GLenum; pname GLenum; params GLint ref);
var global glMapParameterivNV glMapParameterivNV_signature;

def glMapParameterfvNV_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glMapParameterfvNV glMapParameterfvNV_signature;

def glGetMapControlPointsNV_signature func(target GLenum; index GLuint; type GLenum; ustride GLsizei; vstride GLsizei; packed GLboolean; points u8 ref);
var global glGetMapControlPointsNV glGetMapControlPointsNV_signature;

def glGetMapParameterivNV_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetMapParameterivNV glGetMapParameterivNV_signature;

def glGetMapParameterfvNV_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetMapParameterfvNV glGetMapParameterfvNV_signature;

def glGetMapAttribParameterivNV_signature func(target GLenum; index GLuint; pname GLenum; params GLint ref);
var global glGetMapAttribParameterivNV glGetMapAttribParameterivNV_signature;

def glGetMapAttribParameterfvNV_signature func(target GLenum; index GLuint; pname GLenum; params GLfloat ref);
var global glGetMapAttribParameterfvNV glGetMapAttribParameterfvNV_signature;

def glEvalMapsNV_signature func(target GLenum; mode GLenum);
var global glEvalMapsNV glEvalMapsNV_signature;
def GL_NV_explicit_multisample = 1;
def GL_SAMPLE_POSITION_NV = 0x8E50;
def GL_SAMPLE_MASK_NV = 0x8E51;
def GL_SAMPLE_MASK_VALUE_NV = 0x8E52;
def GL_TEXTURE_BINDING_RENDERBUFFER_NV = 0x8E53;
def GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV = 0x8E54;
def GL_TEXTURE_RENDERBUFFER_NV = 0x8E55;
def GL_SAMPLER_RENDERBUFFER_NV = 0x8E56;
def GL_INT_SAMPLER_RENDERBUFFER_NV = 0x8E57;
def GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV = 0x8E58;
def GL_MAX_SAMPLE_MASK_WORDS_NV = 0x8E59;

def glGetMultisamplefvNV_signature func(pname GLenum; index GLuint; val GLfloat ref);
var global glGetMultisamplefvNV glGetMultisamplefvNV_signature;

def glSampleMaskIndexedNV_signature func(index GLuint; mask GLbitfield);
var global glSampleMaskIndexedNV glSampleMaskIndexedNV_signature;

def glTexRenderbufferNV_signature func(target GLenum; renderbuffer GLuint);
var global glTexRenderbufferNV glTexRenderbufferNV_signature;
def GL_NV_fence = 1;
def GL_ALL_COMPLETED_NV = 0x84F2;
def GL_FENCE_STATUS_NV = 0x84F3;
def GL_FENCE_CONDITION_NV = 0x84F4;

def glDeleteFencesNV_signature func(n GLsizei; fences GLuint ref);
var global glDeleteFencesNV glDeleteFencesNV_signature;

def glGenFencesNV_signature func(n GLsizei; fences GLuint ref);
var global glGenFencesNV glGenFencesNV_signature;

def glIsFenceNV_signature func(fence GLuint) (result GLboolean);
var global glIsFenceNV glIsFenceNV_signature;

def glTestFenceNV_signature func(fence GLuint) (result GLboolean);
var global glTestFenceNV glTestFenceNV_signature;

def glGetFenceivNV_signature func(fence GLuint; pname GLenum; params GLint ref);
var global glGetFenceivNV glGetFenceivNV_signature;

def glFinishFenceNV_signature func(fence GLuint);
var global glFinishFenceNV glFinishFenceNV_signature;

def glSetFenceNV_signature func(fence GLuint; condition GLenum);
var global glSetFenceNV glSetFenceNV_signature;
def GL_NV_fill_rectangle = 1;
def GL_FILL_RECTANGLE_NV = 0x933C;
def GL_NV_float_buffer = 1;
def GL_FLOAT_R_NV = 0x8880;
def GL_FLOAT_RG_NV = 0x8881;
def GL_FLOAT_RGB_NV = 0x8882;
def GL_FLOAT_RGBA_NV = 0x8883;
def GL_FLOAT_R16_NV = 0x8884;
def GL_FLOAT_R32_NV = 0x8885;
def GL_FLOAT_RG16_NV = 0x8886;
def GL_FLOAT_RG32_NV = 0x8887;
def GL_FLOAT_RGB16_NV = 0x8888;
def GL_FLOAT_RGB32_NV = 0x8889;
def GL_FLOAT_RGBA16_NV = 0x888A;
def GL_FLOAT_RGBA32_NV = 0x888B;
def GL_TEXTURE_FLOAT_COMPONENTS_NV = 0x888C;
def GL_FLOAT_CLEAR_COLOR_VALUE_NV = 0x888D;
def GL_FLOAT_RGBA_MODE_NV = 0x888E;
def GL_NV_fog_distance = 1;
def GL_FOG_DISTANCE_MODE_NV = 0x855A;
def GL_EYE_RADIAL_NV = 0x855B;
def GL_EYE_PLANE_ABSOLUTE_NV = 0x855C;
def GL_NV_fragment_coverage_to_color = 1;
def GL_FRAGMENT_COVERAGE_TO_COLOR_NV = 0x92DD;
def GL_FRAGMENT_COVERAGE_COLOR_NV = 0x92DE;

def glFragmentCoverageColorNV_signature func(color GLuint);
var global glFragmentCoverageColorNV glFragmentCoverageColorNV_signature;
def GL_NV_fragment_program = 1;
def GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV = 0x8868;
def GL_FRAGMENT_PROGRAM_NV = 0x8870;
def GL_MAX_TEXTURE_COORDS_NV = 0x8871;
def GL_MAX_TEXTURE_IMAGE_UNITS_NV = 0x8872;
def GL_FRAGMENT_PROGRAM_BINDING_NV = 0x8873;
def GL_PROGRAM_ERROR_STRING_NV = 0x8874;

def glProgramNamedParameter4fNV_signature func(id GLuint; len GLsizei; name GLubyte ref; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glProgramNamedParameter4fNV glProgramNamedParameter4fNV_signature;

def glProgramNamedParameter4fvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; v GLfloat ref);
var global glProgramNamedParameter4fvNV glProgramNamedParameter4fvNV_signature;

def glProgramNamedParameter4dNV_signature func(id GLuint; len GLsizei; name GLubyte ref; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glProgramNamedParameter4dNV glProgramNamedParameter4dNV_signature;

def glProgramNamedParameter4dvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; v GLdouble ref);
var global glProgramNamedParameter4dvNV glProgramNamedParameter4dvNV_signature;

def glGetProgramNamedParameterfvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; params GLfloat ref);
var global glGetProgramNamedParameterfvNV glGetProgramNamedParameterfvNV_signature;

def glGetProgramNamedParameterdvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; params GLdouble ref);
var global glGetProgramNamedParameterdvNV glGetProgramNamedParameterdvNV_signature;
def GL_NV_fragment_program2 = 1;
def GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV = 0x88F4;
def GL_MAX_PROGRAM_CALL_DEPTH_NV = 0x88F5;
def GL_MAX_PROGRAM_IF_DEPTH_NV = 0x88F6;
def GL_MAX_PROGRAM_LOOP_DEPTH_NV = 0x88F7;
def GL_MAX_PROGRAM_LOOP_COUNT_NV = 0x88F8;
def GL_NV_fragment_program4 = 1;
def GL_NV_fragment_program_option = 1;
def GL_NV_fragment_shader_barycentric = 1;
def GL_NV_fragment_shader_interlock = 1;
def GL_NV_framebuffer_mixed_samples = 1;
def GL_COVERAGE_MODULATION_TABLE_NV = 0x9331;
def GL_COLOR_SAMPLES_NV = 0x8E20;
def GL_DEPTH_SAMPLES_NV = 0x932D;
def GL_STENCIL_SAMPLES_NV = 0x932E;
def GL_MIXED_DEPTH_SAMPLES_SUPPORTED_NV = 0x932F;
def GL_MIXED_STENCIL_SAMPLES_SUPPORTED_NV = 0x9330;
def GL_COVERAGE_MODULATION_NV = 0x9332;
def GL_COVERAGE_MODULATION_TABLE_SIZE_NV = 0x9333;

def glCoverageModulationTableNV_signature func(n GLsizei; v GLfloat ref);
var global glCoverageModulationTableNV glCoverageModulationTableNV_signature;

def glGetCoverageModulationTableNV_signature func(bufSize GLsizei; v GLfloat ref);
var global glGetCoverageModulationTableNV glGetCoverageModulationTableNV_signature;

def glCoverageModulationNV_signature func(components GLenum);
var global glCoverageModulationNV glCoverageModulationNV_signature;
def GL_NV_framebuffer_multisample_coverage = 1;
def GL_RENDERBUFFER_COVERAGE_SAMPLES_NV = 0x8CAB;
def GL_RENDERBUFFER_COLOR_SAMPLES_NV = 0x8E10;
def GL_MAX_MULTISAMPLE_COVERAGE_MODES_NV = 0x8E11;
def GL_MULTISAMPLE_COVERAGE_MODES_NV = 0x8E12;

def glRenderbufferStorageMultisampleCoverageNV_signature func(target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var global glRenderbufferStorageMultisampleCoverageNV glRenderbufferStorageMultisampleCoverageNV_signature;
def GL_NV_geometry_program4 = 1;
def GL_GEOMETRY_PROGRAM_NV = 0x8C26;
def GL_MAX_PROGRAM_OUTPUT_VERTICES_NV = 0x8C27;
def GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV = 0x8C28;

def glProgramVertexLimitNV_signature func(target GLenum; limit GLint);
var global glProgramVertexLimitNV glProgramVertexLimitNV_signature;

def glFramebufferTextureEXT_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint);
var global glFramebufferTextureEXT glFramebufferTextureEXT_signature;

def glFramebufferTextureFaceEXT_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; face GLenum);
var global glFramebufferTextureFaceEXT glFramebufferTextureFaceEXT_signature;
def GL_NV_geometry_shader4 = 1;
def GL_NV_geometry_shader_passthrough = 1;
def GL_NV_gpu_multicast = 1;
def GL_PER_GPU_STORAGE_BIT_NV = 0x0800;
def GL_MULTICAST_GPUS_NV = 0x92BA;
def GL_RENDER_GPU_MASK_NV = 0x9558;
def GL_PER_GPU_STORAGE_NV = 0x9548;
def GL_MULTICAST_PROGRAMMABLE_SAMPLE_LOCATION_NV = 0x9549;

def glRenderGpuMaskNV_signature func(mask GLbitfield);
var global glRenderGpuMaskNV glRenderGpuMaskNV_signature;

def glMulticastBufferSubDataNV_signature func(gpuMask GLbitfield; buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var global glMulticastBufferSubDataNV glMulticastBufferSubDataNV_signature;

def glMulticastCopyBufferSubDataNV_signature func(readGpu GLuint; writeGpuMask GLbitfield; readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var global glMulticastCopyBufferSubDataNV glMulticastCopyBufferSubDataNV_signature;

def glMulticastCopyImageSubDataNV_signature func(srcGpu GLuint; dstGpuMask GLbitfield; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; srcWidth GLsizei; srcHeight GLsizei; srcDepth GLsizei);
var global glMulticastCopyImageSubDataNV glMulticastCopyImageSubDataNV_signature;

def glMulticastBlitFramebufferNV_signature func(srcGpu GLuint; dstGpu GLuint; srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var global glMulticastBlitFramebufferNV glMulticastBlitFramebufferNV_signature;

def glMulticastFramebufferSampleLocationsfvNV_signature func(gpu GLuint; framebuffer GLuint; start GLuint; count GLsizei; v GLfloat ref);
var global glMulticastFramebufferSampleLocationsfvNV glMulticastFramebufferSampleLocationsfvNV_signature;

def glMulticastBarrierNV_signature func();
var global glMulticastBarrierNV glMulticastBarrierNV_signature;

def glMulticastWaitSyncNV_signature func(signalGpu GLuint; waitGpuMask GLbitfield);
var global glMulticastWaitSyncNV glMulticastWaitSyncNV_signature;

def glMulticastGetQueryObjectivNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLint ref);
var global glMulticastGetQueryObjectivNV glMulticastGetQueryObjectivNV_signature;

def glMulticastGetQueryObjectuivNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLuint ref);
var global glMulticastGetQueryObjectuivNV glMulticastGetQueryObjectuivNV_signature;

def glMulticastGetQueryObjecti64vNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLint64 ref);
var global glMulticastGetQueryObjecti64vNV glMulticastGetQueryObjecti64vNV_signature;

def glMulticastGetQueryObjectui64vNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLuint64 ref);
var global glMulticastGetQueryObjectui64vNV glMulticastGetQueryObjectui64vNV_signature;
def GL_NV_gpu_program4 = 1;
def GL_MIN_PROGRAM_TEXEL_OFFSET_NV = 0x8904;
def GL_MAX_PROGRAM_TEXEL_OFFSET_NV = 0x8905;
def GL_PROGRAM_ATTRIB_COMPONENTS_NV = 0x8906;
def GL_PROGRAM_RESULT_COMPONENTS_NV = 0x8907;
def GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV = 0x8908;
def GL_MAX_PROGRAM_RESULT_COMPONENTS_NV = 0x8909;
def GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV = 0x8DA5;
def GL_MAX_PROGRAM_GENERIC_RESULTS_NV = 0x8DA6;

def glProgramLocalParameterI4iNV_signature func(target GLenum; index GLuint; x GLint; y GLint; z GLint; w GLint);
var global glProgramLocalParameterI4iNV glProgramLocalParameterI4iNV_signature;

def glProgramLocalParameterI4ivNV_signature func(target GLenum; index GLuint; params GLint ref);
var global glProgramLocalParameterI4ivNV glProgramLocalParameterI4ivNV_signature;

def glProgramLocalParametersI4ivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLint ref);
var global glProgramLocalParametersI4ivNV glProgramLocalParametersI4ivNV_signature;

def glProgramLocalParameterI4uiNV_signature func(target GLenum; index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var global glProgramLocalParameterI4uiNV glProgramLocalParameterI4uiNV_signature;

def glProgramLocalParameterI4uivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var global glProgramLocalParameterI4uivNV glProgramLocalParameterI4uivNV_signature;

def glProgramLocalParametersI4uivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLuint ref);
var global glProgramLocalParametersI4uivNV glProgramLocalParametersI4uivNV_signature;

def glProgramEnvParameterI4iNV_signature func(target GLenum; index GLuint; x GLint; y GLint; z GLint; w GLint);
var global glProgramEnvParameterI4iNV glProgramEnvParameterI4iNV_signature;

def glProgramEnvParameterI4ivNV_signature func(target GLenum; index GLuint; params GLint ref);
var global glProgramEnvParameterI4ivNV glProgramEnvParameterI4ivNV_signature;

def glProgramEnvParametersI4ivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLint ref);
var global glProgramEnvParametersI4ivNV glProgramEnvParametersI4ivNV_signature;

def glProgramEnvParameterI4uiNV_signature func(target GLenum; index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var global glProgramEnvParameterI4uiNV glProgramEnvParameterI4uiNV_signature;

def glProgramEnvParameterI4uivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var global glProgramEnvParameterI4uivNV glProgramEnvParameterI4uivNV_signature;

def glProgramEnvParametersI4uivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLuint ref);
var global glProgramEnvParametersI4uivNV glProgramEnvParametersI4uivNV_signature;

def glGetProgramLocalParameterIivNV_signature func(target GLenum; index GLuint; params GLint ref);
var global glGetProgramLocalParameterIivNV glGetProgramLocalParameterIivNV_signature;

def glGetProgramLocalParameterIuivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var global glGetProgramLocalParameterIuivNV glGetProgramLocalParameterIuivNV_signature;

def glGetProgramEnvParameterIivNV_signature func(target GLenum; index GLuint; params GLint ref);
var global glGetProgramEnvParameterIivNV glGetProgramEnvParameterIivNV_signature;

def glGetProgramEnvParameterIuivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var global glGetProgramEnvParameterIuivNV glGetProgramEnvParameterIuivNV_signature;
def GL_NV_gpu_program5 = 1;
def GL_MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV = 0x8E5A;
def GL_MIN_FRAGMENT_INTERPOLATION_OFFSET_NV = 0x8E5B;
def GL_MAX_FRAGMENT_INTERPOLATION_OFFSET_NV = 0x8E5C;
def GL_FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV = 0x8E5D;
def GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV = 0x8E5E;
def GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV = 0x8E5F;
def GL_MAX_PROGRAM_SUBROUTINE_PARAMETERS_NV = 0x8F44;
def GL_MAX_PROGRAM_SUBROUTINE_NUM_NV = 0x8F45;

def glProgramSubroutineParametersuivNV_signature func(target GLenum; count GLsizei; params GLuint ref);
var global glProgramSubroutineParametersuivNV glProgramSubroutineParametersuivNV_signature;

def glGetProgramSubroutineParameteruivNV_signature func(target GLenum; index GLuint; param GLuint ref);
var global glGetProgramSubroutineParameteruivNV glGetProgramSubroutineParameteruivNV_signature;
def GL_NV_gpu_program5_mem_extended = 1;
def GL_NV_gpu_shader5 = 1;
def GL_NV_half_float = 1;
def GL_HALF_FLOAT_NV = 0x140B;

def glVertex2hNV_signature func(x GLhalfNV; y GLhalfNV);
var global glVertex2hNV glVertex2hNV_signature;

def glVertex2hvNV_signature func(v GLhalfNV ref);
var global glVertex2hvNV glVertex2hvNV_signature;

def glVertex3hNV_signature func(x GLhalfNV; y GLhalfNV; z GLhalfNV);
var global glVertex3hNV glVertex3hNV_signature;

def glVertex3hvNV_signature func(v GLhalfNV ref);
var global glVertex3hvNV glVertex3hvNV_signature;

def glVertex4hNV_signature func(x GLhalfNV; y GLhalfNV; z GLhalfNV; w GLhalfNV);
var global glVertex4hNV glVertex4hNV_signature;

def glVertex4hvNV_signature func(v GLhalfNV ref);
var global glVertex4hvNV glVertex4hvNV_signature;

def glNormal3hNV_signature func(nx GLhalfNV; ny GLhalfNV; nz GLhalfNV);
var global glNormal3hNV glNormal3hNV_signature;

def glNormal3hvNV_signature func(v GLhalfNV ref);
var global glNormal3hvNV glNormal3hvNV_signature;

def glColor3hNV_signature func(red GLhalfNV; green GLhalfNV; blue GLhalfNV);
var global glColor3hNV glColor3hNV_signature;

def glColor3hvNV_signature func(v GLhalfNV ref);
var global glColor3hvNV glColor3hvNV_signature;

def glColor4hNV_signature func(red GLhalfNV; green GLhalfNV; blue GLhalfNV; alpha GLhalfNV);
var global glColor4hNV glColor4hNV_signature;

def glColor4hvNV_signature func(v GLhalfNV ref);
var global glColor4hvNV glColor4hvNV_signature;

def glTexCoord1hNV_signature func(s GLhalfNV);
var global glTexCoord1hNV glTexCoord1hNV_signature;

def glTexCoord1hvNV_signature func(v GLhalfNV ref);
var global glTexCoord1hvNV glTexCoord1hvNV_signature;

def glTexCoord2hNV_signature func(s GLhalfNV; t GLhalfNV);
var global glTexCoord2hNV glTexCoord2hNV_signature;

def glTexCoord2hvNV_signature func(v GLhalfNV ref);
var global glTexCoord2hvNV glTexCoord2hvNV_signature;

def glTexCoord3hNV_signature func(s GLhalfNV; t GLhalfNV; r GLhalfNV);
var global glTexCoord3hNV glTexCoord3hNV_signature;

def glTexCoord3hvNV_signature func(v GLhalfNV ref);
var global glTexCoord3hvNV glTexCoord3hvNV_signature;

def glTexCoord4hNV_signature func(s GLhalfNV; t GLhalfNV; r GLhalfNV; q GLhalfNV);
var global glTexCoord4hNV glTexCoord4hNV_signature;

def glTexCoord4hvNV_signature func(v GLhalfNV ref);
var global glTexCoord4hvNV glTexCoord4hvNV_signature;

def glMultiTexCoord1hNV_signature func(target GLenum; s GLhalfNV);
var global glMultiTexCoord1hNV glMultiTexCoord1hNV_signature;

def glMultiTexCoord1hvNV_signature func(target GLenum; v GLhalfNV ref);
var global glMultiTexCoord1hvNV glMultiTexCoord1hvNV_signature;

def glMultiTexCoord2hNV_signature func(target GLenum; s GLhalfNV; t GLhalfNV);
var global glMultiTexCoord2hNV glMultiTexCoord2hNV_signature;

def glMultiTexCoord2hvNV_signature func(target GLenum; v GLhalfNV ref);
var global glMultiTexCoord2hvNV glMultiTexCoord2hvNV_signature;

def glMultiTexCoord3hNV_signature func(target GLenum; s GLhalfNV; t GLhalfNV; r GLhalfNV);
var global glMultiTexCoord3hNV glMultiTexCoord3hNV_signature;

def glMultiTexCoord3hvNV_signature func(target GLenum; v GLhalfNV ref);
var global glMultiTexCoord3hvNV glMultiTexCoord3hvNV_signature;

def glMultiTexCoord4hNV_signature func(target GLenum; s GLhalfNV; t GLhalfNV; r GLhalfNV; q GLhalfNV);
var global glMultiTexCoord4hNV glMultiTexCoord4hNV_signature;

def glMultiTexCoord4hvNV_signature func(target GLenum; v GLhalfNV ref);
var global glMultiTexCoord4hvNV glMultiTexCoord4hvNV_signature;

def glFogCoordhNV_signature func(fog GLhalfNV);
var global glFogCoordhNV glFogCoordhNV_signature;

def glFogCoordhvNV_signature func(fog GLhalfNV ref);
var global glFogCoordhvNV glFogCoordhvNV_signature;

def glSecondaryColor3hNV_signature func(red GLhalfNV; green GLhalfNV; blue GLhalfNV);
var global glSecondaryColor3hNV glSecondaryColor3hNV_signature;

def glSecondaryColor3hvNV_signature func(v GLhalfNV ref);
var global glSecondaryColor3hvNV glSecondaryColor3hvNV_signature;

def glVertexWeighthNV_signature func(weight GLhalfNV);
var global glVertexWeighthNV glVertexWeighthNV_signature;

def glVertexWeighthvNV_signature func(weight GLhalfNV ref);
var global glVertexWeighthvNV glVertexWeighthvNV_signature;

def glVertexAttrib1hNV_signature func(index GLuint; x GLhalfNV);
var global glVertexAttrib1hNV glVertexAttrib1hNV_signature;

def glVertexAttrib1hvNV_signature func(index GLuint; v GLhalfNV ref);
var global glVertexAttrib1hvNV glVertexAttrib1hvNV_signature;

def glVertexAttrib2hNV_signature func(index GLuint; x GLhalfNV; y GLhalfNV);
var global glVertexAttrib2hNV glVertexAttrib2hNV_signature;

def glVertexAttrib2hvNV_signature func(index GLuint; v GLhalfNV ref);
var global glVertexAttrib2hvNV glVertexAttrib2hvNV_signature;

def glVertexAttrib3hNV_signature func(index GLuint; x GLhalfNV; y GLhalfNV; z GLhalfNV);
var global glVertexAttrib3hNV glVertexAttrib3hNV_signature;

def glVertexAttrib3hvNV_signature func(index GLuint; v GLhalfNV ref);
var global glVertexAttrib3hvNV glVertexAttrib3hvNV_signature;

def glVertexAttrib4hNV_signature func(index GLuint; x GLhalfNV; y GLhalfNV; z GLhalfNV; w GLhalfNV);
var global glVertexAttrib4hNV glVertexAttrib4hNV_signature;

def glVertexAttrib4hvNV_signature func(index GLuint; v GLhalfNV ref);
var global glVertexAttrib4hvNV glVertexAttrib4hvNV_signature;

def glVertexAttribs1hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var global glVertexAttribs1hvNV glVertexAttribs1hvNV_signature;

def glVertexAttribs2hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var global glVertexAttribs2hvNV glVertexAttribs2hvNV_signature;

def glVertexAttribs3hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var global glVertexAttribs3hvNV glVertexAttribs3hvNV_signature;

def glVertexAttribs4hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var global glVertexAttribs4hvNV glVertexAttribs4hvNV_signature;
def GL_NV_internalformat_sample_query = 1;
def GL_MULTISAMPLES_NV = 0x9371;
def GL_SUPERSAMPLE_SCALE_X_NV = 0x9372;
def GL_SUPERSAMPLE_SCALE_Y_NV = 0x9373;
def GL_CONFORMANT_NV = 0x9374;

def glGetInternalformatSampleivNV_signature func(target GLenum; internalformat GLenum; samples GLsizei; pname GLenum; count GLsizei; params GLint ref);
var global glGetInternalformatSampleivNV glGetInternalformatSampleivNV_signature;
def GL_NV_light_max_exponent = 1;
def GL_MAX_SHININESS_NV = 0x8504;
def GL_MAX_SPOT_EXPONENT_NV = 0x8505;
def GL_NV_memory_attachment = 1;
def GL_ATTACHED_MEMORY_OBJECT_NV = 0x95A4;
def GL_ATTACHED_MEMORY_OFFSET_NV = 0x95A5;
def GL_MEMORY_ATTACHABLE_ALIGNMENT_NV = 0x95A6;
def GL_MEMORY_ATTACHABLE_SIZE_NV = 0x95A7;
def GL_MEMORY_ATTACHABLE_NV = 0x95A8;
def GL_DETACHED_MEMORY_INCARNATION_NV = 0x95A9;
def GL_DETACHED_TEXTURES_NV = 0x95AA;
def GL_DETACHED_BUFFERS_NV = 0x95AB;
def GL_MAX_DETACHED_TEXTURES_NV = 0x95AC;
def GL_MAX_DETACHED_BUFFERS_NV = 0x95AD;

def glGetMemoryObjectDetachedResourcesuivNV_signature func(memory GLuint; pname GLenum; first GLint; count GLsizei; params GLuint ref);
var global glGetMemoryObjectDetachedResourcesuivNV glGetMemoryObjectDetachedResourcesuivNV_signature;

def glResetMemoryObjectParameterNV_signature func(memory GLuint; pname GLenum);
var global glResetMemoryObjectParameterNV glResetMemoryObjectParameterNV_signature;

def glTexAttachMemoryNV_signature func(target GLenum; memory GLuint; offset GLuint64);
var global glTexAttachMemoryNV glTexAttachMemoryNV_signature;

def glBufferAttachMemoryNV_signature func(target GLenum; memory GLuint; offset GLuint64);
var global glBufferAttachMemoryNV glBufferAttachMemoryNV_signature;

def glTextureAttachMemoryNV_signature func(texture GLuint; memory GLuint; offset GLuint64);
var global glTextureAttachMemoryNV glTextureAttachMemoryNV_signature;

def glNamedBufferAttachMemoryNV_signature func(buffer GLuint; memory GLuint; offset GLuint64);
var global glNamedBufferAttachMemoryNV glNamedBufferAttachMemoryNV_signature;
def GL_NV_memory_object_sparse = 1;

def glBufferPageCommitmentMemNV_signature func(target GLenum; offset GLintptr; size GLsizeiptr; memory GLuint; memOffset GLuint64; commit GLboolean);
var global glBufferPageCommitmentMemNV glBufferPageCommitmentMemNV_signature;

def glTexPageCommitmentMemNV_signature func(target GLenum; layer GLint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64; commit GLboolean);
var global glTexPageCommitmentMemNV glTexPageCommitmentMemNV_signature;

def glNamedBufferPageCommitmentMemNV_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; memory GLuint; memOffset GLuint64; commit GLboolean);
var global glNamedBufferPageCommitmentMemNV glNamedBufferPageCommitmentMemNV_signature;

def glTexturePageCommitmentMemNV_signature func(texture GLuint; layer GLint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64; commit GLboolean);
var global glTexturePageCommitmentMemNV glTexturePageCommitmentMemNV_signature;
def GL_NV_mesh_shader = 1;
def GL_MESH_SHADER_NV = 0x9559;
def GL_TASK_SHADER_NV = 0x955A;
def GL_MAX_MESH_UNIFORM_BLOCKS_NV = 0x8E60;
def GL_MAX_MESH_TEXTURE_IMAGE_UNITS_NV = 0x8E61;
def GL_MAX_MESH_IMAGE_UNIFORMS_NV = 0x8E62;
def GL_MAX_MESH_UNIFORM_COMPONENTS_NV = 0x8E63;
def GL_MAX_MESH_ATOMIC_COUNTER_BUFFERS_NV = 0x8E64;
def GL_MAX_MESH_ATOMIC_COUNTERS_NV = 0x8E65;
def GL_MAX_MESH_SHADER_STORAGE_BLOCKS_NV = 0x8E66;
def GL_MAX_COMBINED_MESH_UNIFORM_COMPONENTS_NV = 0x8E67;
def GL_MAX_TASK_UNIFORM_BLOCKS_NV = 0x8E68;
def GL_MAX_TASK_TEXTURE_IMAGE_UNITS_NV = 0x8E69;
def GL_MAX_TASK_IMAGE_UNIFORMS_NV = 0x8E6A;
def GL_MAX_TASK_UNIFORM_COMPONENTS_NV = 0x8E6B;
def GL_MAX_TASK_ATOMIC_COUNTER_BUFFERS_NV = 0x8E6C;
def GL_MAX_TASK_ATOMIC_COUNTERS_NV = 0x8E6D;
def GL_MAX_TASK_SHADER_STORAGE_BLOCKS_NV = 0x8E6E;
def GL_MAX_COMBINED_TASK_UNIFORM_COMPONENTS_NV = 0x8E6F;
def GL_MAX_MESH_WORK_GROUP_INVOCATIONS_NV = 0x95A2;
def GL_MAX_TASK_WORK_GROUP_INVOCATIONS_NV = 0x95A3;
def GL_MAX_MESH_TOTAL_MEMORY_SIZE_NV = 0x9536;
def GL_MAX_TASK_TOTAL_MEMORY_SIZE_NV = 0x9537;
def GL_MAX_MESH_OUTPUT_VERTICES_NV = 0x9538;
def GL_MAX_MESH_OUTPUT_PRIMITIVES_NV = 0x9539;
def GL_MAX_TASK_OUTPUT_COUNT_NV = 0x953A;
def GL_MAX_DRAW_MESH_TASKS_COUNT_NV = 0x953D;
def GL_MAX_MESH_VIEWS_NV = 0x9557;
def GL_MESH_OUTPUT_PER_VERTEX_GRANULARITY_NV = 0x92DF;
def GL_MESH_OUTPUT_PER_PRIMITIVE_GRANULARITY_NV = 0x9543;
def GL_MAX_MESH_WORK_GROUP_SIZE_NV = 0x953B;
def GL_MAX_TASK_WORK_GROUP_SIZE_NV = 0x953C;
def GL_MESH_WORK_GROUP_SIZE_NV = 0x953E;
def GL_TASK_WORK_GROUP_SIZE_NV = 0x953F;
def GL_MESH_VERTICES_OUT_NV = 0x9579;
def GL_MESH_PRIMITIVES_OUT_NV = 0x957A;
def GL_MESH_OUTPUT_TYPE_NV = 0x957B;
def GL_UNIFORM_BLOCK_REFERENCED_BY_MESH_SHADER_NV = 0x959C;
def GL_UNIFORM_BLOCK_REFERENCED_BY_TASK_SHADER_NV = 0x959D;
def GL_REFERENCED_BY_MESH_SHADER_NV = 0x95A0;
def GL_REFERENCED_BY_TASK_SHADER_NV = 0x95A1;
def GL_MESH_SHADER_BIT_NV = 0x00000040;
def GL_TASK_SHADER_BIT_NV = 0x00000080;
def GL_MESH_SUBROUTINE_NV = 0x957C;
def GL_TASK_SUBROUTINE_NV = 0x957D;
def GL_MESH_SUBROUTINE_UNIFORM_NV = 0x957E;
def GL_TASK_SUBROUTINE_UNIFORM_NV = 0x957F;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_MESH_SHADER_NV = 0x959E;
def GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TASK_SHADER_NV = 0x959F;

def glDrawMeshTasksNV_signature func(first GLuint; count GLuint);
var global glDrawMeshTasksNV glDrawMeshTasksNV_signature;

def glDrawMeshTasksIndirectNV_signature func(indirect GLintptr);
var global glDrawMeshTasksIndirectNV glDrawMeshTasksIndirectNV_signature;

def glMultiDrawMeshTasksIndirectNV_signature func(indirect GLintptr; drawcount GLsizei; stride GLsizei);
var global glMultiDrawMeshTasksIndirectNV glMultiDrawMeshTasksIndirectNV_signature;

def glMultiDrawMeshTasksIndirectCountNV_signature func(indirect GLintptr; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var global glMultiDrawMeshTasksIndirectCountNV glMultiDrawMeshTasksIndirectCountNV_signature;
def GL_NV_multisample_coverage = 1;
def GL_NV_multisample_filter_hint = 1;
def GL_MULTISAMPLE_FILTER_HINT_NV = 0x8534;
def GL_NV_occlusion_query = 1;
def GL_PIXEL_COUNTER_BITS_NV = 0x8864;
def GL_CURRENT_OCCLUSION_QUERY_ID_NV = 0x8865;
def GL_PIXEL_COUNT_NV = 0x8866;
def GL_PIXEL_COUNT_AVAILABLE_NV = 0x8867;

def glGenOcclusionQueriesNV_signature func(n GLsizei; ids GLuint ref);
var global glGenOcclusionQueriesNV glGenOcclusionQueriesNV_signature;

def glDeleteOcclusionQueriesNV_signature func(n GLsizei; ids GLuint ref);
var global glDeleteOcclusionQueriesNV glDeleteOcclusionQueriesNV_signature;

def glIsOcclusionQueryNV_signature func(id GLuint) (result GLboolean);
var global glIsOcclusionQueryNV glIsOcclusionQueryNV_signature;

def glBeginOcclusionQueryNV_signature func(id GLuint);
var global glBeginOcclusionQueryNV glBeginOcclusionQueryNV_signature;

def glEndOcclusionQueryNV_signature func();
var global glEndOcclusionQueryNV glEndOcclusionQueryNV_signature;

def glGetOcclusionQueryivNV_signature func(id GLuint; pname GLenum; params GLint ref);
var global glGetOcclusionQueryivNV glGetOcclusionQueryivNV_signature;

def glGetOcclusionQueryuivNV_signature func(id GLuint; pname GLenum; params GLuint ref);
var global glGetOcclusionQueryuivNV glGetOcclusionQueryuivNV_signature;
def GL_NV_packed_depth_stencil = 1;
def GL_DEPTH_STENCIL_NV = 0x84F9;
def GL_UNSIGNED_INT_24_8_NV = 0x84FA;
def GL_NV_parameter_buffer_object = 1;
def GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV = 0x8DA0;
def GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV = 0x8DA1;
def GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA2;
def GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA3;
def GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA4;

def glProgramBufferParametersfvNV_signature func(target GLenum; bindingIndex GLuint; wordIndex GLuint; count GLsizei; params GLfloat ref);
var global glProgramBufferParametersfvNV glProgramBufferParametersfvNV_signature;

def glProgramBufferParametersIivNV_signature func(target GLenum; bindingIndex GLuint; wordIndex GLuint; count GLsizei; params GLint ref);
var global glProgramBufferParametersIivNV glProgramBufferParametersIivNV_signature;

def glProgramBufferParametersIuivNV_signature func(target GLenum; bindingIndex GLuint; wordIndex GLuint; count GLsizei; params GLuint ref);
var global glProgramBufferParametersIuivNV glProgramBufferParametersIuivNV_signature;
def GL_NV_parameter_buffer_object2 = 1;
def GL_NV_path_rendering = 1;
def GL_PATH_FORMAT_SVG_NV = 0x9070;
def GL_PATH_FORMAT_PS_NV = 0x9071;
def GL_STANDARD_FONT_NAME_NV = 0x9072;
def GL_SYSTEM_FONT_NAME_NV = 0x9073;
def GL_FILE_NAME_NV = 0x9074;
def GL_PATH_STROKE_WIDTH_NV = 0x9075;
def GL_PATH_END_CAPS_NV = 0x9076;
def GL_PATH_INITIAL_END_CAP_NV = 0x9077;
def GL_PATH_TERMINAL_END_CAP_NV = 0x9078;
def GL_PATH_JOIN_STYLE_NV = 0x9079;
def GL_PATH_MITER_LIMIT_NV = 0x907A;
def GL_PATH_DASH_CAPS_NV = 0x907B;
def GL_PATH_INITIAL_DASH_CAP_NV = 0x907C;
def GL_PATH_TERMINAL_DASH_CAP_NV = 0x907D;
def GL_PATH_DASH_OFFSET_NV = 0x907E;
def GL_PATH_CLIENT_LENGTH_NV = 0x907F;
def GL_PATH_FILL_MODE_NV = 0x9080;
def GL_PATH_FILL_MASK_NV = 0x9081;
def GL_PATH_FILL_COVER_MODE_NV = 0x9082;
def GL_PATH_STROKE_COVER_MODE_NV = 0x9083;
def GL_PATH_STROKE_MASK_NV = 0x9084;
def GL_COUNT_UP_NV = 0x9088;
def GL_COUNT_DOWN_NV = 0x9089;
def GL_PATH_OBJECT_BOUNDING_BOX_NV = 0x908A;
def GL_CONVEX_HULL_NV = 0x908B;
def GL_BOUNDING_BOX_NV = 0x908D;
def GL_TRANSLATE_X_NV = 0x908E;
def GL_TRANSLATE_Y_NV = 0x908F;
def GL_TRANSLATE_2D_NV = 0x9090;
def GL_TRANSLATE_3D_NV = 0x9091;
def GL_AFFINE_2D_NV = 0x9092;
def GL_AFFINE_3D_NV = 0x9094;
def GL_TRANSPOSE_AFFINE_2D_NV = 0x9096;
def GL_TRANSPOSE_AFFINE_3D_NV = 0x9098;
def GL_UTF8_NV = 0x909A;
def GL_UTF16_NV = 0x909B;
def GL_BOUNDING_BOX_OF_BOUNDING_BOXES_NV = 0x909C;
def GL_PATH_COMMAND_COUNT_NV = 0x909D;
def GL_PATH_COORD_COUNT_NV = 0x909E;
def GL_PATH_DASH_ARRAY_COUNT_NV = 0x909F;
def GL_PATH_COMPUTED_LENGTH_NV = 0x90A0;
def GL_PATH_FILL_BOUNDING_BOX_NV = 0x90A1;
def GL_PATH_STROKE_BOUNDING_BOX_NV = 0x90A2;
def GL_SQUARE_NV = 0x90A3;
def GL_ROUND_NV = 0x90A4;
def GL_TRIANGULAR_NV = 0x90A5;
def GL_BEVEL_NV = 0x90A6;
def GL_MITER_REVERT_NV = 0x90A7;
def GL_MITER_TRUNCATE_NV = 0x90A8;
def GL_SKIP_MISSING_GLYPH_NV = 0x90A9;
def GL_USE_MISSING_GLYPH_NV = 0x90AA;
def GL_PATH_ERROR_POSITION_NV = 0x90AB;
def GL_ACCUM_ADJACENT_PAIRS_NV = 0x90AD;
def GL_ADJACENT_PAIRS_NV = 0x90AE;
def GL_FIRST_TO_REST_NV = 0x90AF;
def GL_PATH_GEN_MODE_NV = 0x90B0;
def GL_PATH_GEN_COEFF_NV = 0x90B1;
def GL_PATH_GEN_COMPONENTS_NV = 0x90B3;
def GL_PATH_STENCIL_FUNC_NV = 0x90B7;
def GL_PATH_STENCIL_REF_NV = 0x90B8;
def GL_PATH_STENCIL_VALUE_MASK_NV = 0x90B9;
def GL_PATH_STENCIL_DEPTH_OFFSET_FACTOR_NV = 0x90BD;
def GL_PATH_STENCIL_DEPTH_OFFSET_UNITS_NV = 0x90BE;
def GL_PATH_COVER_DEPTH_FUNC_NV = 0x90BF;
def GL_PATH_DASH_OFFSET_RESET_NV = 0x90B4;
def GL_MOVE_TO_RESETS_NV = 0x90B5;
def GL_MOVE_TO_CONTINUES_NV = 0x90B6;
def GL_CLOSE_PATH_NV = 0x00;
def GL_MOVE_TO_NV = 0x02;
def GL_RELATIVE_MOVE_TO_NV = 0x03;
def GL_LINE_TO_NV = 0x04;
def GL_RELATIVE_LINE_TO_NV = 0x05;
def GL_HORIZONTAL_LINE_TO_NV = 0x06;
def GL_RELATIVE_HORIZONTAL_LINE_TO_NV = 0x07;
def GL_VERTICAL_LINE_TO_NV = 0x08;
def GL_RELATIVE_VERTICAL_LINE_TO_NV = 0x09;
def GL_QUADRATIC_CURVE_TO_NV = 0x0A;
def GL_RELATIVE_QUADRATIC_CURVE_TO_NV = 0x0B;
def GL_CUBIC_CURVE_TO_NV = 0x0C;
def GL_RELATIVE_CUBIC_CURVE_TO_NV = 0x0D;
def GL_SMOOTH_QUADRATIC_CURVE_TO_NV = 0x0E;
def GL_RELATIVE_SMOOTH_QUADRATIC_CURVE_TO_NV = 0x0F;
def GL_SMOOTH_CUBIC_CURVE_TO_NV = 0x10;
def GL_RELATIVE_SMOOTH_CUBIC_CURVE_TO_NV = 0x11;
def GL_SMALL_CCW_ARC_TO_NV = 0x12;
def GL_RELATIVE_SMALL_CCW_ARC_TO_NV = 0x13;
def GL_SMALL_CW_ARC_TO_NV = 0x14;
def GL_RELATIVE_SMALL_CW_ARC_TO_NV = 0x15;
def GL_LARGE_CCW_ARC_TO_NV = 0x16;
def GL_RELATIVE_LARGE_CCW_ARC_TO_NV = 0x17;
def GL_LARGE_CW_ARC_TO_NV = 0x18;
def GL_RELATIVE_LARGE_CW_ARC_TO_NV = 0x19;
def GL_RESTART_PATH_NV = 0xF0;
def GL_DUP_FIRST_CUBIC_CURVE_TO_NV = 0xF2;
def GL_DUP_LAST_CUBIC_CURVE_TO_NV = 0xF4;
def GL_RECT_NV = 0xF6;
def GL_CIRCULAR_CCW_ARC_TO_NV = 0xF8;
def GL_CIRCULAR_CW_ARC_TO_NV = 0xFA;
def GL_CIRCULAR_TANGENT_ARC_TO_NV = 0xFC;
def GL_ARC_TO_NV = 0xFE;
def GL_RELATIVE_ARC_TO_NV = 0xFF;
def GL_BOLD_BIT_NV = 0x01;
def GL_ITALIC_BIT_NV = 0x02;
def GL_GLYPH_WIDTH_BIT_NV = 0x01;
def GL_GLYPH_HEIGHT_BIT_NV = 0x02;
def GL_GLYPH_HORIZONTAL_BEARING_X_BIT_NV = 0x04;
def GL_GLYPH_HORIZONTAL_BEARING_Y_BIT_NV = 0x08;
def GL_GLYPH_HORIZONTAL_BEARING_ADVANCE_BIT_NV = 0x10;
def GL_GLYPH_VERTICAL_BEARING_X_BIT_NV = 0x20;
def GL_GLYPH_VERTICAL_BEARING_Y_BIT_NV = 0x40;
def GL_GLYPH_VERTICAL_BEARING_ADVANCE_BIT_NV = 0x80;
def GL_GLYPH_HAS_KERNING_BIT_NV = 0x100;
def GL_FONT_X_MIN_BOUNDS_BIT_NV = 0x00010000;
def GL_FONT_Y_MIN_BOUNDS_BIT_NV = 0x00020000;
def GL_FONT_X_MAX_BOUNDS_BIT_NV = 0x00040000;
def GL_FONT_Y_MAX_BOUNDS_BIT_NV = 0x00080000;
def GL_FONT_UNITS_PER_EM_BIT_NV = 0x00100000;
def GL_FONT_ASCENDER_BIT_NV = 0x00200000;
def GL_FONT_DESCENDER_BIT_NV = 0x00400000;
def GL_FONT_HEIGHT_BIT_NV = 0x00800000;
def GL_FONT_MAX_ADVANCE_WIDTH_BIT_NV = 0x01000000;
def GL_FONT_MAX_ADVANCE_HEIGHT_BIT_NV = 0x02000000;
def GL_FONT_UNDERLINE_POSITION_BIT_NV = 0x04000000;
def GL_FONT_UNDERLINE_THICKNESS_BIT_NV = 0x08000000;
def GL_FONT_HAS_KERNING_BIT_NV = 0x10000000;
def GL_ROUNDED_RECT_NV = 0xE8;
def GL_RELATIVE_ROUNDED_RECT_NV = 0xE9;
def GL_ROUNDED_RECT2_NV = 0xEA;
def GL_RELATIVE_ROUNDED_RECT2_NV = 0xEB;
def GL_ROUNDED_RECT4_NV = 0xEC;
def GL_RELATIVE_ROUNDED_RECT4_NV = 0xED;
def GL_ROUNDED_RECT8_NV = 0xEE;
def GL_RELATIVE_ROUNDED_RECT8_NV = 0xEF;
def GL_RELATIVE_RECT_NV = 0xF7;
def GL_FONT_GLYPHS_AVAILABLE_NV = 0x9368;
def GL_FONT_TARGET_UNAVAILABLE_NV = 0x9369;
def GL_FONT_UNAVAILABLE_NV = 0x936A;
def GL_FONT_UNINTELLIGIBLE_NV = 0x936B;
def GL_CONIC_CURVE_TO_NV = 0x1A;
def GL_RELATIVE_CONIC_CURVE_TO_NV = 0x1B;
def GL_FONT_NUM_GLYPH_INDICES_BIT_NV = 0x20000000;
def GL_STANDARD_FONT_FORMAT_NV = 0x936C;
def GL_2_BYTES_NV = 0x1407;
def GL_3_BYTES_NV = 0x1408;
def GL_4_BYTES_NV = 0x1409;
def GL_EYE_LINEAR_NV = 0x2400;
def GL_OBJECT_LINEAR_NV = 0x2401;
def GL_CONSTANT_NV = 0x8576;
def GL_PATH_FOG_GEN_MODE_NV = 0x90AC;
def GL_PRIMARY_COLOR_NV = 0x852C;
def GL_SECONDARY_COLOR_NV = 0x852D;
def GL_PATH_GEN_COLOR_FORMAT_NV = 0x90B2;
def GL_PATH_PROJECTION_NV = 0x1701;
def GL_PATH_MODELVIEW_NV = 0x1700;
def GL_PATH_MODELVIEW_STACK_DEPTH_NV = 0x0BA3;
def GL_PATH_MODELVIEW_MATRIX_NV = 0x0BA6;
def GL_PATH_MAX_MODELVIEW_STACK_DEPTH_NV = 0x0D36;
def GL_PATH_TRANSPOSE_MODELVIEW_MATRIX_NV = 0x84E3;
def GL_PATH_PROJECTION_STACK_DEPTH_NV = 0x0BA4;
def GL_PATH_PROJECTION_MATRIX_NV = 0x0BA7;
def GL_PATH_MAX_PROJECTION_STACK_DEPTH_NV = 0x0D38;
def GL_PATH_TRANSPOSE_PROJECTION_MATRIX_NV = 0x84E4;
def GL_FRAGMENT_INPUT_NV = 0x936D;

def glGenPathsNV_signature func(range GLsizei) (result GLuint);
var global glGenPathsNV glGenPathsNV_signature;

def glDeletePathsNV_signature func(path GLuint; range GLsizei);
var global glDeletePathsNV glDeletePathsNV_signature;

def glIsPathNV_signature func(path GLuint) (result GLboolean);
var global glIsPathNV glIsPathNV_signature;

def glPathCommandsNV_signature func(path GLuint; numCommands GLsizei; commands GLubyte ref; numCoords GLsizei; coordType GLenum; coords u8 ref);
var global glPathCommandsNV glPathCommandsNV_signature;

def glPathCoordsNV_signature func(path GLuint; numCoords GLsizei; coordType GLenum; coords u8 ref);
var global glPathCoordsNV glPathCoordsNV_signature;

def glPathSubCommandsNV_signature func(path GLuint; commandStart GLsizei; commandsToDelete GLsizei; numCommands GLsizei; commands GLubyte ref; numCoords GLsizei; coordType GLenum; coords u8 ref);
var global glPathSubCommandsNV glPathSubCommandsNV_signature;

def glPathSubCoordsNV_signature func(path GLuint; coordStart GLsizei; numCoords GLsizei; coordType GLenum; coords u8 ref);
var global glPathSubCoordsNV glPathSubCoordsNV_signature;

def glPathStringNV_signature func(path GLuint; format GLenum; length GLsizei; pathString u8 ref);
var global glPathStringNV glPathStringNV_signature;

def glPathGlyphsNV_signature func(firstPathName GLuint; fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; numGlyphs GLsizei; type GLenum; charcodes u8 ref; handleMissingGlyphs GLenum; pathParameterTemplate GLuint; emScale GLfloat);
var global glPathGlyphsNV glPathGlyphsNV_signature;

def glPathGlyphRangeNV_signature func(firstPathName GLuint; fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; firstGlyph GLuint; numGlyphs GLsizei; handleMissingGlyphs GLenum; pathParameterTemplate GLuint; emScale GLfloat);
var global glPathGlyphRangeNV glPathGlyphRangeNV_signature;

def glWeightPathsNV_signature func(resultPath GLuint; numPaths GLsizei; paths GLuint ref; weights GLfloat ref);
var global glWeightPathsNV glWeightPathsNV_signature;

def glCopyPathNV_signature func(resultPath GLuint; srcPath GLuint);
var global glCopyPathNV glCopyPathNV_signature;

def glInterpolatePathsNV_signature func(resultPath GLuint; pathA GLuint; pathB GLuint; weight GLfloat);
var global glInterpolatePathsNV glInterpolatePathsNV_signature;

def glTransformPathNV_signature func(resultPath GLuint; srcPath GLuint; transformType GLenum; transformValues GLfloat ref);
var global glTransformPathNV glTransformPathNV_signature;

def glPathParameterivNV_signature func(path GLuint; pname GLenum; value GLint ref);
var global glPathParameterivNV glPathParameterivNV_signature;

def glPathParameteriNV_signature func(path GLuint; pname GLenum; value GLint);
var global glPathParameteriNV glPathParameteriNV_signature;

def glPathParameterfvNV_signature func(path GLuint; pname GLenum; value GLfloat ref);
var global glPathParameterfvNV glPathParameterfvNV_signature;

def glPathParameterfNV_signature func(path GLuint; pname GLenum; value GLfloat);
var global glPathParameterfNV glPathParameterfNV_signature;

def glPathDashArrayNV_signature func(path GLuint; dashCount GLsizei; dashArray GLfloat ref);
var global glPathDashArrayNV glPathDashArrayNV_signature;

def glPathStencilFuncNV_signature func(func GLenum; ref GLint; mask GLuint);
var global glPathStencilFuncNV glPathStencilFuncNV_signature;

def glPathStencilDepthOffsetNV_signature func(factor GLfloat; units GLfloat);
var global glPathStencilDepthOffsetNV glPathStencilDepthOffsetNV_signature;

def glStencilFillPathNV_signature func(path GLuint; fillMode GLenum; mask GLuint);
var global glStencilFillPathNV glStencilFillPathNV_signature;

def glStencilStrokePathNV_signature func(path GLuint; reference GLint; mask GLuint);
var global glStencilStrokePathNV glStencilStrokePathNV_signature;

def glStencilFillPathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; fillMode GLenum; mask GLuint; transformType GLenum; transformValues GLfloat ref);
var global glStencilFillPathInstancedNV glStencilFillPathInstancedNV_signature;

def glStencilStrokePathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; reference GLint; mask GLuint; transformType GLenum; transformValues GLfloat ref);
var global glStencilStrokePathInstancedNV glStencilStrokePathInstancedNV_signature;

def glPathCoverDepthFuncNV_signature func(func GLenum);
var global glPathCoverDepthFuncNV glPathCoverDepthFuncNV_signature;

def glCoverFillPathNV_signature func(path GLuint; coverMode GLenum);
var global glCoverFillPathNV glCoverFillPathNV_signature;

def glCoverStrokePathNV_signature func(path GLuint; coverMode GLenum);
var global glCoverStrokePathNV glCoverStrokePathNV_signature;

def glCoverFillPathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var global glCoverFillPathInstancedNV glCoverFillPathInstancedNV_signature;

def glCoverStrokePathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var global glCoverStrokePathInstancedNV glCoverStrokePathInstancedNV_signature;

def glGetPathParameterivNV_signature func(path GLuint; pname GLenum; value GLint ref);
var global glGetPathParameterivNV glGetPathParameterivNV_signature;

def glGetPathParameterfvNV_signature func(path GLuint; pname GLenum; value GLfloat ref);
var global glGetPathParameterfvNV glGetPathParameterfvNV_signature;

def glGetPathCommandsNV_signature func(path GLuint; commands GLubyte ref);
var global glGetPathCommandsNV glGetPathCommandsNV_signature;

def glGetPathCoordsNV_signature func(path GLuint; coords GLfloat ref);
var global glGetPathCoordsNV glGetPathCoordsNV_signature;

def glGetPathDashArrayNV_signature func(path GLuint; dashArray GLfloat ref);
var global glGetPathDashArrayNV glGetPathDashArrayNV_signature;

def glGetPathMetricsNV_signature func(metricQueryMask GLbitfield; numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; stride GLsizei; metrics GLfloat ref);
var global glGetPathMetricsNV glGetPathMetricsNV_signature;

def glGetPathMetricRangeNV_signature func(metricQueryMask GLbitfield; firstPathName GLuint; numPaths GLsizei; stride GLsizei; metrics GLfloat ref);
var global glGetPathMetricRangeNV glGetPathMetricRangeNV_signature;

def glGetPathSpacingNV_signature func(pathListMode GLenum; numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; advanceScale GLfloat; kerningScale GLfloat; transformType GLenum; returnedSpacing GLfloat ref);
var global glGetPathSpacingNV glGetPathSpacingNV_signature;

def glIsPointInFillPathNV_signature func(path GLuint; mask GLuint; x GLfloat; y GLfloat) (result GLboolean);
var global glIsPointInFillPathNV glIsPointInFillPathNV_signature;

def glIsPointInStrokePathNV_signature func(path GLuint; x GLfloat; y GLfloat) (result GLboolean);
var global glIsPointInStrokePathNV glIsPointInStrokePathNV_signature;

def glGetPathLengthNV_signature func(path GLuint; startSegment GLsizei; numSegments GLsizei) (result GLfloat);
var global glGetPathLengthNV glGetPathLengthNV_signature;

def glPointAlongPathNV_signature func(path GLuint; startSegment GLsizei; numSegments GLsizei; distance GLfloat; x GLfloat ref; y GLfloat ref; tangentX GLfloat ref; tangentY GLfloat ref) (result GLboolean);
var global glPointAlongPathNV glPointAlongPathNV_signature;

def glMatrixLoad3x2fNV_signature func(matrixMode GLenum; m GLfloat ref);
var global glMatrixLoad3x2fNV glMatrixLoad3x2fNV_signature;

def glMatrixLoad3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var global glMatrixLoad3x3fNV glMatrixLoad3x3fNV_signature;

def glMatrixLoadTranspose3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var global glMatrixLoadTranspose3x3fNV glMatrixLoadTranspose3x3fNV_signature;

def glMatrixMult3x2fNV_signature func(matrixMode GLenum; m GLfloat ref);
var global glMatrixMult3x2fNV glMatrixMult3x2fNV_signature;

def glMatrixMult3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var global glMatrixMult3x3fNV glMatrixMult3x3fNV_signature;

def glMatrixMultTranspose3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var global glMatrixMultTranspose3x3fNV glMatrixMultTranspose3x3fNV_signature;

def glStencilThenCoverFillPathNV_signature func(path GLuint; fillMode GLenum; mask GLuint; coverMode GLenum);
var global glStencilThenCoverFillPathNV glStencilThenCoverFillPathNV_signature;

def glStencilThenCoverStrokePathNV_signature func(path GLuint; reference GLint; mask GLuint; coverMode GLenum);
var global glStencilThenCoverStrokePathNV glStencilThenCoverStrokePathNV_signature;

def glStencilThenCoverFillPathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; fillMode GLenum; mask GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var global glStencilThenCoverFillPathInstancedNV glStencilThenCoverFillPathInstancedNV_signature;

def glStencilThenCoverStrokePathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; reference GLint; mask GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var global glStencilThenCoverStrokePathInstancedNV glStencilThenCoverStrokePathInstancedNV_signature;

def glPathGlyphIndexRangeNV_signature func(fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; pathParameterTemplate GLuint; emScale GLfloat; baseAndCount GLuint ref) (result GLenum);
var global glPathGlyphIndexRangeNV glPathGlyphIndexRangeNV_signature;

def glPathGlyphIndexArrayNV_signature func(firstPathName GLuint; fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; firstGlyphIndex GLuint; numGlyphs GLsizei; pathParameterTemplate GLuint; emScale GLfloat) (result GLenum);
var global glPathGlyphIndexArrayNV glPathGlyphIndexArrayNV_signature;

def glPathMemoryGlyphIndexArrayNV_signature func(firstPathName GLuint; fontTarget GLenum; fontSize GLsizeiptr; fontData u8 ref; faceIndex GLsizei; firstGlyphIndex GLuint; numGlyphs GLsizei; pathParameterTemplate GLuint; emScale GLfloat) (result GLenum);
var global glPathMemoryGlyphIndexArrayNV glPathMemoryGlyphIndexArrayNV_signature;

def glProgramPathFragmentInputGenNV_signature func(program GLuint; location GLint; genMode GLenum; components GLint; coeffs GLfloat ref);
var global glProgramPathFragmentInputGenNV glProgramPathFragmentInputGenNV_signature;

def glGetProgramResourcefvNV_signature func(program GLuint; programInterface GLenum; index GLuint; propCount GLsizei; props GLenum ref; count GLsizei; length GLsizei ref; params GLfloat ref);
var global glGetProgramResourcefvNV glGetProgramResourcefvNV_signature;

def glPathColorGenNV_signature func(color GLenum; genMode GLenum; colorFormat GLenum; coeffs GLfloat ref);
var global glPathColorGenNV glPathColorGenNV_signature;

def glPathTexGenNV_signature func(texCoordSet GLenum; genMode GLenum; components GLint; coeffs GLfloat ref);
var global glPathTexGenNV glPathTexGenNV_signature;

def glPathFogGenNV_signature func(genMode GLenum);
var global glPathFogGenNV glPathFogGenNV_signature;

def glGetPathColorGenivNV_signature func(color GLenum; pname GLenum; value GLint ref);
var global glGetPathColorGenivNV glGetPathColorGenivNV_signature;

def glGetPathColorGenfvNV_signature func(color GLenum; pname GLenum; value GLfloat ref);
var global glGetPathColorGenfvNV glGetPathColorGenfvNV_signature;

def glGetPathTexGenivNV_signature func(texCoordSet GLenum; pname GLenum; value GLint ref);
var global glGetPathTexGenivNV glGetPathTexGenivNV_signature;

def glGetPathTexGenfvNV_signature func(texCoordSet GLenum; pname GLenum; value GLfloat ref);
var global glGetPathTexGenfvNV glGetPathTexGenfvNV_signature;
def GL_NV_path_rendering_shared_edge = 1;
def GL_SHARED_EDGE_NV = 0xC0;
def GL_NV_pixel_data_range = 1;
def GL_WRITE_PIXEL_DATA_RANGE_NV = 0x8878;
def GL_READ_PIXEL_DATA_RANGE_NV = 0x8879;
def GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV = 0x887A;
def GL_READ_PIXEL_DATA_RANGE_LENGTH_NV = 0x887B;
def GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV = 0x887C;
def GL_READ_PIXEL_DATA_RANGE_POINTER_NV = 0x887D;

def glPixelDataRangeNV_signature func(target GLenum; length GLsizei; pointer u8 ref);
var global glPixelDataRangeNV glPixelDataRangeNV_signature;

def glFlushPixelDataRangeNV_signature func(target GLenum);
var global glFlushPixelDataRangeNV glFlushPixelDataRangeNV_signature;
def GL_NV_point_sprite = 1;
def GL_POINT_SPRITE_NV = 0x8861;
def GL_COORD_REPLACE_NV = 0x8862;
def GL_POINT_SPRITE_R_MODE_NV = 0x8863;

def glPointParameteriNV_signature func(pname GLenum; param GLint);
var global glPointParameteriNV glPointParameteriNV_signature;

def glPointParameterivNV_signature func(pname GLenum; params GLint ref);
var global glPointParameterivNV glPointParameterivNV_signature;
def GL_NV_present_video = 1;
def GL_FRAME_NV = 0x8E26;
def GL_FIELDS_NV = 0x8E27;
def GL_CURRENT_TIME_NV = 0x8E28;
def GL_NUM_FILL_STREAMS_NV = 0x8E29;
def GL_PRESENT_TIME_NV = 0x8E2A;
def GL_PRESENT_DURATION_NV = 0x8E2B;

def glPresentFrameKeyedNV_signature func(video_slot GLuint; minPresentTime GLuint64EXT; beginPresentTimeId GLuint; presentDurationId GLuint; type GLenum; target0 GLenum; fill0 GLuint; key0 GLuint; target1 GLenum; fill1 GLuint; key1 GLuint);
var global glPresentFrameKeyedNV glPresentFrameKeyedNV_signature;

def glPresentFrameDualFillNV_signature func(video_slot GLuint; minPresentTime GLuint64EXT; beginPresentTimeId GLuint; presentDurationId GLuint; type GLenum; target0 GLenum; fill0 GLuint; target1 GLenum; fill1 GLuint; target2 GLenum; fill2 GLuint; target3 GLenum; fill3 GLuint);
var global glPresentFrameDualFillNV glPresentFrameDualFillNV_signature;

def glGetVideoivNV_signature func(video_slot GLuint; pname GLenum; params GLint ref);
var global glGetVideoivNV glGetVideoivNV_signature;

def glGetVideouivNV_signature func(video_slot GLuint; pname GLenum; params GLuint ref);
var global glGetVideouivNV glGetVideouivNV_signature;

def glGetVideoi64vNV_signature func(video_slot GLuint; pname GLenum; params GLint64EXT ref);
var global glGetVideoi64vNV glGetVideoi64vNV_signature;

def glGetVideoui64vNV_signature func(video_slot GLuint; pname GLenum; params GLuint64EXT ref);
var global glGetVideoui64vNV glGetVideoui64vNV_signature;
def GL_NV_primitive_restart = 1;
def GL_PRIMITIVE_RESTART_NV = 0x8558;
def GL_PRIMITIVE_RESTART_INDEX_NV = 0x8559;

def glPrimitiveRestartNV_signature func();
var global glPrimitiveRestartNV glPrimitiveRestartNV_signature;

def glPrimitiveRestartIndexNV_signature func(index GLuint);
var global glPrimitiveRestartIndexNV glPrimitiveRestartIndexNV_signature;
def GL_NV_primitive_shading_rate = 1;
def GL_SHADING_RATE_IMAGE_PER_PRIMITIVE_NV = 0x95B1;
def GL_SHADING_RATE_IMAGE_PALETTE_COUNT_NV = 0x95B2;
def GL_NV_query_resource = 1;
def GL_QUERY_RESOURCE_TYPE_VIDMEM_ALLOC_NV = 0x9540;
def GL_QUERY_RESOURCE_MEMTYPE_VIDMEM_NV = 0x9542;
def GL_QUERY_RESOURCE_SYS_RESERVED_NV = 0x9544;
def GL_QUERY_RESOURCE_TEXTURE_NV = 0x9545;
def GL_QUERY_RESOURCE_RENDERBUFFER_NV = 0x9546;
def GL_QUERY_RESOURCE_BUFFEROBJECT_NV = 0x9547;

def glQueryResourceNV_signature func(queryType GLenum; tagId GLint; count GLuint; buffer GLint ref) (result GLint);
var global glQueryResourceNV glQueryResourceNV_signature;
def GL_NV_query_resource_tag = 1;

def glGenQueryResourceTagNV_signature func(n GLsizei; tagIds GLint ref);
var global glGenQueryResourceTagNV glGenQueryResourceTagNV_signature;

def glDeleteQueryResourceTagNV_signature func(n GLsizei; tagIds GLint ref);
var global glDeleteQueryResourceTagNV glDeleteQueryResourceTagNV_signature;

def glQueryResourceTagNV_signature func(tagId GLint; tagString GLchar ref);
var global glQueryResourceTagNV glQueryResourceTagNV_signature;
def GL_NV_register_combiners = 1;
def GL_REGISTER_COMBINERS_NV = 0x8522;
def GL_VARIABLE_A_NV = 0x8523;
def GL_VARIABLE_B_NV = 0x8524;
def GL_VARIABLE_C_NV = 0x8525;
def GL_VARIABLE_D_NV = 0x8526;
def GL_VARIABLE_E_NV = 0x8527;
def GL_VARIABLE_F_NV = 0x8528;
def GL_VARIABLE_G_NV = 0x8529;
def GL_CONSTANT_COLOR0_NV = 0x852A;
def GL_CONSTANT_COLOR1_NV = 0x852B;
def GL_SPARE0_NV = 0x852E;
def GL_SPARE1_NV = 0x852F;
def GL_DISCARD_NV = 0x8530;
def GL_E_TIMES_F_NV = 0x8531;
def GL_SPARE0_PLUS_SECONDARY_COLOR_NV = 0x8532;
def GL_UNSIGNED_IDENTITY_NV = 0x8536;
def GL_UNSIGNED_INVERT_NV = 0x8537;
def GL_EXPAND_NORMAL_NV = 0x8538;
def GL_EXPAND_NEGATE_NV = 0x8539;
def GL_HALF_BIAS_NORMAL_NV = 0x853A;
def GL_HALF_BIAS_NEGATE_NV = 0x853B;
def GL_SIGNED_IDENTITY_NV = 0x853C;
def GL_SIGNED_NEGATE_NV = 0x853D;
def GL_SCALE_BY_TWO_NV = 0x853E;
def GL_SCALE_BY_FOUR_NV = 0x853F;
def GL_SCALE_BY_ONE_HALF_NV = 0x8540;
def GL_BIAS_BY_NEGATIVE_ONE_HALF_NV = 0x8541;
def GL_COMBINER_INPUT_NV = 0x8542;
def GL_COMBINER_MAPPING_NV = 0x8543;
def GL_COMBINER_COMPONENT_USAGE_NV = 0x8544;
def GL_COMBINER_AB_DOT_PRODUCT_NV = 0x8545;
def GL_COMBINER_CD_DOT_PRODUCT_NV = 0x8546;
def GL_COMBINER_MUX_SUM_NV = 0x8547;
def GL_COMBINER_SCALE_NV = 0x8548;
def GL_COMBINER_BIAS_NV = 0x8549;
def GL_COMBINER_AB_OUTPUT_NV = 0x854A;
def GL_COMBINER_CD_OUTPUT_NV = 0x854B;
def GL_COMBINER_SUM_OUTPUT_NV = 0x854C;
def GL_MAX_GENERAL_COMBINERS_NV = 0x854D;
def GL_NUM_GENERAL_COMBINERS_NV = 0x854E;
def GL_COLOR_SUM_CLAMP_NV = 0x854F;
def GL_COMBINER0_NV = 0x8550;
def GL_COMBINER1_NV = 0x8551;
def GL_COMBINER2_NV = 0x8552;
def GL_COMBINER3_NV = 0x8553;
def GL_COMBINER4_NV = 0x8554;
def GL_COMBINER5_NV = 0x8555;
def GL_COMBINER6_NV = 0x8556;
def GL_COMBINER7_NV = 0x8557;

def glCombinerParameterfvNV_signature func(pname GLenum; params GLfloat ref);
var global glCombinerParameterfvNV glCombinerParameterfvNV_signature;

def glCombinerParameterfNV_signature func(pname GLenum; param GLfloat);
var global glCombinerParameterfNV glCombinerParameterfNV_signature;

def glCombinerParameterivNV_signature func(pname GLenum; params GLint ref);
var global glCombinerParameterivNV glCombinerParameterivNV_signature;

def glCombinerParameteriNV_signature func(pname GLenum; param GLint);
var global glCombinerParameteriNV glCombinerParameteriNV_signature;

def glCombinerInputNV_signature func(stage GLenum; portion GLenum; variable GLenum; input GLenum; mapping GLenum; componentUsage GLenum);
var global glCombinerInputNV glCombinerInputNV_signature;

def glCombinerOutputNV_signature func(stage GLenum; portion GLenum; abOutput GLenum; cdOutput GLenum; sumOutput GLenum; scale GLenum; bias GLenum; abDotProduct GLboolean; cdDotProduct GLboolean; muxSum GLboolean);
var global glCombinerOutputNV glCombinerOutputNV_signature;

def glFinalCombinerInputNV_signature func(variable GLenum; input GLenum; mapping GLenum; componentUsage GLenum);
var global glFinalCombinerInputNV glFinalCombinerInputNV_signature;

def glGetCombinerInputParameterfvNV_signature func(stage GLenum; portion GLenum; variable GLenum; pname GLenum; params GLfloat ref);
var global glGetCombinerInputParameterfvNV glGetCombinerInputParameterfvNV_signature;

def glGetCombinerInputParameterivNV_signature func(stage GLenum; portion GLenum; variable GLenum; pname GLenum; params GLint ref);
var global glGetCombinerInputParameterivNV glGetCombinerInputParameterivNV_signature;

def glGetCombinerOutputParameterfvNV_signature func(stage GLenum; portion GLenum; pname GLenum; params GLfloat ref);
var global glGetCombinerOutputParameterfvNV glGetCombinerOutputParameterfvNV_signature;

def glGetCombinerOutputParameterivNV_signature func(stage GLenum; portion GLenum; pname GLenum; params GLint ref);
var global glGetCombinerOutputParameterivNV glGetCombinerOutputParameterivNV_signature;

def glGetFinalCombinerInputParameterfvNV_signature func(variable GLenum; pname GLenum; params GLfloat ref);
var global glGetFinalCombinerInputParameterfvNV glGetFinalCombinerInputParameterfvNV_signature;

def glGetFinalCombinerInputParameterivNV_signature func(variable GLenum; pname GLenum; params GLint ref);
var global glGetFinalCombinerInputParameterivNV glGetFinalCombinerInputParameterivNV_signature;
def GL_NV_register_combiners2 = 1;
def GL_PER_STAGE_CONSTANTS_NV = 0x8535;

def glCombinerStageParameterfvNV_signature func(stage GLenum; pname GLenum; params GLfloat ref);
var global glCombinerStageParameterfvNV glCombinerStageParameterfvNV_signature;

def glGetCombinerStageParameterfvNV_signature func(stage GLenum; pname GLenum; params GLfloat ref);
var global glGetCombinerStageParameterfvNV glGetCombinerStageParameterfvNV_signature;
def GL_NV_representative_fragment_test = 1;
def GL_REPRESENTATIVE_FRAGMENT_TEST_NV = 0x937F;
def GL_NV_robustness_video_memory_purge = 1;
def GL_PURGED_CONTEXT_RESET_NV = 0x92BB;
def GL_NV_sample_locations = 1;
def GL_SAMPLE_LOCATION_SUBPIXEL_BITS_NV = 0x933D;
def GL_SAMPLE_LOCATION_PIXEL_GRID_WIDTH_NV = 0x933E;
def GL_SAMPLE_LOCATION_PIXEL_GRID_HEIGHT_NV = 0x933F;
def GL_PROGRAMMABLE_SAMPLE_LOCATION_TABLE_SIZE_NV = 0x9340;
def GL_SAMPLE_LOCATION_NV = 0x8E50;
def GL_PROGRAMMABLE_SAMPLE_LOCATION_NV = 0x9341;
def GL_FRAMEBUFFER_PROGRAMMABLE_SAMPLE_LOCATIONS_NV = 0x9342;
def GL_FRAMEBUFFER_SAMPLE_LOCATION_PIXEL_GRID_NV = 0x9343;

def glFramebufferSampleLocationsfvNV_signature func(target GLenum; start GLuint; count GLsizei; v GLfloat ref);
var global glFramebufferSampleLocationsfvNV glFramebufferSampleLocationsfvNV_signature;

def glNamedFramebufferSampleLocationsfvNV_signature func(framebuffer GLuint; start GLuint; count GLsizei; v GLfloat ref);
var global glNamedFramebufferSampleLocationsfvNV glNamedFramebufferSampleLocationsfvNV_signature;

def glResolveDepthValuesNV_signature func();
var global glResolveDepthValuesNV glResolveDepthValuesNV_signature;
def GL_NV_sample_mask_override_coverage = 1;
def GL_NV_scissor_exclusive = 1;
def GL_SCISSOR_TEST_EXCLUSIVE_NV = 0x9555;
def GL_SCISSOR_BOX_EXCLUSIVE_NV = 0x9556;

def glScissorExclusiveNV_signature func(x GLint; y GLint; width GLsizei; height GLsizei);
var global glScissorExclusiveNV glScissorExclusiveNV_signature;

def glScissorExclusiveArrayvNV_signature func(first GLuint; count GLsizei; v GLint ref);
var global glScissorExclusiveArrayvNV glScissorExclusiveArrayvNV_signature;
def GL_NV_shader_atomic_counters = 1;
def GL_NV_shader_atomic_float = 1;
def GL_NV_shader_atomic_float64 = 1;
def GL_NV_shader_atomic_fp16_vector = 1;
def GL_NV_shader_atomic_int64 = 1;
def GL_NV_shader_buffer_load = 1;
def GL_BUFFER_GPU_ADDRESS_NV = 0x8F1D;
def GL_GPU_ADDRESS_NV = 0x8F34;
def GL_MAX_SHADER_BUFFER_ADDRESS_NV = 0x8F35;

def glMakeBufferResidentNV_signature func(target GLenum; access GLenum);
var global glMakeBufferResidentNV glMakeBufferResidentNV_signature;

def glMakeBufferNonResidentNV_signature func(target GLenum);
var global glMakeBufferNonResidentNV glMakeBufferNonResidentNV_signature;

def glIsBufferResidentNV_signature func(target GLenum) (result GLboolean);
var global glIsBufferResidentNV glIsBufferResidentNV_signature;

def glMakeNamedBufferResidentNV_signature func(buffer GLuint; access GLenum);
var global glMakeNamedBufferResidentNV glMakeNamedBufferResidentNV_signature;

def glMakeNamedBufferNonResidentNV_signature func(buffer GLuint);
var global glMakeNamedBufferNonResidentNV glMakeNamedBufferNonResidentNV_signature;

def glIsNamedBufferResidentNV_signature func(buffer GLuint) (result GLboolean);
var global glIsNamedBufferResidentNV glIsNamedBufferResidentNV_signature;

def glGetBufferParameterui64vNV_signature func(target GLenum; pname GLenum; params GLuint64EXT ref);
var global glGetBufferParameterui64vNV glGetBufferParameterui64vNV_signature;

def glGetNamedBufferParameterui64vNV_signature func(buffer GLuint; pname GLenum; params GLuint64EXT ref);
var global glGetNamedBufferParameterui64vNV glGetNamedBufferParameterui64vNV_signature;

def glGetIntegerui64vNV_signature func(value GLenum; result GLuint64EXT ref);
var global glGetIntegerui64vNV glGetIntegerui64vNV_signature;

def glUniformui64NV_signature func(location GLint; value GLuint64EXT);
var global glUniformui64NV glUniformui64NV_signature;

def glUniformui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var global glUniformui64vNV glUniformui64vNV_signature;

def glProgramUniformui64NV_signature func(program GLuint; location GLint; value GLuint64EXT);
var global glProgramUniformui64NV glProgramUniformui64NV_signature;

def glProgramUniformui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var global glProgramUniformui64vNV glProgramUniformui64vNV_signature;
def GL_NV_shader_buffer_store = 1;
def GL_SHADER_GLOBAL_ACCESS_BARRIER_BIT_NV = 0x00000010;
def GL_NV_shader_storage_buffer_object = 1;
def GL_NV_shader_subgroup_partitioned = 1;
def GL_SUBGROUP_FEATURE_PARTITIONED_BIT_NV = 0x00000100;
def GL_NV_shader_texture_footprint = 1;
def GL_NV_shader_thread_group = 1;
def GL_WARP_SIZE_NV = 0x9339;
def GL_WARPS_PER_SM_NV = 0x933A;
def GL_SM_COUNT_NV = 0x933B;
def GL_NV_shader_thread_shuffle = 1;
def GL_NV_shading_rate_image = 1;
def GL_SHADING_RATE_IMAGE_NV = 0x9563;
def GL_SHADING_RATE_NO_INVOCATIONS_NV = 0x9564;
def GL_SHADING_RATE_1_INVOCATION_PER_PIXEL_NV = 0x9565;
def GL_SHADING_RATE_1_INVOCATION_PER_1X2_PIXELS_NV = 0x9566;
def GL_SHADING_RATE_1_INVOCATION_PER_2X1_PIXELS_NV = 0x9567;
def GL_SHADING_RATE_1_INVOCATION_PER_2X2_PIXELS_NV = 0x9568;
def GL_SHADING_RATE_1_INVOCATION_PER_2X4_PIXELS_NV = 0x9569;
def GL_SHADING_RATE_1_INVOCATION_PER_4X2_PIXELS_NV = 0x956A;
def GL_SHADING_RATE_1_INVOCATION_PER_4X4_PIXELS_NV = 0x956B;
def GL_SHADING_RATE_2_INVOCATIONS_PER_PIXEL_NV = 0x956C;
def GL_SHADING_RATE_4_INVOCATIONS_PER_PIXEL_NV = 0x956D;
def GL_SHADING_RATE_8_INVOCATIONS_PER_PIXEL_NV = 0x956E;
def GL_SHADING_RATE_16_INVOCATIONS_PER_PIXEL_NV = 0x956F;
def GL_SHADING_RATE_IMAGE_BINDING_NV = 0x955B;
def GL_SHADING_RATE_IMAGE_TEXEL_WIDTH_NV = 0x955C;
def GL_SHADING_RATE_IMAGE_TEXEL_HEIGHT_NV = 0x955D;
def GL_SHADING_RATE_IMAGE_PALETTE_SIZE_NV = 0x955E;
def GL_MAX_COARSE_FRAGMENT_SAMPLES_NV = 0x955F;
def GL_SHADING_RATE_SAMPLE_ORDER_DEFAULT_NV = 0x95AE;
def GL_SHADING_RATE_SAMPLE_ORDER_PIXEL_MAJOR_NV = 0x95AF;
def GL_SHADING_RATE_SAMPLE_ORDER_SAMPLE_MAJOR_NV = 0x95B0;

def glBindShadingRateImageNV_signature func(texture GLuint);
var global glBindShadingRateImageNV glBindShadingRateImageNV_signature;

def glGetShadingRateImagePaletteNV_signature func(viewport GLuint; entry GLuint; rate GLenum ref);
var global glGetShadingRateImagePaletteNV glGetShadingRateImagePaletteNV_signature;

def glGetShadingRateSampleLocationivNV_signature func(rate GLenum; samples GLuint; index GLuint; location GLint ref);
var global glGetShadingRateSampleLocationivNV glGetShadingRateSampleLocationivNV_signature;

def glShadingRateImageBarrierNV_signature func(synchronize GLboolean);
var global glShadingRateImageBarrierNV glShadingRateImageBarrierNV_signature;

def glShadingRateImagePaletteNV_signature func(viewport GLuint; first GLuint; count GLsizei; rates GLenum ref);
var global glShadingRateImagePaletteNV glShadingRateImagePaletteNV_signature;

def glShadingRateSampleOrderNV_signature func(order GLenum);
var global glShadingRateSampleOrderNV glShadingRateSampleOrderNV_signature;

def glShadingRateSampleOrderCustomNV_signature func(rate GLenum; samples GLuint; locations GLint ref);
var global glShadingRateSampleOrderCustomNV glShadingRateSampleOrderCustomNV_signature;
def GL_NV_stereo_view_rendering = 1;
def GL_NV_tessellation_program5 = 1;
def GL_MAX_PROGRAM_PATCH_ATTRIBS_NV = 0x86D8;
def GL_TESS_CONTROL_PROGRAM_NV = 0x891E;
def GL_TESS_EVALUATION_PROGRAM_NV = 0x891F;
def GL_TESS_CONTROL_PROGRAM_PARAMETER_BUFFER_NV = 0x8C74;
def GL_TESS_EVALUATION_PROGRAM_PARAMETER_BUFFER_NV = 0x8C75;
def GL_NV_texgen_emboss = 1;
def GL_EMBOSS_LIGHT_NV = 0x855D;
def GL_EMBOSS_CONSTANT_NV = 0x855E;
def GL_EMBOSS_MAP_NV = 0x855F;
def GL_NV_texgen_reflection = 1;
def GL_NORMAL_MAP_NV = 0x8511;
def GL_REFLECTION_MAP_NV = 0x8512;
def GL_NV_texture_barrier = 1;

def glTextureBarrierNV_signature func();
var global glTextureBarrierNV glTextureBarrierNV_signature;
def GL_NV_texture_compression_vtc = 1;
def GL_NV_texture_env_combine4 = 1;
def GL_COMBINE4_NV = 0x8503;
def GL_SOURCE3_RGB_NV = 0x8583;
def GL_SOURCE3_ALPHA_NV = 0x858B;
def GL_OPERAND3_RGB_NV = 0x8593;
def GL_OPERAND3_ALPHA_NV = 0x859B;
def GL_NV_texture_expand_normal = 1;
def GL_TEXTURE_UNSIGNED_REMAP_MODE_NV = 0x888F;
def GL_NV_texture_multisample = 1;
def GL_TEXTURE_COVERAGE_SAMPLES_NV = 0x9045;
def GL_TEXTURE_COLOR_SAMPLES_NV = 0x9046;

def glTexImage2DMultisampleCoverageNV_signature func(target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; fixedSampleLocations GLboolean);
var global glTexImage2DMultisampleCoverageNV glTexImage2DMultisampleCoverageNV_signature;

def glTexImage3DMultisampleCoverageNV_signature func(target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean);
var global glTexImage3DMultisampleCoverageNV glTexImage3DMultisampleCoverageNV_signature;

def glTextureImage2DMultisampleNV_signature func(texture GLuint; target GLenum; samples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; fixedSampleLocations GLboolean);
var global glTextureImage2DMultisampleNV glTextureImage2DMultisampleNV_signature;

def glTextureImage3DMultisampleNV_signature func(texture GLuint; target GLenum; samples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean);
var global glTextureImage3DMultisampleNV glTextureImage3DMultisampleNV_signature;

def glTextureImage2DMultisampleCoverageNV_signature func(texture GLuint; target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; fixedSampleLocations GLboolean);
var global glTextureImage2DMultisampleCoverageNV glTextureImage2DMultisampleCoverageNV_signature;

def glTextureImage3DMultisampleCoverageNV_signature func(texture GLuint; target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean);
var global glTextureImage3DMultisampleCoverageNV glTextureImage3DMultisampleCoverageNV_signature;
def GL_NV_texture_rectangle = 1;
def GL_TEXTURE_RECTANGLE_NV = 0x84F5;
def GL_TEXTURE_BINDING_RECTANGLE_NV = 0x84F6;
def GL_PROXY_TEXTURE_RECTANGLE_NV = 0x84F7;
def GL_MAX_RECTANGLE_TEXTURE_SIZE_NV = 0x84F8;
def GL_NV_texture_rectangle_compressed = 1;
def GL_NV_texture_shader = 1;
def GL_OFFSET_TEXTURE_RECTANGLE_NV = 0x864C;
def GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV = 0x864D;
def GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV = 0x864E;
def GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV = 0x86D9;
def GL_UNSIGNED_INT_S8_S8_8_8_NV = 0x86DA;
def GL_UNSIGNED_INT_8_8_S8_S8_REV_NV = 0x86DB;
def GL_DSDT_MAG_INTENSITY_NV = 0x86DC;
def GL_SHADER_CONSISTENT_NV = 0x86DD;
def GL_TEXTURE_SHADER_NV = 0x86DE;
def GL_SHADER_OPERATION_NV = 0x86DF;
def GL_CULL_MODES_NV = 0x86E0;
def GL_OFFSET_TEXTURE_MATRIX_NV = 0x86E1;
def GL_OFFSET_TEXTURE_SCALE_NV = 0x86E2;
def GL_OFFSET_TEXTURE_BIAS_NV = 0x86E3;
def GL_OFFSET_TEXTURE_2D_MATRIX_NV = 0x86E1;
def GL_OFFSET_TEXTURE_2D_SCALE_NV = 0x86E2;
def GL_OFFSET_TEXTURE_2D_BIAS_NV = 0x86E3;
def GL_PREVIOUS_TEXTURE_INPUT_NV = 0x86E4;
def GL_CONST_EYE_NV = 0x86E5;
def GL_PASS_THROUGH_NV = 0x86E6;
def GL_CULL_FRAGMENT_NV = 0x86E7;
def GL_OFFSET_TEXTURE_2D_NV = 0x86E8;
def GL_DEPENDENT_AR_TEXTURE_2D_NV = 0x86E9;
def GL_DEPENDENT_GB_TEXTURE_2D_NV = 0x86EA;
def GL_DOT_PRODUCT_NV = 0x86EC;
def GL_DOT_PRODUCT_DEPTH_REPLACE_NV = 0x86ED;
def GL_DOT_PRODUCT_TEXTURE_2D_NV = 0x86EE;
def GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV = 0x86F0;
def GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV = 0x86F1;
def GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV = 0x86F2;
def GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV = 0x86F3;
def GL_HILO_NV = 0x86F4;
def GL_DSDT_NV = 0x86F5;
def GL_DSDT_MAG_NV = 0x86F6;
def GL_DSDT_MAG_VIB_NV = 0x86F7;
def GL_HILO16_NV = 0x86F8;
def GL_SIGNED_HILO_NV = 0x86F9;
def GL_SIGNED_HILO16_NV = 0x86FA;
def GL_SIGNED_RGBA_NV = 0x86FB;
def GL_SIGNED_RGBA8_NV = 0x86FC;
def GL_SIGNED_RGB_NV = 0x86FE;
def GL_SIGNED_RGB8_NV = 0x86FF;
def GL_SIGNED_LUMINANCE_NV = 0x8701;
def GL_SIGNED_LUMINANCE8_NV = 0x8702;
def GL_SIGNED_LUMINANCE_ALPHA_NV = 0x8703;
def GL_SIGNED_LUMINANCE8_ALPHA8_NV = 0x8704;
def GL_SIGNED_ALPHA_NV = 0x8705;
def GL_SIGNED_ALPHA8_NV = 0x8706;
def GL_SIGNED_INTENSITY_NV = 0x8707;
def GL_SIGNED_INTENSITY8_NV = 0x8708;
def GL_DSDT8_NV = 0x8709;
def GL_DSDT8_MAG8_NV = 0x870A;
def GL_DSDT8_MAG8_INTENSITY8_NV = 0x870B;
def GL_SIGNED_RGB_UNSIGNED_ALPHA_NV = 0x870C;
def GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV = 0x870D;
def GL_HI_SCALE_NV = 0x870E;
def GL_LO_SCALE_NV = 0x870F;
def GL_DS_SCALE_NV = 0x8710;
def GL_DT_SCALE_NV = 0x8711;
def GL_MAGNITUDE_SCALE_NV = 0x8712;
def GL_VIBRANCE_SCALE_NV = 0x8713;
def GL_HI_BIAS_NV = 0x8714;
def GL_LO_BIAS_NV = 0x8715;
def GL_DS_BIAS_NV = 0x8716;
def GL_DT_BIAS_NV = 0x8717;
def GL_MAGNITUDE_BIAS_NV = 0x8718;
def GL_VIBRANCE_BIAS_NV = 0x8719;
def GL_TEXTURE_BORDER_VALUES_NV = 0x871A;
def GL_TEXTURE_HI_SIZE_NV = 0x871B;
def GL_TEXTURE_LO_SIZE_NV = 0x871C;
def GL_TEXTURE_DS_SIZE_NV = 0x871D;
def GL_TEXTURE_DT_SIZE_NV = 0x871E;
def GL_TEXTURE_MAG_SIZE_NV = 0x871F;
def GL_NV_texture_shader2 = 1;
def GL_DOT_PRODUCT_TEXTURE_3D_NV = 0x86EF;
def GL_NV_texture_shader3 = 1;
def GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV = 0x8850;
def GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV = 0x8851;
def GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8852;
def GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV = 0x8853;
def GL_OFFSET_HILO_TEXTURE_2D_NV = 0x8854;
def GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV = 0x8855;
def GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV = 0x8856;
def GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8857;
def GL_DEPENDENT_HILO_TEXTURE_2D_NV = 0x8858;
def GL_DEPENDENT_RGB_TEXTURE_3D_NV = 0x8859;
def GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV = 0x885A;
def GL_DOT_PRODUCT_PASS_THROUGH_NV = 0x885B;
def GL_DOT_PRODUCT_TEXTURE_1D_NV = 0x885C;
def GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV = 0x885D;
def GL_HILO8_NV = 0x885E;
def GL_SIGNED_HILO8_NV = 0x885F;
def GL_FORCE_BLUE_TO_ONE_NV = 0x8860;
def GL_NV_timeline_semaphore = 1;
def GL_TIMELINE_SEMAPHORE_VALUE_NV = 0x9595;
def GL_SEMAPHORE_TYPE_NV = 0x95B3;
def GL_SEMAPHORE_TYPE_BINARY_NV = 0x95B4;
def GL_SEMAPHORE_TYPE_TIMELINE_NV = 0x95B5;
def GL_MAX_TIMELINE_SEMAPHORE_VALUE_DIFFERENCE_NV = 0x95B6;

def glCreateSemaphoresNV_signature func(n GLsizei; semaphores GLuint ref);
var global glCreateSemaphoresNV glCreateSemaphoresNV_signature;

def glSemaphoreParameterivNV_signature func(semaphore GLuint; pname GLenum; params GLint ref);
var global glSemaphoreParameterivNV glSemaphoreParameterivNV_signature;

def glGetSemaphoreParameterivNV_signature func(semaphore GLuint; pname GLenum; params GLint ref);
var global glGetSemaphoreParameterivNV glGetSemaphoreParameterivNV_signature;
def GL_NV_transform_feedback = 1;
def GL_BACK_PRIMARY_COLOR_NV = 0x8C77;
def GL_BACK_SECONDARY_COLOR_NV = 0x8C78;
def GL_TEXTURE_COORD_NV = 0x8C79;
def GL_CLIP_DISTANCE_NV = 0x8C7A;
def GL_VERTEX_ID_NV = 0x8C7B;
def GL_PRIMITIVE_ID_NV = 0x8C7C;
def GL_GENERIC_ATTRIB_NV = 0x8C7D;
def GL_TRANSFORM_FEEDBACK_ATTRIBS_NV = 0x8C7E;
def GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV = 0x8C7F;
def GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV = 0x8C80;
def GL_ACTIVE_VARYINGS_NV = 0x8C81;
def GL_ACTIVE_VARYING_MAX_LENGTH_NV = 0x8C82;
def GL_TRANSFORM_FEEDBACK_VARYINGS_NV = 0x8C83;
def GL_TRANSFORM_FEEDBACK_BUFFER_START_NV = 0x8C84;
def GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV = 0x8C85;
def GL_TRANSFORM_FEEDBACK_RECORD_NV = 0x8C86;
def GL_PRIMITIVES_GENERATED_NV = 0x8C87;
def GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV = 0x8C88;
def GL_RASTERIZER_DISCARD_NV = 0x8C89;
def GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV = 0x8C8A;
def GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV = 0x8C8B;
def GL_INTERLEAVED_ATTRIBS_NV = 0x8C8C;
def GL_SEPARATE_ATTRIBS_NV = 0x8C8D;
def GL_TRANSFORM_FEEDBACK_BUFFER_NV = 0x8C8E;
def GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV = 0x8C8F;
def GL_LAYER_NV = 0x8DAA;
def GL_NEXT_BUFFER_NV = -2;
def GL_SKIP_COMPONENTS4_NV = -3;
def GL_SKIP_COMPONENTS3_NV = -4;
def GL_SKIP_COMPONENTS2_NV = -5;
def GL_SKIP_COMPONENTS1_NV = -6;

def glBeginTransformFeedbackNV_signature func(primitiveMode GLenum);
var global glBeginTransformFeedbackNV glBeginTransformFeedbackNV_signature;

def glEndTransformFeedbackNV_signature func();
var global glEndTransformFeedbackNV glEndTransformFeedbackNV_signature;

def glTransformFeedbackAttribsNV_signature func(count GLsizei; attribs GLint ref; bufferMode GLenum);
var global glTransformFeedbackAttribsNV glTransformFeedbackAttribsNV_signature;

def glBindBufferRangeNV_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var global glBindBufferRangeNV glBindBufferRangeNV_signature;

def glBindBufferOffsetNV_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr);
var global glBindBufferOffsetNV glBindBufferOffsetNV_signature;

def glBindBufferBaseNV_signature func(target GLenum; index GLuint; buffer GLuint);
var global glBindBufferBaseNV glBindBufferBaseNV_signature;

def glTransformFeedbackVaryingsNV_signature func(program GLuint; count GLsizei; locations GLint ref; bufferMode GLenum);
var global glTransformFeedbackVaryingsNV glTransformFeedbackVaryingsNV_signature;

def glActiveVaryingNV_signature func(program GLuint; name GLchar ref);
var global glActiveVaryingNV glActiveVaryingNV_signature;

def glGetVaryingLocationNV_signature func(program GLuint; name GLchar ref) (result GLint);
var global glGetVaryingLocationNV glGetVaryingLocationNV_signature;

def glGetActiveVaryingNV_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLsizei ref; type GLenum ref; name GLchar ref);
var global glGetActiveVaryingNV glGetActiveVaryingNV_signature;

def glGetTransformFeedbackVaryingNV_signature func(program GLuint; index GLuint; location GLint ref);
var global glGetTransformFeedbackVaryingNV glGetTransformFeedbackVaryingNV_signature;

def glTransformFeedbackStreamAttribsNV_signature func(count GLsizei; attribs GLint ref; nbuffers GLsizei; bufstreams GLint ref; bufferMode GLenum);
var global glTransformFeedbackStreamAttribsNV glTransformFeedbackStreamAttribsNV_signature;
def GL_NV_transform_feedback2 = 1;
def GL_TRANSFORM_FEEDBACK_NV = 0x8E22;
def GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV = 0x8E23;
def GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV = 0x8E24;
def GL_TRANSFORM_FEEDBACK_BINDING_NV = 0x8E25;

def glBindTransformFeedbackNV_signature func(target GLenum; id GLuint);
var global glBindTransformFeedbackNV glBindTransformFeedbackNV_signature;

def glDeleteTransformFeedbacksNV_signature func(n GLsizei; ids GLuint ref);
var global glDeleteTransformFeedbacksNV glDeleteTransformFeedbacksNV_signature;

def glGenTransformFeedbacksNV_signature func(n GLsizei; ids GLuint ref);
var global glGenTransformFeedbacksNV glGenTransformFeedbacksNV_signature;

def glIsTransformFeedbackNV_signature func(id GLuint) (result GLboolean);
var global glIsTransformFeedbackNV glIsTransformFeedbackNV_signature;

def glPauseTransformFeedbackNV_signature func();
var global glPauseTransformFeedbackNV glPauseTransformFeedbackNV_signature;

def glResumeTransformFeedbackNV_signature func();
var global glResumeTransformFeedbackNV glResumeTransformFeedbackNV_signature;

def glDrawTransformFeedbackNV_signature func(mode GLenum; id GLuint);
var global glDrawTransformFeedbackNV glDrawTransformFeedbackNV_signature;
def GL_NV_uniform_buffer_unified_memory = 1;
def GL_UNIFORM_BUFFER_UNIFIED_NV = 0x936E;
def GL_UNIFORM_BUFFER_ADDRESS_NV = 0x936F;
def GL_UNIFORM_BUFFER_LENGTH_NV = 0x9370;
def GL_NV_vdpau_interop = 1;
def GL_SURFACE_STATE_NV = 0x86EB;
def GL_SURFACE_REGISTERED_NV = 0x86FD;
def GL_SURFACE_MAPPED_NV = 0x8700;
def GL_WRITE_DISCARD_NV = 0x88BE;

def glVDPAUInitNV_signature func(vdpDevice u8 ref; getProcAddress u8 ref);
var global glVDPAUInitNV glVDPAUInitNV_signature;

def glVDPAUFiniNV_signature func();
var global glVDPAUFiniNV glVDPAUFiniNV_signature;

def glVDPAURegisterVideoSurfaceNV_signature func(vdpSurface u8 ref; target GLenum; numTextureNames GLsizei; textureNames GLuint ref) (result GLvdpauSurfaceNV);
var global glVDPAURegisterVideoSurfaceNV glVDPAURegisterVideoSurfaceNV_signature;

def glVDPAURegisterOutputSurfaceNV_signature func(vdpSurface u8 ref; target GLenum; numTextureNames GLsizei; textureNames GLuint ref) (result GLvdpauSurfaceNV);
var global glVDPAURegisterOutputSurfaceNV glVDPAURegisterOutputSurfaceNV_signature;

def glVDPAUIsSurfaceNV_signature func(surface GLvdpauSurfaceNV) (result GLboolean);
var global glVDPAUIsSurfaceNV glVDPAUIsSurfaceNV_signature;

def glVDPAUUnregisterSurfaceNV_signature func(surface GLvdpauSurfaceNV);
var global glVDPAUUnregisterSurfaceNV glVDPAUUnregisterSurfaceNV_signature;

def glVDPAUGetSurfaceivNV_signature func(surface GLvdpauSurfaceNV; pname GLenum; count GLsizei; length GLsizei ref; values GLint ref);
var global glVDPAUGetSurfaceivNV glVDPAUGetSurfaceivNV_signature;

def glVDPAUSurfaceAccessNV_signature func(surface GLvdpauSurfaceNV; access GLenum);
var global glVDPAUSurfaceAccessNV glVDPAUSurfaceAccessNV_signature;

def glVDPAUMapSurfacesNV_signature func(numSurfaces GLsizei; surfaces GLvdpauSurfaceNV ref);
var global glVDPAUMapSurfacesNV glVDPAUMapSurfacesNV_signature;

def glVDPAUUnmapSurfacesNV_signature func(numSurface GLsizei; surfaces GLvdpauSurfaceNV ref);
var global glVDPAUUnmapSurfacesNV glVDPAUUnmapSurfacesNV_signature;
def GL_NV_vdpau_interop2 = 1;

def glVDPAURegisterVideoSurfaceWithPictureStructureNV_signature func(vdpSurface u8 ref; target GLenum; numTextureNames GLsizei; textureNames GLuint ref; isFrameStructure GLboolean) (result GLvdpauSurfaceNV);
var global glVDPAURegisterVideoSurfaceWithPictureStructureNV glVDPAURegisterVideoSurfaceWithPictureStructureNV_signature;
def GL_NV_vertex_array_range = 1;
def GL_VERTEX_ARRAY_RANGE_NV = 0x851D;
def GL_VERTEX_ARRAY_RANGE_LENGTH_NV = 0x851E;
def GL_VERTEX_ARRAY_RANGE_VALID_NV = 0x851F;
def GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = 0x8520;
def GL_VERTEX_ARRAY_RANGE_POINTER_NV = 0x8521;

def glFlushVertexArrayRangeNV_signature func();
var global glFlushVertexArrayRangeNV glFlushVertexArrayRangeNV_signature;

def glVertexArrayRangeNV_signature func(length GLsizei; pointer u8 ref);
var global glVertexArrayRangeNV glVertexArrayRangeNV_signature;
def GL_NV_vertex_array_range2 = 1;
def GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV = 0x8533;
def GL_NV_vertex_attrib_integer_64bit = 1;

def glVertexAttribL1i64NV_signature func(index GLuint; x GLint64EXT);
var global glVertexAttribL1i64NV glVertexAttribL1i64NV_signature;

def glVertexAttribL2i64NV_signature func(index GLuint; x GLint64EXT; y GLint64EXT);
var global glVertexAttribL2i64NV glVertexAttribL2i64NV_signature;

def glVertexAttribL3i64NV_signature func(index GLuint; x GLint64EXT; y GLint64EXT; z GLint64EXT);
var global glVertexAttribL3i64NV glVertexAttribL3i64NV_signature;

def glVertexAttribL4i64NV_signature func(index GLuint; x GLint64EXT; y GLint64EXT; z GLint64EXT; w GLint64EXT);
var global glVertexAttribL4i64NV glVertexAttribL4i64NV_signature;

def glVertexAttribL1i64vNV_signature func(index GLuint; v GLint64EXT ref);
var global glVertexAttribL1i64vNV glVertexAttribL1i64vNV_signature;

def glVertexAttribL2i64vNV_signature func(index GLuint; v GLint64EXT ref);
var global glVertexAttribL2i64vNV glVertexAttribL2i64vNV_signature;

def glVertexAttribL3i64vNV_signature func(index GLuint; v GLint64EXT ref);
var global glVertexAttribL3i64vNV glVertexAttribL3i64vNV_signature;

def glVertexAttribL4i64vNV_signature func(index GLuint; v GLint64EXT ref);
var global glVertexAttribL4i64vNV glVertexAttribL4i64vNV_signature;

def glVertexAttribL1ui64NV_signature func(index GLuint; x GLuint64EXT);
var global glVertexAttribL1ui64NV glVertexAttribL1ui64NV_signature;

def glVertexAttribL2ui64NV_signature func(index GLuint; x GLuint64EXT; y GLuint64EXT);
var global glVertexAttribL2ui64NV glVertexAttribL2ui64NV_signature;

def glVertexAttribL3ui64NV_signature func(index GLuint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT);
var global glVertexAttribL3ui64NV glVertexAttribL3ui64NV_signature;

def glVertexAttribL4ui64NV_signature func(index GLuint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT; w GLuint64EXT);
var global glVertexAttribL4ui64NV glVertexAttribL4ui64NV_signature;

def glVertexAttribL1ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var global glVertexAttribL1ui64vNV glVertexAttribL1ui64vNV_signature;

def glVertexAttribL2ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var global glVertexAttribL2ui64vNV glVertexAttribL2ui64vNV_signature;

def glVertexAttribL3ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var global glVertexAttribL3ui64vNV glVertexAttribL3ui64vNV_signature;

def glVertexAttribL4ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var global glVertexAttribL4ui64vNV glVertexAttribL4ui64vNV_signature;

def glGetVertexAttribLi64vNV_signature func(index GLuint; pname GLenum; params GLint64EXT ref);
var global glGetVertexAttribLi64vNV glGetVertexAttribLi64vNV_signature;

def glGetVertexAttribLui64vNV_signature func(index GLuint; pname GLenum; params GLuint64EXT ref);
var global glGetVertexAttribLui64vNV glGetVertexAttribLui64vNV_signature;

def glVertexAttribLFormatNV_signature func(index GLuint; size GLint; type GLenum; stride GLsizei);
var global glVertexAttribLFormatNV glVertexAttribLFormatNV_signature;
def GL_NV_vertex_buffer_unified_memory = 1;
def GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV = 0x8F1E;
def GL_ELEMENT_ARRAY_UNIFIED_NV = 0x8F1F;
def GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV = 0x8F20;
def GL_VERTEX_ARRAY_ADDRESS_NV = 0x8F21;
def GL_NORMAL_ARRAY_ADDRESS_NV = 0x8F22;
def GL_COLOR_ARRAY_ADDRESS_NV = 0x8F23;
def GL_INDEX_ARRAY_ADDRESS_NV = 0x8F24;
def GL_TEXTURE_COORD_ARRAY_ADDRESS_NV = 0x8F25;
def GL_EDGE_FLAG_ARRAY_ADDRESS_NV = 0x8F26;
def GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV = 0x8F27;
def GL_FOG_COORD_ARRAY_ADDRESS_NV = 0x8F28;
def GL_ELEMENT_ARRAY_ADDRESS_NV = 0x8F29;
def GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV = 0x8F2A;
def GL_VERTEX_ARRAY_LENGTH_NV = 0x8F2B;
def GL_NORMAL_ARRAY_LENGTH_NV = 0x8F2C;
def GL_COLOR_ARRAY_LENGTH_NV = 0x8F2D;
def GL_INDEX_ARRAY_LENGTH_NV = 0x8F2E;
def GL_TEXTURE_COORD_ARRAY_LENGTH_NV = 0x8F2F;
def GL_EDGE_FLAG_ARRAY_LENGTH_NV = 0x8F30;
def GL_SECONDARY_COLOR_ARRAY_LENGTH_NV = 0x8F31;
def GL_FOG_COORD_ARRAY_LENGTH_NV = 0x8F32;
def GL_ELEMENT_ARRAY_LENGTH_NV = 0x8F33;
def GL_DRAW_INDIRECT_UNIFIED_NV = 0x8F40;
def GL_DRAW_INDIRECT_ADDRESS_NV = 0x8F41;
def GL_DRAW_INDIRECT_LENGTH_NV = 0x8F42;

def glBufferAddressRangeNV_signature func(pname GLenum; index GLuint; address GLuint64EXT; length GLsizeiptr);
var global glBufferAddressRangeNV glBufferAddressRangeNV_signature;

def glVertexFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var global glVertexFormatNV glVertexFormatNV_signature;

def glNormalFormatNV_signature func(type GLenum; stride GLsizei);
var global glNormalFormatNV glNormalFormatNV_signature;

def glColorFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var global glColorFormatNV glColorFormatNV_signature;

def glIndexFormatNV_signature func(type GLenum; stride GLsizei);
var global glIndexFormatNV glIndexFormatNV_signature;

def glTexCoordFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var global glTexCoordFormatNV glTexCoordFormatNV_signature;

def glEdgeFlagFormatNV_signature func(stride GLsizei);
var global glEdgeFlagFormatNV glEdgeFlagFormatNV_signature;

def glSecondaryColorFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var global glSecondaryColorFormatNV glSecondaryColorFormatNV_signature;

def glFogCoordFormatNV_signature func(type GLenum; stride GLsizei);
var global glFogCoordFormatNV glFogCoordFormatNV_signature;

def glVertexAttribFormatNV_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei);
var global glVertexAttribFormatNV glVertexAttribFormatNV_signature;

def glVertexAttribIFormatNV_signature func(index GLuint; size GLint; type GLenum; stride GLsizei);
var global glVertexAttribIFormatNV glVertexAttribIFormatNV_signature;

def glGetIntegerui64i_vNV_signature func(value GLenum; index GLuint; result GLuint64EXT ref);
var global glGetIntegerui64i_vNV glGetIntegerui64i_vNV_signature;
def GL_NV_vertex_program = 1;
def GL_VERTEX_PROGRAM_NV = 0x8620;
def GL_VERTEX_STATE_PROGRAM_NV = 0x8621;
def GL_ATTRIB_ARRAY_SIZE_NV = 0x8623;
def GL_ATTRIB_ARRAY_STRIDE_NV = 0x8624;
def GL_ATTRIB_ARRAY_TYPE_NV = 0x8625;
def GL_CURRENT_ATTRIB_NV = 0x8626;
def GL_PROGRAM_LENGTH_NV = 0x8627;
def GL_PROGRAM_STRING_NV = 0x8628;
def GL_MODELVIEW_PROJECTION_NV = 0x8629;
def GL_IDENTITY_NV = 0x862A;
def GL_INVERSE_NV = 0x862B;
def GL_TRANSPOSE_NV = 0x862C;
def GL_INVERSE_TRANSPOSE_NV = 0x862D;
def GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = 0x862E;
def GL_MAX_TRACK_MATRICES_NV = 0x862F;
def GL_MATRIX0_NV = 0x8630;
def GL_MATRIX1_NV = 0x8631;
def GL_MATRIX2_NV = 0x8632;
def GL_MATRIX3_NV = 0x8633;
def GL_MATRIX4_NV = 0x8634;
def GL_MATRIX5_NV = 0x8635;
def GL_MATRIX6_NV = 0x8636;
def GL_MATRIX7_NV = 0x8637;
def GL_CURRENT_MATRIX_STACK_DEPTH_NV = 0x8640;
def GL_CURRENT_MATRIX_NV = 0x8641;
def GL_VERTEX_PROGRAM_POINT_SIZE_NV = 0x8642;
def GL_VERTEX_PROGRAM_TWO_SIDE_NV = 0x8643;
def GL_PROGRAM_PARAMETER_NV = 0x8644;
def GL_ATTRIB_ARRAY_POINTER_NV = 0x8645;
def GL_PROGRAM_TARGET_NV = 0x8646;
def GL_PROGRAM_RESIDENT_NV = 0x8647;
def GL_TRACK_MATRIX_NV = 0x8648;
def GL_TRACK_MATRIX_TRANSFORM_NV = 0x8649;
def GL_VERTEX_PROGRAM_BINDING_NV = 0x864A;
def GL_PROGRAM_ERROR_POSITION_NV = 0x864B;
def GL_VERTEX_ATTRIB_ARRAY0_NV = 0x8650;
def GL_VERTEX_ATTRIB_ARRAY1_NV = 0x8651;
def GL_VERTEX_ATTRIB_ARRAY2_NV = 0x8652;
def GL_VERTEX_ATTRIB_ARRAY3_NV = 0x8653;
def GL_VERTEX_ATTRIB_ARRAY4_NV = 0x8654;
def GL_VERTEX_ATTRIB_ARRAY5_NV = 0x8655;
def GL_VERTEX_ATTRIB_ARRAY6_NV = 0x8656;
def GL_VERTEX_ATTRIB_ARRAY7_NV = 0x8657;
def GL_VERTEX_ATTRIB_ARRAY8_NV = 0x8658;
def GL_VERTEX_ATTRIB_ARRAY9_NV = 0x8659;
def GL_VERTEX_ATTRIB_ARRAY10_NV = 0x865A;
def GL_VERTEX_ATTRIB_ARRAY11_NV = 0x865B;
def GL_VERTEX_ATTRIB_ARRAY12_NV = 0x865C;
def GL_VERTEX_ATTRIB_ARRAY13_NV = 0x865D;
def GL_VERTEX_ATTRIB_ARRAY14_NV = 0x865E;
def GL_VERTEX_ATTRIB_ARRAY15_NV = 0x865F;
def GL_MAP1_VERTEX_ATTRIB0_4_NV = 0x8660;
def GL_MAP1_VERTEX_ATTRIB1_4_NV = 0x8661;
def GL_MAP1_VERTEX_ATTRIB2_4_NV = 0x8662;
def GL_MAP1_VERTEX_ATTRIB3_4_NV = 0x8663;
def GL_MAP1_VERTEX_ATTRIB4_4_NV = 0x8664;
def GL_MAP1_VERTEX_ATTRIB5_4_NV = 0x8665;
def GL_MAP1_VERTEX_ATTRIB6_4_NV = 0x8666;
def GL_MAP1_VERTEX_ATTRIB7_4_NV = 0x8667;
def GL_MAP1_VERTEX_ATTRIB8_4_NV = 0x8668;
def GL_MAP1_VERTEX_ATTRIB9_4_NV = 0x8669;
def GL_MAP1_VERTEX_ATTRIB10_4_NV = 0x866A;
def GL_MAP1_VERTEX_ATTRIB11_4_NV = 0x866B;
def GL_MAP1_VERTEX_ATTRIB12_4_NV = 0x866C;
def GL_MAP1_VERTEX_ATTRIB13_4_NV = 0x866D;
def GL_MAP1_VERTEX_ATTRIB14_4_NV = 0x866E;
def GL_MAP1_VERTEX_ATTRIB15_4_NV = 0x866F;
def GL_MAP2_VERTEX_ATTRIB0_4_NV = 0x8670;
def GL_MAP2_VERTEX_ATTRIB1_4_NV = 0x8671;
def GL_MAP2_VERTEX_ATTRIB2_4_NV = 0x8672;
def GL_MAP2_VERTEX_ATTRIB3_4_NV = 0x8673;
def GL_MAP2_VERTEX_ATTRIB4_4_NV = 0x8674;
def GL_MAP2_VERTEX_ATTRIB5_4_NV = 0x8675;
def GL_MAP2_VERTEX_ATTRIB6_4_NV = 0x8676;
def GL_MAP2_VERTEX_ATTRIB7_4_NV = 0x8677;
def GL_MAP2_VERTEX_ATTRIB8_4_NV = 0x8678;
def GL_MAP2_VERTEX_ATTRIB9_4_NV = 0x8679;
def GL_MAP2_VERTEX_ATTRIB10_4_NV = 0x867A;
def GL_MAP2_VERTEX_ATTRIB11_4_NV = 0x867B;
def GL_MAP2_VERTEX_ATTRIB12_4_NV = 0x867C;
def GL_MAP2_VERTEX_ATTRIB13_4_NV = 0x867D;
def GL_MAP2_VERTEX_ATTRIB14_4_NV = 0x867E;
def GL_MAP2_VERTEX_ATTRIB15_4_NV = 0x867F;

def glAreProgramsResidentNV_signature func(n GLsizei; programs GLuint ref; residences GLboolean ref) (result GLboolean);
var global glAreProgramsResidentNV glAreProgramsResidentNV_signature;

def glBindProgramNV_signature func(target GLenum; id GLuint);
var global glBindProgramNV glBindProgramNV_signature;

def glDeleteProgramsNV_signature func(n GLsizei; programs GLuint ref);
var global glDeleteProgramsNV glDeleteProgramsNV_signature;

def glExecuteProgramNV_signature func(target GLenum; id GLuint; params GLfloat ref);
var global glExecuteProgramNV glExecuteProgramNV_signature;

def glGenProgramsNV_signature func(n GLsizei; programs GLuint ref);
var global glGenProgramsNV glGenProgramsNV_signature;

def glGetProgramParameterdvNV_signature func(target GLenum; index GLuint; pname GLenum; params GLdouble ref);
var global glGetProgramParameterdvNV glGetProgramParameterdvNV_signature;

def glGetProgramParameterfvNV_signature func(target GLenum; index GLuint; pname GLenum; params GLfloat ref);
var global glGetProgramParameterfvNV glGetProgramParameterfvNV_signature;

def glGetProgramivNV_signature func(id GLuint; pname GLenum; params GLint ref);
var global glGetProgramivNV glGetProgramivNV_signature;

def glGetProgramStringNV_signature func(id GLuint; pname GLenum; program GLubyte ref);
var global glGetProgramStringNV glGetProgramStringNV_signature;

def glGetTrackMatrixivNV_signature func(target GLenum; address GLuint; pname GLenum; params GLint ref);
var global glGetTrackMatrixivNV glGetTrackMatrixivNV_signature;

def glGetVertexAttribdvNV_signature func(index GLuint; pname GLenum; params GLdouble ref);
var global glGetVertexAttribdvNV glGetVertexAttribdvNV_signature;

def glGetVertexAttribfvNV_signature func(index GLuint; pname GLenum; params GLfloat ref);
var global glGetVertexAttribfvNV glGetVertexAttribfvNV_signature;

def glGetVertexAttribivNV_signature func(index GLuint; pname GLenum; params GLint ref);
var global glGetVertexAttribivNV glGetVertexAttribivNV_signature;

def glGetVertexAttribPointervNV_signature func(index GLuint; pname GLenum; pointer u8 ref ref);
var global glGetVertexAttribPointervNV glGetVertexAttribPointervNV_signature;

def glIsProgramNV_signature func(id GLuint) (result GLboolean);
var global glIsProgramNV glIsProgramNV_signature;

def glLoadProgramNV_signature func(target GLenum; id GLuint; len GLsizei; program GLubyte ref);
var global glLoadProgramNV glLoadProgramNV_signature;

def glProgramParameter4dNV_signature func(target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glProgramParameter4dNV glProgramParameter4dNV_signature;

def glProgramParameter4dvNV_signature func(target GLenum; index GLuint; v GLdouble ref);
var global glProgramParameter4dvNV glProgramParameter4dvNV_signature;

def glProgramParameter4fNV_signature func(target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glProgramParameter4fNV glProgramParameter4fNV_signature;

def glProgramParameter4fvNV_signature func(target GLenum; index GLuint; v GLfloat ref);
var global glProgramParameter4fvNV glProgramParameter4fvNV_signature;

def glProgramParameters4dvNV_signature func(target GLenum; index GLuint; count GLsizei; v GLdouble ref);
var global glProgramParameters4dvNV glProgramParameters4dvNV_signature;

def glProgramParameters4fvNV_signature func(target GLenum; index GLuint; count GLsizei; v GLfloat ref);
var global glProgramParameters4fvNV glProgramParameters4fvNV_signature;

def glRequestResidentProgramsNV_signature func(n GLsizei; programs GLuint ref);
var global glRequestResidentProgramsNV glRequestResidentProgramsNV_signature;

def glTrackMatrixNV_signature func(target GLenum; address GLuint; matrix GLenum; transform GLenum);
var global glTrackMatrixNV glTrackMatrixNV_signature;

def glVertexAttribPointerNV_signature func(index GLuint; fsize GLint; type GLenum; stride GLsizei; pointer u8 ref);
var global glVertexAttribPointerNV glVertexAttribPointerNV_signature;

def glVertexAttrib1dNV_signature func(index GLuint; x GLdouble);
var global glVertexAttrib1dNV glVertexAttrib1dNV_signature;

def glVertexAttrib1dvNV_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib1dvNV glVertexAttrib1dvNV_signature;

def glVertexAttrib1fNV_signature func(index GLuint; x GLfloat);
var global glVertexAttrib1fNV glVertexAttrib1fNV_signature;

def glVertexAttrib1fvNV_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib1fvNV glVertexAttrib1fvNV_signature;

def glVertexAttrib1sNV_signature func(index GLuint; x GLshort);
var global glVertexAttrib1sNV glVertexAttrib1sNV_signature;

def glVertexAttrib1svNV_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib1svNV glVertexAttrib1svNV_signature;

def glVertexAttrib2dNV_signature func(index GLuint; x GLdouble; y GLdouble);
var global glVertexAttrib2dNV glVertexAttrib2dNV_signature;

def glVertexAttrib2dvNV_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib2dvNV glVertexAttrib2dvNV_signature;

def glVertexAttrib2fNV_signature func(index GLuint; x GLfloat; y GLfloat);
var global glVertexAttrib2fNV glVertexAttrib2fNV_signature;

def glVertexAttrib2fvNV_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib2fvNV glVertexAttrib2fvNV_signature;

def glVertexAttrib2sNV_signature func(index GLuint; x GLshort; y GLshort);
var global glVertexAttrib2sNV glVertexAttrib2sNV_signature;

def glVertexAttrib2svNV_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib2svNV glVertexAttrib2svNV_signature;

def glVertexAttrib3dNV_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var global glVertexAttrib3dNV glVertexAttrib3dNV_signature;

def glVertexAttrib3dvNV_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib3dvNV glVertexAttrib3dvNV_signature;

def glVertexAttrib3fNV_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat);
var global glVertexAttrib3fNV glVertexAttrib3fNV_signature;

def glVertexAttrib3fvNV_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib3fvNV glVertexAttrib3fvNV_signature;

def glVertexAttrib3sNV_signature func(index GLuint; x GLshort; y GLshort; z GLshort);
var global glVertexAttrib3sNV glVertexAttrib3sNV_signature;

def glVertexAttrib3svNV_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib3svNV glVertexAttrib3svNV_signature;

def glVertexAttrib4dNV_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var global glVertexAttrib4dNV glVertexAttrib4dNV_signature;

def glVertexAttrib4dvNV_signature func(index GLuint; v GLdouble ref);
var global glVertexAttrib4dvNV glVertexAttrib4dvNV_signature;

def glVertexAttrib4fNV_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glVertexAttrib4fNV glVertexAttrib4fNV_signature;

def glVertexAttrib4fvNV_signature func(index GLuint; v GLfloat ref);
var global glVertexAttrib4fvNV glVertexAttrib4fvNV_signature;

def glVertexAttrib4sNV_signature func(index GLuint; x GLshort; y GLshort; z GLshort; w GLshort);
var global glVertexAttrib4sNV glVertexAttrib4sNV_signature;

def glVertexAttrib4svNV_signature func(index GLuint; v GLshort ref);
var global glVertexAttrib4svNV glVertexAttrib4svNV_signature;

def glVertexAttrib4ubNV_signature func(index GLuint; x GLubyte; y GLubyte; z GLubyte; w GLubyte);
var global glVertexAttrib4ubNV glVertexAttrib4ubNV_signature;

def glVertexAttrib4ubvNV_signature func(index GLuint; v GLubyte ref);
var global glVertexAttrib4ubvNV glVertexAttrib4ubvNV_signature;

def glVertexAttribs1dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var global glVertexAttribs1dvNV glVertexAttribs1dvNV_signature;

def glVertexAttribs1fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var global glVertexAttribs1fvNV glVertexAttribs1fvNV_signature;

def glVertexAttribs1svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var global glVertexAttribs1svNV glVertexAttribs1svNV_signature;

def glVertexAttribs2dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var global glVertexAttribs2dvNV glVertexAttribs2dvNV_signature;

def glVertexAttribs2fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var global glVertexAttribs2fvNV glVertexAttribs2fvNV_signature;

def glVertexAttribs2svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var global glVertexAttribs2svNV glVertexAttribs2svNV_signature;

def glVertexAttribs3dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var global glVertexAttribs3dvNV glVertexAttribs3dvNV_signature;

def glVertexAttribs3fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var global glVertexAttribs3fvNV glVertexAttribs3fvNV_signature;

def glVertexAttribs3svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var global glVertexAttribs3svNV glVertexAttribs3svNV_signature;

def glVertexAttribs4dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var global glVertexAttribs4dvNV glVertexAttribs4dvNV_signature;

def glVertexAttribs4fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var global glVertexAttribs4fvNV glVertexAttribs4fvNV_signature;

def glVertexAttribs4svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var global glVertexAttribs4svNV glVertexAttribs4svNV_signature;

def glVertexAttribs4ubvNV_signature func(index GLuint; count GLsizei; v GLubyte ref);
var global glVertexAttribs4ubvNV glVertexAttribs4ubvNV_signature;
def GL_NV_vertex_program1_1 = 1;
def GL_NV_vertex_program2 = 1;
def GL_NV_vertex_program2_option = 1;
def GL_NV_vertex_program3 = 1;
def GL_NV_vertex_program4 = 1;
def GL_VERTEX_ATTRIB_ARRAY_INTEGER_NV = 0x88FD;
def GL_NV_video_capture = 1;
def GL_VIDEO_BUFFER_NV = 0x9020;
def GL_VIDEO_BUFFER_BINDING_NV = 0x9021;
def GL_FIELD_UPPER_NV = 0x9022;
def GL_FIELD_LOWER_NV = 0x9023;
def GL_NUM_VIDEO_CAPTURE_STREAMS_NV = 0x9024;
def GL_NEXT_VIDEO_CAPTURE_BUFFER_STATUS_NV = 0x9025;
def GL_VIDEO_CAPTURE_TO_422_SUPPORTED_NV = 0x9026;
def GL_LAST_VIDEO_CAPTURE_STATUS_NV = 0x9027;
def GL_VIDEO_BUFFER_PITCH_NV = 0x9028;
def GL_VIDEO_COLOR_CONVERSION_MATRIX_NV = 0x9029;
def GL_VIDEO_COLOR_CONVERSION_MAX_NV = 0x902A;
def GL_VIDEO_COLOR_CONVERSION_MIN_NV = 0x902B;
def GL_VIDEO_COLOR_CONVERSION_OFFSET_NV = 0x902C;
def GL_VIDEO_BUFFER_INTERNAL_FORMAT_NV = 0x902D;
def GL_PARTIAL_SUCCESS_NV = 0x902E;
def GL_SUCCESS_NV = 0x902F;
def GL_FAILURE_NV = 0x9030;
def GL_YCBYCR8_422_NV = 0x9031;
def GL_YCBAYCR8A_4224_NV = 0x9032;
def GL_Z6Y10Z6CB10Z6Y10Z6CR10_422_NV = 0x9033;
def GL_Z6Y10Z6CB10Z6A10Z6Y10Z6CR10Z6A10_4224_NV = 0x9034;
def GL_Z4Y12Z4CB12Z4Y12Z4CR12_422_NV = 0x9035;
def GL_Z4Y12Z4CB12Z4A12Z4Y12Z4CR12Z4A12_4224_NV = 0x9036;
def GL_Z4Y12Z4CB12Z4CR12_444_NV = 0x9037;
def GL_VIDEO_CAPTURE_FRAME_WIDTH_NV = 0x9038;
def GL_VIDEO_CAPTURE_FRAME_HEIGHT_NV = 0x9039;
def GL_VIDEO_CAPTURE_FIELD_UPPER_HEIGHT_NV = 0x903A;
def GL_VIDEO_CAPTURE_FIELD_LOWER_HEIGHT_NV = 0x903B;
def GL_VIDEO_CAPTURE_SURFACE_ORIGIN_NV = 0x903C;

def glBeginVideoCaptureNV_signature func(video_capture_slot GLuint);
var global glBeginVideoCaptureNV glBeginVideoCaptureNV_signature;

def glBindVideoCaptureStreamBufferNV_signature func(video_capture_slot GLuint; stream GLuint; frame_region GLenum; offset GLintptrARB);
var global glBindVideoCaptureStreamBufferNV glBindVideoCaptureStreamBufferNV_signature;

def glBindVideoCaptureStreamTextureNV_signature func(video_capture_slot GLuint; stream GLuint; frame_region GLenum; target GLenum; texture GLuint);
var global glBindVideoCaptureStreamTextureNV glBindVideoCaptureStreamTextureNV_signature;

def glEndVideoCaptureNV_signature func(video_capture_slot GLuint);
var global glEndVideoCaptureNV glEndVideoCaptureNV_signature;

def glGetVideoCaptureivNV_signature func(video_capture_slot GLuint; pname GLenum; params GLint ref);
var global glGetVideoCaptureivNV glGetVideoCaptureivNV_signature;

def glGetVideoCaptureStreamivNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLint ref);
var global glGetVideoCaptureStreamivNV glGetVideoCaptureStreamivNV_signature;

def glGetVideoCaptureStreamfvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLfloat ref);
var global glGetVideoCaptureStreamfvNV glGetVideoCaptureStreamfvNV_signature;

def glGetVideoCaptureStreamdvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLdouble ref);
var global glGetVideoCaptureStreamdvNV glGetVideoCaptureStreamdvNV_signature;

def glVideoCaptureNV_signature func(video_capture_slot GLuint; sequence_num GLuint ref; capture_time GLuint64EXT ref) (result GLenum);
var global glVideoCaptureNV glVideoCaptureNV_signature;

def glVideoCaptureStreamParameterivNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLint ref);
var global glVideoCaptureStreamParameterivNV glVideoCaptureStreamParameterivNV_signature;

def glVideoCaptureStreamParameterfvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLfloat ref);
var global glVideoCaptureStreamParameterfvNV glVideoCaptureStreamParameterfvNV_signature;

def glVideoCaptureStreamParameterdvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLdouble ref);
var global glVideoCaptureStreamParameterdvNV glVideoCaptureStreamParameterdvNV_signature;
def GL_NV_viewport_array2 = 1;
def GL_NV_viewport_swizzle = 1;
def GL_VIEWPORT_SWIZZLE_POSITIVE_X_NV = 0x9350;
def GL_VIEWPORT_SWIZZLE_NEGATIVE_X_NV = 0x9351;
def GL_VIEWPORT_SWIZZLE_POSITIVE_Y_NV = 0x9352;
def GL_VIEWPORT_SWIZZLE_NEGATIVE_Y_NV = 0x9353;
def GL_VIEWPORT_SWIZZLE_POSITIVE_Z_NV = 0x9354;
def GL_VIEWPORT_SWIZZLE_NEGATIVE_Z_NV = 0x9355;
def GL_VIEWPORT_SWIZZLE_POSITIVE_W_NV = 0x9356;
def GL_VIEWPORT_SWIZZLE_NEGATIVE_W_NV = 0x9357;
def GL_VIEWPORT_SWIZZLE_X_NV = 0x9358;
def GL_VIEWPORT_SWIZZLE_Y_NV = 0x9359;
def GL_VIEWPORT_SWIZZLE_Z_NV = 0x935A;
def GL_VIEWPORT_SWIZZLE_W_NV = 0x935B;

def glViewportSwizzleNV_signature func(index GLuint; swizzlex GLenum; swizzley GLenum; swizzlez GLenum; swizzlew GLenum);
var global glViewportSwizzleNV glViewportSwizzleNV_signature;
def GL_OML_interlace = 1;
def GL_INTERLACE_OML = 0x8980;
def GL_INTERLACE_READ_OML = 0x8981;
def GL_OML_resample = 1;
def GL_PACK_RESAMPLE_OML = 0x8984;
def GL_UNPACK_RESAMPLE_OML = 0x8985;
def GL_RESAMPLE_REPLICATE_OML = 0x8986;
def GL_RESAMPLE_ZERO_FILL_OML = 0x8987;
def GL_RESAMPLE_AVERAGE_OML = 0x8988;
def GL_RESAMPLE_DECIMATE_OML = 0x8989;
def GL_OML_subsample = 1;
def GL_FORMAT_SUBSAMPLE_24_24_OML = 0x8982;
def GL_FORMAT_SUBSAMPLE_244_244_OML = 0x8983;
def GL_OVR_multiview = 1;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_NUM_VIEWS_OVR = 0x9630;
def GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_BASE_VIEW_INDEX_OVR = 0x9632;
def GL_MAX_VIEWS_OVR = 0x9631;
def GL_FRAMEBUFFER_INCOMPLETE_VIEW_TARGETS_OVR = 0x9633;

def glFramebufferTextureMultiviewOVR_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; baseViewIndex GLint; numViews GLsizei);
var global glFramebufferTextureMultiviewOVR glFramebufferTextureMultiviewOVR_signature;
def GL_OVR_multiview2 = 1;
def GL_PGI_misc_hints = 1;
def GL_PREFER_DOUBLEBUFFER_HINT_PGI = 0x1A1F8;
def GL_CONSERVE_MEMORY_HINT_PGI = 0x1A1FD;
def GL_RECLAIM_MEMORY_HINT_PGI = 0x1A1FE;
def GL_NATIVE_GRAPHICS_HANDLE_PGI = 0x1A202;
def GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI = 0x1A203;
def GL_NATIVE_GRAPHICS_END_HINT_PGI = 0x1A204;
def GL_ALWAYS_FAST_HINT_PGI = 0x1A20C;
def GL_ALWAYS_SOFT_HINT_PGI = 0x1A20D;
def GL_ALLOW_DRAW_OBJ_HINT_PGI = 0x1A20E;
def GL_ALLOW_DRAW_WIN_HINT_PGI = 0x1A20F;
def GL_ALLOW_DRAW_FRG_HINT_PGI = 0x1A210;
def GL_ALLOW_DRAW_MEM_HINT_PGI = 0x1A211;
def GL_STRICT_DEPTHFUNC_HINT_PGI = 0x1A216;
def GL_STRICT_LIGHTING_HINT_PGI = 0x1A217;
def GL_STRICT_SCISSOR_HINT_PGI = 0x1A218;
def GL_FULL_STIPPLE_HINT_PGI = 0x1A219;
def GL_CLIP_NEAR_HINT_PGI = 0x1A220;
def GL_CLIP_FAR_HINT_PGI = 0x1A221;
def GL_WIDE_LINE_HINT_PGI = 0x1A222;
def GL_BACK_NORMALS_HINT_PGI = 0x1A223;

def glHintPGI_signature func(target GLenum; mode GLint);
var global glHintPGI glHintPGI_signature;
def GL_PGI_vertex_hints = 1;
def GL_VERTEX_DATA_HINT_PGI = 0x1A22A;
def GL_VERTEX_CONSISTENT_HINT_PGI = 0x1A22B;
def GL_MATERIAL_SIDE_HINT_PGI = 0x1A22C;
def GL_MAX_VERTEX_HINT_PGI = 0x1A22D;
def GL_COLOR3_BIT_PGI = 0x00010000;
def GL_COLOR4_BIT_PGI = 0x00020000;
def GL_EDGEFLAG_BIT_PGI = 0x00040000;
def GL_INDEX_BIT_PGI = 0x00080000;
def GL_MAT_AMBIENT_BIT_PGI = 0x00100000;
def GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI = 0x00200000;
def GL_MAT_DIFFUSE_BIT_PGI = 0x00400000;
def GL_MAT_EMISSION_BIT_PGI = 0x00800000;
def GL_MAT_COLOR_INDEXES_BIT_PGI = 0x01000000;
def GL_MAT_SHININESS_BIT_PGI = 0x02000000;
def GL_MAT_SPECULAR_BIT_PGI = 0x04000000;
def GL_NORMAL_BIT_PGI = 0x08000000;
def GL_TEXCOORD1_BIT_PGI = 0x10000000;
def GL_TEXCOORD2_BIT_PGI = 0x20000000;
def GL_TEXCOORD3_BIT_PGI = 0x40000000;
def GL_TEXCOORD4_BIT_PGI = 0x80000000;
def GL_VERTEX23_BIT_PGI = 0x00000004;
def GL_VERTEX4_BIT_PGI = 0x00000008;
def GL_REND_screen_coordinates = 1;
def GL_SCREEN_COORDINATES_REND = 0x8490;
def GL_INVERTED_SCREEN_W_REND = 0x8491;
def GL_S3_s3tc = 1;
def GL_RGB_S3TC = 0x83A0;
def GL_RGB4_S3TC = 0x83A1;
def GL_RGBA_S3TC = 0x83A2;
def GL_RGBA4_S3TC = 0x83A3;
def GL_RGBA_DXT5_S3TC = 0x83A4;
def GL_RGBA4_DXT5_S3TC = 0x83A5;
def GL_SGIS_detail_texture = 1;
def GL_DETAIL_TEXTURE_2D_SGIS = 0x8095;
def GL_DETAIL_TEXTURE_2D_BINDING_SGIS = 0x8096;
def GL_LINEAR_DETAIL_SGIS = 0x8097;
def GL_LINEAR_DETAIL_ALPHA_SGIS = 0x8098;
def GL_LINEAR_DETAIL_COLOR_SGIS = 0x8099;
def GL_DETAIL_TEXTURE_LEVEL_SGIS = 0x809A;
def GL_DETAIL_TEXTURE_MODE_SGIS = 0x809B;
def GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS = 0x809C;

def glDetailTexFuncSGIS_signature func(target GLenum; n GLsizei; points GLfloat ref);
var global glDetailTexFuncSGIS glDetailTexFuncSGIS_signature;

def glGetDetailTexFuncSGIS_signature func(target GLenum; points GLfloat ref);
var global glGetDetailTexFuncSGIS glGetDetailTexFuncSGIS_signature;
def GL_SGIS_fog_function = 1;
def GL_FOG_FUNC_SGIS = 0x812A;
def GL_FOG_FUNC_POINTS_SGIS = 0x812B;
def GL_MAX_FOG_FUNC_POINTS_SGIS = 0x812C;

def glFogFuncSGIS_signature func(n GLsizei; points GLfloat ref);
var global glFogFuncSGIS glFogFuncSGIS_signature;

def glGetFogFuncSGIS_signature func(points GLfloat ref);
var global glGetFogFuncSGIS glGetFogFuncSGIS_signature;
def GL_SGIS_generate_mipmap = 1;
def GL_GENERATE_MIPMAP_SGIS = 0x8191;
def GL_GENERATE_MIPMAP_HINT_SGIS = 0x8192;
def GL_SGIS_multisample = 1;
def GL_MULTISAMPLE_SGIS = 0x809D;
def GL_SAMPLE_ALPHA_TO_MASK_SGIS = 0x809E;
def GL_SAMPLE_ALPHA_TO_ONE_SGIS = 0x809F;
def GL_SAMPLE_MASK_SGIS = 0x80A0;
def GL_1PASS_SGIS = 0x80A1;
def GL_2PASS_0_SGIS = 0x80A2;
def GL_2PASS_1_SGIS = 0x80A3;
def GL_4PASS_0_SGIS = 0x80A4;
def GL_4PASS_1_SGIS = 0x80A5;
def GL_4PASS_2_SGIS = 0x80A6;
def GL_4PASS_3_SGIS = 0x80A7;
def GL_SAMPLE_BUFFERS_SGIS = 0x80A8;
def GL_SAMPLES_SGIS = 0x80A9;
def GL_SAMPLE_MASK_VALUE_SGIS = 0x80AA;
def GL_SAMPLE_MASK_INVERT_SGIS = 0x80AB;
def GL_SAMPLE_PATTERN_SGIS = 0x80AC;

def glSampleMaskSGIS_signature func(value GLclampf; invert GLboolean);
var global glSampleMaskSGIS glSampleMaskSGIS_signature;

def glSamplePatternSGIS_signature func(pattern GLenum);
var global glSamplePatternSGIS glSamplePatternSGIS_signature;
def GL_SGIS_pixel_texture = 1;
def GL_PIXEL_TEXTURE_SGIS = 0x8353;
def GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS = 0x8354;
def GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS = 0x8355;
def GL_PIXEL_GROUP_COLOR_SGIS = 0x8356;

def glPixelTexGenParameteriSGIS_signature func(pname GLenum; param GLint);
var global glPixelTexGenParameteriSGIS glPixelTexGenParameteriSGIS_signature;

def glPixelTexGenParameterivSGIS_signature func(pname GLenum; params GLint ref);
var global glPixelTexGenParameterivSGIS glPixelTexGenParameterivSGIS_signature;

def glPixelTexGenParameterfSGIS_signature func(pname GLenum; param GLfloat);
var global glPixelTexGenParameterfSGIS glPixelTexGenParameterfSGIS_signature;

def glPixelTexGenParameterfvSGIS_signature func(pname GLenum; params GLfloat ref);
var global glPixelTexGenParameterfvSGIS glPixelTexGenParameterfvSGIS_signature;

def glGetPixelTexGenParameterivSGIS_signature func(pname GLenum; params GLint ref);
var global glGetPixelTexGenParameterivSGIS glGetPixelTexGenParameterivSGIS_signature;

def glGetPixelTexGenParameterfvSGIS_signature func(pname GLenum; params GLfloat ref);
var global glGetPixelTexGenParameterfvSGIS glGetPixelTexGenParameterfvSGIS_signature;
def GL_SGIS_point_line_texgen = 1;
def GL_EYE_DISTANCE_TO_POINT_SGIS = 0x81F0;
def GL_OBJECT_DISTANCE_TO_POINT_SGIS = 0x81F1;
def GL_EYE_DISTANCE_TO_LINE_SGIS = 0x81F2;
def GL_OBJECT_DISTANCE_TO_LINE_SGIS = 0x81F3;
def GL_EYE_POINT_SGIS = 0x81F4;
def GL_OBJECT_POINT_SGIS = 0x81F5;
def GL_EYE_LINE_SGIS = 0x81F6;
def GL_OBJECT_LINE_SGIS = 0x81F7;
def GL_SGIS_point_parameters = 1;
def GL_POINT_SIZE_MIN_SGIS = 0x8126;
def GL_POINT_SIZE_MAX_SGIS = 0x8127;
def GL_POINT_FADE_THRESHOLD_SIZE_SGIS = 0x8128;
def GL_DISTANCE_ATTENUATION_SGIS = 0x8129;

def glPointParameterfSGIS_signature func(pname GLenum; param GLfloat);
var global glPointParameterfSGIS glPointParameterfSGIS_signature;

def glPointParameterfvSGIS_signature func(pname GLenum; params GLfloat ref);
var global glPointParameterfvSGIS glPointParameterfvSGIS_signature;
def GL_SGIS_sharpen_texture = 1;
def GL_LINEAR_SHARPEN_SGIS = 0x80AD;
def GL_LINEAR_SHARPEN_ALPHA_SGIS = 0x80AE;
def GL_LINEAR_SHARPEN_COLOR_SGIS = 0x80AF;
def GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS = 0x80B0;

def glSharpenTexFuncSGIS_signature func(target GLenum; n GLsizei; points GLfloat ref);
var global glSharpenTexFuncSGIS glSharpenTexFuncSGIS_signature;

def glGetSharpenTexFuncSGIS_signature func(target GLenum; points GLfloat ref);
var global glGetSharpenTexFuncSGIS glGetSharpenTexFuncSGIS_signature;
def GL_SGIS_texture4D = 1;
def GL_PACK_SKIP_VOLUMES_SGIS = 0x8130;
def GL_PACK_IMAGE_DEPTH_SGIS = 0x8131;
def GL_UNPACK_SKIP_VOLUMES_SGIS = 0x8132;
def GL_UNPACK_IMAGE_DEPTH_SGIS = 0x8133;
def GL_TEXTURE_4D_SGIS = 0x8134;
def GL_PROXY_TEXTURE_4D_SGIS = 0x8135;
def GL_TEXTURE_4DSIZE_SGIS = 0x8136;
def GL_TEXTURE_WRAP_Q_SGIS = 0x8137;
def GL_MAX_4D_TEXTURE_SIZE_SGIS = 0x8138;
def GL_TEXTURE_4D_BINDING_SGIS = 0x814F;

def glTexImage4DSGIS_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; size4d GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var global glTexImage4DSGIS glTexImage4DSGIS_signature;

def glTexSubImage4DSGIS_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; woffset GLint; width GLsizei; height GLsizei; depth GLsizei; size4d GLsizei; format GLenum; type GLenum; pixels u8 ref);
var global glTexSubImage4DSGIS glTexSubImage4DSGIS_signature;
def GL_SGIS_texture_border_clamp = 1;
def GL_CLAMP_TO_BORDER_SGIS = 0x812D;
def GL_SGIS_texture_color_mask = 1;
def GL_TEXTURE_COLOR_WRITEMASK_SGIS = 0x81EF;

def glTextureColorMaskSGIS_signature func(red GLboolean; green GLboolean; blue GLboolean; alpha GLboolean);
var global glTextureColorMaskSGIS glTextureColorMaskSGIS_signature;
def GL_SGIS_texture_edge_clamp = 1;
def GL_CLAMP_TO_EDGE_SGIS = 0x812F;
def GL_SGIS_texture_filter4 = 1;
def GL_FILTER4_SGIS = 0x8146;
def GL_TEXTURE_FILTER4_SIZE_SGIS = 0x8147;

def glGetTexFilterFuncSGIS_signature func(target GLenum; filter GLenum; weights GLfloat ref);
var global glGetTexFilterFuncSGIS glGetTexFilterFuncSGIS_signature;

def glTexFilterFuncSGIS_signature func(target GLenum; filter GLenum; n GLsizei; weights GLfloat ref);
var global glTexFilterFuncSGIS glTexFilterFuncSGIS_signature;
def GL_SGIS_texture_lod = 1;
def GL_TEXTURE_MIN_LOD_SGIS = 0x813A;
def GL_TEXTURE_MAX_LOD_SGIS = 0x813B;
def GL_TEXTURE_BASE_LEVEL_SGIS = 0x813C;
def GL_TEXTURE_MAX_LEVEL_SGIS = 0x813D;
def GL_SGIS_texture_select = 1;
def GL_DUAL_ALPHA4_SGIS = 0x8110;
def GL_DUAL_ALPHA8_SGIS = 0x8111;
def GL_DUAL_ALPHA12_SGIS = 0x8112;
def GL_DUAL_ALPHA16_SGIS = 0x8113;
def GL_DUAL_LUMINANCE4_SGIS = 0x8114;
def GL_DUAL_LUMINANCE8_SGIS = 0x8115;
def GL_DUAL_LUMINANCE12_SGIS = 0x8116;
def GL_DUAL_LUMINANCE16_SGIS = 0x8117;
def GL_DUAL_INTENSITY4_SGIS = 0x8118;
def GL_DUAL_INTENSITY8_SGIS = 0x8119;
def GL_DUAL_INTENSITY12_SGIS = 0x811A;
def GL_DUAL_INTENSITY16_SGIS = 0x811B;
def GL_DUAL_LUMINANCE_ALPHA4_SGIS = 0x811C;
def GL_DUAL_LUMINANCE_ALPHA8_SGIS = 0x811D;
def GL_QUAD_ALPHA4_SGIS = 0x811E;
def GL_QUAD_ALPHA8_SGIS = 0x811F;
def GL_QUAD_LUMINANCE4_SGIS = 0x8120;
def GL_QUAD_LUMINANCE8_SGIS = 0x8121;
def GL_QUAD_INTENSITY4_SGIS = 0x8122;
def GL_QUAD_INTENSITY8_SGIS = 0x8123;
def GL_DUAL_TEXTURE_SELECT_SGIS = 0x8124;
def GL_QUAD_TEXTURE_SELECT_SGIS = 0x8125;
def GL_SGIX_async = 1;
def GL_ASYNC_MARKER_SGIX = 0x8329;

def glAsyncMarkerSGIX_signature func(marker GLuint);
var global glAsyncMarkerSGIX glAsyncMarkerSGIX_signature;

def glFinishAsyncSGIX_signature func(markerp GLuint ref) (result GLint);
var global glFinishAsyncSGIX glFinishAsyncSGIX_signature;

def glPollAsyncSGIX_signature func(markerp GLuint ref) (result GLint);
var global glPollAsyncSGIX glPollAsyncSGIX_signature;

def glGenAsyncMarkersSGIX_signature func(range GLsizei) (result GLuint);
var global glGenAsyncMarkersSGIX glGenAsyncMarkersSGIX_signature;

def glDeleteAsyncMarkersSGIX_signature func(marker GLuint; range GLsizei);
var global glDeleteAsyncMarkersSGIX glDeleteAsyncMarkersSGIX_signature;

def glIsAsyncMarkerSGIX_signature func(marker GLuint) (result GLboolean);
var global glIsAsyncMarkerSGIX glIsAsyncMarkerSGIX_signature;
def GL_SGIX_async_histogram = 1;
def GL_ASYNC_HISTOGRAM_SGIX = 0x832C;
def GL_MAX_ASYNC_HISTOGRAM_SGIX = 0x832D;
def GL_SGIX_async_pixel = 1;
def GL_ASYNC_TEX_IMAGE_SGIX = 0x835C;
def GL_ASYNC_DRAW_PIXELS_SGIX = 0x835D;
def GL_ASYNC_READ_PIXELS_SGIX = 0x835E;
def GL_MAX_ASYNC_TEX_IMAGE_SGIX = 0x835F;
def GL_MAX_ASYNC_DRAW_PIXELS_SGIX = 0x8360;
def GL_MAX_ASYNC_READ_PIXELS_SGIX = 0x8361;
def GL_SGIX_blend_alpha_minmax = 1;
def GL_ALPHA_MIN_SGIX = 0x8320;
def GL_ALPHA_MAX_SGIX = 0x8321;
def GL_SGIX_calligraphic_fragment = 1;
def GL_CALLIGRAPHIC_FRAGMENT_SGIX = 0x8183;
def GL_SGIX_clipmap = 1;
def GL_LINEAR_CLIPMAP_LINEAR_SGIX = 0x8170;
def GL_TEXTURE_CLIPMAP_CENTER_SGIX = 0x8171;
def GL_TEXTURE_CLIPMAP_FRAME_SGIX = 0x8172;
def GL_TEXTURE_CLIPMAP_OFFSET_SGIX = 0x8173;
def GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX = 0x8174;
def GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX = 0x8175;
def GL_TEXTURE_CLIPMAP_DEPTH_SGIX = 0x8176;
def GL_MAX_CLIPMAP_DEPTH_SGIX = 0x8177;
def GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX = 0x8178;
def GL_NEAREST_CLIPMAP_NEAREST_SGIX = 0x844D;
def GL_NEAREST_CLIPMAP_LINEAR_SGIX = 0x844E;
def GL_LINEAR_CLIPMAP_NEAREST_SGIX = 0x844F;
def GL_SGIX_convolution_accuracy = 1;
def GL_CONVOLUTION_HINT_SGIX = 0x8316;
def GL_SGIX_depth_pass_instrument = 1;
def GL_SGIX_depth_texture = 1;
def GL_DEPTH_COMPONENT16_SGIX = 0x81A5;
def GL_DEPTH_COMPONENT24_SGIX = 0x81A6;
def GL_DEPTH_COMPONENT32_SGIX = 0x81A7;
def GL_SGIX_flush_raster = 1;

def glFlushRasterSGIX_signature func();
var global glFlushRasterSGIX glFlushRasterSGIX_signature;
def GL_SGIX_fog_offset = 1;
def GL_FOG_OFFSET_SGIX = 0x8198;
def GL_FOG_OFFSET_VALUE_SGIX = 0x8199;
def GL_SGIX_fragment_lighting = 1;
def GL_FRAGMENT_LIGHTING_SGIX = 0x8400;
def GL_FRAGMENT_COLOR_MATERIAL_SGIX = 0x8401;
def GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX = 0x8402;
def GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX = 0x8403;
def GL_MAX_FRAGMENT_LIGHTS_SGIX = 0x8404;
def GL_MAX_ACTIVE_LIGHTS_SGIX = 0x8405;
def GL_CURRENT_RASTER_NORMAL_SGIX = 0x8406;
def GL_LIGHT_ENV_MODE_SGIX = 0x8407;
def GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX = 0x8408;
def GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX = 0x8409;
def GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX = 0x840A;
def GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX = 0x840B;
def GL_FRAGMENT_LIGHT0_SGIX = 0x840C;
def GL_FRAGMENT_LIGHT1_SGIX = 0x840D;
def GL_FRAGMENT_LIGHT2_SGIX = 0x840E;
def GL_FRAGMENT_LIGHT3_SGIX = 0x840F;
def GL_FRAGMENT_LIGHT4_SGIX = 0x8410;
def GL_FRAGMENT_LIGHT5_SGIX = 0x8411;
def GL_FRAGMENT_LIGHT6_SGIX = 0x8412;
def GL_FRAGMENT_LIGHT7_SGIX = 0x8413;

def glFragmentColorMaterialSGIX_signature func(face GLenum; mode GLenum);
var global glFragmentColorMaterialSGIX glFragmentColorMaterialSGIX_signature;

def glFragmentLightfSGIX_signature func(light GLenum; pname GLenum; param GLfloat);
var global glFragmentLightfSGIX glFragmentLightfSGIX_signature;

def glFragmentLightfvSGIX_signature func(light GLenum; pname GLenum; params GLfloat ref);
var global glFragmentLightfvSGIX glFragmentLightfvSGIX_signature;

def glFragmentLightiSGIX_signature func(light GLenum; pname GLenum; param GLint);
var global glFragmentLightiSGIX glFragmentLightiSGIX_signature;

def glFragmentLightivSGIX_signature func(light GLenum; pname GLenum; params GLint ref);
var global glFragmentLightivSGIX glFragmentLightivSGIX_signature;

def glFragmentLightModelfSGIX_signature func(pname GLenum; param GLfloat);
var global glFragmentLightModelfSGIX glFragmentLightModelfSGIX_signature;

def glFragmentLightModelfvSGIX_signature func(pname GLenum; params GLfloat ref);
var global glFragmentLightModelfvSGIX glFragmentLightModelfvSGIX_signature;

def glFragmentLightModeliSGIX_signature func(pname GLenum; param GLint);
var global glFragmentLightModeliSGIX glFragmentLightModeliSGIX_signature;

def glFragmentLightModelivSGIX_signature func(pname GLenum; params GLint ref);
var global glFragmentLightModelivSGIX glFragmentLightModelivSGIX_signature;

def glFragmentMaterialfSGIX_signature func(face GLenum; pname GLenum; param GLfloat);
var global glFragmentMaterialfSGIX glFragmentMaterialfSGIX_signature;

def glFragmentMaterialfvSGIX_signature func(face GLenum; pname GLenum; params GLfloat ref);
var global glFragmentMaterialfvSGIX glFragmentMaterialfvSGIX_signature;

def glFragmentMaterialiSGIX_signature func(face GLenum; pname GLenum; param GLint);
var global glFragmentMaterialiSGIX glFragmentMaterialiSGIX_signature;

def glFragmentMaterialivSGIX_signature func(face GLenum; pname GLenum; params GLint ref);
var global glFragmentMaterialivSGIX glFragmentMaterialivSGIX_signature;

def glGetFragmentLightfvSGIX_signature func(light GLenum; pname GLenum; params GLfloat ref);
var global glGetFragmentLightfvSGIX glGetFragmentLightfvSGIX_signature;

def glGetFragmentLightivSGIX_signature func(light GLenum; pname GLenum; params GLint ref);
var global glGetFragmentLightivSGIX glGetFragmentLightivSGIX_signature;

def glGetFragmentMaterialfvSGIX_signature func(face GLenum; pname GLenum; params GLfloat ref);
var global glGetFragmentMaterialfvSGIX glGetFragmentMaterialfvSGIX_signature;

def glGetFragmentMaterialivSGIX_signature func(face GLenum; pname GLenum; params GLint ref);
var global glGetFragmentMaterialivSGIX glGetFragmentMaterialivSGIX_signature;

def glLightEnviSGIX_signature func(pname GLenum; param GLint);
var global glLightEnviSGIX glLightEnviSGIX_signature;
def GL_SGIX_framezoom = 1;
def GL_FRAMEZOOM_SGIX = 0x818B;
def GL_FRAMEZOOM_FACTOR_SGIX = 0x818C;
def GL_MAX_FRAMEZOOM_FACTOR_SGIX = 0x818D;

def glFrameZoomSGIX_signature func(factor GLint);
var global glFrameZoomSGIX glFrameZoomSGIX_signature;
def GL_SGIX_igloo_interface = 1;

def glIglooInterfaceSGIX_signature func(pname GLenum; params u8 ref);
var global glIglooInterfaceSGIX glIglooInterfaceSGIX_signature;
def GL_SGIX_instruments = 1;
def GL_INSTRUMENT_BUFFER_POINTER_SGIX = 0x8180;
def GL_INSTRUMENT_MEASUREMENTS_SGIX = 0x8181;

def glGetInstrumentsSGIX_signature func() (result GLint);
var global glGetInstrumentsSGIX glGetInstrumentsSGIX_signature;

def glInstrumentsBufferSGIX_signature func(size GLsizei; buffer GLint ref);
var global glInstrumentsBufferSGIX glInstrumentsBufferSGIX_signature;

def glPollInstrumentsSGIX_signature func(marker_p GLint ref) (result GLint);
var global glPollInstrumentsSGIX glPollInstrumentsSGIX_signature;

def glReadInstrumentsSGIX_signature func(marker GLint);
var global glReadInstrumentsSGIX glReadInstrumentsSGIX_signature;

def glStartInstrumentsSGIX_signature func();
var global glStartInstrumentsSGIX glStartInstrumentsSGIX_signature;

def glStopInstrumentsSGIX_signature func(marker GLint);
var global glStopInstrumentsSGIX glStopInstrumentsSGIX_signature;
def GL_SGIX_interlace = 1;
def GL_INTERLACE_SGIX = 0x8094;
def GL_SGIX_ir_instrument1 = 1;
def GL_IR_INSTRUMENT1_SGIX = 0x817F;
def GL_SGIX_list_priority = 1;
def GL_LIST_PRIORITY_SGIX = 0x8182;

def glGetListParameterfvSGIX_signature func(list GLuint; pname GLenum; params GLfloat ref);
var global glGetListParameterfvSGIX glGetListParameterfvSGIX_signature;

def glGetListParameterivSGIX_signature func(list GLuint; pname GLenum; params GLint ref);
var global glGetListParameterivSGIX glGetListParameterivSGIX_signature;

def glListParameterfSGIX_signature func(list GLuint; pname GLenum; param GLfloat);
var global glListParameterfSGIX glListParameterfSGIX_signature;

def glListParameterfvSGIX_signature func(list GLuint; pname GLenum; params GLfloat ref);
var global glListParameterfvSGIX glListParameterfvSGIX_signature;

def glListParameteriSGIX_signature func(list GLuint; pname GLenum; param GLint);
var global glListParameteriSGIX glListParameteriSGIX_signature;

def glListParameterivSGIX_signature func(list GLuint; pname GLenum; params GLint ref);
var global glListParameterivSGIX glListParameterivSGIX_signature;
def GL_SGIX_pixel_texture = 1;
def GL_PIXEL_TEX_GEN_SGIX = 0x8139;
def GL_PIXEL_TEX_GEN_MODE_SGIX = 0x832B;

def glPixelTexGenSGIX_signature func(mode GLenum);
var global glPixelTexGenSGIX glPixelTexGenSGIX_signature;
def GL_SGIX_pixel_tiles = 1;
def GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX = 0x813E;
def GL_PIXEL_TILE_CACHE_INCREMENT_SGIX = 0x813F;
def GL_PIXEL_TILE_WIDTH_SGIX = 0x8140;
def GL_PIXEL_TILE_HEIGHT_SGIX = 0x8141;
def GL_PIXEL_TILE_GRID_WIDTH_SGIX = 0x8142;
def GL_PIXEL_TILE_GRID_HEIGHT_SGIX = 0x8143;
def GL_PIXEL_TILE_GRID_DEPTH_SGIX = 0x8144;
def GL_PIXEL_TILE_CACHE_SIZE_SGIX = 0x8145;
def GL_SGIX_polynomial_ffd = 1;
def GL_TEXTURE_DEFORMATION_BIT_SGIX = 0x00000001;
def GL_GEOMETRY_DEFORMATION_BIT_SGIX = 0x00000002;
def GL_GEOMETRY_DEFORMATION_SGIX = 0x8194;
def GL_TEXTURE_DEFORMATION_SGIX = 0x8195;
def GL_DEFORMATIONS_MASK_SGIX = 0x8196;
def GL_MAX_DEFORMATION_ORDER_SGIX = 0x8197;

def glDeformationMap3dSGIX_signature func(target GLenum; u1 GLdouble; u2 GLdouble; ustride GLint; uorder GLint; v1 GLdouble; v2 GLdouble; vstride GLint; vorder GLint; w1 GLdouble; w2 GLdouble; wstride GLint; worder GLint; points GLdouble ref);
var global glDeformationMap3dSGIX glDeformationMap3dSGIX_signature;

def glDeformationMap3fSGIX_signature func(target GLenum; u1 GLfloat; u2 GLfloat; ustride GLint; uorder GLint; v1 GLfloat; v2 GLfloat; vstride GLint; vorder GLint; w1 GLfloat; w2 GLfloat; wstride GLint; worder GLint; points GLfloat ref);
var global glDeformationMap3fSGIX glDeformationMap3fSGIX_signature;

def glDeformSGIX_signature func(mask GLbitfield);
var global glDeformSGIX glDeformSGIX_signature;

def glLoadIdentityDeformationMapSGIX_signature func(mask GLbitfield);
var global glLoadIdentityDeformationMapSGIX glLoadIdentityDeformationMapSGIX_signature;
def GL_SGIX_reference_plane = 1;
def GL_REFERENCE_PLANE_SGIX = 0x817D;
def GL_REFERENCE_PLANE_EQUATION_SGIX = 0x817E;

def glReferencePlaneSGIX_signature func(equation GLdouble ref);
var global glReferencePlaneSGIX glReferencePlaneSGIX_signature;
def GL_SGIX_resample = 1;
def GL_PACK_RESAMPLE_SGIX = 0x842E;
def GL_UNPACK_RESAMPLE_SGIX = 0x842F;
def GL_RESAMPLE_REPLICATE_SGIX = 0x8433;
def GL_RESAMPLE_ZERO_FILL_SGIX = 0x8434;
def GL_RESAMPLE_DECIMATE_SGIX = 0x8430;
def GL_SGIX_scalebias_hint = 1;
def GL_SCALEBIAS_HINT_SGIX = 0x8322;
def GL_SGIX_shadow = 1;
def GL_TEXTURE_COMPARE_SGIX = 0x819A;
def GL_TEXTURE_COMPARE_OPERATOR_SGIX = 0x819B;
def GL_TEXTURE_LEQUAL_R_SGIX = 0x819C;
def GL_TEXTURE_GEQUAL_R_SGIX = 0x819D;
def GL_SGIX_shadow_ambient = 1;
def GL_SHADOW_AMBIENT_SGIX = 0x80BF;
def GL_SGIX_sprite = 1;
def GL_SPRITE_SGIX = 0x8148;
def GL_SPRITE_MODE_SGIX = 0x8149;
def GL_SPRITE_AXIS_SGIX = 0x814A;
def GL_SPRITE_TRANSLATION_SGIX = 0x814B;
def GL_SPRITE_AXIAL_SGIX = 0x814C;
def GL_SPRITE_OBJECT_ALIGNED_SGIX = 0x814D;
def GL_SPRITE_EYE_ALIGNED_SGIX = 0x814E;

def glSpriteParameterfSGIX_signature func(pname GLenum; param GLfloat);
var global glSpriteParameterfSGIX glSpriteParameterfSGIX_signature;

def glSpriteParameterfvSGIX_signature func(pname GLenum; params GLfloat ref);
var global glSpriteParameterfvSGIX glSpriteParameterfvSGIX_signature;

def glSpriteParameteriSGIX_signature func(pname GLenum; param GLint);
var global glSpriteParameteriSGIX glSpriteParameteriSGIX_signature;

def glSpriteParameterivSGIX_signature func(pname GLenum; params GLint ref);
var global glSpriteParameterivSGIX glSpriteParameterivSGIX_signature;
def GL_SGIX_subsample = 1;
def GL_PACK_SUBSAMPLE_RATE_SGIX = 0x85A0;
def GL_UNPACK_SUBSAMPLE_RATE_SGIX = 0x85A1;
def GL_PIXEL_SUBSAMPLE_4444_SGIX = 0x85A2;
def GL_PIXEL_SUBSAMPLE_2424_SGIX = 0x85A3;
def GL_PIXEL_SUBSAMPLE_4242_SGIX = 0x85A4;
def GL_SGIX_tag_sample_buffer = 1;

def glTagSampleBufferSGIX_signature func();
var global glTagSampleBufferSGIX glTagSampleBufferSGIX_signature;
def GL_SGIX_texture_add_env = 1;
def GL_TEXTURE_ENV_BIAS_SGIX = 0x80BE;
def GL_SGIX_texture_coordinate_clamp = 1;
def GL_TEXTURE_MAX_CLAMP_S_SGIX = 0x8369;
def GL_TEXTURE_MAX_CLAMP_T_SGIX = 0x836A;
def GL_TEXTURE_MAX_CLAMP_R_SGIX = 0x836B;
def GL_SGIX_texture_lod_bias = 1;
def GL_TEXTURE_LOD_BIAS_S_SGIX = 0x818E;
def GL_TEXTURE_LOD_BIAS_T_SGIX = 0x818F;
def GL_TEXTURE_LOD_BIAS_R_SGIX = 0x8190;
def GL_SGIX_texture_multi_buffer = 1;
def GL_TEXTURE_MULTI_BUFFER_HINT_SGIX = 0x812E;
def GL_SGIX_texture_scale_bias = 1;
def GL_POST_TEXTURE_FILTER_BIAS_SGIX = 0x8179;
def GL_POST_TEXTURE_FILTER_SCALE_SGIX = 0x817A;
def GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX = 0x817B;
def GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX = 0x817C;
def GL_SGIX_vertex_preclip = 1;
def GL_VERTEX_PRECLIP_SGIX = 0x83EE;
def GL_VERTEX_PRECLIP_HINT_SGIX = 0x83EF;
def GL_SGIX_ycrcb = 1;
def GL_YCRCB_422_SGIX = 0x81BB;
def GL_YCRCB_444_SGIX = 0x81BC;
def GL_SGIX_ycrcb_subsample = 1;
def GL_SGIX_ycrcba = 1;
def GL_YCRCB_SGIX = 0x8318;
def GL_YCRCBA_SGIX = 0x8319;
def GL_SGI_color_matrix = 1;
def GL_COLOR_MATRIX_SGI = 0x80B1;
def GL_COLOR_MATRIX_STACK_DEPTH_SGI = 0x80B2;
def GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI = 0x80B3;
def GL_POST_COLOR_MATRIX_RED_SCALE_SGI = 0x80B4;
def GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI = 0x80B5;
def GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI = 0x80B6;
def GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI = 0x80B7;
def GL_POST_COLOR_MATRIX_RED_BIAS_SGI = 0x80B8;
def GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI = 0x80B9;
def GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI = 0x80BA;
def GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI = 0x80BB;
def GL_SGI_color_table = 1;
def GL_COLOR_TABLE_SGI = 0x80D0;
def GL_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D1;
def GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D2;
def GL_PROXY_COLOR_TABLE_SGI = 0x80D3;
def GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D4;
def GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D5;
def GL_COLOR_TABLE_SCALE_SGI = 0x80D6;
def GL_COLOR_TABLE_BIAS_SGI = 0x80D7;
def GL_COLOR_TABLE_FORMAT_SGI = 0x80D8;
def GL_COLOR_TABLE_WIDTH_SGI = 0x80D9;
def GL_COLOR_TABLE_RED_SIZE_SGI = 0x80DA;
def GL_COLOR_TABLE_GREEN_SIZE_SGI = 0x80DB;
def GL_COLOR_TABLE_BLUE_SIZE_SGI = 0x80DC;
def GL_COLOR_TABLE_ALPHA_SIZE_SGI = 0x80DD;
def GL_COLOR_TABLE_LUMINANCE_SIZE_SGI = 0x80DE;
def GL_COLOR_TABLE_INTENSITY_SIZE_SGI = 0x80DF;

def glColorTableSGI_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; table u8 ref);
var global glColorTableSGI glColorTableSGI_signature;

def glColorTableParameterfvSGI_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glColorTableParameterfvSGI glColorTableParameterfvSGI_signature;

def glColorTableParameterivSGI_signature func(target GLenum; pname GLenum; params GLint ref);
var global glColorTableParameterivSGI glColorTableParameterivSGI_signature;

def glCopyColorTableSGI_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var global glCopyColorTableSGI glCopyColorTableSGI_signature;

def glGetColorTableSGI_signature func(target GLenum; format GLenum; type GLenum; table u8 ref);
var global glGetColorTableSGI glGetColorTableSGI_signature;

def glGetColorTableParameterfvSGI_signature func(target GLenum; pname GLenum; params GLfloat ref);
var global glGetColorTableParameterfvSGI glGetColorTableParameterfvSGI_signature;

def glGetColorTableParameterivSGI_signature func(target GLenum; pname GLenum; params GLint ref);
var global glGetColorTableParameterivSGI glGetColorTableParameterivSGI_signature;
def GL_SGI_texture_color_table = 1;
def GL_TEXTURE_COLOR_TABLE_SGI = 0x80BC;
def GL_PROXY_TEXTURE_COLOR_TABLE_SGI = 0x80BD;
def GL_SUNX_constant_data = 1;
def GL_UNPACK_CONSTANT_DATA_SUNX = 0x81D5;
def GL_TEXTURE_CONSTANT_DATA_SUNX = 0x81D6;

def glFinishTextureSUNX_signature func();
var global glFinishTextureSUNX glFinishTextureSUNX_signature;
def GL_SUN_convolution_border_modes = 1;
def GL_WRAP_BORDER_SUN = 0x81D4;
def GL_SUN_global_alpha = 1;
def GL_GLOBAL_ALPHA_SUN = 0x81D9;
def GL_GLOBAL_ALPHA_FACTOR_SUN = 0x81DA;

def glGlobalAlphaFactorbSUN_signature func(factor GLbyte);
var global glGlobalAlphaFactorbSUN glGlobalAlphaFactorbSUN_signature;

def glGlobalAlphaFactorsSUN_signature func(factor GLshort);
var global glGlobalAlphaFactorsSUN glGlobalAlphaFactorsSUN_signature;

def glGlobalAlphaFactoriSUN_signature func(factor GLint);
var global glGlobalAlphaFactoriSUN glGlobalAlphaFactoriSUN_signature;

def glGlobalAlphaFactorfSUN_signature func(factor GLfloat);
var global glGlobalAlphaFactorfSUN glGlobalAlphaFactorfSUN_signature;

def glGlobalAlphaFactordSUN_signature func(factor GLdouble);
var global glGlobalAlphaFactordSUN glGlobalAlphaFactordSUN_signature;

def glGlobalAlphaFactorubSUN_signature func(factor GLubyte);
var global glGlobalAlphaFactorubSUN glGlobalAlphaFactorubSUN_signature;

def glGlobalAlphaFactorusSUN_signature func(factor GLushort);
var global glGlobalAlphaFactorusSUN glGlobalAlphaFactorusSUN_signature;

def glGlobalAlphaFactoruiSUN_signature func(factor GLuint);
var global glGlobalAlphaFactoruiSUN glGlobalAlphaFactoruiSUN_signature;
def GL_SUN_mesh_array = 1;
def GL_QUAD_MESH_SUN = 0x8614;
def GL_TRIANGLE_MESH_SUN = 0x8615;

def glDrawMeshArraysSUN_signature func(mode GLenum; first GLint; count GLsizei; width GLsizei);
var global glDrawMeshArraysSUN glDrawMeshArraysSUN_signature;
def GL_SUN_slice_accum = 1;
def GL_SLICE_ACCUM_SUN = 0x85CC;
def GL_SUN_triangle_list = 1;
def GL_RESTART_SUN = 0x0001;
def GL_REPLACE_MIDDLE_SUN = 0x0002;
def GL_REPLACE_OLDEST_SUN = 0x0003;
def GL_TRIANGLE_LIST_SUN = 0x81D7;
def GL_REPLACEMENT_CODE_SUN = 0x81D8;
def GL_REPLACEMENT_CODE_ARRAY_SUN = 0x85C0;
def GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN = 0x85C1;
def GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN = 0x85C2;
def GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN = 0x85C3;
def GL_R1UI_V3F_SUN = 0x85C4;
def GL_R1UI_C4UB_V3F_SUN = 0x85C5;
def GL_R1UI_C3F_V3F_SUN = 0x85C6;
def GL_R1UI_N3F_V3F_SUN = 0x85C7;
def GL_R1UI_C4F_N3F_V3F_SUN = 0x85C8;
def GL_R1UI_T2F_V3F_SUN = 0x85C9;
def GL_R1UI_T2F_N3F_V3F_SUN = 0x85CA;
def GL_R1UI_T2F_C4F_N3F_V3F_SUN = 0x85CB;

def glReplacementCodeuiSUN_signature func(code GLuint);
var global glReplacementCodeuiSUN glReplacementCodeuiSUN_signature;

def glReplacementCodeusSUN_signature func(code GLushort);
var global glReplacementCodeusSUN glReplacementCodeusSUN_signature;

def glReplacementCodeubSUN_signature func(code GLubyte);
var global glReplacementCodeubSUN glReplacementCodeubSUN_signature;

def glReplacementCodeuivSUN_signature func(code GLuint ref);
var global glReplacementCodeuivSUN glReplacementCodeuivSUN_signature;

def glReplacementCodeusvSUN_signature func(code GLushort ref);
var global glReplacementCodeusvSUN glReplacementCodeusvSUN_signature;

def glReplacementCodeubvSUN_signature func(code GLubyte ref);
var global glReplacementCodeubvSUN glReplacementCodeubvSUN_signature;

def glReplacementCodePointerSUN_signature func(type GLenum; stride GLsizei; pointer u8 ref ref);
var global glReplacementCodePointerSUN glReplacementCodePointerSUN_signature;
def GL_SUN_vertex = 1;

def glColor4ubVertex2fSUN_signature func(r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat);
var global glColor4ubVertex2fSUN glColor4ubVertex2fSUN_signature;

def glColor4ubVertex2fvSUN_signature func(c GLubyte ref; v GLfloat ref);
var global glColor4ubVertex2fvSUN glColor4ubVertex2fvSUN_signature;

def glColor4ubVertex3fSUN_signature func(r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat; z GLfloat);
var global glColor4ubVertex3fSUN glColor4ubVertex3fSUN_signature;

def glColor4ubVertex3fvSUN_signature func(c GLubyte ref; v GLfloat ref);
var global glColor4ubVertex3fvSUN glColor4ubVertex3fvSUN_signature;

def glColor3fVertex3fSUN_signature func(r GLfloat; g GLfloat; b GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glColor3fVertex3fSUN glColor3fVertex3fSUN_signature;

def glColor3fVertex3fvSUN_signature func(c GLfloat ref; v GLfloat ref);
var global glColor3fVertex3fvSUN glColor3fVertex3fvSUN_signature;

def glNormal3fVertex3fSUN_signature func(nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glNormal3fVertex3fSUN glNormal3fVertex3fSUN_signature;

def glNormal3fVertex3fvSUN_signature func(n GLfloat ref; v GLfloat ref);
var global glNormal3fVertex3fvSUN glNormal3fVertex3fvSUN_signature;

def glColor4fNormal3fVertex3fSUN_signature func(r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glColor4fNormal3fVertex3fSUN glColor4fNormal3fVertex3fSUN_signature;

def glColor4fNormal3fVertex3fvSUN_signature func(c GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glColor4fNormal3fVertex3fvSUN glColor4fNormal3fVertex3fvSUN_signature;

def glTexCoord2fVertex3fSUN_signature func(s GLfloat; t GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glTexCoord2fVertex3fSUN glTexCoord2fVertex3fSUN_signature;

def glTexCoord2fVertex3fvSUN_signature func(tc GLfloat ref; v GLfloat ref);
var global glTexCoord2fVertex3fvSUN glTexCoord2fVertex3fvSUN_signature;

def glTexCoord4fVertex4fSUN_signature func(s GLfloat; t GLfloat; p GLfloat; q GLfloat; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glTexCoord4fVertex4fSUN glTexCoord4fVertex4fSUN_signature;

def glTexCoord4fVertex4fvSUN_signature func(tc GLfloat ref; v GLfloat ref);
var global glTexCoord4fVertex4fvSUN glTexCoord4fVertex4fvSUN_signature;

def glTexCoord2fColor4ubVertex3fSUN_signature func(s GLfloat; t GLfloat; r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat; z GLfloat);
var global glTexCoord2fColor4ubVertex3fSUN glTexCoord2fColor4ubVertex3fSUN_signature;

def glTexCoord2fColor4ubVertex3fvSUN_signature func(tc GLfloat ref; c GLubyte ref; v GLfloat ref);
var global glTexCoord2fColor4ubVertex3fvSUN glTexCoord2fColor4ubVertex3fvSUN_signature;

def glTexCoord2fColor3fVertex3fSUN_signature func(s GLfloat; t GLfloat; r GLfloat; g GLfloat; b GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glTexCoord2fColor3fVertex3fSUN glTexCoord2fColor3fVertex3fSUN_signature;

def glTexCoord2fColor3fVertex3fvSUN_signature func(tc GLfloat ref; c GLfloat ref; v GLfloat ref);
var global glTexCoord2fColor3fVertex3fvSUN glTexCoord2fColor3fVertex3fvSUN_signature;

def glTexCoord2fNormal3fVertex3fSUN_signature func(s GLfloat; t GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glTexCoord2fNormal3fVertex3fSUN glTexCoord2fNormal3fVertex3fSUN_signature;

def glTexCoord2fNormal3fVertex3fvSUN_signature func(tc GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glTexCoord2fNormal3fVertex3fvSUN glTexCoord2fNormal3fVertex3fvSUN_signature;

def glTexCoord2fColor4fNormal3fVertex3fSUN_signature func(s GLfloat; t GLfloat; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glTexCoord2fColor4fNormal3fVertex3fSUN glTexCoord2fColor4fNormal3fVertex3fSUN_signature;

def glTexCoord2fColor4fNormal3fVertex3fvSUN_signature func(tc GLfloat ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glTexCoord2fColor4fNormal3fVertex3fvSUN glTexCoord2fColor4fNormal3fVertex3fvSUN_signature;

def glTexCoord4fColor4fNormal3fVertex4fSUN_signature func(s GLfloat; t GLfloat; p GLfloat; q GLfloat; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var global glTexCoord4fColor4fNormal3fVertex4fSUN glTexCoord4fColor4fNormal3fVertex4fSUN_signature;

def glTexCoord4fColor4fNormal3fVertex4fvSUN_signature func(tc GLfloat ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glTexCoord4fColor4fNormal3fVertex4fvSUN glTexCoord4fColor4fNormal3fVertex4fvSUN_signature;

def glReplacementCodeuiVertex3fSUN_signature func(rc GLuint; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiVertex3fSUN glReplacementCodeuiVertex3fSUN_signature;

def glReplacementCodeuiVertex3fvSUN_signature func(rc GLuint ref; v GLfloat ref);
var global glReplacementCodeuiVertex3fvSUN glReplacementCodeuiVertex3fvSUN_signature;

def glReplacementCodeuiColor4ubVertex3fSUN_signature func(rc GLuint; r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiColor4ubVertex3fSUN glReplacementCodeuiColor4ubVertex3fSUN_signature;

def glReplacementCodeuiColor4ubVertex3fvSUN_signature func(rc GLuint ref; c GLubyte ref; v GLfloat ref);
var global glReplacementCodeuiColor4ubVertex3fvSUN glReplacementCodeuiColor4ubVertex3fvSUN_signature;

def glReplacementCodeuiColor3fVertex3fSUN_signature func(rc GLuint; r GLfloat; g GLfloat; b GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiColor3fVertex3fSUN glReplacementCodeuiColor3fVertex3fSUN_signature;

def glReplacementCodeuiColor3fVertex3fvSUN_signature func(rc GLuint ref; c GLfloat ref; v GLfloat ref);
var global glReplacementCodeuiColor3fVertex3fvSUN glReplacementCodeuiColor3fVertex3fvSUN_signature;

def glReplacementCodeuiNormal3fVertex3fSUN_signature func(rc GLuint; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiNormal3fVertex3fSUN glReplacementCodeuiNormal3fVertex3fSUN_signature;

def glReplacementCodeuiNormal3fVertex3fvSUN_signature func(rc GLuint ref; n GLfloat ref; v GLfloat ref);
var global glReplacementCodeuiNormal3fVertex3fvSUN glReplacementCodeuiNormal3fVertex3fvSUN_signature;

def glReplacementCodeuiColor4fNormal3fVertex3fSUN_signature func(rc GLuint; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiColor4fNormal3fVertex3fSUN glReplacementCodeuiColor4fNormal3fVertex3fSUN_signature;

def glReplacementCodeuiColor4fNormal3fVertex3fvSUN_signature func(rc GLuint ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glReplacementCodeuiColor4fNormal3fVertex3fvSUN glReplacementCodeuiColor4fNormal3fVertex3fvSUN_signature;

def glReplacementCodeuiTexCoord2fVertex3fSUN_signature func(rc GLuint; s GLfloat; t GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiTexCoord2fVertex3fSUN glReplacementCodeuiTexCoord2fVertex3fSUN_signature;

def glReplacementCodeuiTexCoord2fVertex3fvSUN_signature func(rc GLuint ref; tc GLfloat ref; v GLfloat ref);
var global glReplacementCodeuiTexCoord2fVertex3fvSUN glReplacementCodeuiTexCoord2fVertex3fvSUN_signature;

def glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN_signature func(rc GLuint; s GLfloat; t GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN_signature;

def glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN_signature func(rc GLuint ref; tc GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN_signature;

def glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN_signature func(rc GLuint; s GLfloat; t GLfloat; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var global glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN_signature;

def glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN_signature func(rc GLuint ref; tc GLfloat ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var global glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN_signature;
def GL_WIN_phong_shading = 1;
def GL_WIN_specular_fog = 1;

// file: gl/wglext.h

def WGL_WGLEXT_VERSION = 20211115;
def WGL_ARB_buffer_region = 1;
def WGL_FRONT_COLOR_BUFFER_BIT_ARB = 0x00000001;
def WGL_BACK_COLOR_BUFFER_BIT_ARB = 0x00000002;
def WGL_DEPTH_BUFFER_BIT_ARB = 0x00000004;
def WGL_STENCIL_BUFFER_BIT_ARB = 0x00000008;

def wglCreateBufferRegionARB func(hDC HDC; iLayerPlane s32; uType UINT) (result HANDLE) extern_binding("opengl32", true);

def wglDeleteBufferRegionARB func(hRegion HANDLE) extern_binding("opengl32", true);

def wglSaveBufferRegionARB func(hRegion HANDLE; x s32; y s32; width s32; height s32) (result BOOL) extern_binding("opengl32", true);

def wglRestoreBufferRegionARB func(hRegion HANDLE; x s32; y s32; width s32; height s32; xSrc s32; ySrc s32) (result BOOL) extern_binding("opengl32", true);
def WGL_ARB_context_flush_control = 1;
def WGL_CONTEXT_RELEASE_BEHAVIOR_ARB = 0x2097;
def WGL_CONTEXT_RELEASE_BEHAVIOR_NONE_ARB = 0;
def WGL_CONTEXT_RELEASE_BEHAVIOR_FLUSH_ARB = 0x2098;
def WGL_ARB_create_context = 1;
def WGL_CONTEXT_DEBUG_BIT_ARB = 0x00000001;
def WGL_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = 0x00000002;
def WGL_CONTEXT_MAJOR_VERSION_ARB = 0x2091;
def WGL_CONTEXT_MINOR_VERSION_ARB = 0x2092;
def WGL_CONTEXT_LAYER_PLANE_ARB = 0x2093;
def WGL_CONTEXT_FLAGS_ARB = 0x2094;

def wglCreateContextAttribsARB func(hDC HDC; hShareContext HGLRC; attribList s32 ref) (result HGLRC) extern_binding("opengl32", true);
def WGL_ARB_create_context_no_error = 1;
def WGL_CONTEXT_OPENGL_NO_ERROR_ARB = 0x31B3;
def WGL_ARB_create_context_profile = 1;
def WGL_CONTEXT_PROFILE_MASK_ARB = 0x9126;
def WGL_CONTEXT_CORE_PROFILE_BIT_ARB = 0x00000001;
def WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = 0x00000002;
def WGL_ARB_create_context_robustness = 1;
def WGL_CONTEXT_ROBUST_ACCESS_BIT_ARB = 0x00000004;
def WGL_LOSE_CONTEXT_ON_RESET_ARB = 0x8252;
def WGL_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB = 0x8256;
def WGL_NO_RESET_NOTIFICATION_ARB = 0x8261;
def WGL_ARB_extensions_string = 1;

def wglGetExtensionsStringARB func(hdc HDC) (result u8 ref) extern_binding("opengl32", true);
def WGL_ARB_framebuffer_sRGB = 1;
def WGL_FRAMEBUFFER_SRGB_CAPABLE_ARB = 0x20A9;
def WGL_ARB_make_current_read = 1;

def wglMakeContextCurrentARB func(hDrawDC HDC; hReadDC HDC; hglrc HGLRC) (result BOOL) extern_binding("opengl32", true);

def wglGetCurrentReadDCARB func() (result HDC) extern_binding("opengl32", true);
def WGL_ARB_multisample = 1;
def WGL_SAMPLE_BUFFERS_ARB = 0x2041;
def WGL_SAMPLES_ARB = 0x2042;
def WGL_ARB_pbuffer = 1;
def WGL_DRAW_TO_PBUFFER_ARB = 0x202D;
def WGL_MAX_PBUFFER_PIXELS_ARB = 0x202E;
def WGL_MAX_PBUFFER_WIDTH_ARB = 0x202F;
def WGL_MAX_PBUFFER_HEIGHT_ARB = 0x2030;
def WGL_PBUFFER_LARGEST_ARB = 0x2033;
def WGL_PBUFFER_WIDTH_ARB = 0x2034;
def WGL_PBUFFER_HEIGHT_ARB = 0x2035;
def WGL_PBUFFER_LOST_ARB = 0x2036;

def wglCreatePbufferARB func(hDC HDC; iPixelFormat s32; iWidth s32; iHeight s32; piAttribList s32 ref) (result HPBUFFERARB) extern_binding("opengl32", true);

def wglGetPbufferDCARB func(hPbuffer HPBUFFERARB) (result HDC) extern_binding("opengl32", true);

def wglReleasePbufferDCARB func(hPbuffer HPBUFFERARB; hDC HDC) (result s32) extern_binding("opengl32", true);

def wglDestroyPbufferARB func(hPbuffer HPBUFFERARB) (result BOOL) extern_binding("opengl32", true);

def wglQueryPbufferARB func(hPbuffer HPBUFFERARB; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_ARB_pixel_format = 1;
def WGL_NUMBER_PIXEL_FORMATS_ARB = 0x2000;
def WGL_DRAW_TO_WINDOW_ARB = 0x2001;
def WGL_DRAW_TO_BITMAP_ARB = 0x2002;
def WGL_ACCELERATION_ARB = 0x2003;
def WGL_NEED_PALETTE_ARB = 0x2004;
def WGL_NEED_SYSTEM_PALETTE_ARB = 0x2005;
def WGL_SWAP_LAYER_BUFFERS_ARB = 0x2006;
def WGL_SWAP_METHOD_ARB = 0x2007;
def WGL_NUMBER_OVERLAYS_ARB = 0x2008;
def WGL_NUMBER_UNDERLAYS_ARB = 0x2009;
def WGL_TRANSPARENT_ARB = 0x200A;
def WGL_TRANSPARENT_RED_VALUE_ARB = 0x2037;
def WGL_TRANSPARENT_GREEN_VALUE_ARB = 0x2038;
def WGL_TRANSPARENT_BLUE_VALUE_ARB = 0x2039;
def WGL_TRANSPARENT_ALPHA_VALUE_ARB = 0x203A;
def WGL_TRANSPARENT_INDEX_VALUE_ARB = 0x203B;
def WGL_SHARE_DEPTH_ARB = 0x200C;
def WGL_SHARE_STENCIL_ARB = 0x200D;
def WGL_SHARE_ACCUM_ARB = 0x200E;
def WGL_SUPPORT_GDI_ARB = 0x200F;
def WGL_SUPPORT_OPENGL_ARB = 0x2010;
def WGL_DOUBLE_BUFFER_ARB = 0x2011;
def WGL_STEREO_ARB = 0x2012;
def WGL_PIXEL_TYPE_ARB = 0x2013;
def WGL_COLOR_BITS_ARB = 0x2014;
def WGL_RED_BITS_ARB = 0x2015;
def WGL_RED_SHIFT_ARB = 0x2016;
def WGL_GREEN_BITS_ARB = 0x2017;
def WGL_GREEN_SHIFT_ARB = 0x2018;
def WGL_BLUE_BITS_ARB = 0x2019;
def WGL_BLUE_SHIFT_ARB = 0x201A;
def WGL_ALPHA_BITS_ARB = 0x201B;
def WGL_ALPHA_SHIFT_ARB = 0x201C;
def WGL_ACCUM_BITS_ARB = 0x201D;
def WGL_ACCUM_RED_BITS_ARB = 0x201E;
def WGL_ACCUM_GREEN_BITS_ARB = 0x201F;
def WGL_ACCUM_BLUE_BITS_ARB = 0x2020;
def WGL_ACCUM_ALPHA_BITS_ARB = 0x2021;
def WGL_DEPTH_BITS_ARB = 0x2022;
def WGL_STENCIL_BITS_ARB = 0x2023;
def WGL_AUX_BUFFERS_ARB = 0x2024;
def WGL_NO_ACCELERATION_ARB = 0x2025;
def WGL_GENERIC_ACCELERATION_ARB = 0x2026;
def WGL_FULL_ACCELERATION_ARB = 0x2027;
def WGL_SWAP_EXCHANGE_ARB = 0x2028;
def WGL_SWAP_COPY_ARB = 0x2029;
def WGL_SWAP_UNDEFINED_ARB = 0x202A;
def WGL_TYPE_RGBA_ARB = 0x202B;
def WGL_TYPE_COLORINDEX_ARB = 0x202C;

def wglGetPixelFormatAttribivARB func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; piValues s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglGetPixelFormatAttribfvARB func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; pfValues FLOAT ref) (result BOOL) extern_binding("opengl32", true);

def wglChoosePixelFormatARB func(hdc HDC; piAttribIList s32 ref; pfAttribFList FLOAT ref; nMaxFormats UINT; piFormats s32 ref; nNumFormats UINT ref) (result BOOL) extern_binding("opengl32", true);
def WGL_ARB_pixel_format_float = 1;
def WGL_TYPE_RGBA_FLOAT_ARB = 0x21A0;
def WGL_ARB_render_texture = 1;
def WGL_BIND_TO_TEXTURE_RGB_ARB = 0x2070;
def WGL_BIND_TO_TEXTURE_RGBA_ARB = 0x2071;
def WGL_TEXTURE_FORMAT_ARB = 0x2072;
def WGL_TEXTURE_TARGET_ARB = 0x2073;
def WGL_MIPMAP_TEXTURE_ARB = 0x2074;
def WGL_TEXTURE_RGB_ARB = 0x2075;
def WGL_TEXTURE_RGBA_ARB = 0x2076;
def WGL_NO_TEXTURE_ARB = 0x2077;
def WGL_TEXTURE_CUBE_MAP_ARB = 0x2078;
def WGL_TEXTURE_1D_ARB = 0x2079;
def WGL_TEXTURE_2D_ARB = 0x207A;
def WGL_MIPMAP_LEVEL_ARB = 0x207B;
def WGL_CUBE_MAP_FACE_ARB = 0x207C;
def WGL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = 0x207D;
def WGL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = 0x207E;
def WGL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = 0x207F;
def WGL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = 0x2080;
def WGL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = 0x2081;
def WGL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = 0x2082;
def WGL_FRONT_LEFT_ARB = 0x2083;
def WGL_FRONT_RIGHT_ARB = 0x2084;
def WGL_BACK_LEFT_ARB = 0x2085;
def WGL_BACK_RIGHT_ARB = 0x2086;
def WGL_AUX0_ARB = 0x2087;
def WGL_AUX1_ARB = 0x2088;
def WGL_AUX2_ARB = 0x2089;
def WGL_AUX3_ARB = 0x208A;
def WGL_AUX4_ARB = 0x208B;
def WGL_AUX5_ARB = 0x208C;
def WGL_AUX6_ARB = 0x208D;
def WGL_AUX7_ARB = 0x208E;
def WGL_AUX8_ARB = 0x208F;
def WGL_AUX9_ARB = 0x2090;

def wglBindTexImageARB func(hPbuffer HPBUFFERARB; iBuffer s32) (result BOOL) extern_binding("opengl32", true);

def wglReleaseTexImageARB func(hPbuffer HPBUFFERARB; iBuffer s32) (result BOOL) extern_binding("opengl32", true);

def wglSetPbufferAttribARB func(hPbuffer HPBUFFERARB; piAttribList s32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_ARB_robustness_application_isolation = 1;
def WGL_CONTEXT_RESET_ISOLATION_BIT_ARB = 0x00000008;
def WGL_ARB_robustness_share_group_isolation = 1;
def WGL_3DFX_multisample = 1;
def WGL_SAMPLE_BUFFERS_3DFX = 0x2060;
def WGL_SAMPLES_3DFX = 0x2061;
def WGL_3DL_stereo_control = 1;
def WGL_STEREO_EMITTER_ENABLE_3DL = 0x2055;
def WGL_STEREO_EMITTER_DISABLE_3DL = 0x2056;
def WGL_STEREO_POLARITY_NORMAL_3DL = 0x2057;
def WGL_STEREO_POLARITY_INVERT_3DL = 0x2058;

def wglSetStereoEmitterState3DL func(hDC HDC; uState UINT) (result BOOL) extern_binding("opengl32", true);
def WGL_AMD_gpu_association = 1;
def WGL_GPU_VENDOR_AMD = 0x1F00;
def WGL_GPU_RENDERER_STRING_AMD = 0x1F01;
def WGL_GPU_OPENGL_VERSION_STRING_AMD = 0x1F02;
def WGL_GPU_FASTEST_TARGET_GPUS_AMD = 0x21A2;
def WGL_GPU_RAM_AMD = 0x21A3;
def WGL_GPU_CLOCK_AMD = 0x21A4;
def WGL_GPU_NUM_PIPES_AMD = 0x21A5;
def WGL_GPU_NUM_SIMD_AMD = 0x21A6;
def WGL_GPU_NUM_RB_AMD = 0x21A7;
def WGL_GPU_NUM_SPI_AMD = 0x21A8;

def wglGetGPUIDsAMD func(maxCount UINT; ids UINT ref) (result UINT) extern_binding("opengl32", true);

def wglGetGPUInfoAMD func(id UINT; property INT; dataType GLenum; size UINT; data u8 ref) (result INT) extern_binding("opengl32", true);

def wglGetContextGPUIDAMD func(hglrc HGLRC) (result UINT) extern_binding("opengl32", true);

def wglCreateAssociatedContextAMD func(id UINT) (result HGLRC) extern_binding("opengl32", true);

def wglCreateAssociatedContextAttribsAMD func(id UINT; hShareContext HGLRC; attribList s32 ref) (result HGLRC) extern_binding("opengl32", true);

def wglDeleteAssociatedContextAMD func(hglrc HGLRC) (result BOOL) extern_binding("opengl32", true);

def wglMakeAssociatedContextCurrentAMD func(hglrc HGLRC) (result BOOL) extern_binding("opengl32", true);

def wglGetCurrentAssociatedContextAMD func() (result HGLRC) extern_binding("opengl32", true);

def wglBlitContextFramebufferAMD func(dstCtx HGLRC; srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum) extern_binding("opengl32", true);
def WGL_ATI_pixel_format_float = 1;
def WGL_TYPE_RGBA_FLOAT_ATI = 0x21A0;
def WGL_ATI_render_texture_rectangle = 1;
def WGL_TEXTURE_RECTANGLE_ATI = 0x21A5;
def WGL_EXT_colorspace = 1;
def WGL_COLORSPACE_EXT = 0x309D;
def WGL_COLORSPACE_SRGB_EXT = 0x3089;
def WGL_COLORSPACE_LINEAR_EXT = 0x308A;
def WGL_EXT_create_context_es2_profile = 1;
def WGL_CONTEXT_ES2_PROFILE_BIT_EXT = 0x00000004;
def WGL_EXT_create_context_es_profile = 1;
def WGL_CONTEXT_ES_PROFILE_BIT_EXT = 0x00000004;
def WGL_EXT_depth_float = 1;
def WGL_DEPTH_FLOAT_EXT = 0x2040;
def WGL_EXT_display_color_table = 1;

def wglCreateDisplayColorTableEXT func(id GLushort) (result GLboolean) extern_binding("opengl32", true);

def wglLoadDisplayColorTableEXT func(table GLushort ref; length GLuint) (result GLboolean) extern_binding("opengl32", true);

def wglBindDisplayColorTableEXT func(id GLushort) (result GLboolean) extern_binding("opengl32", true);

def wglDestroyDisplayColorTableEXT func(id GLushort) extern_binding("opengl32", true);
def WGL_EXT_extensions_string = 1;

def wglGetExtensionsStringEXT func() (result u8 ref) extern_binding("opengl32", true);
def WGL_EXT_framebuffer_sRGB = 1;
def WGL_FRAMEBUFFER_SRGB_CAPABLE_EXT = 0x20A9;
def WGL_EXT_make_current_read = 1;

def wglMakeContextCurrentEXT func(hDrawDC HDC; hReadDC HDC; hglrc HGLRC) (result BOOL) extern_binding("opengl32", true);

def wglGetCurrentReadDCEXT func() (result HDC) extern_binding("opengl32", true);
def WGL_EXT_multisample = 1;
def WGL_SAMPLE_BUFFERS_EXT = 0x2041;
def WGL_SAMPLES_EXT = 0x2042;
def WGL_EXT_pbuffer = 1;
def WGL_DRAW_TO_PBUFFER_EXT = 0x202D;
def WGL_MAX_PBUFFER_PIXELS_EXT = 0x202E;
def WGL_MAX_PBUFFER_WIDTH_EXT = 0x202F;
def WGL_MAX_PBUFFER_HEIGHT_EXT = 0x2030;
def WGL_OPTIMAL_PBUFFER_WIDTH_EXT = 0x2031;
def WGL_OPTIMAL_PBUFFER_HEIGHT_EXT = 0x2032;
def WGL_PBUFFER_LARGEST_EXT = 0x2033;
def WGL_PBUFFER_WIDTH_EXT = 0x2034;
def WGL_PBUFFER_HEIGHT_EXT = 0x2035;

def wglCreatePbufferEXT func(hDC HDC; iPixelFormat s32; iWidth s32; iHeight s32; piAttribList s32 ref) (result HPBUFFEREXT) extern_binding("opengl32", true);

def wglGetPbufferDCEXT func(hPbuffer HPBUFFEREXT) (result HDC) extern_binding("opengl32", true);

def wglReleasePbufferDCEXT func(hPbuffer HPBUFFEREXT; hDC HDC) (result s32) extern_binding("opengl32", true);

def wglDestroyPbufferEXT func(hPbuffer HPBUFFEREXT) (result BOOL) extern_binding("opengl32", true);

def wglQueryPbufferEXT func(hPbuffer HPBUFFEREXT; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_EXT_pixel_format = 1;
def WGL_NUMBER_PIXEL_FORMATS_EXT = 0x2000;
def WGL_DRAW_TO_WINDOW_EXT = 0x2001;
def WGL_DRAW_TO_BITMAP_EXT = 0x2002;
def WGL_ACCELERATION_EXT = 0x2003;
def WGL_NEED_PALETTE_EXT = 0x2004;
def WGL_NEED_SYSTEM_PALETTE_EXT = 0x2005;
def WGL_SWAP_LAYER_BUFFERS_EXT = 0x2006;
def WGL_SWAP_METHOD_EXT = 0x2007;
def WGL_NUMBER_OVERLAYS_EXT = 0x2008;
def WGL_NUMBER_UNDERLAYS_EXT = 0x2009;
def WGL_TRANSPARENT_EXT = 0x200A;
def WGL_TRANSPARENT_VALUE_EXT = 0x200B;
def WGL_SHARE_DEPTH_EXT = 0x200C;
def WGL_SHARE_STENCIL_EXT = 0x200D;
def WGL_SHARE_ACCUM_EXT = 0x200E;
def WGL_SUPPORT_GDI_EXT = 0x200F;
def WGL_SUPPORT_OPENGL_EXT = 0x2010;
def WGL_DOUBLE_BUFFER_EXT = 0x2011;
def WGL_STEREO_EXT = 0x2012;
def WGL_PIXEL_TYPE_EXT = 0x2013;
def WGL_COLOR_BITS_EXT = 0x2014;
def WGL_RED_BITS_EXT = 0x2015;
def WGL_RED_SHIFT_EXT = 0x2016;
def WGL_GREEN_BITS_EXT = 0x2017;
def WGL_GREEN_SHIFT_EXT = 0x2018;
def WGL_BLUE_BITS_EXT = 0x2019;
def WGL_BLUE_SHIFT_EXT = 0x201A;
def WGL_ALPHA_BITS_EXT = 0x201B;
def WGL_ALPHA_SHIFT_EXT = 0x201C;
def WGL_ACCUM_BITS_EXT = 0x201D;
def WGL_ACCUM_RED_BITS_EXT = 0x201E;
def WGL_ACCUM_GREEN_BITS_EXT = 0x201F;
def WGL_ACCUM_BLUE_BITS_EXT = 0x2020;
def WGL_ACCUM_ALPHA_BITS_EXT = 0x2021;
def WGL_DEPTH_BITS_EXT = 0x2022;
def WGL_STENCIL_BITS_EXT = 0x2023;
def WGL_AUX_BUFFERS_EXT = 0x2024;
def WGL_NO_ACCELERATION_EXT = 0x2025;
def WGL_GENERIC_ACCELERATION_EXT = 0x2026;
def WGL_FULL_ACCELERATION_EXT = 0x2027;
def WGL_SWAP_EXCHANGE_EXT = 0x2028;
def WGL_SWAP_COPY_EXT = 0x2029;
def WGL_SWAP_UNDEFINED_EXT = 0x202A;
def WGL_TYPE_RGBA_EXT = 0x202B;
def WGL_TYPE_COLORINDEX_EXT = 0x202C;

def wglGetPixelFormatAttribivEXT func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; piValues s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglGetPixelFormatAttribfvEXT func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; pfValues FLOAT ref) (result BOOL) extern_binding("opengl32", true);

def wglChoosePixelFormatEXT func(hdc HDC; piAttribIList s32 ref; pfAttribFList FLOAT ref; nMaxFormats UINT; piFormats s32 ref; nNumFormats UINT ref) (result BOOL) extern_binding("opengl32", true);
def WGL_EXT_pixel_format_packed_float = 1;
def WGL_TYPE_RGBA_UNSIGNED_FLOAT_EXT = 0x20A8;
def WGL_EXT_swap_control = 1;

def wglSwapIntervalEXT func(interval s32) (result BOOL) extern_binding("opengl32", true);

def wglGetSwapIntervalEXT func() (result s32) extern_binding("opengl32", true);
def WGL_EXT_swap_control_tear = 1;
def WGL_I3D_digital_video_control = 1;
def WGL_DIGITAL_VIDEO_CURSOR_ALPHA_FRAMEBUFFER_I3D = 0x2050;
def WGL_DIGITAL_VIDEO_CURSOR_ALPHA_VALUE_I3D = 0x2051;
def WGL_DIGITAL_VIDEO_CURSOR_INCLUDED_I3D = 0x2052;
def WGL_DIGITAL_VIDEO_GAMMA_CORRECTED_I3D = 0x2053;

def wglGetDigitalVideoParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglSetDigitalVideoParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_I3D_gamma = 1;
def WGL_GAMMA_TABLE_SIZE_I3D = 0x204E;
def WGL_GAMMA_EXCLUDE_DESKTOP_I3D = 0x204F;

def wglGetGammaTableParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglSetGammaTableParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglGetGammaTableI3D func(hDC HDC; iEntries s32; puRed USHORT ref; puGreen USHORT ref; puBlue USHORT ref) (result BOOL) extern_binding("opengl32", true);

def wglSetGammaTableI3D func(hDC HDC; iEntries s32; puRed USHORT ref; puGreen USHORT ref; puBlue USHORT ref) (result BOOL) extern_binding("opengl32", true);
def WGL_I3D_genlock = 1;
def WGL_GENLOCK_SOURCE_MULTIVIEW_I3D = 0x2044;
def WGL_GENLOCK_SOURCE_EXTERNAL_SYNC_I3D = 0x2045;
def WGL_GENLOCK_SOURCE_EXTERNAL_FIELD_I3D = 0x2046;
def WGL_GENLOCK_SOURCE_EXTERNAL_TTL_I3D = 0x2047;
def WGL_GENLOCK_SOURCE_DIGITAL_SYNC_I3D = 0x2048;
def WGL_GENLOCK_SOURCE_DIGITAL_FIELD_I3D = 0x2049;
def WGL_GENLOCK_SOURCE_EDGE_FALLING_I3D = 0x204A;
def WGL_GENLOCK_SOURCE_EDGE_RISING_I3D = 0x204B;
def WGL_GENLOCK_SOURCE_EDGE_BOTH_I3D = 0x204C;

def wglEnableGenlockI3D func(hDC HDC) (result BOOL) extern_binding("opengl32", true);

def wglDisableGenlockI3D func(hDC HDC) (result BOOL) extern_binding("opengl32", true);

def wglIsEnabledGenlockI3D func(hDC HDC; pFlag BOOL ref) (result BOOL) extern_binding("opengl32", true);

def wglGenlockSourceI3D func(hDC HDC; uSource UINT) (result BOOL) extern_binding("opengl32", true);

def wglGetGenlockSourceI3D func(hDC HDC; uSource UINT ref) (result BOOL) extern_binding("opengl32", true);

def wglGenlockSourceEdgeI3D func(hDC HDC; uEdge UINT) (result BOOL) extern_binding("opengl32", true);

def wglGetGenlockSourceEdgeI3D func(hDC HDC; uEdge UINT ref) (result BOOL) extern_binding("opengl32", true);

def wglGenlockSampleRateI3D func(hDC HDC; uRate UINT) (result BOOL) extern_binding("opengl32", true);

def wglGetGenlockSampleRateI3D func(hDC HDC; uRate UINT ref) (result BOOL) extern_binding("opengl32", true);

def wglGenlockSourceDelayI3D func(hDC HDC; uDelay UINT) (result BOOL) extern_binding("opengl32", true);

def wglGetGenlockSourceDelayI3D func(hDC HDC; uDelay UINT ref) (result BOOL) extern_binding("opengl32", true);

def wglQueryGenlockMaxSourceDelayI3D func(hDC HDC; uMaxLineDelay UINT ref; uMaxPixelDelay UINT ref) (result BOOL) extern_binding("opengl32", true);
def WGL_I3D_image_buffer = 1;
def WGL_IMAGE_BUFFER_MIN_ACCESS_I3D = 0x00000001;
def WGL_IMAGE_BUFFER_LOCK_I3D = 0x00000002;

def wglCreateImageBufferI3D func(hDC HDC; dwSize DWORD; uFlags UINT) (result LPVOID) extern_binding("opengl32", true);

def wglDestroyImageBufferI3D func(hDC HDC; pAddress LPVOID) (result BOOL) extern_binding("opengl32", true);

def wglAssociateImageBufferEventsI3D func(hDC HDC; pEvent HANDLE ref; pAddress LPVOID ref; pSize DWORD ref; count UINT) (result BOOL) extern_binding("opengl32", true);

def wglReleaseImageBufferEventsI3D func(hDC HDC; pAddress LPVOID ref; count UINT) (result BOOL) extern_binding("opengl32", true);
def WGL_I3D_swap_frame_lock = 1;

def wglEnableFrameLockI3D func() (result BOOL) extern_binding("opengl32", true);

def wglDisableFrameLockI3D func() (result BOOL) extern_binding("opengl32", true);

def wglIsEnabledFrameLockI3D func(pFlag BOOL ref) (result BOOL) extern_binding("opengl32", true);

def wglQueryFrameLockMasterI3D func(pFlag BOOL ref) (result BOOL) extern_binding("opengl32", true);
def WGL_I3D_swap_frame_usage = 1;

def wglGetFrameUsageI3D func(pUsage f32 ref) (result BOOL) extern_binding("opengl32", true);

def wglBeginFrameTrackingI3D func() (result BOOL) extern_binding("opengl32", true);

def wglEndFrameTrackingI3D func() (result BOOL) extern_binding("opengl32", true);

def wglQueryFrameTrackingI3D func(pFrameCount DWORD ref; pMissedFrames DWORD ref; pLastMissedUsage f32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_DX_interop = 1;
def WGL_ACCESS_READ_ONLY_NV = 0x00000000;
def WGL_ACCESS_READ_WRITE_NV = 0x00000001;
def WGL_ACCESS_WRITE_DISCARD_NV = 0x00000002;

def wglDXSetResourceShareHandleNV func(dxObject u8 ref; shareHandle HANDLE) (result BOOL) extern_binding("opengl32", true);

def wglDXOpenDeviceNV func(dxDevice u8 ref) (result HANDLE) extern_binding("opengl32", true);

def wglDXCloseDeviceNV func(hDevice HANDLE) (result BOOL) extern_binding("opengl32", true);

def wglDXRegisterObjectNV func(hDevice HANDLE; dxObject u8 ref; name GLuint; type GLenum; access GLenum) (result HANDLE) extern_binding("opengl32", true);

def wglDXUnregisterObjectNV func(hDevice HANDLE; hObject HANDLE) (result BOOL) extern_binding("opengl32", true);

def wglDXObjectAccessNV func(hObject HANDLE; access GLenum) (result BOOL) extern_binding("opengl32", true);

def wglDXLockObjectsNV func(hDevice HANDLE; count GLint; hObjects HANDLE ref) (result BOOL) extern_binding("opengl32", true);

def wglDXUnlockObjectsNV func(hDevice HANDLE; count GLint; hObjects HANDLE ref) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_DX_interop2 = 1;
def WGL_NV_copy_image = 1;

def wglCopyImageSubDataNV func(hSrcRC HGLRC; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; hDstRC HGLRC; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; width GLsizei; height GLsizei; depth GLsizei) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_delay_before_swap = 1;

def wglDelayBeforeSwapNV func(hDC HDC; seconds GLfloat) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_float_buffer = 1;
def WGL_FLOAT_COMPONENTS_NV = 0x20B0;
def WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_R_NV = 0x20B1;
def WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RG_NV = 0x20B2;
def WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGB_NV = 0x20B3;
def WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGBA_NV = 0x20B4;
def WGL_TEXTURE_FLOAT_R_NV = 0x20B5;
def WGL_TEXTURE_FLOAT_RG_NV = 0x20B6;
def WGL_TEXTURE_FLOAT_RGB_NV = 0x20B7;
def WGL_TEXTURE_FLOAT_RGBA_NV = 0x20B8;
def WGL_NV_gpu_affinity = 1;

def wglEnumGpusNV func(iGpuIndex UINT; phGpu HGPUNV ref) (result BOOL) extern_binding("opengl32", true);

def wglEnumGpuDevicesNV func(hGpu HGPUNV; iDeviceIndex UINT; lpGpuDevice PGPU_DEVICE) (result BOOL) extern_binding("opengl32", true);

def wglCreateAffinityDCNV func(phGpuList HGPUNV ref) (result HDC) extern_binding("opengl32", true);

def wglEnumGpusFromAffinityDCNV func(hAffinityDC HDC; iGpuIndex UINT; hGpu HGPUNV ref) (result BOOL) extern_binding("opengl32", true);

def wglDeleteDCNV func(hdc HDC) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_multigpu_context = 1;
def WGL_CONTEXT_MULTIGPU_ATTRIB_NV = 0x20AA;
def WGL_CONTEXT_MULTIGPU_ATTRIB_SINGLE_NV = 0x20AB;
def WGL_CONTEXT_MULTIGPU_ATTRIB_AFR_NV = 0x20AC;
def WGL_CONTEXT_MULTIGPU_ATTRIB_MULTICAST_NV = 0x20AD;
def WGL_CONTEXT_MULTIGPU_ATTRIB_MULTI_DISPLAY_MULTICAST_NV = 0x20AE;
def WGL_NV_multisample_coverage = 1;
def WGL_COVERAGE_SAMPLES_NV = 0x2042;
def WGL_COLOR_SAMPLES_NV = 0x20B9;
def WGL_NV_present_video = 1;
def WGL_NUM_VIDEO_SLOTS_NV = 0x20F0;

def wglEnumerateVideoDevicesNV func(hDc HDC; phDeviceList HVIDEOOUTPUTDEVICENV ref) (result s32) extern_binding("opengl32", true);

def wglBindVideoDeviceNV func(hDc HDC; uVideoSlot u32; hVideoDevice HVIDEOOUTPUTDEVICENV; piAttribList s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglQueryCurrentContextNV func(iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_render_depth_texture = 1;
def WGL_BIND_TO_TEXTURE_DEPTH_NV = 0x20A3;
def WGL_BIND_TO_TEXTURE_RECTANGLE_DEPTH_NV = 0x20A4;
def WGL_DEPTH_TEXTURE_FORMAT_NV = 0x20A5;
def WGL_TEXTURE_DEPTH_COMPONENT_NV = 0x20A6;
def WGL_DEPTH_COMPONENT_NV = 0x20A7;
def WGL_NV_render_texture_rectangle = 1;
def WGL_BIND_TO_TEXTURE_RECTANGLE_RGB_NV = 0x20A0;
def WGL_BIND_TO_TEXTURE_RECTANGLE_RGBA_NV = 0x20A1;
def WGL_TEXTURE_RECTANGLE_NV = 0x20A2;
def WGL_NV_swap_group = 1;

def wglJoinSwapGroupNV func(hDC HDC; group GLuint) (result BOOL) extern_binding("opengl32", true);

def wglBindSwapBarrierNV func(group GLuint; barrier GLuint) (result BOOL) extern_binding("opengl32", true);

def wglQuerySwapGroupNV func(hDC HDC; group GLuint ref; barrier GLuint ref) (result BOOL) extern_binding("opengl32", true);

def wglQueryMaxSwapGroupsNV func(hDC HDC; maxGroups GLuint ref; maxBarriers GLuint ref) (result BOOL) extern_binding("opengl32", true);

def wglQueryFrameCountNV func(hDC HDC; count GLuint ref) (result BOOL) extern_binding("opengl32", true);

def wglResetFrameCountNV func(hDC HDC) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_vertex_array_range = 1;

def wglAllocateMemoryNV func(size GLsizei; readfreq GLfloat; writefreq GLfloat; priority GLfloat) (result u8 ref) extern_binding("opengl32", true);

def wglFreeMemoryNV func(pointer u8 ref) extern_binding("opengl32", true);
def WGL_NV_video_capture = 1;
def WGL_UNIQUE_ID_NV = 0x20CE;
def WGL_NUM_VIDEO_CAPTURE_SLOTS_NV = 0x20CF;

def wglBindVideoCaptureDeviceNV func(uVideoSlot UINT; hDevice HVIDEOINPUTDEVICENV) (result BOOL) extern_binding("opengl32", true);

def wglEnumerateVideoCaptureDevicesNV func(hDc HDC; phDeviceList HVIDEOINPUTDEVICENV ref) (result UINT) extern_binding("opengl32", true);

def wglLockVideoCaptureDeviceNV func(hDc HDC; hDevice HVIDEOINPUTDEVICENV) (result BOOL) extern_binding("opengl32", true);

def wglQueryVideoCaptureDeviceNV func(hDc HDC; hDevice HVIDEOINPUTDEVICENV; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding("opengl32", true);

def wglReleaseVideoCaptureDeviceNV func(hDc HDC; hDevice HVIDEOINPUTDEVICENV) (result BOOL) extern_binding("opengl32", true);
def WGL_NV_video_output = 1;
def WGL_BIND_TO_VIDEO_RGB_NV = 0x20C0;
def WGL_BIND_TO_VIDEO_RGBA_NV = 0x20C1;
def WGL_BIND_TO_VIDEO_RGB_AND_DEPTH_NV = 0x20C2;
def WGL_VIDEO_OUT_COLOR_NV = 0x20C3;
def WGL_VIDEO_OUT_ALPHA_NV = 0x20C4;
def WGL_VIDEO_OUT_DEPTH_NV = 0x20C5;
def WGL_VIDEO_OUT_COLOR_AND_ALPHA_NV = 0x20C6;
def WGL_VIDEO_OUT_COLOR_AND_DEPTH_NV = 0x20C7;
def WGL_VIDEO_OUT_FRAME = 0x20C8;
def WGL_VIDEO_OUT_FIELD_1 = 0x20C9;
def WGL_VIDEO_OUT_FIELD_2 = 0x20CA;
def WGL_VIDEO_OUT_STACKED_FIELDS_1_2 = 0x20CB;
def WGL_VIDEO_OUT_STACKED_FIELDS_2_1 = 0x20CC;

def wglGetVideoDeviceNV func(hDC HDC; numDevices s32; hVideoDevice HPVIDEODEV ref) (result BOOL) extern_binding("opengl32", true);

def wglReleaseVideoDeviceNV func(hVideoDevice HPVIDEODEV) (result BOOL) extern_binding("opengl32", true);

def wglBindVideoImageNV func(hVideoDevice HPVIDEODEV; hPbuffer HPBUFFERARB; iVideoBuffer s32) (result BOOL) extern_binding("opengl32", true);

def wglReleaseVideoImageNV func(hPbuffer HPBUFFERARB; iVideoBuffer s32) (result BOOL) extern_binding("opengl32", true);

def wglSendPbufferToVideoNV func(hPbuffer HPBUFFERARB; iBufferType s32; pulCounterPbuffer u32 ref; bBlock BOOL) (result BOOL) extern_binding("opengl32", true);

def wglGetVideoInfoNV func(hpVideoDevice HPVIDEODEV; pulCounterOutputPbuffer u32 ref; pulCounterOutputVideo u32 ref) (result BOOL) extern_binding("opengl32", true);
def WGL_OML_sync_control = 1;

def wglGetSyncValuesOML func(hdc HDC; ust INT64 ref; msc INT64 ref; sbc INT64 ref) (result BOOL) extern_binding("opengl32", true);

def wglGetMscRateOML func(hdc HDC; numerator INT32 ref; denominator INT32 ref) (result BOOL) extern_binding("opengl32", true);

def wglSwapBuffersMscOML func(hdc HDC; target_msc INT64; divisor INT64; remainder INT64) (result INT64) extern_binding("opengl32", true);

def wglSwapLayerBuffersMscOML func(hdc HDC; fuPlanes INT; target_msc INT64; divisor INT64; remainder INT64) (result INT64) extern_binding("opengl32", true);

def wglWaitForMscOML func(hdc HDC; target_msc INT64; divisor INT64; remainder INT64; ust INT64 ref; msc INT64 ref; sbc INT64 ref) (result BOOL) extern_binding("opengl32", true);

def wglWaitForSbcOML func(hdc HDC; target_sbc INT64; ust INT64 ref; msc INT64 ref; sbc INT64 ref) (result BOOL) extern_binding("opengl32", true);
