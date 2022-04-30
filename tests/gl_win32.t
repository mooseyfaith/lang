module gl;

// file: C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/wingdi.h


def wglCopyContext func(argument0 HGLRC; argument1 HGLRC; argument2 UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglCreateContext func(argument0 HDC) (result HGLRC) extern_binding_lib("opengl32.lib");

def wglCreateLayerContext func(argument0 HDC; argument1 s32) (result HGLRC) extern_binding_lib("opengl32.lib");

def wglDeleteContext func(argument0 HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetCurrentContext func(argument0 VOID) (result HGLRC) extern_binding_lib("opengl32.lib");

def wglGetCurrentDC func(argument0 VOID) (result HDC) extern_binding_lib("opengl32.lib");

def wglGetProcAddress func(argument0 LPCSTR) (result PROC) extern_binding_lib("opengl32.lib");

def wglMakeCurrent func(argument0 HDC; argument1 HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglShareLists func(argument0 HGLRC; argument1 HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglUseFontBitmapsA func(argument0 HDC; argument1 DWORD; argument2 DWORD; argument3 DWORD) (result BOOL) extern_binding_lib("opengl32.lib");

def wglUseFontBitmapsW func(argument0 HDC; argument1 DWORD; argument2 DWORD; argument3 DWORD) (result BOOL) extern_binding_lib("opengl32.lib");

def wglUseFontOutlinesA func(argument0 HDC; argument1 DWORD; argument2 DWORD; argument3 DWORD; argument4 FLOAT; argument5 FLOAT; argument6 s32; argument7 LPGLYPHMETRICSFLOAT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglUseFontOutlinesW func(argument0 HDC; argument1 DWORD; argument2 DWORD; argument3 DWORD; argument4 FLOAT; argument5 FLOAT; argument6 s32; argument7 LPGLYPHMETRICSFLOAT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDescribeLayerPlane func(argument0 HDC; argument1 s32; argument2 s32; argument3 UINT; argument4 LPLAYERPLANEDESCRIPTOR) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSetLayerPaletteEntries func(argument0 HDC; argument1 s32; argument2 s32; argument3 s32; argument4 COLORREF ref) (result s32) extern_binding_lib("opengl32.lib");

def wglGetLayerPaletteEntries func(argument0 HDC; argument1 s32; argument2 s32; argument3 s32; argument4 COLORREF ref) (result s32) extern_binding_lib("opengl32.lib");

def wglRealizeLayerPalette func(argument0 HDC; argument1 s32; argument2 BOOL) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSwapLayerBuffers func(argument0 HDC; argument1 UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSwapMultipleBuffers func(argument0 UINT; argument1 WGLSWAP ref) (result DWORD) extern_binding_lib("opengl32.lib");

// file: C:/Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/um/gl/GL.h

def GLenum = type u32;
def GLboolean = type u8;
def GLbitfield = type u32;
def GLbyte = type s8;
def GLshort = type s16;
def GLint = type s32;
def GLsizei = type s32;
def GLubyte = type u8;
def GLushort = type u16;
def GLuint = type u32;
def GLfloat = type f32;
def GLclampf = type f32;
def GLdouble = type f64;
def GLclampd = type f64;
def GLvoid = type u8;

def glAccum func(op GLenum; value GLfloat) extern_binding_lib("opengl32.lib");

def glAlphaFunc func(func GLenum; ref GLclampf) extern_binding_lib("opengl32.lib");

def glAreTexturesResident func(n GLsizei; textures GLuint ref; residences GLboolean ref) (result GLboolean) extern_binding_lib("opengl32.lib");

def glArrayElement func(i GLint) extern_binding_lib("opengl32.lib");

def glBegin func(mode GLenum) extern_binding_lib("opengl32.lib");

def glBindTexture func(target GLenum; texture GLuint) extern_binding_lib("opengl32.lib");

def glBitmap func(width GLsizei; height GLsizei; xorig GLfloat; yorig GLfloat; xmove GLfloat; ymove GLfloat; bitmap GLubyte ref) extern_binding_lib("opengl32.lib");

def glBlendFunc func(sfactor GLenum; dfactor GLenum) extern_binding_lib("opengl32.lib");

def glCallList func(list GLuint) extern_binding_lib("opengl32.lib");

def glCallLists func(n GLsizei; type GLenum; lists GLvoid ref) extern_binding_lib("opengl32.lib");

def glClear func(mask GLbitfield) extern_binding_lib("opengl32.lib");

def glClearAccum func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat) extern_binding_lib("opengl32.lib");

def glClearColor func(red GLclampf; green GLclampf; blue GLclampf; alpha GLclampf) extern_binding_lib("opengl32.lib");

def glClearDepth func(depth GLclampd) extern_binding_lib("opengl32.lib");

def glClearIndex func(c GLfloat) extern_binding_lib("opengl32.lib");

def glClearStencil func(s GLint) extern_binding_lib("opengl32.lib");

def glClipPlane func(plane GLenum; equation GLdouble ref) extern_binding_lib("opengl32.lib");

def glColor3b func(red GLbyte; green GLbyte; blue GLbyte) extern_binding_lib("opengl32.lib");

def glColor3bv func(v GLbyte ref) extern_binding_lib("opengl32.lib");

def glColor3d func(red GLdouble; green GLdouble; blue GLdouble) extern_binding_lib("opengl32.lib");

def glColor3dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glColor3f func(red GLfloat; green GLfloat; blue GLfloat) extern_binding_lib("opengl32.lib");

def glColor3fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glColor3i func(red GLint; green GLint; blue GLint) extern_binding_lib("opengl32.lib");

def glColor3iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glColor3s func(red GLshort; green GLshort; blue GLshort) extern_binding_lib("opengl32.lib");

def glColor3sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glColor3ub func(red GLubyte; green GLubyte; blue GLubyte) extern_binding_lib("opengl32.lib");

def glColor3ubv func(v GLubyte ref) extern_binding_lib("opengl32.lib");

def glColor3ui func(red GLuint; green GLuint; blue GLuint) extern_binding_lib("opengl32.lib");

def glColor3uiv func(v GLuint ref) extern_binding_lib("opengl32.lib");

def glColor3us func(red GLushort; green GLushort; blue GLushort) extern_binding_lib("opengl32.lib");

def glColor3usv func(v GLushort ref) extern_binding_lib("opengl32.lib");

def glColor4b func(red GLbyte; green GLbyte; blue GLbyte; alpha GLbyte) extern_binding_lib("opengl32.lib");

def glColor4bv func(v GLbyte ref) extern_binding_lib("opengl32.lib");

def glColor4d func(red GLdouble; green GLdouble; blue GLdouble; alpha GLdouble) extern_binding_lib("opengl32.lib");

def glColor4dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glColor4f func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat) extern_binding_lib("opengl32.lib");

def glColor4fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glColor4i func(red GLint; green GLint; blue GLint; alpha GLint) extern_binding_lib("opengl32.lib");

def glColor4iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glColor4s func(red GLshort; green GLshort; blue GLshort; alpha GLshort) extern_binding_lib("opengl32.lib");

def glColor4sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glColor4ub func(red GLubyte; green GLubyte; blue GLubyte; alpha GLubyte) extern_binding_lib("opengl32.lib");

def glColor4ubv func(v GLubyte ref) extern_binding_lib("opengl32.lib");

def glColor4ui func(red GLuint; green GLuint; blue GLuint; alpha GLuint) extern_binding_lib("opengl32.lib");

def glColor4uiv func(v GLuint ref) extern_binding_lib("opengl32.lib");

def glColor4us func(red GLushort; green GLushort; blue GLushort; alpha GLushort) extern_binding_lib("opengl32.lib");

def glColor4usv func(v GLushort ref) extern_binding_lib("opengl32.lib");

def glColorMask func(red GLboolean; green GLboolean; blue GLboolean; alpha GLboolean) extern_binding_lib("opengl32.lib");

def glColorMaterial func(face GLenum; mode GLenum) extern_binding_lib("opengl32.lib");

def glColorPointer func(size GLint; type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glCopyPixels func(x GLint; y GLint; width GLsizei; height GLsizei; type GLenum) extern_binding_lib("opengl32.lib");

def glCopyTexImage1D func(target GLenum; level GLint; internalFormat GLenum; x GLint; y GLint; width GLsizei; border GLint) extern_binding_lib("opengl32.lib");

def glCopyTexImage2D func(target GLenum; level GLint; internalFormat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint) extern_binding_lib("opengl32.lib");

def glCopyTexSubImage1D func(target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei) extern_binding_lib("opengl32.lib");

def glCopyTexSubImage2D func(target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei) extern_binding_lib("opengl32.lib");

def glCullFace func(mode GLenum) extern_binding_lib("opengl32.lib");

def glDeleteLists func(list GLuint; range GLsizei) extern_binding_lib("opengl32.lib");

def glDeleteTextures func(n GLsizei; textures GLuint ref) extern_binding_lib("opengl32.lib");

def glDepthFunc func(func GLenum) extern_binding_lib("opengl32.lib");

def glDepthMask func(flag GLboolean) extern_binding_lib("opengl32.lib");

def glDepthRange func(zNear GLclampd; zFar GLclampd) extern_binding_lib("opengl32.lib");

def glDisable func(cap GLenum) extern_binding_lib("opengl32.lib");

def glDisableClientState func(array GLenum) extern_binding_lib("opengl32.lib");

def glDrawArrays func(mode GLenum; first GLint; count GLsizei) extern_binding_lib("opengl32.lib");

def glDrawBuffer func(mode GLenum) extern_binding_lib("opengl32.lib");

def glDrawElements func(mode GLenum; count GLsizei; type GLenum; indices GLvoid ref) extern_binding_lib("opengl32.lib");

def glDrawPixels func(width GLsizei; height GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glEdgeFlag func(flag GLboolean) extern_binding_lib("opengl32.lib");

def glEdgeFlagPointer func(stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glEdgeFlagv func(flag GLboolean ref) extern_binding_lib("opengl32.lib");

def glEnable func(cap GLenum) extern_binding_lib("opengl32.lib");

def glEnableClientState func(array GLenum) extern_binding_lib("opengl32.lib");

def glEnd func() extern_binding_lib("opengl32.lib");

def glEndList func() extern_binding_lib("opengl32.lib");

def glEvalCoord1d func(u GLdouble) extern_binding_lib("opengl32.lib");

def glEvalCoord1dv func(u GLdouble ref) extern_binding_lib("opengl32.lib");

def glEvalCoord1f func(u GLfloat) extern_binding_lib("opengl32.lib");

def glEvalCoord1fv func(u GLfloat ref) extern_binding_lib("opengl32.lib");

def glEvalCoord2d func(u GLdouble; v GLdouble) extern_binding_lib("opengl32.lib");

def glEvalCoord2dv func(u GLdouble ref) extern_binding_lib("opengl32.lib");

def glEvalCoord2f func(u GLfloat; v GLfloat) extern_binding_lib("opengl32.lib");

def glEvalCoord2fv func(u GLfloat ref) extern_binding_lib("opengl32.lib");

def glEvalMesh1 func(mode GLenum; i1 GLint; i2 GLint) extern_binding_lib("opengl32.lib");

def glEvalMesh2 func(mode GLenum; i1 GLint; i2 GLint; j1 GLint; j2 GLint) extern_binding_lib("opengl32.lib");

def glEvalPoint1 func(i GLint) extern_binding_lib("opengl32.lib");

def glEvalPoint2 func(i GLint; j GLint) extern_binding_lib("opengl32.lib");

def glFeedbackBuffer func(size GLsizei; type GLenum; buffer GLfloat ref) extern_binding_lib("opengl32.lib");

def glFinish func() extern_binding_lib("opengl32.lib");

def glFlush func() extern_binding_lib("opengl32.lib");

def glFogf func(pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glFogfv func(pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glFogi func(pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glFogiv func(pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glFrontFace func(mode GLenum) extern_binding_lib("opengl32.lib");

def glFrustum func(left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble) extern_binding_lib("opengl32.lib");

def glGenLists func(range GLsizei) (result GLuint) extern_binding_lib("opengl32.lib");

def glGenTextures func(n GLsizei; textures GLuint ref) extern_binding_lib("opengl32.lib");

def glGetBooleanv func(pname GLenum; params GLboolean ref) extern_binding_lib("opengl32.lib");

def glGetClipPlane func(plane GLenum; equation GLdouble ref) extern_binding_lib("opengl32.lib");

def glGetDoublev func(pname GLenum; params GLdouble ref) extern_binding_lib("opengl32.lib");

def glGetError func() (result GLenum) extern_binding_lib("opengl32.lib");

def glGetFloatv func(pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetIntegerv func(pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glGetLightfv func(light GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetLightiv func(light GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glGetMapdv func(target GLenum; query GLenum; v GLdouble ref) extern_binding_lib("opengl32.lib");

def glGetMapfv func(target GLenum; query GLenum; v GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetMapiv func(target GLenum; query GLenum; v GLint ref) extern_binding_lib("opengl32.lib");

def glGetMaterialfv func(face GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetMaterialiv func(face GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glGetPixelMapfv func(map GLenum; values GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetPixelMapuiv func(map GLenum; values GLuint ref) extern_binding_lib("opengl32.lib");

def glGetPixelMapusv func(map GLenum; values GLushort ref) extern_binding_lib("opengl32.lib");

def glGetPointerv func(pname GLenum; params GLvoid ref ref) extern_binding_lib("opengl32.lib");

def glGetPolygonStipple func(mask GLubyte ref) extern_binding_lib("opengl32.lib");

def glGetString func(name GLenum) (result GLubyte ref) extern_binding_lib("opengl32.lib");

def glGetTexEnvfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetTexEnviv func(target GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glGetTexGendv func(coord GLenum; pname GLenum; params GLdouble ref) extern_binding_lib("opengl32.lib");

def glGetTexGenfv func(coord GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetTexGeniv func(coord GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glGetTexImage func(target GLenum; level GLint; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glGetTexLevelParameterfv func(target GLenum; level GLint; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetTexLevelParameteriv func(target GLenum; level GLint; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glGetTexParameterfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glGetTexParameteriv func(target GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glHint func(target GLenum; mode GLenum) extern_binding_lib("opengl32.lib");

def glIndexMask func(mask GLuint) extern_binding_lib("opengl32.lib");

def glIndexPointer func(type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glIndexd func(c GLdouble) extern_binding_lib("opengl32.lib");

def glIndexdv func(c GLdouble ref) extern_binding_lib("opengl32.lib");

def glIndexf func(c GLfloat) extern_binding_lib("opengl32.lib");

def glIndexfv func(c GLfloat ref) extern_binding_lib("opengl32.lib");

def glIndexi func(c GLint) extern_binding_lib("opengl32.lib");

def glIndexiv func(c GLint ref) extern_binding_lib("opengl32.lib");

def glIndexs func(c GLshort) extern_binding_lib("opengl32.lib");

def glIndexsv func(c GLshort ref) extern_binding_lib("opengl32.lib");

def glIndexub func(c GLubyte) extern_binding_lib("opengl32.lib");

def glIndexubv func(c GLubyte ref) extern_binding_lib("opengl32.lib");

def glInitNames func() extern_binding_lib("opengl32.lib");

def glInterleavedArrays func(format GLenum; stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glIsEnabled func(cap GLenum) (result GLboolean) extern_binding_lib("opengl32.lib");

def glIsList func(list GLuint) (result GLboolean) extern_binding_lib("opengl32.lib");

def glIsTexture func(texture GLuint) (result GLboolean) extern_binding_lib("opengl32.lib");

def glLightModelf func(pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glLightModelfv func(pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glLightModeli func(pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glLightModeliv func(pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glLightf func(light GLenum; pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glLightfv func(light GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glLighti func(light GLenum; pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glLightiv func(light GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glLineStipple func(factor GLint; pattern GLushort) extern_binding_lib("opengl32.lib");

def glLineWidth func(width GLfloat) extern_binding_lib("opengl32.lib");

def glListBase func(base GLuint) extern_binding_lib("opengl32.lib");

def glLoadIdentity func() extern_binding_lib("opengl32.lib");

def glLoadMatrixd func(m GLdouble ref) extern_binding_lib("opengl32.lib");

def glLoadMatrixf func(m GLfloat ref) extern_binding_lib("opengl32.lib");

def glLoadName func(name GLuint) extern_binding_lib("opengl32.lib");

def glLogicOp func(opcode GLenum) extern_binding_lib("opengl32.lib");

def glMap1d func(target GLenum; u1 GLdouble; u2 GLdouble; stride GLint; order GLint; points GLdouble ref) extern_binding_lib("opengl32.lib");

def glMap1f func(target GLenum; u1 GLfloat; u2 GLfloat; stride GLint; order GLint; points GLfloat ref) extern_binding_lib("opengl32.lib");

def glMap2d func(target GLenum; u1 GLdouble; u2 GLdouble; ustride GLint; uorder GLint; v1 GLdouble; v2 GLdouble; vstride GLint; vorder GLint; points GLdouble ref) extern_binding_lib("opengl32.lib");

def glMap2f func(target GLenum; u1 GLfloat; u2 GLfloat; ustride GLint; uorder GLint; v1 GLfloat; v2 GLfloat; vstride GLint; vorder GLint; points GLfloat ref) extern_binding_lib("opengl32.lib");

def glMapGrid1d func(un GLint; u1 GLdouble; u2 GLdouble) extern_binding_lib("opengl32.lib");

def glMapGrid1f func(un GLint; u1 GLfloat; u2 GLfloat) extern_binding_lib("opengl32.lib");

def glMapGrid2d func(un GLint; u1 GLdouble; u2 GLdouble; vn GLint; v1 GLdouble; v2 GLdouble) extern_binding_lib("opengl32.lib");

def glMapGrid2f func(un GLint; u1 GLfloat; u2 GLfloat; vn GLint; v1 GLfloat; v2 GLfloat) extern_binding_lib("opengl32.lib");

def glMaterialf func(face GLenum; pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glMaterialfv func(face GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glMateriali func(face GLenum; pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glMaterialiv func(face GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glMatrixMode func(mode GLenum) extern_binding_lib("opengl32.lib");

def glMultMatrixd func(m GLdouble ref) extern_binding_lib("opengl32.lib");

def glMultMatrixf func(m GLfloat ref) extern_binding_lib("opengl32.lib");

def glNewList func(list GLuint; mode GLenum) extern_binding_lib("opengl32.lib");

def glNormal3b func(nx GLbyte; ny GLbyte; nz GLbyte) extern_binding_lib("opengl32.lib");

def glNormal3bv func(v GLbyte ref) extern_binding_lib("opengl32.lib");

def glNormal3d func(nx GLdouble; ny GLdouble; nz GLdouble) extern_binding_lib("opengl32.lib");

def glNormal3dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glNormal3f func(nx GLfloat; ny GLfloat; nz GLfloat) extern_binding_lib("opengl32.lib");

def glNormal3fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glNormal3i func(nx GLint; ny GLint; nz GLint) extern_binding_lib("opengl32.lib");

def glNormal3iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glNormal3s func(nx GLshort; ny GLshort; nz GLshort) extern_binding_lib("opengl32.lib");

def glNormal3sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glNormalPointer func(type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glOrtho func(left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble) extern_binding_lib("opengl32.lib");

def glPassThrough func(token GLfloat) extern_binding_lib("opengl32.lib");

def glPixelMapfv func(map GLenum; mapsize GLsizei; values GLfloat ref) extern_binding_lib("opengl32.lib");

def glPixelMapuiv func(map GLenum; mapsize GLsizei; values GLuint ref) extern_binding_lib("opengl32.lib");

def glPixelMapusv func(map GLenum; mapsize GLsizei; values GLushort ref) extern_binding_lib("opengl32.lib");

def glPixelStoref func(pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glPixelStorei func(pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glPixelTransferf func(pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glPixelTransferi func(pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glPixelZoom func(xfactor GLfloat; yfactor GLfloat) extern_binding_lib("opengl32.lib");

def glPointSize func(size GLfloat) extern_binding_lib("opengl32.lib");

def glPolygonMode func(face GLenum; mode GLenum) extern_binding_lib("opengl32.lib");

def glPolygonOffset func(factor GLfloat; units GLfloat) extern_binding_lib("opengl32.lib");

def glPolygonStipple func(mask GLubyte ref) extern_binding_lib("opengl32.lib");

def glPopAttrib func() extern_binding_lib("opengl32.lib");

def glPopClientAttrib func() extern_binding_lib("opengl32.lib");

def glPopMatrix func() extern_binding_lib("opengl32.lib");

def glPopName func() extern_binding_lib("opengl32.lib");

def glPrioritizeTextures func(n GLsizei; textures GLuint ref; priorities GLclampf ref) extern_binding_lib("opengl32.lib");

def glPushAttrib func(mask GLbitfield) extern_binding_lib("opengl32.lib");

def glPushClientAttrib func(mask GLbitfield) extern_binding_lib("opengl32.lib");

def glPushMatrix func() extern_binding_lib("opengl32.lib");

def glPushName func(name GLuint) extern_binding_lib("opengl32.lib");

def glRasterPos2d func(x GLdouble; y GLdouble) extern_binding_lib("opengl32.lib");

def glRasterPos2dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glRasterPos2f func(x GLfloat; y GLfloat) extern_binding_lib("opengl32.lib");

def glRasterPos2fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glRasterPos2i func(x GLint; y GLint) extern_binding_lib("opengl32.lib");

def glRasterPos2iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glRasterPos2s func(x GLshort; y GLshort) extern_binding_lib("opengl32.lib");

def glRasterPos2sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glRasterPos3d func(x GLdouble; y GLdouble; z GLdouble) extern_binding_lib("opengl32.lib");

def glRasterPos3dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glRasterPos3f func(x GLfloat; y GLfloat; z GLfloat) extern_binding_lib("opengl32.lib");

def glRasterPos3fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glRasterPos3i func(x GLint; y GLint; z GLint) extern_binding_lib("opengl32.lib");

def glRasterPos3iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glRasterPos3s func(x GLshort; y GLshort; z GLshort) extern_binding_lib("opengl32.lib");

def glRasterPos3sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glRasterPos4d func(x GLdouble; y GLdouble; z GLdouble; w GLdouble) extern_binding_lib("opengl32.lib");

def glRasterPos4dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glRasterPos4f func(x GLfloat; y GLfloat; z GLfloat; w GLfloat) extern_binding_lib("opengl32.lib");

def glRasterPos4fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glRasterPos4i func(x GLint; y GLint; z GLint; w GLint) extern_binding_lib("opengl32.lib");

def glRasterPos4iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glRasterPos4s func(x GLshort; y GLshort; z GLshort; w GLshort) extern_binding_lib("opengl32.lib");

def glRasterPos4sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glReadBuffer func(mode GLenum) extern_binding_lib("opengl32.lib");

def glReadPixels func(x GLint; y GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glRectd func(x1 GLdouble; y1 GLdouble; x2 GLdouble; y2 GLdouble) extern_binding_lib("opengl32.lib");

def glRectdv func(v1 GLdouble ref; v2 GLdouble ref) extern_binding_lib("opengl32.lib");

def glRectf func(x1 GLfloat; y1 GLfloat; x2 GLfloat; y2 GLfloat) extern_binding_lib("opengl32.lib");

def glRectfv func(v1 GLfloat ref; v2 GLfloat ref) extern_binding_lib("opengl32.lib");

def glRecti func(x1 GLint; y1 GLint; x2 GLint; y2 GLint) extern_binding_lib("opengl32.lib");

def glRectiv func(v1 GLint ref; v2 GLint ref) extern_binding_lib("opengl32.lib");

def glRects func(x1 GLshort; y1 GLshort; x2 GLshort; y2 GLshort) extern_binding_lib("opengl32.lib");

def glRectsv func(v1 GLshort ref; v2 GLshort ref) extern_binding_lib("opengl32.lib");

def glRenderMode func(mode GLenum) (result GLint) extern_binding_lib("opengl32.lib");

def glRotated func(angle GLdouble; x GLdouble; y GLdouble; z GLdouble) extern_binding_lib("opengl32.lib");

def glRotatef func(angle GLfloat; x GLfloat; y GLfloat; z GLfloat) extern_binding_lib("opengl32.lib");

def glScaled func(x GLdouble; y GLdouble; z GLdouble) extern_binding_lib("opengl32.lib");

def glScalef func(x GLfloat; y GLfloat; z GLfloat) extern_binding_lib("opengl32.lib");

def glScissor func(x GLint; y GLint; width GLsizei; height GLsizei) extern_binding_lib("opengl32.lib");

def glSelectBuffer func(size GLsizei; buffer GLuint ref) extern_binding_lib("opengl32.lib");

def glShadeModel func(mode GLenum) extern_binding_lib("opengl32.lib");

def glStencilFunc func(func GLenum; ref GLint; mask GLuint) extern_binding_lib("opengl32.lib");

def glStencilMask func(mask GLuint) extern_binding_lib("opengl32.lib");

def glStencilOp func(fail GLenum; zfail GLenum; zpass GLenum) extern_binding_lib("opengl32.lib");

def glTexCoord1d func(s GLdouble) extern_binding_lib("opengl32.lib");

def glTexCoord1dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glTexCoord1f func(s GLfloat) extern_binding_lib("opengl32.lib");

def glTexCoord1fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexCoord1i func(s GLint) extern_binding_lib("opengl32.lib");

def glTexCoord1iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glTexCoord1s func(s GLshort) extern_binding_lib("opengl32.lib");

def glTexCoord1sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glTexCoord2d func(s GLdouble; t GLdouble) extern_binding_lib("opengl32.lib");

def glTexCoord2dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glTexCoord2f func(s GLfloat; t GLfloat) extern_binding_lib("opengl32.lib");

def glTexCoord2fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexCoord2i func(s GLint; t GLint) extern_binding_lib("opengl32.lib");

def glTexCoord2iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glTexCoord2s func(s GLshort; t GLshort) extern_binding_lib("opengl32.lib");

def glTexCoord2sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glTexCoord3d func(s GLdouble; t GLdouble; r GLdouble) extern_binding_lib("opengl32.lib");

def glTexCoord3dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glTexCoord3f func(s GLfloat; t GLfloat; r GLfloat) extern_binding_lib("opengl32.lib");

def glTexCoord3fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexCoord3i func(s GLint; t GLint; r GLint) extern_binding_lib("opengl32.lib");

def glTexCoord3iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glTexCoord3s func(s GLshort; t GLshort; r GLshort) extern_binding_lib("opengl32.lib");

def glTexCoord3sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glTexCoord4d func(s GLdouble; t GLdouble; r GLdouble; q GLdouble) extern_binding_lib("opengl32.lib");

def glTexCoord4dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glTexCoord4f func(s GLfloat; t GLfloat; r GLfloat; q GLfloat) extern_binding_lib("opengl32.lib");

def glTexCoord4fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexCoord4i func(s GLint; t GLint; r GLint; q GLint) extern_binding_lib("opengl32.lib");

def glTexCoord4iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glTexCoord4s func(s GLshort; t GLshort; r GLshort; q GLshort) extern_binding_lib("opengl32.lib");

def glTexCoord4sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glTexCoordPointer func(size GLint; type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glTexEnvf func(target GLenum; pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glTexEnvfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexEnvi func(target GLenum; pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glTexEnviv func(target GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glTexGend func(coord GLenum; pname GLenum; param GLdouble) extern_binding_lib("opengl32.lib");

def glTexGendv func(coord GLenum; pname GLenum; params GLdouble ref) extern_binding_lib("opengl32.lib");

def glTexGenf func(coord GLenum; pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glTexGenfv func(coord GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexGeni func(coord GLenum; pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glTexGeniv func(coord GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glTexImage1D func(target GLenum; level GLint; internalformat GLint; width GLsizei; border GLint; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glTexImage2D func(target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; border GLint; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glTexParameterf func(target GLenum; pname GLenum; param GLfloat) extern_binding_lib("opengl32.lib");

def glTexParameterfv func(target GLenum; pname GLenum; params GLfloat ref) extern_binding_lib("opengl32.lib");

def glTexParameteri func(target GLenum; pname GLenum; param GLint) extern_binding_lib("opengl32.lib");

def glTexParameteriv func(target GLenum; pname GLenum; params GLint ref) extern_binding_lib("opengl32.lib");

def glTexSubImage1D func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glTexSubImage2D func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels GLvoid ref) extern_binding_lib("opengl32.lib");

def glTranslated func(x GLdouble; y GLdouble; z GLdouble) extern_binding_lib("opengl32.lib");

def glTranslatef func(x GLfloat; y GLfloat; z GLfloat) extern_binding_lib("opengl32.lib");

def glVertex2d func(x GLdouble; y GLdouble) extern_binding_lib("opengl32.lib");

def glVertex2dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glVertex2f func(x GLfloat; y GLfloat) extern_binding_lib("opengl32.lib");

def glVertex2fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glVertex2i func(x GLint; y GLint) extern_binding_lib("opengl32.lib");

def glVertex2iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glVertex2s func(x GLshort; y GLshort) extern_binding_lib("opengl32.lib");

def glVertex2sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glVertex3d func(x GLdouble; y GLdouble; z GLdouble) extern_binding_lib("opengl32.lib");

def glVertex3dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glVertex3f func(x GLfloat; y GLfloat; z GLfloat) extern_binding_lib("opengl32.lib");

def glVertex3fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glVertex3i func(x GLint; y GLint; z GLint) extern_binding_lib("opengl32.lib");

def glVertex3iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glVertex3s func(x GLshort; y GLshort; z GLshort) extern_binding_lib("opengl32.lib");

def glVertex3sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glVertex4d func(x GLdouble; y GLdouble; z GLdouble; w GLdouble) extern_binding_lib("opengl32.lib");

def glVertex4dv func(v GLdouble ref) extern_binding_lib("opengl32.lib");

def glVertex4f func(x GLfloat; y GLfloat; z GLfloat; w GLfloat) extern_binding_lib("opengl32.lib");

def glVertex4fv func(v GLfloat ref) extern_binding_lib("opengl32.lib");

def glVertex4i func(x GLint; y GLint; z GLint; w GLint) extern_binding_lib("opengl32.lib");

def glVertex4iv func(v GLint ref) extern_binding_lib("opengl32.lib");

def glVertex4s func(x GLshort; y GLshort; z GLshort; w GLshort) extern_binding_lib("opengl32.lib");

def glVertex4sv func(v GLshort ref) extern_binding_lib("opengl32.lib");

def glVertexPointer func(size GLint; type GLenum; stride GLsizei; pointer GLvoid ref) extern_binding_lib("opengl32.lib");

def glViewport func(x GLint; y GLint; width GLsizei; height GLsizei) extern_binding_lib("opengl32.lib");

// file: gl/glext.h


def glDrawRangeElements_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei; type GLenum; indices u8 ref);
var glDrawRangeElements glDrawRangeElements_signature;

def glTexImage3D_signature func(target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glTexImage3D glTexImage3D_signature;

def glTexSubImage3D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTexSubImage3D glTexSubImage3D_signature;

def glCopyTexSubImage3D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTexSubImage3D glCopyTexSubImage3D_signature;

def glActiveTexture_signature func(texture GLenum);
var glActiveTexture glActiveTexture_signature;

def glSampleCoverage_signature func(value GLfloat; invert GLboolean);
var glSampleCoverage glSampleCoverage_signature;

def glCompressedTexImage3D_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var glCompressedTexImage3D glCompressedTexImage3D_signature;

def glCompressedTexImage2D_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var glCompressedTexImage2D glCompressedTexImage2D_signature;

def glCompressedTexImage1D_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var glCompressedTexImage1D glCompressedTexImage1D_signature;

def glCompressedTexSubImage3D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTexSubImage3D glCompressedTexSubImage3D_signature;

def glCompressedTexSubImage2D_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTexSubImage2D glCompressedTexSubImage2D_signature;

def glCompressedTexSubImage1D_signature func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTexSubImage1D glCompressedTexSubImage1D_signature;

def glGetCompressedTexImage_signature func(target GLenum; level GLint; img u8 ref);
var glGetCompressedTexImage glGetCompressedTexImage_signature;

def glClientActiveTexture_signature func(texture GLenum);
var glClientActiveTexture glClientActiveTexture_signature;

def glMultiTexCoord1d_signature func(target GLenum; s GLdouble);
var glMultiTexCoord1d glMultiTexCoord1d_signature;

def glMultiTexCoord1dv_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord1dv glMultiTexCoord1dv_signature;

def glMultiTexCoord1f_signature func(target GLenum; s GLfloat);
var glMultiTexCoord1f glMultiTexCoord1f_signature;

def glMultiTexCoord1fv_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord1fv glMultiTexCoord1fv_signature;

def glMultiTexCoord1i_signature func(target GLenum; s GLint);
var glMultiTexCoord1i glMultiTexCoord1i_signature;

def glMultiTexCoord1iv_signature func(target GLenum; v GLint ref);
var glMultiTexCoord1iv glMultiTexCoord1iv_signature;

def glMultiTexCoord1s_signature func(target GLenum; s GLshort);
var glMultiTexCoord1s glMultiTexCoord1s_signature;

def glMultiTexCoord1sv_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord1sv glMultiTexCoord1sv_signature;

def glMultiTexCoord2d_signature func(target GLenum; s GLdouble; t GLdouble);
var glMultiTexCoord2d glMultiTexCoord2d_signature;

def glMultiTexCoord2dv_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord2dv glMultiTexCoord2dv_signature;

def glMultiTexCoord2f_signature func(target GLenum; s GLfloat; t GLfloat);
var glMultiTexCoord2f glMultiTexCoord2f_signature;

def glMultiTexCoord2fv_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord2fv glMultiTexCoord2fv_signature;

def glMultiTexCoord2i_signature func(target GLenum; s GLint; t GLint);
var glMultiTexCoord2i glMultiTexCoord2i_signature;

def glMultiTexCoord2iv_signature func(target GLenum; v GLint ref);
var glMultiTexCoord2iv glMultiTexCoord2iv_signature;

def glMultiTexCoord2s_signature func(target GLenum; s GLshort; t GLshort);
var glMultiTexCoord2s glMultiTexCoord2s_signature;

def glMultiTexCoord2sv_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord2sv glMultiTexCoord2sv_signature;

def glMultiTexCoord3d_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble);
var glMultiTexCoord3d glMultiTexCoord3d_signature;

def glMultiTexCoord3dv_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord3dv glMultiTexCoord3dv_signature;

def glMultiTexCoord3f_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat);
var glMultiTexCoord3f glMultiTexCoord3f_signature;

def glMultiTexCoord3fv_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord3fv glMultiTexCoord3fv_signature;

def glMultiTexCoord3i_signature func(target GLenum; s GLint; t GLint; r GLint);
var glMultiTexCoord3i glMultiTexCoord3i_signature;

def glMultiTexCoord3iv_signature func(target GLenum; v GLint ref);
var glMultiTexCoord3iv glMultiTexCoord3iv_signature;

def glMultiTexCoord3s_signature func(target GLenum; s GLshort; t GLshort; r GLshort);
var glMultiTexCoord3s glMultiTexCoord3s_signature;

def glMultiTexCoord3sv_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord3sv glMultiTexCoord3sv_signature;

def glMultiTexCoord4d_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble; q GLdouble);
var glMultiTexCoord4d glMultiTexCoord4d_signature;

def glMultiTexCoord4dv_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord4dv glMultiTexCoord4dv_signature;

def glMultiTexCoord4f_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat; q GLfloat);
var glMultiTexCoord4f glMultiTexCoord4f_signature;

def glMultiTexCoord4fv_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord4fv glMultiTexCoord4fv_signature;

def glMultiTexCoord4i_signature func(target GLenum; s GLint; t GLint; r GLint; q GLint);
var glMultiTexCoord4i glMultiTexCoord4i_signature;

def glMultiTexCoord4iv_signature func(target GLenum; v GLint ref);
var glMultiTexCoord4iv glMultiTexCoord4iv_signature;

def glMultiTexCoord4s_signature func(target GLenum; s GLshort; t GLshort; r GLshort; q GLshort);
var glMultiTexCoord4s glMultiTexCoord4s_signature;

def glMultiTexCoord4sv_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord4sv glMultiTexCoord4sv_signature;

def glLoadTransposeMatrixf_signature func(m GLfloat ref);
var glLoadTransposeMatrixf glLoadTransposeMatrixf_signature;

def glLoadTransposeMatrixd_signature func(m GLdouble ref);
var glLoadTransposeMatrixd glLoadTransposeMatrixd_signature;

def glMultTransposeMatrixf_signature func(m GLfloat ref);
var glMultTransposeMatrixf glMultTransposeMatrixf_signature;

def glMultTransposeMatrixd_signature func(m GLdouble ref);
var glMultTransposeMatrixd glMultTransposeMatrixd_signature;

def glBlendFuncSeparate_signature func(sfactorRGB GLenum; dfactorRGB GLenum; sfactorAlpha GLenum; dfactorAlpha GLenum);
var glBlendFuncSeparate glBlendFuncSeparate_signature;

def glMultiDrawArrays_signature func(mode GLenum; first GLint ref; count GLsizei ref; drawcount GLsizei);
var glMultiDrawArrays glMultiDrawArrays_signature;

def glMultiDrawElements_signature func(mode GLenum; count GLsizei ref; type GLenum; indices u8 ref ref; drawcount GLsizei);
var glMultiDrawElements glMultiDrawElements_signature;

def glPointParameterf_signature func(pname GLenum; param GLfloat);
var glPointParameterf glPointParameterf_signature;

def glPointParameterfv_signature func(pname GLenum; params GLfloat ref);
var glPointParameterfv glPointParameterfv_signature;

def glPointParameteri_signature func(pname GLenum; param GLint);
var glPointParameteri glPointParameteri_signature;

def glPointParameteriv_signature func(pname GLenum; params GLint ref);
var glPointParameteriv glPointParameteriv_signature;

def glFogCoordf_signature func(coord GLfloat);
var glFogCoordf glFogCoordf_signature;

def glFogCoordfv_signature func(coord GLfloat ref);
var glFogCoordfv glFogCoordfv_signature;

def glFogCoordd_signature func(coord GLdouble);
var glFogCoordd glFogCoordd_signature;

def glFogCoorddv_signature func(coord GLdouble ref);
var glFogCoorddv glFogCoorddv_signature;

def glFogCoordPointer_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var glFogCoordPointer glFogCoordPointer_signature;

def glSecondaryColor3b_signature func(red GLbyte; green GLbyte; blue GLbyte);
var glSecondaryColor3b glSecondaryColor3b_signature;

def glSecondaryColor3bv_signature func(v GLbyte ref);
var glSecondaryColor3bv glSecondaryColor3bv_signature;

def glSecondaryColor3d_signature func(red GLdouble; green GLdouble; blue GLdouble);
var glSecondaryColor3d glSecondaryColor3d_signature;

def glSecondaryColor3dv_signature func(v GLdouble ref);
var glSecondaryColor3dv glSecondaryColor3dv_signature;

def glSecondaryColor3f_signature func(red GLfloat; green GLfloat; blue GLfloat);
var glSecondaryColor3f glSecondaryColor3f_signature;

def glSecondaryColor3fv_signature func(v GLfloat ref);
var glSecondaryColor3fv glSecondaryColor3fv_signature;

def glSecondaryColor3i_signature func(red GLint; green GLint; blue GLint);
var glSecondaryColor3i glSecondaryColor3i_signature;

def glSecondaryColor3iv_signature func(v GLint ref);
var glSecondaryColor3iv glSecondaryColor3iv_signature;

def glSecondaryColor3s_signature func(red GLshort; green GLshort; blue GLshort);
var glSecondaryColor3s glSecondaryColor3s_signature;

def glSecondaryColor3sv_signature func(v GLshort ref);
var glSecondaryColor3sv glSecondaryColor3sv_signature;

def glSecondaryColor3ub_signature func(red GLubyte; green GLubyte; blue GLubyte);
var glSecondaryColor3ub glSecondaryColor3ub_signature;

def glSecondaryColor3ubv_signature func(v GLubyte ref);
var glSecondaryColor3ubv glSecondaryColor3ubv_signature;

def glSecondaryColor3ui_signature func(red GLuint; green GLuint; blue GLuint);
var glSecondaryColor3ui glSecondaryColor3ui_signature;

def glSecondaryColor3uiv_signature func(v GLuint ref);
var glSecondaryColor3uiv glSecondaryColor3uiv_signature;

def glSecondaryColor3us_signature func(red GLushort; green GLushort; blue GLushort);
var glSecondaryColor3us glSecondaryColor3us_signature;

def glSecondaryColor3usv_signature func(v GLushort ref);
var glSecondaryColor3usv glSecondaryColor3usv_signature;

def glSecondaryColorPointer_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glSecondaryColorPointer glSecondaryColorPointer_signature;

def glWindowPos2d_signature func(x GLdouble; y GLdouble);
var glWindowPos2d glWindowPos2d_signature;

def glWindowPos2dv_signature func(v GLdouble ref);
var glWindowPos2dv glWindowPos2dv_signature;

def glWindowPos2f_signature func(x GLfloat; y GLfloat);
var glWindowPos2f glWindowPos2f_signature;

def glWindowPos2fv_signature func(v GLfloat ref);
var glWindowPos2fv glWindowPos2fv_signature;

def glWindowPos2i_signature func(x GLint; y GLint);
var glWindowPos2i glWindowPos2i_signature;

def glWindowPos2iv_signature func(v GLint ref);
var glWindowPos2iv glWindowPos2iv_signature;

def glWindowPos2s_signature func(x GLshort; y GLshort);
var glWindowPos2s glWindowPos2s_signature;

def glWindowPos2sv_signature func(v GLshort ref);
var glWindowPos2sv glWindowPos2sv_signature;

def glWindowPos3d_signature func(x GLdouble; y GLdouble; z GLdouble);
var glWindowPos3d glWindowPos3d_signature;

def glWindowPos3dv_signature func(v GLdouble ref);
var glWindowPos3dv glWindowPos3dv_signature;

def glWindowPos3f_signature func(x GLfloat; y GLfloat; z GLfloat);
var glWindowPos3f glWindowPos3f_signature;

def glWindowPos3fv_signature func(v GLfloat ref);
var glWindowPos3fv glWindowPos3fv_signature;

def glWindowPos3i_signature func(x GLint; y GLint; z GLint);
var glWindowPos3i glWindowPos3i_signature;

def glWindowPos3iv_signature func(v GLint ref);
var glWindowPos3iv glWindowPos3iv_signature;

def glWindowPos3s_signature func(x GLshort; y GLshort; z GLshort);
var glWindowPos3s glWindowPos3s_signature;

def glWindowPos3sv_signature func(v GLshort ref);
var glWindowPos3sv glWindowPos3sv_signature;

def glBlendColor_signature func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat);
var glBlendColor glBlendColor_signature;

def glBlendEquation_signature func(mode GLenum);
var glBlendEquation glBlendEquation_signature;
def GLsizeiptr = type khronos_ssize_t;
def GLintptr = type khronos_intptr_t;

def glGenQueries_signature func(n GLsizei; ids GLuint ref);
var glGenQueries glGenQueries_signature;

def glDeleteQueries_signature func(n GLsizei; ids GLuint ref);
var glDeleteQueries glDeleteQueries_signature;

def glIsQuery_signature func(id GLuint) (result GLboolean);
var glIsQuery glIsQuery_signature;

def glBeginQuery_signature func(target GLenum; id GLuint);
var glBeginQuery glBeginQuery_signature;

def glEndQuery_signature func(target GLenum);
var glEndQuery glEndQuery_signature;

def glGetQueryiv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetQueryiv glGetQueryiv_signature;

def glGetQueryObjectiv_signature func(id GLuint; pname GLenum; params GLint ref);
var glGetQueryObjectiv glGetQueryObjectiv_signature;

def glGetQueryObjectuiv_signature func(id GLuint; pname GLenum; params GLuint ref);
var glGetQueryObjectuiv glGetQueryObjectuiv_signature;

def glBindBuffer_signature func(target GLenum; buffer GLuint);
var glBindBuffer glBindBuffer_signature;

def glDeleteBuffers_signature func(n GLsizei; buffers GLuint ref);
var glDeleteBuffers glDeleteBuffers_signature;

def glGenBuffers_signature func(n GLsizei; buffers GLuint ref);
var glGenBuffers glGenBuffers_signature;

def glIsBuffer_signature func(buffer GLuint) (result GLboolean);
var glIsBuffer glIsBuffer_signature;

def glBufferData_signature func(target GLenum; size GLsizeiptr; data u8 ref; usage GLenum);
var glBufferData glBufferData_signature;

def glBufferSubData_signature func(target GLenum; offset GLintptr; size GLsizeiptr; data u8 ref);
var glBufferSubData glBufferSubData_signature;

def glGetBufferSubData_signature func(target GLenum; offset GLintptr; size GLsizeiptr; data u8 ref);
var glGetBufferSubData glGetBufferSubData_signature;

def glMapBuffer_signature func(target GLenum; access GLenum) (result u8 ref);
var glMapBuffer glMapBuffer_signature;

def glUnmapBuffer_signature func(target GLenum) (result GLboolean);
var glUnmapBuffer glUnmapBuffer_signature;

def glGetBufferParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetBufferParameteriv glGetBufferParameteriv_signature;

def glGetBufferPointerv_signature func(target GLenum; pname GLenum; params u8 ref ref);
var glGetBufferPointerv glGetBufferPointerv_signature;
def GLchar = type u8;

def glBlendEquationSeparate_signature func(modeRGB GLenum; modeAlpha GLenum);
var glBlendEquationSeparate glBlendEquationSeparate_signature;

def glDrawBuffers_signature func(n GLsizei; bufs GLenum ref);
var glDrawBuffers glDrawBuffers_signature;

def glStencilOpSeparate_signature func(face GLenum; sfail GLenum; dpfail GLenum; dppass GLenum);
var glStencilOpSeparate glStencilOpSeparate_signature;

def glStencilFuncSeparate_signature func(face GLenum; func GLenum; ref GLint; mask GLuint);
var glStencilFuncSeparate glStencilFuncSeparate_signature;

def glStencilMaskSeparate_signature func(face GLenum; mask GLuint);
var glStencilMaskSeparate glStencilMaskSeparate_signature;

def glAttachShader_signature func(program GLuint; shader GLuint);
var glAttachShader glAttachShader_signature;

def glBindAttribLocation_signature func(program GLuint; index GLuint; name GLchar ref);
var glBindAttribLocation glBindAttribLocation_signature;

def glCompileShader_signature func(shader GLuint);
var glCompileShader glCompileShader_signature;

def glCreateProgram_signature func() (result GLuint);
var glCreateProgram glCreateProgram_signature;

def glCreateShader_signature func(type GLenum) (result GLuint);
var glCreateShader glCreateShader_signature;

def glDeleteProgram_signature func(program GLuint);
var glDeleteProgram glDeleteProgram_signature;

def glDeleteShader_signature func(shader GLuint);
var glDeleteShader glDeleteShader_signature;

def glDetachShader_signature func(program GLuint; shader GLuint);
var glDetachShader glDetachShader_signature;

def glDisableVertexAttribArray_signature func(index GLuint);
var glDisableVertexAttribArray glDisableVertexAttribArray_signature;

def glEnableVertexAttribArray_signature func(index GLuint);
var glEnableVertexAttribArray glEnableVertexAttribArray_signature;

def glGetActiveAttrib_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLchar ref);
var glGetActiveAttrib glGetActiveAttrib_signature;

def glGetActiveUniform_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLchar ref);
var glGetActiveUniform glGetActiveUniform_signature;

def glGetAttachedShaders_signature func(program GLuint; maxCount GLsizei; count GLsizei ref; shaders GLuint ref);
var glGetAttachedShaders glGetAttachedShaders_signature;

def glGetAttribLocation_signature func(program GLuint; name GLchar ref) (result GLint);
var glGetAttribLocation glGetAttribLocation_signature;

def glGetProgramiv_signature func(program GLuint; pname GLenum; params GLint ref);
var glGetProgramiv glGetProgramiv_signature;

def glGetProgramInfoLog_signature func(program GLuint; bufSize GLsizei; length GLsizei ref; infoLog GLchar ref);
var glGetProgramInfoLog glGetProgramInfoLog_signature;

def glGetShaderiv_signature func(shader GLuint; pname GLenum; params GLint ref);
var glGetShaderiv glGetShaderiv_signature;

def glGetShaderInfoLog_signature func(shader GLuint; bufSize GLsizei; length GLsizei ref; infoLog GLchar ref);
var glGetShaderInfoLog glGetShaderInfoLog_signature;

def glGetShaderSource_signature func(shader GLuint; bufSize GLsizei; length GLsizei ref; source GLchar ref);
var glGetShaderSource glGetShaderSource_signature;

def glGetUniformLocation_signature func(program GLuint; name GLchar ref) (result GLint);
var glGetUniformLocation glGetUniformLocation_signature;

def glGetUniformfv_signature func(program GLuint; location GLint; params GLfloat ref);
var glGetUniformfv glGetUniformfv_signature;

def glGetUniformiv_signature func(program GLuint; location GLint; params GLint ref);
var glGetUniformiv glGetUniformiv_signature;

def glGetVertexAttribdv_signature func(index GLuint; pname GLenum; params GLdouble ref);
var glGetVertexAttribdv glGetVertexAttribdv_signature;

def glGetVertexAttribfv_signature func(index GLuint; pname GLenum; params GLfloat ref);
var glGetVertexAttribfv glGetVertexAttribfv_signature;

def glGetVertexAttribiv_signature func(index GLuint; pname GLenum; params GLint ref);
var glGetVertexAttribiv glGetVertexAttribiv_signature;

def glGetVertexAttribPointerv_signature func(index GLuint; pname GLenum; pointer u8 ref ref);
var glGetVertexAttribPointerv glGetVertexAttribPointerv_signature;

def glIsProgram_signature func(program GLuint) (result GLboolean);
var glIsProgram glIsProgram_signature;

def glIsShader_signature func(shader GLuint) (result GLboolean);
var glIsShader glIsShader_signature;

def glLinkProgram_signature func(program GLuint);
var glLinkProgram glLinkProgram_signature;

def glShaderSource_signature func(shader GLuint; count GLsizei; string GLchar ref ref; length GLint ref);
var glShaderSource glShaderSource_signature;

def glUseProgram_signature func(program GLuint);
var glUseProgram glUseProgram_signature;

def glUniform1f_signature func(location GLint; v0 GLfloat);
var glUniform1f glUniform1f_signature;

def glUniform2f_signature func(location GLint; v0 GLfloat; v1 GLfloat);
var glUniform2f glUniform2f_signature;

def glUniform3f_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var glUniform3f glUniform3f_signature;

def glUniform4f_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var glUniform4f glUniform4f_signature;

def glUniform1i_signature func(location GLint; v0 GLint);
var glUniform1i glUniform1i_signature;

def glUniform2i_signature func(location GLint; v0 GLint; v1 GLint);
var glUniform2i glUniform2i_signature;

def glUniform3i_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint);
var glUniform3i glUniform3i_signature;

def glUniform4i_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var glUniform4i glUniform4i_signature;

def glUniform1fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform1fv glUniform1fv_signature;

def glUniform2fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform2fv glUniform2fv_signature;

def glUniform3fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform3fv glUniform3fv_signature;

def glUniform4fv_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform4fv glUniform4fv_signature;

def glUniform1iv_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform1iv glUniform1iv_signature;

def glUniform2iv_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform2iv glUniform2iv_signature;

def glUniform3iv_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform3iv glUniform3iv_signature;

def glUniform4iv_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform4iv glUniform4iv_signature;

def glUniformMatrix2fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix2fv glUniformMatrix2fv_signature;

def glUniformMatrix3fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix3fv glUniformMatrix3fv_signature;

def glUniformMatrix4fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix4fv glUniformMatrix4fv_signature;

def glValidateProgram_signature func(program GLuint);
var glValidateProgram glValidateProgram_signature;

def glVertexAttrib1d_signature func(index GLuint; x GLdouble);
var glVertexAttrib1d glVertexAttrib1d_signature;

def glVertexAttrib1dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib1dv glVertexAttrib1dv_signature;

def glVertexAttrib1f_signature func(index GLuint; x GLfloat);
var glVertexAttrib1f glVertexAttrib1f_signature;

def glVertexAttrib1fv_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib1fv glVertexAttrib1fv_signature;

def glVertexAttrib1s_signature func(index GLuint; x GLshort);
var glVertexAttrib1s glVertexAttrib1s_signature;

def glVertexAttrib1sv_signature func(index GLuint; v GLshort ref);
var glVertexAttrib1sv glVertexAttrib1sv_signature;

def glVertexAttrib2d_signature func(index GLuint; x GLdouble; y GLdouble);
var glVertexAttrib2d glVertexAttrib2d_signature;

def glVertexAttrib2dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib2dv glVertexAttrib2dv_signature;

def glVertexAttrib2f_signature func(index GLuint; x GLfloat; y GLfloat);
var glVertexAttrib2f glVertexAttrib2f_signature;

def glVertexAttrib2fv_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib2fv glVertexAttrib2fv_signature;

def glVertexAttrib2s_signature func(index GLuint; x GLshort; y GLshort);
var glVertexAttrib2s glVertexAttrib2s_signature;

def glVertexAttrib2sv_signature func(index GLuint; v GLshort ref);
var glVertexAttrib2sv glVertexAttrib2sv_signature;

def glVertexAttrib3d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var glVertexAttrib3d glVertexAttrib3d_signature;

def glVertexAttrib3dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib3dv glVertexAttrib3dv_signature;

def glVertexAttrib3f_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat);
var glVertexAttrib3f glVertexAttrib3f_signature;

def glVertexAttrib3fv_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib3fv glVertexAttrib3fv_signature;

def glVertexAttrib3s_signature func(index GLuint; x GLshort; y GLshort; z GLshort);
var glVertexAttrib3s glVertexAttrib3s_signature;

def glVertexAttrib3sv_signature func(index GLuint; v GLshort ref);
var glVertexAttrib3sv glVertexAttrib3sv_signature;

def glVertexAttrib4Nbv_signature func(index GLuint; v GLbyte ref);
var glVertexAttrib4Nbv glVertexAttrib4Nbv_signature;

def glVertexAttrib4Niv_signature func(index GLuint; v GLint ref);
var glVertexAttrib4Niv glVertexAttrib4Niv_signature;

def glVertexAttrib4Nsv_signature func(index GLuint; v GLshort ref);
var glVertexAttrib4Nsv glVertexAttrib4Nsv_signature;

def glVertexAttrib4Nub_signature func(index GLuint; x GLubyte; y GLubyte; z GLubyte; w GLubyte);
var glVertexAttrib4Nub glVertexAttrib4Nub_signature;

def glVertexAttrib4Nubv_signature func(index GLuint; v GLubyte ref);
var glVertexAttrib4Nubv glVertexAttrib4Nubv_signature;

def glVertexAttrib4Nuiv_signature func(index GLuint; v GLuint ref);
var glVertexAttrib4Nuiv glVertexAttrib4Nuiv_signature;

def glVertexAttrib4Nusv_signature func(index GLuint; v GLushort ref);
var glVertexAttrib4Nusv glVertexAttrib4Nusv_signature;

def glVertexAttrib4bv_signature func(index GLuint; v GLbyte ref);
var glVertexAttrib4bv glVertexAttrib4bv_signature;

def glVertexAttrib4d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glVertexAttrib4d glVertexAttrib4d_signature;

def glVertexAttrib4dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib4dv glVertexAttrib4dv_signature;

def glVertexAttrib4f_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glVertexAttrib4f glVertexAttrib4f_signature;

def glVertexAttrib4fv_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib4fv glVertexAttrib4fv_signature;

def glVertexAttrib4iv_signature func(index GLuint; v GLint ref);
var glVertexAttrib4iv glVertexAttrib4iv_signature;

def glVertexAttrib4s_signature func(index GLuint; x GLshort; y GLshort; z GLshort; w GLshort);
var glVertexAttrib4s glVertexAttrib4s_signature;

def glVertexAttrib4sv_signature func(index GLuint; v GLshort ref);
var glVertexAttrib4sv glVertexAttrib4sv_signature;

def glVertexAttrib4ubv_signature func(index GLuint; v GLubyte ref);
var glVertexAttrib4ubv glVertexAttrib4ubv_signature;

def glVertexAttrib4uiv_signature func(index GLuint; v GLuint ref);
var glVertexAttrib4uiv glVertexAttrib4uiv_signature;

def glVertexAttrib4usv_signature func(index GLuint; v GLushort ref);
var glVertexAttrib4usv glVertexAttrib4usv_signature;

def glVertexAttribPointer_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; pointer u8 ref);
var glVertexAttribPointer glVertexAttribPointer_signature;

def glUniformMatrix2x3fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix2x3fv glUniformMatrix2x3fv_signature;

def glUniformMatrix3x2fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix3x2fv glUniformMatrix3x2fv_signature;

def glUniformMatrix2x4fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix2x4fv glUniformMatrix2x4fv_signature;

def glUniformMatrix4x2fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix4x2fv glUniformMatrix4x2fv_signature;

def glUniformMatrix3x4fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix3x4fv glUniformMatrix3x4fv_signature;

def glUniformMatrix4x3fv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix4x3fv glUniformMatrix4x3fv_signature;
def GLhalf = type khronos_uint16_t;

def glColorMaski_signature func(index GLuint; r GLboolean; g GLboolean; b GLboolean; a GLboolean);
var glColorMaski glColorMaski_signature;

def glGetBooleani_v_signature func(target GLenum; index GLuint; data GLboolean ref);
var glGetBooleani_v glGetBooleani_v_signature;

def glGetIntegeri_v_signature func(target GLenum; index GLuint; data GLint ref);
var glGetIntegeri_v glGetIntegeri_v_signature;

def glEnablei_signature func(target GLenum; index GLuint);
var glEnablei glEnablei_signature;

def glDisablei_signature func(target GLenum; index GLuint);
var glDisablei glDisablei_signature;

def glIsEnabledi_signature func(target GLenum; index GLuint) (result GLboolean);
var glIsEnabledi glIsEnabledi_signature;

def glBeginTransformFeedback_signature func(primitiveMode GLenum);
var glBeginTransformFeedback glBeginTransformFeedback_signature;

def glEndTransformFeedback_signature func();
var glEndTransformFeedback glEndTransformFeedback_signature;

def glBindBufferRange_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glBindBufferRange glBindBufferRange_signature;

def glBindBufferBase_signature func(target GLenum; index GLuint; buffer GLuint);
var glBindBufferBase glBindBufferBase_signature;

def glTransformFeedbackVaryings_signature func(program GLuint; count GLsizei; varyings GLchar ref ref; bufferMode GLenum);
var glTransformFeedbackVaryings glTransformFeedbackVaryings_signature;

def glGetTransformFeedbackVarying_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLsizei ref; type GLenum ref; name GLchar ref);
var glGetTransformFeedbackVarying glGetTransformFeedbackVarying_signature;

def glClampColor_signature func(target GLenum; clamp GLenum);
var glClampColor glClampColor_signature;

def glBeginConditionalRender_signature func(id GLuint; mode GLenum);
var glBeginConditionalRender glBeginConditionalRender_signature;

def glEndConditionalRender_signature func();
var glEndConditionalRender glEndConditionalRender_signature;

def glVertexAttribIPointer_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glVertexAttribIPointer glVertexAttribIPointer_signature;

def glGetVertexAttribIiv_signature func(index GLuint; pname GLenum; params GLint ref);
var glGetVertexAttribIiv glGetVertexAttribIiv_signature;

def glGetVertexAttribIuiv_signature func(index GLuint; pname GLenum; params GLuint ref);
var glGetVertexAttribIuiv glGetVertexAttribIuiv_signature;

def glVertexAttribI1i_signature func(index GLuint; x GLint);
var glVertexAttribI1i glVertexAttribI1i_signature;

def glVertexAttribI2i_signature func(index GLuint; x GLint; y GLint);
var glVertexAttribI2i glVertexAttribI2i_signature;

def glVertexAttribI3i_signature func(index GLuint; x GLint; y GLint; z GLint);
var glVertexAttribI3i glVertexAttribI3i_signature;

def glVertexAttribI4i_signature func(index GLuint; x GLint; y GLint; z GLint; w GLint);
var glVertexAttribI4i glVertexAttribI4i_signature;

def glVertexAttribI1ui_signature func(index GLuint; x GLuint);
var glVertexAttribI1ui glVertexAttribI1ui_signature;

def glVertexAttribI2ui_signature func(index GLuint; x GLuint; y GLuint);
var glVertexAttribI2ui glVertexAttribI2ui_signature;

def glVertexAttribI3ui_signature func(index GLuint; x GLuint; y GLuint; z GLuint);
var glVertexAttribI3ui glVertexAttribI3ui_signature;

def glVertexAttribI4ui_signature func(index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var glVertexAttribI4ui glVertexAttribI4ui_signature;

def glVertexAttribI1iv_signature func(index GLuint; v GLint ref);
var glVertexAttribI1iv glVertexAttribI1iv_signature;

def glVertexAttribI2iv_signature func(index GLuint; v GLint ref);
var glVertexAttribI2iv glVertexAttribI2iv_signature;

def glVertexAttribI3iv_signature func(index GLuint; v GLint ref);
var glVertexAttribI3iv glVertexAttribI3iv_signature;

def glVertexAttribI4iv_signature func(index GLuint; v GLint ref);
var glVertexAttribI4iv glVertexAttribI4iv_signature;

def glVertexAttribI1uiv_signature func(index GLuint; v GLuint ref);
var glVertexAttribI1uiv glVertexAttribI1uiv_signature;

def glVertexAttribI2uiv_signature func(index GLuint; v GLuint ref);
var glVertexAttribI2uiv glVertexAttribI2uiv_signature;

def glVertexAttribI3uiv_signature func(index GLuint; v GLuint ref);
var glVertexAttribI3uiv glVertexAttribI3uiv_signature;

def glVertexAttribI4uiv_signature func(index GLuint; v GLuint ref);
var glVertexAttribI4uiv glVertexAttribI4uiv_signature;

def glVertexAttribI4bv_signature func(index GLuint; v GLbyte ref);
var glVertexAttribI4bv glVertexAttribI4bv_signature;

def glVertexAttribI4sv_signature func(index GLuint; v GLshort ref);
var glVertexAttribI4sv glVertexAttribI4sv_signature;

def glVertexAttribI4ubv_signature func(index GLuint; v GLubyte ref);
var glVertexAttribI4ubv glVertexAttribI4ubv_signature;

def glVertexAttribI4usv_signature func(index GLuint; v GLushort ref);
var glVertexAttribI4usv glVertexAttribI4usv_signature;

def glGetUniformuiv_signature func(program GLuint; location GLint; params GLuint ref);
var glGetUniformuiv glGetUniformuiv_signature;

def glBindFragDataLocation_signature func(program GLuint; color GLuint; name GLchar ref);
var glBindFragDataLocation glBindFragDataLocation_signature;

def glGetFragDataLocation_signature func(program GLuint; name GLchar ref) (result GLint);
var glGetFragDataLocation glGetFragDataLocation_signature;

def glUniform1ui_signature func(location GLint; v0 GLuint);
var glUniform1ui glUniform1ui_signature;

def glUniform2ui_signature func(location GLint; v0 GLuint; v1 GLuint);
var glUniform2ui glUniform2ui_signature;

def glUniform3ui_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var glUniform3ui glUniform3ui_signature;

def glUniform4ui_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var glUniform4ui glUniform4ui_signature;

def glUniform1uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform1uiv glUniform1uiv_signature;

def glUniform2uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform2uiv glUniform2uiv_signature;

def glUniform3uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform3uiv glUniform3uiv_signature;

def glUniform4uiv_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform4uiv glUniform4uiv_signature;

def glTexParameterIiv_signature func(target GLenum; pname GLenum; params GLint ref);
var glTexParameterIiv glTexParameterIiv_signature;

def glTexParameterIuiv_signature func(target GLenum; pname GLenum; params GLuint ref);
var glTexParameterIuiv glTexParameterIuiv_signature;

def glGetTexParameterIiv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetTexParameterIiv glGetTexParameterIiv_signature;

def glGetTexParameterIuiv_signature func(target GLenum; pname GLenum; params GLuint ref);
var glGetTexParameterIuiv glGetTexParameterIuiv_signature;

def glClearBufferiv_signature func(buffer GLenum; drawbuffer GLint; value GLint ref);
var glClearBufferiv glClearBufferiv_signature;

def glClearBufferuiv_signature func(buffer GLenum; drawbuffer GLint; value GLuint ref);
var glClearBufferuiv glClearBufferuiv_signature;

def glClearBufferfv_signature func(buffer GLenum; drawbuffer GLint; value GLfloat ref);
var glClearBufferfv glClearBufferfv_signature;

def glClearBufferfi_signature func(buffer GLenum; drawbuffer GLint; depth GLfloat; stencil GLint);
var glClearBufferfi glClearBufferfi_signature;

def glGetStringi_signature func(name GLenum; index GLuint) (result GLubyte ref);
var glGetStringi glGetStringi_signature;

def glIsRenderbuffer_signature func(renderbuffer GLuint) (result GLboolean);
var glIsRenderbuffer glIsRenderbuffer_signature;

def glBindRenderbuffer_signature func(target GLenum; renderbuffer GLuint);
var glBindRenderbuffer glBindRenderbuffer_signature;

def glDeleteRenderbuffers_signature func(n GLsizei; renderbuffers GLuint ref);
var glDeleteRenderbuffers glDeleteRenderbuffers_signature;

def glGenRenderbuffers_signature func(n GLsizei; renderbuffers GLuint ref);
var glGenRenderbuffers glGenRenderbuffers_signature;

def glRenderbufferStorage_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei);
var glRenderbufferStorage glRenderbufferStorage_signature;

def glGetRenderbufferParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetRenderbufferParameteriv glGetRenderbufferParameteriv_signature;

def glIsFramebuffer_signature func(framebuffer GLuint) (result GLboolean);
var glIsFramebuffer glIsFramebuffer_signature;

def glBindFramebuffer_signature func(target GLenum; framebuffer GLuint);
var glBindFramebuffer glBindFramebuffer_signature;

def glDeleteFramebuffers_signature func(n GLsizei; framebuffers GLuint ref);
var glDeleteFramebuffers glDeleteFramebuffers_signature;

def glGenFramebuffers_signature func(n GLsizei; framebuffers GLuint ref);
var glGenFramebuffers glGenFramebuffers_signature;

def glCheckFramebufferStatus_signature func(target GLenum) (result GLenum);
var glCheckFramebufferStatus glCheckFramebufferStatus_signature;

def glFramebufferTexture1D_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var glFramebufferTexture1D glFramebufferTexture1D_signature;

def glFramebufferTexture2D_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var glFramebufferTexture2D glFramebufferTexture2D_signature;

def glFramebufferTexture3D_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint; zoffset GLint);
var glFramebufferTexture3D glFramebufferTexture3D_signature;

def glFramebufferRenderbuffer_signature func(target GLenum; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var glFramebufferRenderbuffer glFramebufferRenderbuffer_signature;

def glGetFramebufferAttachmentParameteriv_signature func(target GLenum; attachment GLenum; pname GLenum; params GLint ref);
var glGetFramebufferAttachmentParameteriv glGetFramebufferAttachmentParameteriv_signature;

def glGenerateMipmap_signature func(target GLenum);
var glGenerateMipmap glGenerateMipmap_signature;

def glBlitFramebuffer_signature func(srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var glBlitFramebuffer glBlitFramebuffer_signature;

def glRenderbufferStorageMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glRenderbufferStorageMultisample glRenderbufferStorageMultisample_signature;

def glFramebufferTextureLayer_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; layer GLint);
var glFramebufferTextureLayer glFramebufferTextureLayer_signature;

def glMapBufferRange_signature func(target GLenum; offset GLintptr; length GLsizeiptr; access GLbitfield) (result u8 ref);
var glMapBufferRange glMapBufferRange_signature;

def glFlushMappedBufferRange_signature func(target GLenum; offset GLintptr; length GLsizeiptr);
var glFlushMappedBufferRange glFlushMappedBufferRange_signature;

def glBindVertexArray_signature func(array GLuint);
var glBindVertexArray glBindVertexArray_signature;

def glDeleteVertexArrays_signature func(n GLsizei; arrays GLuint ref);
var glDeleteVertexArrays glDeleteVertexArrays_signature;

def glGenVertexArrays_signature func(n GLsizei; arrays GLuint ref);
var glGenVertexArrays glGenVertexArrays_signature;

def glIsVertexArray_signature func(array GLuint) (result GLboolean);
var glIsVertexArray glIsVertexArray_signature;

def glDrawArraysInstanced_signature func(mode GLenum; first GLint; count GLsizei; instancecount GLsizei);
var glDrawArraysInstanced glDrawArraysInstanced_signature;

def glDrawElementsInstanced_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei);
var glDrawElementsInstanced glDrawElementsInstanced_signature;

def glTexBuffer_signature func(target GLenum; internalformat GLenum; buffer GLuint);
var glTexBuffer glTexBuffer_signature;

def glPrimitiveRestartIndex_signature func(index GLuint);
var glPrimitiveRestartIndex glPrimitiveRestartIndex_signature;

def glCopyBufferSubData_signature func(readTarget GLenum; writeTarget GLenum; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var glCopyBufferSubData glCopyBufferSubData_signature;

def glGetUniformIndices_signature func(program GLuint; uniformCount GLsizei; uniformNames GLchar ref ref; uniformIndices GLuint ref);
var glGetUniformIndices glGetUniformIndices_signature;

def glGetActiveUniformsiv_signature func(program GLuint; uniformCount GLsizei; uniformIndices GLuint ref; pname GLenum; params GLint ref);
var glGetActiveUniformsiv glGetActiveUniformsiv_signature;

def glGetActiveUniformName_signature func(program GLuint; uniformIndex GLuint; bufSize GLsizei; length GLsizei ref; uniformName GLchar ref);
var glGetActiveUniformName glGetActiveUniformName_signature;

def glGetUniformBlockIndex_signature func(program GLuint; uniformBlockName GLchar ref) (result GLuint);
var glGetUniformBlockIndex glGetUniformBlockIndex_signature;

def glGetActiveUniformBlockiv_signature func(program GLuint; uniformBlockIndex GLuint; pname GLenum; params GLint ref);
var glGetActiveUniformBlockiv glGetActiveUniformBlockiv_signature;

def glGetActiveUniformBlockName_signature func(program GLuint; uniformBlockIndex GLuint; bufSize GLsizei; length GLsizei ref; uniformBlockName GLchar ref);
var glGetActiveUniformBlockName glGetActiveUniformBlockName_signature;

def glUniformBlockBinding_signature func(program GLuint; uniformBlockIndex GLuint; uniformBlockBinding GLuint);
var glUniformBlockBinding glUniformBlockBinding_signature;
def GLsync = type __GLsync ref;
def GLuint64 = type khronos_uint64_t;
def GLint64 = type khronos_int64_t;

def glDrawElementsBaseVertex_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; basevertex GLint);
var glDrawElementsBaseVertex glDrawElementsBaseVertex_signature;

def glDrawRangeElementsBaseVertex_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei; type GLenum; indices u8 ref; basevertex GLint);
var glDrawRangeElementsBaseVertex glDrawRangeElementsBaseVertex_signature;

def glDrawElementsInstancedBaseVertex_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei; basevertex GLint);
var glDrawElementsInstancedBaseVertex glDrawElementsInstancedBaseVertex_signature;

def glMultiDrawElementsBaseVertex_signature func(mode GLenum; count GLsizei ref; type GLenum; indices u8 ref ref; drawcount GLsizei; basevertex GLint ref);
var glMultiDrawElementsBaseVertex glMultiDrawElementsBaseVertex_signature;

def glProvokingVertex_signature func(mode GLenum);
var glProvokingVertex glProvokingVertex_signature;

def glFenceSync_signature func(condition GLenum; flags GLbitfield) (result GLsync);
var glFenceSync glFenceSync_signature;

def glIsSync_signature func(sync GLsync) (result GLboolean);
var glIsSync glIsSync_signature;

def glDeleteSync_signature func(sync GLsync);
var glDeleteSync glDeleteSync_signature;

def glClientWaitSync_signature func(sync GLsync; flags GLbitfield; timeout GLuint64) (result GLenum);
var glClientWaitSync glClientWaitSync_signature;

def glWaitSync_signature func(sync GLsync; flags GLbitfield; timeout GLuint64);
var glWaitSync glWaitSync_signature;

def glGetInteger64v_signature func(pname GLenum; data GLint64 ref);
var glGetInteger64v glGetInteger64v_signature;

def glGetSynciv_signature func(sync GLsync; pname GLenum; count GLsizei; length GLsizei ref; values GLint ref);
var glGetSynciv glGetSynciv_signature;

def glGetInteger64i_v_signature func(target GLenum; index GLuint; data GLint64 ref);
var glGetInteger64i_v glGetInteger64i_v_signature;

def glGetBufferParameteri64v_signature func(target GLenum; pname GLenum; params GLint64 ref);
var glGetBufferParameteri64v glGetBufferParameteri64v_signature;

def glFramebufferTexture_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint);
var glFramebufferTexture glFramebufferTexture_signature;

def glTexImage2DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var glTexImage2DMultisample glTexImage2DMultisample_signature;

def glTexImage3DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var glTexImage3DMultisample glTexImage3DMultisample_signature;

def glGetMultisamplefv_signature func(pname GLenum; index GLuint; val GLfloat ref);
var glGetMultisamplefv glGetMultisamplefv_signature;

def glSampleMaski_signature func(maskNumber GLuint; mask GLbitfield);
var glSampleMaski glSampleMaski_signature;

def glBindFragDataLocationIndexed_signature func(program GLuint; colorNumber GLuint; index GLuint; name GLchar ref);
var glBindFragDataLocationIndexed glBindFragDataLocationIndexed_signature;

def glGetFragDataIndex_signature func(program GLuint; name GLchar ref) (result GLint);
var glGetFragDataIndex glGetFragDataIndex_signature;

def glGenSamplers_signature func(count GLsizei; samplers GLuint ref);
var glGenSamplers glGenSamplers_signature;

def glDeleteSamplers_signature func(count GLsizei; samplers GLuint ref);
var glDeleteSamplers glDeleteSamplers_signature;

def glIsSampler_signature func(sampler GLuint) (result GLboolean);
var glIsSampler glIsSampler_signature;

def glBindSampler_signature func(unit GLuint; sampler GLuint);
var glBindSampler glBindSampler_signature;

def glSamplerParameteri_signature func(sampler GLuint; pname GLenum; param GLint);
var glSamplerParameteri glSamplerParameteri_signature;

def glSamplerParameteriv_signature func(sampler GLuint; pname GLenum; param GLint ref);
var glSamplerParameteriv glSamplerParameteriv_signature;

def glSamplerParameterf_signature func(sampler GLuint; pname GLenum; param GLfloat);
var glSamplerParameterf glSamplerParameterf_signature;

def glSamplerParameterfv_signature func(sampler GLuint; pname GLenum; param GLfloat ref);
var glSamplerParameterfv glSamplerParameterfv_signature;

def glSamplerParameterIiv_signature func(sampler GLuint; pname GLenum; param GLint ref);
var glSamplerParameterIiv glSamplerParameterIiv_signature;

def glSamplerParameterIuiv_signature func(sampler GLuint; pname GLenum; param GLuint ref);
var glSamplerParameterIuiv glSamplerParameterIuiv_signature;

def glGetSamplerParameteriv_signature func(sampler GLuint; pname GLenum; params GLint ref);
var glGetSamplerParameteriv glGetSamplerParameteriv_signature;

def glGetSamplerParameterIiv_signature func(sampler GLuint; pname GLenum; params GLint ref);
var glGetSamplerParameterIiv glGetSamplerParameterIiv_signature;

def glGetSamplerParameterfv_signature func(sampler GLuint; pname GLenum; params GLfloat ref);
var glGetSamplerParameterfv glGetSamplerParameterfv_signature;

def glGetSamplerParameterIuiv_signature func(sampler GLuint; pname GLenum; params GLuint ref);
var glGetSamplerParameterIuiv glGetSamplerParameterIuiv_signature;

def glQueryCounter_signature func(id GLuint; target GLenum);
var glQueryCounter glQueryCounter_signature;

def glGetQueryObjecti64v_signature func(id GLuint; pname GLenum; params GLint64 ref);
var glGetQueryObjecti64v glGetQueryObjecti64v_signature;

def glGetQueryObjectui64v_signature func(id GLuint; pname GLenum; params GLuint64 ref);
var glGetQueryObjectui64v glGetQueryObjectui64v_signature;

def glVertexAttribDivisor_signature func(index GLuint; divisor GLuint);
var glVertexAttribDivisor glVertexAttribDivisor_signature;

def glVertexAttribP1ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var glVertexAttribP1ui glVertexAttribP1ui_signature;

def glVertexAttribP1uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var glVertexAttribP1uiv glVertexAttribP1uiv_signature;

def glVertexAttribP2ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var glVertexAttribP2ui glVertexAttribP2ui_signature;

def glVertexAttribP2uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var glVertexAttribP2uiv glVertexAttribP2uiv_signature;

def glVertexAttribP3ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var glVertexAttribP3ui glVertexAttribP3ui_signature;

def glVertexAttribP3uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var glVertexAttribP3uiv glVertexAttribP3uiv_signature;

def glVertexAttribP4ui_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint);
var glVertexAttribP4ui glVertexAttribP4ui_signature;

def glVertexAttribP4uiv_signature func(index GLuint; type GLenum; normalized GLboolean; value GLuint ref);
var glVertexAttribP4uiv glVertexAttribP4uiv_signature;

def glVertexP2ui_signature func(type GLenum; value GLuint);
var glVertexP2ui glVertexP2ui_signature;

def glVertexP2uiv_signature func(type GLenum; value GLuint ref);
var glVertexP2uiv glVertexP2uiv_signature;

def glVertexP3ui_signature func(type GLenum; value GLuint);
var glVertexP3ui glVertexP3ui_signature;

def glVertexP3uiv_signature func(type GLenum; value GLuint ref);
var glVertexP3uiv glVertexP3uiv_signature;

def glVertexP4ui_signature func(type GLenum; value GLuint);
var glVertexP4ui glVertexP4ui_signature;

def glVertexP4uiv_signature func(type GLenum; value GLuint ref);
var glVertexP4uiv glVertexP4uiv_signature;

def glTexCoordP1ui_signature func(type GLenum; coords GLuint);
var glTexCoordP1ui glTexCoordP1ui_signature;

def glTexCoordP1uiv_signature func(type GLenum; coords GLuint ref);
var glTexCoordP1uiv glTexCoordP1uiv_signature;

def glTexCoordP2ui_signature func(type GLenum; coords GLuint);
var glTexCoordP2ui glTexCoordP2ui_signature;

def glTexCoordP2uiv_signature func(type GLenum; coords GLuint ref);
var glTexCoordP2uiv glTexCoordP2uiv_signature;

def glTexCoordP3ui_signature func(type GLenum; coords GLuint);
var glTexCoordP3ui glTexCoordP3ui_signature;

def glTexCoordP3uiv_signature func(type GLenum; coords GLuint ref);
var glTexCoordP3uiv glTexCoordP3uiv_signature;

def glTexCoordP4ui_signature func(type GLenum; coords GLuint);
var glTexCoordP4ui glTexCoordP4ui_signature;

def glTexCoordP4uiv_signature func(type GLenum; coords GLuint ref);
var glTexCoordP4uiv glTexCoordP4uiv_signature;

def glMultiTexCoordP1ui_signature func(texture GLenum; type GLenum; coords GLuint);
var glMultiTexCoordP1ui glMultiTexCoordP1ui_signature;

def glMultiTexCoordP1uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var glMultiTexCoordP1uiv glMultiTexCoordP1uiv_signature;

def glMultiTexCoordP2ui_signature func(texture GLenum; type GLenum; coords GLuint);
var glMultiTexCoordP2ui glMultiTexCoordP2ui_signature;

def glMultiTexCoordP2uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var glMultiTexCoordP2uiv glMultiTexCoordP2uiv_signature;

def glMultiTexCoordP3ui_signature func(texture GLenum; type GLenum; coords GLuint);
var glMultiTexCoordP3ui glMultiTexCoordP3ui_signature;

def glMultiTexCoordP3uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var glMultiTexCoordP3uiv glMultiTexCoordP3uiv_signature;

def glMultiTexCoordP4ui_signature func(texture GLenum; type GLenum; coords GLuint);
var glMultiTexCoordP4ui glMultiTexCoordP4ui_signature;

def glMultiTexCoordP4uiv_signature func(texture GLenum; type GLenum; coords GLuint ref);
var glMultiTexCoordP4uiv glMultiTexCoordP4uiv_signature;

def glNormalP3ui_signature func(type GLenum; coords GLuint);
var glNormalP3ui glNormalP3ui_signature;

def glNormalP3uiv_signature func(type GLenum; coords GLuint ref);
var glNormalP3uiv glNormalP3uiv_signature;

def glColorP3ui_signature func(type GLenum; color GLuint);
var glColorP3ui glColorP3ui_signature;

def glColorP3uiv_signature func(type GLenum; color GLuint ref);
var glColorP3uiv glColorP3uiv_signature;

def glColorP4ui_signature func(type GLenum; color GLuint);
var glColorP4ui glColorP4ui_signature;

def glColorP4uiv_signature func(type GLenum; color GLuint ref);
var glColorP4uiv glColorP4uiv_signature;

def glSecondaryColorP3ui_signature func(type GLenum; color GLuint);
var glSecondaryColorP3ui glSecondaryColorP3ui_signature;

def glSecondaryColorP3uiv_signature func(type GLenum; color GLuint ref);
var glSecondaryColorP3uiv glSecondaryColorP3uiv_signature;

def glMinSampleShading_signature func(value GLfloat);
var glMinSampleShading glMinSampleShading_signature;

def glBlendEquationi_signature func(buf GLuint; mode GLenum);
var glBlendEquationi glBlendEquationi_signature;

def glBlendEquationSeparatei_signature func(buf GLuint; modeRGB GLenum; modeAlpha GLenum);
var glBlendEquationSeparatei glBlendEquationSeparatei_signature;

def glBlendFunci_signature func(buf GLuint; src GLenum; dst GLenum);
var glBlendFunci glBlendFunci_signature;

def glBlendFuncSeparatei_signature func(buf GLuint; srcRGB GLenum; dstRGB GLenum; srcAlpha GLenum; dstAlpha GLenum);
var glBlendFuncSeparatei glBlendFuncSeparatei_signature;

def glDrawArraysIndirect_signature func(mode GLenum; indirect u8 ref);
var glDrawArraysIndirect glDrawArraysIndirect_signature;

def glDrawElementsIndirect_signature func(mode GLenum; type GLenum; indirect u8 ref);
var glDrawElementsIndirect glDrawElementsIndirect_signature;

def glUniform1d_signature func(location GLint; x GLdouble);
var glUniform1d glUniform1d_signature;

def glUniform2d_signature func(location GLint; x GLdouble; y GLdouble);
var glUniform2d glUniform2d_signature;

def glUniform3d_signature func(location GLint; x GLdouble; y GLdouble; z GLdouble);
var glUniform3d glUniform3d_signature;

def glUniform4d_signature func(location GLint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glUniform4d glUniform4d_signature;

def glUniform1dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var glUniform1dv glUniform1dv_signature;

def glUniform2dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var glUniform2dv glUniform2dv_signature;

def glUniform3dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var glUniform3dv glUniform3dv_signature;

def glUniform4dv_signature func(location GLint; count GLsizei; value GLdouble ref);
var glUniform4dv glUniform4dv_signature;

def glUniformMatrix2dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix2dv glUniformMatrix2dv_signature;

def glUniformMatrix3dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix3dv glUniformMatrix3dv_signature;

def glUniformMatrix4dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix4dv glUniformMatrix4dv_signature;

def glUniformMatrix2x3dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix2x3dv glUniformMatrix2x3dv_signature;

def glUniformMatrix2x4dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix2x4dv glUniformMatrix2x4dv_signature;

def glUniformMatrix3x2dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix3x2dv glUniformMatrix3x2dv_signature;

def glUniformMatrix3x4dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix3x4dv glUniformMatrix3x4dv_signature;

def glUniformMatrix4x2dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix4x2dv glUniformMatrix4x2dv_signature;

def glUniformMatrix4x3dv_signature func(location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glUniformMatrix4x3dv glUniformMatrix4x3dv_signature;

def glGetUniformdv_signature func(program GLuint; location GLint; params GLdouble ref);
var glGetUniformdv glGetUniformdv_signature;

def glGetSubroutineUniformLocation_signature func(program GLuint; shadertype GLenum; name GLchar ref) (result GLint);
var glGetSubroutineUniformLocation glGetSubroutineUniformLocation_signature;

def glGetSubroutineIndex_signature func(program GLuint; shadertype GLenum; name GLchar ref) (result GLuint);
var glGetSubroutineIndex glGetSubroutineIndex_signature;

def glGetActiveSubroutineUniformiv_signature func(program GLuint; shadertype GLenum; index GLuint; pname GLenum; values GLint ref);
var glGetActiveSubroutineUniformiv glGetActiveSubroutineUniformiv_signature;

def glGetActiveSubroutineUniformName_signature func(program GLuint; shadertype GLenum; index GLuint; bufSize GLsizei; length GLsizei ref; name GLchar ref);
var glGetActiveSubroutineUniformName glGetActiveSubroutineUniformName_signature;

def glGetActiveSubroutineName_signature func(program GLuint; shadertype GLenum; index GLuint; bufSize GLsizei; length GLsizei ref; name GLchar ref);
var glGetActiveSubroutineName glGetActiveSubroutineName_signature;

def glUniformSubroutinesuiv_signature func(shadertype GLenum; count GLsizei; indices GLuint ref);
var glUniformSubroutinesuiv glUniformSubroutinesuiv_signature;

def glGetUniformSubroutineuiv_signature func(shadertype GLenum; location GLint; params GLuint ref);
var glGetUniformSubroutineuiv glGetUniformSubroutineuiv_signature;

def glGetProgramStageiv_signature func(program GLuint; shadertype GLenum; pname GLenum; values GLint ref);
var glGetProgramStageiv glGetProgramStageiv_signature;

def glPatchParameteri_signature func(pname GLenum; value GLint);
var glPatchParameteri glPatchParameteri_signature;

def glPatchParameterfv_signature func(pname GLenum; values GLfloat ref);
var glPatchParameterfv glPatchParameterfv_signature;

def glBindTransformFeedback_signature func(target GLenum; id GLuint);
var glBindTransformFeedback glBindTransformFeedback_signature;

def glDeleteTransformFeedbacks_signature func(n GLsizei; ids GLuint ref);
var glDeleteTransformFeedbacks glDeleteTransformFeedbacks_signature;

def glGenTransformFeedbacks_signature func(n GLsizei; ids GLuint ref);
var glGenTransformFeedbacks glGenTransformFeedbacks_signature;

def glIsTransformFeedback_signature func(id GLuint) (result GLboolean);
var glIsTransformFeedback glIsTransformFeedback_signature;

def glPauseTransformFeedback_signature func();
var glPauseTransformFeedback glPauseTransformFeedback_signature;

def glResumeTransformFeedback_signature func();
var glResumeTransformFeedback glResumeTransformFeedback_signature;

def glDrawTransformFeedback_signature func(mode GLenum; id GLuint);
var glDrawTransformFeedback glDrawTransformFeedback_signature;

def glDrawTransformFeedbackStream_signature func(mode GLenum; id GLuint; stream GLuint);
var glDrawTransformFeedbackStream glDrawTransformFeedbackStream_signature;

def glBeginQueryIndexed_signature func(target GLenum; index GLuint; id GLuint);
var glBeginQueryIndexed glBeginQueryIndexed_signature;

def glEndQueryIndexed_signature func(target GLenum; index GLuint);
var glEndQueryIndexed glEndQueryIndexed_signature;

def glGetQueryIndexediv_signature func(target GLenum; index GLuint; pname GLenum; params GLint ref);
var glGetQueryIndexediv glGetQueryIndexediv_signature;

def glReleaseShaderCompiler_signature func();
var glReleaseShaderCompiler glReleaseShaderCompiler_signature;

def glShaderBinary_signature func(count GLsizei; shaders GLuint ref; binaryFormat GLenum; binary u8 ref; length GLsizei);
var glShaderBinary glShaderBinary_signature;

def glGetShaderPrecisionFormat_signature func(shadertype GLenum; precisiontype GLenum; range GLint ref; precision GLint ref);
var glGetShaderPrecisionFormat glGetShaderPrecisionFormat_signature;

def glDepthRangef_signature func(n GLfloat; f GLfloat);
var glDepthRangef glDepthRangef_signature;

def glClearDepthf_signature func(d GLfloat);
var glClearDepthf glClearDepthf_signature;

def glGetProgramBinary_signature func(program GLuint; bufSize GLsizei; length GLsizei ref; binaryFormat GLenum ref; binary u8 ref);
var glGetProgramBinary glGetProgramBinary_signature;

def glProgramBinary_signature func(program GLuint; binaryFormat GLenum; binary u8 ref; length GLsizei);
var glProgramBinary glProgramBinary_signature;

def glProgramParameteri_signature func(program GLuint; pname GLenum; value GLint);
var glProgramParameteri glProgramParameteri_signature;

def glUseProgramStages_signature func(pipeline GLuint; stages GLbitfield; program GLuint);
var glUseProgramStages glUseProgramStages_signature;

def glActiveShaderProgram_signature func(pipeline GLuint; program GLuint);
var glActiveShaderProgram glActiveShaderProgram_signature;

def glCreateShaderProgramv_signature func(type GLenum; count GLsizei; strings GLchar ref ref) (result GLuint);
var glCreateShaderProgramv glCreateShaderProgramv_signature;

def glBindProgramPipeline_signature func(pipeline GLuint);
var glBindProgramPipeline glBindProgramPipeline_signature;

def glDeleteProgramPipelines_signature func(n GLsizei; pipelines GLuint ref);
var glDeleteProgramPipelines glDeleteProgramPipelines_signature;

def glGenProgramPipelines_signature func(n GLsizei; pipelines GLuint ref);
var glGenProgramPipelines glGenProgramPipelines_signature;

def glIsProgramPipeline_signature func(pipeline GLuint) (result GLboolean);
var glIsProgramPipeline glIsProgramPipeline_signature;

def glGetProgramPipelineiv_signature func(pipeline GLuint; pname GLenum; params GLint ref);
var glGetProgramPipelineiv glGetProgramPipelineiv_signature;

def glProgramUniform1i_signature func(program GLuint; location GLint; v0 GLint);
var glProgramUniform1i glProgramUniform1i_signature;

def glProgramUniform1iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform1iv glProgramUniform1iv_signature;

def glProgramUniform1f_signature func(program GLuint; location GLint; v0 GLfloat);
var glProgramUniform1f glProgramUniform1f_signature;

def glProgramUniform1fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform1fv glProgramUniform1fv_signature;

def glProgramUniform1d_signature func(program GLuint; location GLint; v0 GLdouble);
var glProgramUniform1d glProgramUniform1d_signature;

def glProgramUniform1dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform1dv glProgramUniform1dv_signature;

def glProgramUniform1ui_signature func(program GLuint; location GLint; v0 GLuint);
var glProgramUniform1ui glProgramUniform1ui_signature;

def glProgramUniform1uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform1uiv glProgramUniform1uiv_signature;

def glProgramUniform2i_signature func(program GLuint; location GLint; v0 GLint; v1 GLint);
var glProgramUniform2i glProgramUniform2i_signature;

def glProgramUniform2iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform2iv glProgramUniform2iv_signature;

def glProgramUniform2f_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat);
var glProgramUniform2f glProgramUniform2f_signature;

def glProgramUniform2fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform2fv glProgramUniform2fv_signature;

def glProgramUniform2d_signature func(program GLuint; location GLint; v0 GLdouble; v1 GLdouble);
var glProgramUniform2d glProgramUniform2d_signature;

def glProgramUniform2dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform2dv glProgramUniform2dv_signature;

def glProgramUniform2ui_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint);
var glProgramUniform2ui glProgramUniform2ui_signature;

def glProgramUniform2uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform2uiv glProgramUniform2uiv_signature;

def glProgramUniform3i_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint);
var glProgramUniform3i glProgramUniform3i_signature;

def glProgramUniform3iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform3iv glProgramUniform3iv_signature;

def glProgramUniform3f_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var glProgramUniform3f glProgramUniform3f_signature;

def glProgramUniform3fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform3fv glProgramUniform3fv_signature;

def glProgramUniform3d_signature func(program GLuint; location GLint; v0 GLdouble; v1 GLdouble; v2 GLdouble);
var glProgramUniform3d glProgramUniform3d_signature;

def glProgramUniform3dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform3dv glProgramUniform3dv_signature;

def glProgramUniform3ui_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var glProgramUniform3ui glProgramUniform3ui_signature;

def glProgramUniform3uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform3uiv glProgramUniform3uiv_signature;

def glProgramUniform4i_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var glProgramUniform4i glProgramUniform4i_signature;

def glProgramUniform4iv_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform4iv glProgramUniform4iv_signature;

def glProgramUniform4f_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var glProgramUniform4f glProgramUniform4f_signature;

def glProgramUniform4fv_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform4fv glProgramUniform4fv_signature;

def glProgramUniform4d_signature func(program GLuint; location GLint; v0 GLdouble; v1 GLdouble; v2 GLdouble; v3 GLdouble);
var glProgramUniform4d glProgramUniform4d_signature;

def glProgramUniform4dv_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform4dv glProgramUniform4dv_signature;

def glProgramUniform4ui_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var glProgramUniform4ui glProgramUniform4ui_signature;

def glProgramUniform4uiv_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform4uiv glProgramUniform4uiv_signature;

def glProgramUniformMatrix2fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix2fv glProgramUniformMatrix2fv_signature;

def glProgramUniformMatrix3fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix3fv glProgramUniformMatrix3fv_signature;

def glProgramUniformMatrix4fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix4fv glProgramUniformMatrix4fv_signature;

def glProgramUniformMatrix2dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix2dv glProgramUniformMatrix2dv_signature;

def glProgramUniformMatrix3dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix3dv glProgramUniformMatrix3dv_signature;

def glProgramUniformMatrix4dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix4dv glProgramUniformMatrix4dv_signature;

def glProgramUniformMatrix2x3fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix2x3fv glProgramUniformMatrix2x3fv_signature;

def glProgramUniformMatrix3x2fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix3x2fv glProgramUniformMatrix3x2fv_signature;

def glProgramUniformMatrix2x4fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix2x4fv glProgramUniformMatrix2x4fv_signature;

def glProgramUniformMatrix4x2fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix4x2fv glProgramUniformMatrix4x2fv_signature;

def glProgramUniformMatrix3x4fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix3x4fv glProgramUniformMatrix3x4fv_signature;

def glProgramUniformMatrix4x3fv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix4x3fv glProgramUniformMatrix4x3fv_signature;

def glProgramUniformMatrix2x3dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix2x3dv glProgramUniformMatrix2x3dv_signature;

def glProgramUniformMatrix3x2dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix3x2dv glProgramUniformMatrix3x2dv_signature;

def glProgramUniformMatrix2x4dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix2x4dv glProgramUniformMatrix2x4dv_signature;

def glProgramUniformMatrix4x2dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix4x2dv glProgramUniformMatrix4x2dv_signature;

def glProgramUniformMatrix3x4dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix3x4dv glProgramUniformMatrix3x4dv_signature;

def glProgramUniformMatrix4x3dv_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix4x3dv glProgramUniformMatrix4x3dv_signature;

def glValidateProgramPipeline_signature func(pipeline GLuint);
var glValidateProgramPipeline glValidateProgramPipeline_signature;

def glGetProgramPipelineInfoLog_signature func(pipeline GLuint; bufSize GLsizei; length GLsizei ref; infoLog GLchar ref);
var glGetProgramPipelineInfoLog glGetProgramPipelineInfoLog_signature;

def glVertexAttribL1d_signature func(index GLuint; x GLdouble);
var glVertexAttribL1d glVertexAttribL1d_signature;

def glVertexAttribL2d_signature func(index GLuint; x GLdouble; y GLdouble);
var glVertexAttribL2d glVertexAttribL2d_signature;

def glVertexAttribL3d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var glVertexAttribL3d glVertexAttribL3d_signature;

def glVertexAttribL4d_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glVertexAttribL4d glVertexAttribL4d_signature;

def glVertexAttribL1dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL1dv glVertexAttribL1dv_signature;

def glVertexAttribL2dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL2dv glVertexAttribL2dv_signature;

def glVertexAttribL3dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL3dv glVertexAttribL3dv_signature;

def glVertexAttribL4dv_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL4dv glVertexAttribL4dv_signature;

def glVertexAttribLPointer_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glVertexAttribLPointer glVertexAttribLPointer_signature;

def glGetVertexAttribLdv_signature func(index GLuint; pname GLenum; params GLdouble ref);
var glGetVertexAttribLdv glGetVertexAttribLdv_signature;

def glViewportArrayv_signature func(first GLuint; count GLsizei; v GLfloat ref);
var glViewportArrayv glViewportArrayv_signature;

def glViewportIndexedf_signature func(index GLuint; x GLfloat; y GLfloat; w GLfloat; h GLfloat);
var glViewportIndexedf glViewportIndexedf_signature;

def glViewportIndexedfv_signature func(index GLuint; v GLfloat ref);
var glViewportIndexedfv glViewportIndexedfv_signature;

def glScissorArrayv_signature func(first GLuint; count GLsizei; v GLint ref);
var glScissorArrayv glScissorArrayv_signature;

def glScissorIndexed_signature func(index GLuint; left GLint; bottom GLint; width GLsizei; height GLsizei);
var glScissorIndexed glScissorIndexed_signature;

def glScissorIndexedv_signature func(index GLuint; v GLint ref);
var glScissorIndexedv glScissorIndexedv_signature;

def glDepthRangeArrayv_signature func(first GLuint; count GLsizei; v GLdouble ref);
var glDepthRangeArrayv glDepthRangeArrayv_signature;

def glDepthRangeIndexed_signature func(index GLuint; n GLdouble; f GLdouble);
var glDepthRangeIndexed glDepthRangeIndexed_signature;

def glGetFloati_v_signature func(target GLenum; index GLuint; data GLfloat ref);
var glGetFloati_v glGetFloati_v_signature;

def glGetDoublei_v_signature func(target GLenum; index GLuint; data GLdouble ref);
var glGetDoublei_v glGetDoublei_v_signature;

def glDrawArraysInstancedBaseInstance_signature func(mode GLenum; first GLint; count GLsizei; instancecount GLsizei; baseinstance GLuint);
var glDrawArraysInstancedBaseInstance glDrawArraysInstancedBaseInstance_signature;

def glDrawElementsInstancedBaseInstance_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei; baseinstance GLuint);
var glDrawElementsInstancedBaseInstance glDrawElementsInstancedBaseInstance_signature;

def glDrawElementsInstancedBaseVertexBaseInstance_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; instancecount GLsizei; basevertex GLint; baseinstance GLuint);
var glDrawElementsInstancedBaseVertexBaseInstance glDrawElementsInstancedBaseVertexBaseInstance_signature;

def glGetInternalformativ_signature func(target GLenum; internalformat GLenum; pname GLenum; count GLsizei; params GLint ref);
var glGetInternalformativ glGetInternalformativ_signature;

def glGetActiveAtomicCounterBufferiv_signature func(program GLuint; bufferIndex GLuint; pname GLenum; params GLint ref);
var glGetActiveAtomicCounterBufferiv glGetActiveAtomicCounterBufferiv_signature;

def glBindImageTexture_signature func(unit GLuint; texture GLuint; level GLint; layered GLboolean; layer GLint; access GLenum; format GLenum);
var glBindImageTexture glBindImageTexture_signature;

def glMemoryBarrier_signature func(barriers GLbitfield);
var glMemoryBarrier glMemoryBarrier_signature;

def glTexStorage1D_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei);
var glTexStorage1D glTexStorage1D_signature;

def glTexStorage2D_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glTexStorage2D glTexStorage2D_signature;

def glTexStorage3D_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var glTexStorage3D glTexStorage3D_signature;

def glDrawTransformFeedbackInstanced_signature func(mode GLenum; id GLuint; instancecount GLsizei);
var glDrawTransformFeedbackInstanced glDrawTransformFeedbackInstanced_signature;

def glDrawTransformFeedbackStreamInstanced_signature func(mode GLenum; id GLuint; stream GLuint; instancecount GLsizei);
var glDrawTransformFeedbackStreamInstanced glDrawTransformFeedbackStreamInstanced_signature;

def glClearBufferData_signature func(target GLenum; internalformat GLenum; format GLenum; type GLenum; data u8 ref);
var glClearBufferData glClearBufferData_signature;

def glClearBufferSubData_signature func(target GLenum; internalformat GLenum; offset GLintptr; size GLsizeiptr; format GLenum; type GLenum; data u8 ref);
var glClearBufferSubData glClearBufferSubData_signature;

def glDispatchCompute_signature func(num_groups_x GLuint; num_groups_y GLuint; num_groups_z GLuint);
var glDispatchCompute glDispatchCompute_signature;

def glDispatchComputeIndirect_signature func(indirect GLintptr);
var glDispatchComputeIndirect glDispatchComputeIndirect_signature;

def glCopyImageSubData_signature func(srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; srcWidth GLsizei; srcHeight GLsizei; srcDepth GLsizei);
var glCopyImageSubData glCopyImageSubData_signature;

def glFramebufferParameteri_signature func(target GLenum; pname GLenum; param GLint);
var glFramebufferParameteri glFramebufferParameteri_signature;

def glGetFramebufferParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetFramebufferParameteriv glGetFramebufferParameteriv_signature;

def glGetInternalformati64v_signature func(target GLenum; internalformat GLenum; pname GLenum; count GLsizei; params GLint64 ref);
var glGetInternalformati64v glGetInternalformati64v_signature;

def glInvalidateTexSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei);
var glInvalidateTexSubImage glInvalidateTexSubImage_signature;

def glInvalidateTexImage_signature func(texture GLuint; level GLint);
var glInvalidateTexImage glInvalidateTexImage_signature;

def glInvalidateBufferSubData_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr);
var glInvalidateBufferSubData glInvalidateBufferSubData_signature;

def glInvalidateBufferData_signature func(buffer GLuint);
var glInvalidateBufferData glInvalidateBufferData_signature;

def glInvalidateFramebuffer_signature func(target GLenum; numAttachments GLsizei; attachments GLenum ref);
var glInvalidateFramebuffer glInvalidateFramebuffer_signature;

def glInvalidateSubFramebuffer_signature func(target GLenum; numAttachments GLsizei; attachments GLenum ref; x GLint; y GLint; width GLsizei; height GLsizei);
var glInvalidateSubFramebuffer glInvalidateSubFramebuffer_signature;

def glMultiDrawArraysIndirect_signature func(mode GLenum; indirect u8 ref; drawcount GLsizei; stride GLsizei);
var glMultiDrawArraysIndirect glMultiDrawArraysIndirect_signature;

def glMultiDrawElementsIndirect_signature func(mode GLenum; type GLenum; indirect u8 ref; drawcount GLsizei; stride GLsizei);
var glMultiDrawElementsIndirect glMultiDrawElementsIndirect_signature;

def glGetProgramInterfaceiv_signature func(program GLuint; programInterface GLenum; pname GLenum; params GLint ref);
var glGetProgramInterfaceiv glGetProgramInterfaceiv_signature;

def glGetProgramResourceIndex_signature func(program GLuint; programInterface GLenum; name GLchar ref) (result GLuint);
var glGetProgramResourceIndex glGetProgramResourceIndex_signature;

def glGetProgramResourceName_signature func(program GLuint; programInterface GLenum; index GLuint; bufSize GLsizei; length GLsizei ref; name GLchar ref);
var glGetProgramResourceName glGetProgramResourceName_signature;

def glGetProgramResourceiv_signature func(program GLuint; programInterface GLenum; index GLuint; propCount GLsizei; props GLenum ref; count GLsizei; length GLsizei ref; params GLint ref);
var glGetProgramResourceiv glGetProgramResourceiv_signature;

def glGetProgramResourceLocation_signature func(program GLuint; programInterface GLenum; name GLchar ref) (result GLint);
var glGetProgramResourceLocation glGetProgramResourceLocation_signature;

def glGetProgramResourceLocationIndex_signature func(program GLuint; programInterface GLenum; name GLchar ref) (result GLint);
var glGetProgramResourceLocationIndex glGetProgramResourceLocationIndex_signature;

def glShaderStorageBlockBinding_signature func(program GLuint; storageBlockIndex GLuint; storageBlockBinding GLuint);
var glShaderStorageBlockBinding glShaderStorageBlockBinding_signature;

def glTexBufferRange_signature func(target GLenum; internalformat GLenum; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glTexBufferRange glTexBufferRange_signature;

def glTexStorage2DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var glTexStorage2DMultisample glTexStorage2DMultisample_signature;

def glTexStorage3DMultisample_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var glTexStorage3DMultisample glTexStorage3DMultisample_signature;

def glTextureView_signature func(texture GLuint; target GLenum; origtexture GLuint; internalformat GLenum; minlevel GLuint; numlevels GLuint; minlayer GLuint; numlayers GLuint);
var glTextureView glTextureView_signature;

def glBindVertexBuffer_signature func(bindingindex GLuint; buffer GLuint; offset GLintptr; stride GLsizei);
var glBindVertexBuffer glBindVertexBuffer_signature;

def glVertexAttribFormat_signature func(attribindex GLuint; size GLint; type GLenum; normalized GLboolean; relativeoffset GLuint);
var glVertexAttribFormat glVertexAttribFormat_signature;

def glVertexAttribIFormat_signature func(attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var glVertexAttribIFormat glVertexAttribIFormat_signature;

def glVertexAttribLFormat_signature func(attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var glVertexAttribLFormat glVertexAttribLFormat_signature;

def glVertexAttribBinding_signature func(attribindex GLuint; bindingindex GLuint);
var glVertexAttribBinding glVertexAttribBinding_signature;

def glVertexBindingDivisor_signature func(bindingindex GLuint; divisor GLuint);
var glVertexBindingDivisor glVertexBindingDivisor_signature;

def glDebugMessageControl_signature func(source GLenum; type GLenum; severity GLenum; count GLsizei; ids GLuint ref; enabled GLboolean);
var glDebugMessageControl glDebugMessageControl_signature;

def glDebugMessageInsert_signature func(source GLenum; type GLenum; id GLuint; severity GLenum; length GLsizei; buf GLchar ref);
var glDebugMessageInsert glDebugMessageInsert_signature;

def glDebugMessageCallback_signature func(callback GLDEBUGPROC; userParam u8 ref);
var glDebugMessageCallback glDebugMessageCallback_signature;

def glGetDebugMessageLog_signature func(count GLuint; bufSize GLsizei; sources GLenum ref; types GLenum ref; ids GLuint ref; severities GLenum ref; lengths GLsizei ref; messageLog GLchar ref) (result GLuint);
var glGetDebugMessageLog glGetDebugMessageLog_signature;

def glPushDebugGroup_signature func(source GLenum; id GLuint; length GLsizei; message GLchar ref);
var glPushDebugGroup glPushDebugGroup_signature;

def glPopDebugGroup_signature func();
var glPopDebugGroup glPopDebugGroup_signature;

def glObjectLabel_signature func(identifier GLenum; name GLuint; length GLsizei; label GLchar ref);
var glObjectLabel glObjectLabel_signature;

def glGetObjectLabel_signature func(identifier GLenum; name GLuint; bufSize GLsizei; length GLsizei ref; label GLchar ref);
var glGetObjectLabel glGetObjectLabel_signature;

def glObjectPtrLabel_signature func(ptr u8 ref; length GLsizei; label GLchar ref);
var glObjectPtrLabel glObjectPtrLabel_signature;

def glGetObjectPtrLabel_signature func(ptr u8 ref; bufSize GLsizei; length GLsizei ref; label GLchar ref);
var glGetObjectPtrLabel glGetObjectPtrLabel_signature;

def glBufferStorage_signature func(target GLenum; size GLsizeiptr; data u8 ref; flags GLbitfield);
var glBufferStorage glBufferStorage_signature;

def glClearTexImage_signature func(texture GLuint; level GLint; format GLenum; type GLenum; data u8 ref);
var glClearTexImage glClearTexImage_signature;

def glClearTexSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; data u8 ref);
var glClearTexSubImage glClearTexSubImage_signature;

def glBindBuffersBase_signature func(target GLenum; first GLuint; count GLsizei; buffers GLuint ref);
var glBindBuffersBase glBindBuffersBase_signature;

def glBindBuffersRange_signature func(target GLenum; first GLuint; count GLsizei; buffers GLuint ref; offsets GLintptr ref; sizes GLsizeiptr ref);
var glBindBuffersRange glBindBuffersRange_signature;

def glBindTextures_signature func(first GLuint; count GLsizei; textures GLuint ref);
var glBindTextures glBindTextures_signature;

def glBindSamplers_signature func(first GLuint; count GLsizei; samplers GLuint ref);
var glBindSamplers glBindSamplers_signature;

def glBindImageTextures_signature func(first GLuint; count GLsizei; textures GLuint ref);
var glBindImageTextures glBindImageTextures_signature;

def glBindVertexBuffers_signature func(first GLuint; count GLsizei; buffers GLuint ref; offsets GLintptr ref; strides GLsizei ref);
var glBindVertexBuffers glBindVertexBuffers_signature;

def glClipControl_signature func(origin GLenum; depth GLenum);
var glClipControl glClipControl_signature;

def glCreateTransformFeedbacks_signature func(n GLsizei; ids GLuint ref);
var glCreateTransformFeedbacks glCreateTransformFeedbacks_signature;

def glTransformFeedbackBufferBase_signature func(xfb GLuint; index GLuint; buffer GLuint);
var glTransformFeedbackBufferBase glTransformFeedbackBufferBase_signature;

def glTransformFeedbackBufferRange_signature func(xfb GLuint; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glTransformFeedbackBufferRange glTransformFeedbackBufferRange_signature;

def glGetTransformFeedbackiv_signature func(xfb GLuint; pname GLenum; param GLint ref);
var glGetTransformFeedbackiv glGetTransformFeedbackiv_signature;

def glGetTransformFeedbacki_v_signature func(xfb GLuint; pname GLenum; index GLuint; param GLint ref);
var glGetTransformFeedbacki_v glGetTransformFeedbacki_v_signature;

def glGetTransformFeedbacki64_v_signature func(xfb GLuint; pname GLenum; index GLuint; param GLint64 ref);
var glGetTransformFeedbacki64_v glGetTransformFeedbacki64_v_signature;

def glCreateBuffers_signature func(n GLsizei; buffers GLuint ref);
var glCreateBuffers glCreateBuffers_signature;

def glNamedBufferStorage_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; flags GLbitfield);
var glNamedBufferStorage glNamedBufferStorage_signature;

def glNamedBufferData_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; usage GLenum);
var glNamedBufferData glNamedBufferData_signature;

def glNamedBufferSubData_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var glNamedBufferSubData glNamedBufferSubData_signature;

def glCopyNamedBufferSubData_signature func(readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var glCopyNamedBufferSubData glCopyNamedBufferSubData_signature;

def glClearNamedBufferData_signature func(buffer GLuint; internalformat GLenum; format GLenum; type GLenum; data u8 ref);
var glClearNamedBufferData glClearNamedBufferData_signature;

def glClearNamedBufferSubData_signature func(buffer GLuint; internalformat GLenum; offset GLintptr; size GLsizeiptr; format GLenum; type GLenum; data u8 ref);
var glClearNamedBufferSubData glClearNamedBufferSubData_signature;

def glMapNamedBuffer_signature func(buffer GLuint; access GLenum) (result u8 ref);
var glMapNamedBuffer glMapNamedBuffer_signature;

def glMapNamedBufferRange_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr; access GLbitfield) (result u8 ref);
var glMapNamedBufferRange glMapNamedBufferRange_signature;

def glUnmapNamedBuffer_signature func(buffer GLuint) (result GLboolean);
var glUnmapNamedBuffer glUnmapNamedBuffer_signature;

def glFlushMappedNamedBufferRange_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr);
var glFlushMappedNamedBufferRange glFlushMappedNamedBufferRange_signature;

def glGetNamedBufferParameteriv_signature func(buffer GLuint; pname GLenum; params GLint ref);
var glGetNamedBufferParameteriv glGetNamedBufferParameteriv_signature;

def glGetNamedBufferParameteri64v_signature func(buffer GLuint; pname GLenum; params GLint64 ref);
var glGetNamedBufferParameteri64v glGetNamedBufferParameteri64v_signature;

def glGetNamedBufferPointerv_signature func(buffer GLuint; pname GLenum; params u8 ref ref);
var glGetNamedBufferPointerv glGetNamedBufferPointerv_signature;

def glGetNamedBufferSubData_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var glGetNamedBufferSubData glGetNamedBufferSubData_signature;

def glCreateFramebuffers_signature func(n GLsizei; framebuffers GLuint ref);
var glCreateFramebuffers glCreateFramebuffers_signature;

def glNamedFramebufferRenderbuffer_signature func(framebuffer GLuint; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var glNamedFramebufferRenderbuffer glNamedFramebufferRenderbuffer_signature;

def glNamedFramebufferParameteri_signature func(framebuffer GLuint; pname GLenum; param GLint);
var glNamedFramebufferParameteri glNamedFramebufferParameteri_signature;

def glNamedFramebufferTexture_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint);
var glNamedFramebufferTexture glNamedFramebufferTexture_signature;

def glNamedFramebufferTextureLayer_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint; layer GLint);
var glNamedFramebufferTextureLayer glNamedFramebufferTextureLayer_signature;

def glNamedFramebufferDrawBuffer_signature func(framebuffer GLuint; buf GLenum);
var glNamedFramebufferDrawBuffer glNamedFramebufferDrawBuffer_signature;

def glNamedFramebufferDrawBuffers_signature func(framebuffer GLuint; n GLsizei; bufs GLenum ref);
var glNamedFramebufferDrawBuffers glNamedFramebufferDrawBuffers_signature;

def glNamedFramebufferReadBuffer_signature func(framebuffer GLuint; src GLenum);
var glNamedFramebufferReadBuffer glNamedFramebufferReadBuffer_signature;

def glInvalidateNamedFramebufferData_signature func(framebuffer GLuint; numAttachments GLsizei; attachments GLenum ref);
var glInvalidateNamedFramebufferData glInvalidateNamedFramebufferData_signature;

def glInvalidateNamedFramebufferSubData_signature func(framebuffer GLuint; numAttachments GLsizei; attachments GLenum ref; x GLint; y GLint; width GLsizei; height GLsizei);
var glInvalidateNamedFramebufferSubData glInvalidateNamedFramebufferSubData_signature;

def glClearNamedFramebufferiv_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; value GLint ref);
var glClearNamedFramebufferiv glClearNamedFramebufferiv_signature;

def glClearNamedFramebufferuiv_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; value GLuint ref);
var glClearNamedFramebufferuiv glClearNamedFramebufferuiv_signature;

def glClearNamedFramebufferfv_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; value GLfloat ref);
var glClearNamedFramebufferfv glClearNamedFramebufferfv_signature;

def glClearNamedFramebufferfi_signature func(framebuffer GLuint; buffer GLenum; drawbuffer GLint; depth GLfloat; stencil GLint);
var glClearNamedFramebufferfi glClearNamedFramebufferfi_signature;

def glBlitNamedFramebuffer_signature func(readFramebuffer GLuint; drawFramebuffer GLuint; srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var glBlitNamedFramebuffer glBlitNamedFramebuffer_signature;

def glCheckNamedFramebufferStatus_signature func(framebuffer GLuint; target GLenum) (result GLenum);
var glCheckNamedFramebufferStatus glCheckNamedFramebufferStatus_signature;

def glGetNamedFramebufferParameteriv_signature func(framebuffer GLuint; pname GLenum; param GLint ref);
var glGetNamedFramebufferParameteriv glGetNamedFramebufferParameteriv_signature;

def glGetNamedFramebufferAttachmentParameteriv_signature func(framebuffer GLuint; attachment GLenum; pname GLenum; params GLint ref);
var glGetNamedFramebufferAttachmentParameteriv glGetNamedFramebufferAttachmentParameteriv_signature;

def glCreateRenderbuffers_signature func(n GLsizei; renderbuffers GLuint ref);
var glCreateRenderbuffers glCreateRenderbuffers_signature;

def glNamedRenderbufferStorage_signature func(renderbuffer GLuint; internalformat GLenum; width GLsizei; height GLsizei);
var glNamedRenderbufferStorage glNamedRenderbufferStorage_signature;

def glNamedRenderbufferStorageMultisample_signature func(renderbuffer GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glNamedRenderbufferStorageMultisample glNamedRenderbufferStorageMultisample_signature;

def glGetNamedRenderbufferParameteriv_signature func(renderbuffer GLuint; pname GLenum; params GLint ref);
var glGetNamedRenderbufferParameteriv glGetNamedRenderbufferParameteriv_signature;

def glCreateTextures_signature func(target GLenum; n GLsizei; textures GLuint ref);
var glCreateTextures glCreateTextures_signature;

def glTextureBuffer_signature func(texture GLuint; internalformat GLenum; buffer GLuint);
var glTextureBuffer glTextureBuffer_signature;

def glTextureBufferRange_signature func(texture GLuint; internalformat GLenum; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glTextureBufferRange glTextureBufferRange_signature;

def glTextureStorage1D_signature func(texture GLuint; levels GLsizei; internalformat GLenum; width GLsizei);
var glTextureStorage1D glTextureStorage1D_signature;

def glTextureStorage2D_signature func(texture GLuint; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glTextureStorage2D glTextureStorage2D_signature;

def glTextureStorage3D_signature func(texture GLuint; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var glTextureStorage3D glTextureStorage3D_signature;

def glTextureStorage2DMultisample_signature func(texture GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var glTextureStorage2DMultisample glTextureStorage2DMultisample_signature;

def glTextureStorage3DMultisample_signature func(texture GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var glTextureStorage3DMultisample glTextureStorage3DMultisample_signature;

def glTextureSubImage1D_signature func(texture GLuint; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTextureSubImage1D glTextureSubImage1D_signature;

def glTextureSubImage2D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTextureSubImage2D glTextureSubImage2D_signature;

def glTextureSubImage3D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTextureSubImage3D glTextureSubImage3D_signature;

def glCompressedTextureSubImage1D_signature func(texture GLuint; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTextureSubImage1D glCompressedTextureSubImage1D_signature;

def glCompressedTextureSubImage2D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTextureSubImage2D glCompressedTextureSubImage2D_signature;

def glCompressedTextureSubImage3D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTextureSubImage3D glCompressedTextureSubImage3D_signature;

def glCopyTextureSubImage1D_signature func(texture GLuint; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var glCopyTextureSubImage1D glCopyTextureSubImage1D_signature;

def glCopyTextureSubImage2D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTextureSubImage2D glCopyTextureSubImage2D_signature;

def glCopyTextureSubImage3D_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTextureSubImage3D glCopyTextureSubImage3D_signature;

def glTextureParameterf_signature func(texture GLuint; pname GLenum; param GLfloat);
var glTextureParameterf glTextureParameterf_signature;

def glTextureParameterfv_signature func(texture GLuint; pname GLenum; param GLfloat ref);
var glTextureParameterfv glTextureParameterfv_signature;

def glTextureParameteri_signature func(texture GLuint; pname GLenum; param GLint);
var glTextureParameteri glTextureParameteri_signature;

def glTextureParameterIiv_signature func(texture GLuint; pname GLenum; params GLint ref);
var glTextureParameterIiv glTextureParameterIiv_signature;

def glTextureParameterIuiv_signature func(texture GLuint; pname GLenum; params GLuint ref);
var glTextureParameterIuiv glTextureParameterIuiv_signature;

def glTextureParameteriv_signature func(texture GLuint; pname GLenum; param GLint ref);
var glTextureParameteriv glTextureParameteriv_signature;

def glGenerateTextureMipmap_signature func(texture GLuint);
var glGenerateTextureMipmap glGenerateTextureMipmap_signature;

def glBindTextureUnit_signature func(unit GLuint; texture GLuint);
var glBindTextureUnit glBindTextureUnit_signature;

def glGetTextureImage_signature func(texture GLuint; level GLint; format GLenum; type GLenum; bufSize GLsizei; pixels u8 ref);
var glGetTextureImage glGetTextureImage_signature;

def glGetCompressedTextureImage_signature func(texture GLuint; level GLint; bufSize GLsizei; pixels u8 ref);
var glGetCompressedTextureImage glGetCompressedTextureImage_signature;

def glGetTextureLevelParameterfv_signature func(texture GLuint; level GLint; pname GLenum; params GLfloat ref);
var glGetTextureLevelParameterfv glGetTextureLevelParameterfv_signature;

def glGetTextureLevelParameteriv_signature func(texture GLuint; level GLint; pname GLenum; params GLint ref);
var glGetTextureLevelParameteriv glGetTextureLevelParameteriv_signature;

def glGetTextureParameterfv_signature func(texture GLuint; pname GLenum; params GLfloat ref);
var glGetTextureParameterfv glGetTextureParameterfv_signature;

def glGetTextureParameterIiv_signature func(texture GLuint; pname GLenum; params GLint ref);
var glGetTextureParameterIiv glGetTextureParameterIiv_signature;

def glGetTextureParameterIuiv_signature func(texture GLuint; pname GLenum; params GLuint ref);
var glGetTextureParameterIuiv glGetTextureParameterIuiv_signature;

def glGetTextureParameteriv_signature func(texture GLuint; pname GLenum; params GLint ref);
var glGetTextureParameteriv glGetTextureParameteriv_signature;

def glCreateVertexArrays_signature func(n GLsizei; arrays GLuint ref);
var glCreateVertexArrays glCreateVertexArrays_signature;

def glDisableVertexArrayAttrib_signature func(vaobj GLuint; index GLuint);
var glDisableVertexArrayAttrib glDisableVertexArrayAttrib_signature;

def glEnableVertexArrayAttrib_signature func(vaobj GLuint; index GLuint);
var glEnableVertexArrayAttrib glEnableVertexArrayAttrib_signature;

def glVertexArrayElementBuffer_signature func(vaobj GLuint; buffer GLuint);
var glVertexArrayElementBuffer glVertexArrayElementBuffer_signature;

def glVertexArrayVertexBuffer_signature func(vaobj GLuint; bindingindex GLuint; buffer GLuint; offset GLintptr; stride GLsizei);
var glVertexArrayVertexBuffer glVertexArrayVertexBuffer_signature;

def glVertexArrayVertexBuffers_signature func(vaobj GLuint; first GLuint; count GLsizei; buffers GLuint ref; offsets GLintptr ref; strides GLsizei ref);
var glVertexArrayVertexBuffers glVertexArrayVertexBuffers_signature;

def glVertexArrayAttribBinding_signature func(vaobj GLuint; attribindex GLuint; bindingindex GLuint);
var glVertexArrayAttribBinding glVertexArrayAttribBinding_signature;

def glVertexArrayAttribFormat_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; normalized GLboolean; relativeoffset GLuint);
var glVertexArrayAttribFormat glVertexArrayAttribFormat_signature;

def glVertexArrayAttribIFormat_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var glVertexArrayAttribIFormat glVertexArrayAttribIFormat_signature;

def glVertexArrayAttribLFormat_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var glVertexArrayAttribLFormat glVertexArrayAttribLFormat_signature;

def glVertexArrayBindingDivisor_signature func(vaobj GLuint; bindingindex GLuint; divisor GLuint);
var glVertexArrayBindingDivisor glVertexArrayBindingDivisor_signature;

def glGetVertexArrayiv_signature func(vaobj GLuint; pname GLenum; param GLint ref);
var glGetVertexArrayiv glGetVertexArrayiv_signature;

def glGetVertexArrayIndexediv_signature func(vaobj GLuint; index GLuint; pname GLenum; param GLint ref);
var glGetVertexArrayIndexediv glGetVertexArrayIndexediv_signature;

def glGetVertexArrayIndexed64iv_signature func(vaobj GLuint; index GLuint; pname GLenum; param GLint64 ref);
var glGetVertexArrayIndexed64iv glGetVertexArrayIndexed64iv_signature;

def glCreateSamplers_signature func(n GLsizei; samplers GLuint ref);
var glCreateSamplers glCreateSamplers_signature;

def glCreateProgramPipelines_signature func(n GLsizei; pipelines GLuint ref);
var glCreateProgramPipelines glCreateProgramPipelines_signature;

def glCreateQueries_signature func(target GLenum; n GLsizei; ids GLuint ref);
var glCreateQueries glCreateQueries_signature;

def glGetQueryBufferObjecti64v_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var glGetQueryBufferObjecti64v glGetQueryBufferObjecti64v_signature;

def glGetQueryBufferObjectiv_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var glGetQueryBufferObjectiv glGetQueryBufferObjectiv_signature;

def glGetQueryBufferObjectui64v_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var glGetQueryBufferObjectui64v glGetQueryBufferObjectui64v_signature;

def glGetQueryBufferObjectuiv_signature func(id GLuint; buffer GLuint; pname GLenum; offset GLintptr);
var glGetQueryBufferObjectuiv glGetQueryBufferObjectuiv_signature;

def glMemoryBarrierByRegion_signature func(barriers GLbitfield);
var glMemoryBarrierByRegion glMemoryBarrierByRegion_signature;

def glGetTextureSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; bufSize GLsizei; pixels u8 ref);
var glGetTextureSubImage glGetTextureSubImage_signature;

def glGetCompressedTextureSubImage_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; bufSize GLsizei; pixels u8 ref);
var glGetCompressedTextureSubImage glGetCompressedTextureSubImage_signature;

def glGetGraphicsResetStatus_signature func() (result GLenum);
var glGetGraphicsResetStatus glGetGraphicsResetStatus_signature;

def glGetnCompressedTexImage_signature func(target GLenum; lod GLint; bufSize GLsizei; pixels u8 ref);
var glGetnCompressedTexImage glGetnCompressedTexImage_signature;

def glGetnTexImage_signature func(target GLenum; level GLint; format GLenum; type GLenum; bufSize GLsizei; pixels u8 ref);
var glGetnTexImage glGetnTexImage_signature;

def glGetnUniformdv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLdouble ref);
var glGetnUniformdv glGetnUniformdv_signature;

def glGetnUniformfv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLfloat ref);
var glGetnUniformfv glGetnUniformfv_signature;

def glGetnUniformiv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLint ref);
var glGetnUniformiv glGetnUniformiv_signature;

def glGetnUniformuiv_signature func(program GLuint; location GLint; bufSize GLsizei; params GLuint ref);
var glGetnUniformuiv glGetnUniformuiv_signature;

def glReadnPixels_signature func(x GLint; y GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; bufSize GLsizei; data u8 ref);
var glReadnPixels glReadnPixels_signature;

def glGetnMapdv_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLdouble ref);
var glGetnMapdv glGetnMapdv_signature;

def glGetnMapfv_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLfloat ref);
var glGetnMapfv glGetnMapfv_signature;

def glGetnMapiv_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLint ref);
var glGetnMapiv glGetnMapiv_signature;

def glGetnPixelMapfv_signature func(map GLenum; bufSize GLsizei; values GLfloat ref);
var glGetnPixelMapfv glGetnPixelMapfv_signature;

def glGetnPixelMapuiv_signature func(map GLenum; bufSize GLsizei; values GLuint ref);
var glGetnPixelMapuiv glGetnPixelMapuiv_signature;

def glGetnPixelMapusv_signature func(map GLenum; bufSize GLsizei; values GLushort ref);
var glGetnPixelMapusv glGetnPixelMapusv_signature;

def glGetnPolygonStipple_signature func(bufSize GLsizei; pattern GLubyte ref);
var glGetnPolygonStipple glGetnPolygonStipple_signature;

def glGetnColorTable_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; table u8 ref);
var glGetnColorTable glGetnColorTable_signature;

def glGetnConvolutionFilter_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; image u8 ref);
var glGetnConvolutionFilter glGetnConvolutionFilter_signature;

def glGetnSeparableFilter_signature func(target GLenum; format GLenum; type GLenum; rowBufSize GLsizei; row u8 ref; columnBufSize GLsizei; column u8 ref; span u8 ref);
var glGetnSeparableFilter glGetnSeparableFilter_signature;

def glGetnHistogram_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var glGetnHistogram glGetnHistogram_signature;

def glGetnMinmax_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var glGetnMinmax glGetnMinmax_signature;

def glTextureBarrier_signature func();
var glTextureBarrier glTextureBarrier_signature;

def glSpecializeShader_signature func(shader GLuint; pEntryPoint GLchar ref; numSpecializationConstants GLuint; pConstantIndex GLuint ref; pConstantValue GLuint ref);
var glSpecializeShader glSpecializeShader_signature;

def glMultiDrawArraysIndirectCount_signature func(mode GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var glMultiDrawArraysIndirectCount glMultiDrawArraysIndirectCount_signature;

def glMultiDrawElementsIndirectCount_signature func(mode GLenum; type GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var glMultiDrawElementsIndirectCount glMultiDrawElementsIndirectCount_signature;

def glPolygonOffsetClamp_signature func(factor GLfloat; units GLfloat; clamp GLfloat);
var glPolygonOffsetClamp glPolygonOffsetClamp_signature;

def glPrimitiveBoundingBoxARB_signature func(minX GLfloat; minY GLfloat; minZ GLfloat; minW GLfloat; maxX GLfloat; maxY GLfloat; maxZ GLfloat; maxW GLfloat);
var glPrimitiveBoundingBoxARB glPrimitiveBoundingBoxARB_signature;
def GLuint64EXT = type khronos_uint64_t;

def glGetTextureHandleARB_signature func(texture GLuint) (result GLuint64);
var glGetTextureHandleARB glGetTextureHandleARB_signature;

def glGetTextureSamplerHandleARB_signature func(texture GLuint; sampler GLuint) (result GLuint64);
var glGetTextureSamplerHandleARB glGetTextureSamplerHandleARB_signature;

def glMakeTextureHandleResidentARB_signature func(handle GLuint64);
var glMakeTextureHandleResidentARB glMakeTextureHandleResidentARB_signature;

def glMakeTextureHandleNonResidentARB_signature func(handle GLuint64);
var glMakeTextureHandleNonResidentARB glMakeTextureHandleNonResidentARB_signature;

def glGetImageHandleARB_signature func(texture GLuint; level GLint; layered GLboolean; layer GLint; format GLenum) (result GLuint64);
var glGetImageHandleARB glGetImageHandleARB_signature;

def glMakeImageHandleResidentARB_signature func(handle GLuint64; access GLenum);
var glMakeImageHandleResidentARB glMakeImageHandleResidentARB_signature;

def glMakeImageHandleNonResidentARB_signature func(handle GLuint64);
var glMakeImageHandleNonResidentARB glMakeImageHandleNonResidentARB_signature;

def glUniformHandleui64ARB_signature func(location GLint; value GLuint64);
var glUniformHandleui64ARB glUniformHandleui64ARB_signature;

def glUniformHandleui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var glUniformHandleui64vARB glUniformHandleui64vARB_signature;

def glProgramUniformHandleui64ARB_signature func(program GLuint; location GLint; value GLuint64);
var glProgramUniformHandleui64ARB glProgramUniformHandleui64ARB_signature;

def glProgramUniformHandleui64vARB_signature func(program GLuint; location GLint; count GLsizei; values GLuint64 ref);
var glProgramUniformHandleui64vARB glProgramUniformHandleui64vARB_signature;

def glIsTextureHandleResidentARB_signature func(handle GLuint64) (result GLboolean);
var glIsTextureHandleResidentARB glIsTextureHandleResidentARB_signature;

def glIsImageHandleResidentARB_signature func(handle GLuint64) (result GLboolean);
var glIsImageHandleResidentARB glIsImageHandleResidentARB_signature;

def glVertexAttribL1ui64ARB_signature func(index GLuint; x GLuint64EXT);
var glVertexAttribL1ui64ARB glVertexAttribL1ui64ARB_signature;

def glVertexAttribL1ui64vARB_signature func(index GLuint; v GLuint64EXT ref);
var glVertexAttribL1ui64vARB glVertexAttribL1ui64vARB_signature;

def glGetVertexAttribLui64vARB_signature func(index GLuint; pname GLenum; params GLuint64EXT ref);
var glGetVertexAttribLui64vARB glGetVertexAttribLui64vARB_signature;

def glCreateSyncFromCLeventARB_signature func(context _cl_context ref; event _cl_event ref; flags GLbitfield) (result GLsync);
var glCreateSyncFromCLeventARB glCreateSyncFromCLeventARB_signature;

def glClampColorARB_signature func(target GLenum; clamp GLenum);
var glClampColorARB glClampColorARB_signature;

def glDispatchComputeGroupSizeARB_signature func(num_groups_x GLuint; num_groups_y GLuint; num_groups_z GLuint; group_size_x GLuint; group_size_y GLuint; group_size_z GLuint);
var glDispatchComputeGroupSizeARB glDispatchComputeGroupSizeARB_signature;

def glDebugMessageControlARB_signature func(source GLenum; type GLenum; severity GLenum; count GLsizei; ids GLuint ref; enabled GLboolean);
var glDebugMessageControlARB glDebugMessageControlARB_signature;

def glDebugMessageInsertARB_signature func(source GLenum; type GLenum; id GLuint; severity GLenum; length GLsizei; buf GLchar ref);
var glDebugMessageInsertARB glDebugMessageInsertARB_signature;

def glDebugMessageCallbackARB_signature func(callback GLDEBUGPROCARB; userParam u8 ref);
var glDebugMessageCallbackARB glDebugMessageCallbackARB_signature;

def glGetDebugMessageLogARB_signature func(count GLuint; bufSize GLsizei; sources GLenum ref; types GLenum ref; ids GLuint ref; severities GLenum ref; lengths GLsizei ref; messageLog GLchar ref) (result GLuint);
var glGetDebugMessageLogARB glGetDebugMessageLogARB_signature;

def glDrawBuffersARB_signature func(n GLsizei; bufs GLenum ref);
var glDrawBuffersARB glDrawBuffersARB_signature;

def glBlendEquationiARB_signature func(buf GLuint; mode GLenum);
var glBlendEquationiARB glBlendEquationiARB_signature;

def glBlendEquationSeparateiARB_signature func(buf GLuint; modeRGB GLenum; modeAlpha GLenum);
var glBlendEquationSeparateiARB glBlendEquationSeparateiARB_signature;

def glBlendFunciARB_signature func(buf GLuint; src GLenum; dst GLenum);
var glBlendFunciARB glBlendFunciARB_signature;

def glBlendFuncSeparateiARB_signature func(buf GLuint; srcRGB GLenum; dstRGB GLenum; srcAlpha GLenum; dstAlpha GLenum);
var glBlendFuncSeparateiARB glBlendFuncSeparateiARB_signature;

def glDrawArraysInstancedARB_signature func(mode GLenum; first GLint; count GLsizei; primcount GLsizei);
var glDrawArraysInstancedARB glDrawArraysInstancedARB_signature;

def glDrawElementsInstancedARB_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; primcount GLsizei);
var glDrawElementsInstancedARB glDrawElementsInstancedARB_signature;

def glProgramStringARB_signature func(target GLenum; format GLenum; len GLsizei; string u8 ref);
var glProgramStringARB glProgramStringARB_signature;

def glBindProgramARB_signature func(target GLenum; program GLuint);
var glBindProgramARB glBindProgramARB_signature;

def glDeleteProgramsARB_signature func(n GLsizei; programs GLuint ref);
var glDeleteProgramsARB glDeleteProgramsARB_signature;

def glGenProgramsARB_signature func(n GLsizei; programs GLuint ref);
var glGenProgramsARB glGenProgramsARB_signature;

def glProgramEnvParameter4dARB_signature func(target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glProgramEnvParameter4dARB glProgramEnvParameter4dARB_signature;

def glProgramEnvParameter4dvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var glProgramEnvParameter4dvARB glProgramEnvParameter4dvARB_signature;

def glProgramEnvParameter4fARB_signature func(target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glProgramEnvParameter4fARB glProgramEnvParameter4fARB_signature;

def glProgramEnvParameter4fvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var glProgramEnvParameter4fvARB glProgramEnvParameter4fvARB_signature;

def glProgramLocalParameter4dARB_signature func(target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glProgramLocalParameter4dARB glProgramLocalParameter4dARB_signature;

def glProgramLocalParameter4dvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var glProgramLocalParameter4dvARB glProgramLocalParameter4dvARB_signature;

def glProgramLocalParameter4fARB_signature func(target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glProgramLocalParameter4fARB glProgramLocalParameter4fARB_signature;

def glProgramLocalParameter4fvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var glProgramLocalParameter4fvARB glProgramLocalParameter4fvARB_signature;

def glGetProgramEnvParameterdvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var glGetProgramEnvParameterdvARB glGetProgramEnvParameterdvARB_signature;

def glGetProgramEnvParameterfvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var glGetProgramEnvParameterfvARB glGetProgramEnvParameterfvARB_signature;

def glGetProgramLocalParameterdvARB_signature func(target GLenum; index GLuint; params GLdouble ref);
var glGetProgramLocalParameterdvARB glGetProgramLocalParameterdvARB_signature;

def glGetProgramLocalParameterfvARB_signature func(target GLenum; index GLuint; params GLfloat ref);
var glGetProgramLocalParameterfvARB glGetProgramLocalParameterfvARB_signature;

def glGetProgramivARB_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetProgramivARB glGetProgramivARB_signature;

def glGetProgramStringARB_signature func(target GLenum; pname GLenum; string u8 ref);
var glGetProgramStringARB glGetProgramStringARB_signature;

def glIsProgramARB_signature func(program GLuint) (result GLboolean);
var glIsProgramARB glIsProgramARB_signature;

def glProgramParameteriARB_signature func(program GLuint; pname GLenum; value GLint);
var glProgramParameteriARB glProgramParameteriARB_signature;

def glFramebufferTextureARB_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint);
var glFramebufferTextureARB glFramebufferTextureARB_signature;

def glFramebufferTextureLayerARB_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; layer GLint);
var glFramebufferTextureLayerARB glFramebufferTextureLayerARB_signature;

def glFramebufferTextureFaceARB_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; face GLenum);
var glFramebufferTextureFaceARB glFramebufferTextureFaceARB_signature;

def glSpecializeShaderARB_signature func(shader GLuint; pEntryPoint GLchar ref; numSpecializationConstants GLuint; pConstantIndex GLuint ref; pConstantValue GLuint ref);
var glSpecializeShaderARB glSpecializeShaderARB_signature;

def glUniform1i64ARB_signature func(location GLint; x GLint64);
var glUniform1i64ARB glUniform1i64ARB_signature;

def glUniform2i64ARB_signature func(location GLint; x GLint64; y GLint64);
var glUniform2i64ARB glUniform2i64ARB_signature;

def glUniform3i64ARB_signature func(location GLint; x GLint64; y GLint64; z GLint64);
var glUniform3i64ARB glUniform3i64ARB_signature;

def glUniform4i64ARB_signature func(location GLint; x GLint64; y GLint64; z GLint64; w GLint64);
var glUniform4i64ARB glUniform4i64ARB_signature;

def glUniform1i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var glUniform1i64vARB glUniform1i64vARB_signature;

def glUniform2i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var glUniform2i64vARB glUniform2i64vARB_signature;

def glUniform3i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var glUniform3i64vARB glUniform3i64vARB_signature;

def glUniform4i64vARB_signature func(location GLint; count GLsizei; value GLint64 ref);
var glUniform4i64vARB glUniform4i64vARB_signature;

def glUniform1ui64ARB_signature func(location GLint; x GLuint64);
var glUniform1ui64ARB glUniform1ui64ARB_signature;

def glUniform2ui64ARB_signature func(location GLint; x GLuint64; y GLuint64);
var glUniform2ui64ARB glUniform2ui64ARB_signature;

def glUniform3ui64ARB_signature func(location GLint; x GLuint64; y GLuint64; z GLuint64);
var glUniform3ui64ARB glUniform3ui64ARB_signature;

def glUniform4ui64ARB_signature func(location GLint; x GLuint64; y GLuint64; z GLuint64; w GLuint64);
var glUniform4ui64ARB glUniform4ui64ARB_signature;

def glUniform1ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var glUniform1ui64vARB glUniform1ui64vARB_signature;

def glUniform2ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var glUniform2ui64vARB glUniform2ui64vARB_signature;

def glUniform3ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var glUniform3ui64vARB glUniform3ui64vARB_signature;

def glUniform4ui64vARB_signature func(location GLint; count GLsizei; value GLuint64 ref);
var glUniform4ui64vARB glUniform4ui64vARB_signature;

def glGetUniformi64vARB_signature func(program GLuint; location GLint; params GLint64 ref);
var glGetUniformi64vARB glGetUniformi64vARB_signature;

def glGetUniformui64vARB_signature func(program GLuint; location GLint; params GLuint64 ref);
var glGetUniformui64vARB glGetUniformui64vARB_signature;

def glGetnUniformi64vARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLint64 ref);
var glGetnUniformi64vARB glGetnUniformi64vARB_signature;

def glGetnUniformui64vARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLuint64 ref);
var glGetnUniformui64vARB glGetnUniformui64vARB_signature;

def glProgramUniform1i64ARB_signature func(program GLuint; location GLint; x GLint64);
var glProgramUniform1i64ARB glProgramUniform1i64ARB_signature;

def glProgramUniform2i64ARB_signature func(program GLuint; location GLint; x GLint64; y GLint64);
var glProgramUniform2i64ARB glProgramUniform2i64ARB_signature;

def glProgramUniform3i64ARB_signature func(program GLuint; location GLint; x GLint64; y GLint64; z GLint64);
var glProgramUniform3i64ARB glProgramUniform3i64ARB_signature;

def glProgramUniform4i64ARB_signature func(program GLuint; location GLint; x GLint64; y GLint64; z GLint64; w GLint64);
var glProgramUniform4i64ARB glProgramUniform4i64ARB_signature;

def glProgramUniform1i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var glProgramUniform1i64vARB glProgramUniform1i64vARB_signature;

def glProgramUniform2i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var glProgramUniform2i64vARB glProgramUniform2i64vARB_signature;

def glProgramUniform3i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var glProgramUniform3i64vARB glProgramUniform3i64vARB_signature;

def glProgramUniform4i64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLint64 ref);
var glProgramUniform4i64vARB glProgramUniform4i64vARB_signature;

def glProgramUniform1ui64ARB_signature func(program GLuint; location GLint; x GLuint64);
var glProgramUniform1ui64ARB glProgramUniform1ui64ARB_signature;

def glProgramUniform2ui64ARB_signature func(program GLuint; location GLint; x GLuint64; y GLuint64);
var glProgramUniform2ui64ARB glProgramUniform2ui64ARB_signature;

def glProgramUniform3ui64ARB_signature func(program GLuint; location GLint; x GLuint64; y GLuint64; z GLuint64);
var glProgramUniform3ui64ARB glProgramUniform3ui64ARB_signature;

def glProgramUniform4ui64ARB_signature func(program GLuint; location GLint; x GLuint64; y GLuint64; z GLuint64; w GLuint64);
var glProgramUniform4ui64ARB glProgramUniform4ui64ARB_signature;

def glProgramUniform1ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var glProgramUniform1ui64vARB glProgramUniform1ui64vARB_signature;

def glProgramUniform2ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var glProgramUniform2ui64vARB glProgramUniform2ui64vARB_signature;

def glProgramUniform3ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var glProgramUniform3ui64vARB glProgramUniform3ui64vARB_signature;

def glProgramUniform4ui64vARB_signature func(program GLuint; location GLint; count GLsizei; value GLuint64 ref);
var glProgramUniform4ui64vARB glProgramUniform4ui64vARB_signature;
def GLhalfARB = type khronos_uint16_t;

def glColorTable_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; table u8 ref);
var glColorTable glColorTable_signature;

def glColorTableParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glColorTableParameterfv glColorTableParameterfv_signature;

def glColorTableParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glColorTableParameteriv glColorTableParameteriv_signature;

def glCopyColorTable_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var glCopyColorTable glCopyColorTable_signature;

def glGetColorTable_signature func(target GLenum; format GLenum; type GLenum; table u8 ref);
var glGetColorTable glGetColorTable_signature;

def glGetColorTableParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetColorTableParameterfv glGetColorTableParameterfv_signature;

def glGetColorTableParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetColorTableParameteriv glGetColorTableParameteriv_signature;

def glColorSubTable_signature func(target GLenum; start GLsizei; count GLsizei; format GLenum; type GLenum; data u8 ref);
var glColorSubTable glColorSubTable_signature;

def glCopyColorSubTable_signature func(target GLenum; start GLsizei; x GLint; y GLint; width GLsizei);
var glCopyColorSubTable glCopyColorSubTable_signature;

def glConvolutionFilter1D_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; image u8 ref);
var glConvolutionFilter1D glConvolutionFilter1D_signature;

def glConvolutionFilter2D_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; image u8 ref);
var glConvolutionFilter2D glConvolutionFilter2D_signature;

def glConvolutionParameterf_signature func(target GLenum; pname GLenum; params GLfloat);
var glConvolutionParameterf glConvolutionParameterf_signature;

def glConvolutionParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glConvolutionParameterfv glConvolutionParameterfv_signature;

def glConvolutionParameteri_signature func(target GLenum; pname GLenum; params GLint);
var glConvolutionParameteri glConvolutionParameteri_signature;

def glConvolutionParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glConvolutionParameteriv glConvolutionParameteriv_signature;

def glCopyConvolutionFilter1D_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var glCopyConvolutionFilter1D glCopyConvolutionFilter1D_signature;

def glCopyConvolutionFilter2D_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyConvolutionFilter2D glCopyConvolutionFilter2D_signature;

def glGetConvolutionFilter_signature func(target GLenum; format GLenum; type GLenum; image u8 ref);
var glGetConvolutionFilter glGetConvolutionFilter_signature;

def glGetConvolutionParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetConvolutionParameterfv glGetConvolutionParameterfv_signature;

def glGetConvolutionParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetConvolutionParameteriv glGetConvolutionParameteriv_signature;

def glGetSeparableFilter_signature func(target GLenum; format GLenum; type GLenum; row u8 ref; column u8 ref; span u8 ref);
var glGetSeparableFilter glGetSeparableFilter_signature;

def glSeparableFilter2D_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; row u8 ref; column u8 ref);
var glSeparableFilter2D glSeparableFilter2D_signature;

def glGetHistogram_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var glGetHistogram glGetHistogram_signature;

def glGetHistogramParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetHistogramParameterfv glGetHistogramParameterfv_signature;

def glGetHistogramParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetHistogramParameteriv glGetHistogramParameteriv_signature;

def glGetMinmax_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var glGetMinmax glGetMinmax_signature;

def glGetMinmaxParameterfv_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetMinmaxParameterfv glGetMinmaxParameterfv_signature;

def glGetMinmaxParameteriv_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetMinmaxParameteriv glGetMinmaxParameteriv_signature;

def glHistogram_signature func(target GLenum; width GLsizei; internalformat GLenum; sink GLboolean);
var glHistogram glHistogram_signature;

def glMinmax_signature func(target GLenum; internalformat GLenum; sink GLboolean);
var glMinmax glMinmax_signature;

def glResetHistogram_signature func(target GLenum);
var glResetHistogram glResetHistogram_signature;

def glResetMinmax_signature func(target GLenum);
var glResetMinmax glResetMinmax_signature;

def glMultiDrawArraysIndirectCountARB_signature func(mode GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var glMultiDrawArraysIndirectCountARB glMultiDrawArraysIndirectCountARB_signature;

def glMultiDrawElementsIndirectCountARB_signature func(mode GLenum; type GLenum; indirect u8 ref; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var glMultiDrawElementsIndirectCountARB glMultiDrawElementsIndirectCountARB_signature;

def glVertexAttribDivisorARB_signature func(index GLuint; divisor GLuint);
var glVertexAttribDivisorARB glVertexAttribDivisorARB_signature;

def glCurrentPaletteMatrixARB_signature func(index GLint);
var glCurrentPaletteMatrixARB glCurrentPaletteMatrixARB_signature;

def glMatrixIndexubvARB_signature func(size GLint; indices GLubyte ref);
var glMatrixIndexubvARB glMatrixIndexubvARB_signature;

def glMatrixIndexusvARB_signature func(size GLint; indices GLushort ref);
var glMatrixIndexusvARB glMatrixIndexusvARB_signature;

def glMatrixIndexuivARB_signature func(size GLint; indices GLuint ref);
var glMatrixIndexuivARB glMatrixIndexuivARB_signature;

def glMatrixIndexPointerARB_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glMatrixIndexPointerARB glMatrixIndexPointerARB_signature;

def glSampleCoverageARB_signature func(value GLfloat; invert GLboolean);
var glSampleCoverageARB glSampleCoverageARB_signature;

def glActiveTextureARB_signature func(texture GLenum);
var glActiveTextureARB glActiveTextureARB_signature;

def glClientActiveTextureARB_signature func(texture GLenum);
var glClientActiveTextureARB glClientActiveTextureARB_signature;

def glMultiTexCoord1dARB_signature func(target GLenum; s GLdouble);
var glMultiTexCoord1dARB glMultiTexCoord1dARB_signature;

def glMultiTexCoord1dvARB_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord1dvARB glMultiTexCoord1dvARB_signature;

def glMultiTexCoord1fARB_signature func(target GLenum; s GLfloat);
var glMultiTexCoord1fARB glMultiTexCoord1fARB_signature;

def glMultiTexCoord1fvARB_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord1fvARB glMultiTexCoord1fvARB_signature;

def glMultiTexCoord1iARB_signature func(target GLenum; s GLint);
var glMultiTexCoord1iARB glMultiTexCoord1iARB_signature;

def glMultiTexCoord1ivARB_signature func(target GLenum; v GLint ref);
var glMultiTexCoord1ivARB glMultiTexCoord1ivARB_signature;

def glMultiTexCoord1sARB_signature func(target GLenum; s GLshort);
var glMultiTexCoord1sARB glMultiTexCoord1sARB_signature;

def glMultiTexCoord1svARB_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord1svARB glMultiTexCoord1svARB_signature;

def glMultiTexCoord2dARB_signature func(target GLenum; s GLdouble; t GLdouble);
var glMultiTexCoord2dARB glMultiTexCoord2dARB_signature;

def glMultiTexCoord2dvARB_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord2dvARB glMultiTexCoord2dvARB_signature;

def glMultiTexCoord2fARB_signature func(target GLenum; s GLfloat; t GLfloat);
var glMultiTexCoord2fARB glMultiTexCoord2fARB_signature;

def glMultiTexCoord2fvARB_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord2fvARB glMultiTexCoord2fvARB_signature;

def glMultiTexCoord2iARB_signature func(target GLenum; s GLint; t GLint);
var glMultiTexCoord2iARB glMultiTexCoord2iARB_signature;

def glMultiTexCoord2ivARB_signature func(target GLenum; v GLint ref);
var glMultiTexCoord2ivARB glMultiTexCoord2ivARB_signature;

def glMultiTexCoord2sARB_signature func(target GLenum; s GLshort; t GLshort);
var glMultiTexCoord2sARB glMultiTexCoord2sARB_signature;

def glMultiTexCoord2svARB_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord2svARB glMultiTexCoord2svARB_signature;

def glMultiTexCoord3dARB_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble);
var glMultiTexCoord3dARB glMultiTexCoord3dARB_signature;

def glMultiTexCoord3dvARB_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord3dvARB glMultiTexCoord3dvARB_signature;

def glMultiTexCoord3fARB_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat);
var glMultiTexCoord3fARB glMultiTexCoord3fARB_signature;

def glMultiTexCoord3fvARB_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord3fvARB glMultiTexCoord3fvARB_signature;

def glMultiTexCoord3iARB_signature func(target GLenum; s GLint; t GLint; r GLint);
var glMultiTexCoord3iARB glMultiTexCoord3iARB_signature;

def glMultiTexCoord3ivARB_signature func(target GLenum; v GLint ref);
var glMultiTexCoord3ivARB glMultiTexCoord3ivARB_signature;

def glMultiTexCoord3sARB_signature func(target GLenum; s GLshort; t GLshort; r GLshort);
var glMultiTexCoord3sARB glMultiTexCoord3sARB_signature;

def glMultiTexCoord3svARB_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord3svARB glMultiTexCoord3svARB_signature;

def glMultiTexCoord4dARB_signature func(target GLenum; s GLdouble; t GLdouble; r GLdouble; q GLdouble);
var glMultiTexCoord4dARB glMultiTexCoord4dARB_signature;

def glMultiTexCoord4dvARB_signature func(target GLenum; v GLdouble ref);
var glMultiTexCoord4dvARB glMultiTexCoord4dvARB_signature;

def glMultiTexCoord4fARB_signature func(target GLenum; s GLfloat; t GLfloat; r GLfloat; q GLfloat);
var glMultiTexCoord4fARB glMultiTexCoord4fARB_signature;

def glMultiTexCoord4fvARB_signature func(target GLenum; v GLfloat ref);
var glMultiTexCoord4fvARB glMultiTexCoord4fvARB_signature;

def glMultiTexCoord4iARB_signature func(target GLenum; s GLint; t GLint; r GLint; q GLint);
var glMultiTexCoord4iARB glMultiTexCoord4iARB_signature;

def glMultiTexCoord4ivARB_signature func(target GLenum; v GLint ref);
var glMultiTexCoord4ivARB glMultiTexCoord4ivARB_signature;

def glMultiTexCoord4sARB_signature func(target GLenum; s GLshort; t GLshort; r GLshort; q GLshort);
var glMultiTexCoord4sARB glMultiTexCoord4sARB_signature;

def glMultiTexCoord4svARB_signature func(target GLenum; v GLshort ref);
var glMultiTexCoord4svARB glMultiTexCoord4svARB_signature;

def glGenQueriesARB_signature func(n GLsizei; ids GLuint ref);
var glGenQueriesARB glGenQueriesARB_signature;

def glDeleteQueriesARB_signature func(n GLsizei; ids GLuint ref);
var glDeleteQueriesARB glDeleteQueriesARB_signature;

def glIsQueryARB_signature func(id GLuint) (result GLboolean);
var glIsQueryARB glIsQueryARB_signature;

def glBeginQueryARB_signature func(target GLenum; id GLuint);
var glBeginQueryARB glBeginQueryARB_signature;

def glEndQueryARB_signature func(target GLenum);
var glEndQueryARB glEndQueryARB_signature;

def glGetQueryivARB_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetQueryivARB glGetQueryivARB_signature;

def glGetQueryObjectivARB_signature func(id GLuint; pname GLenum; params GLint ref);
var glGetQueryObjectivARB glGetQueryObjectivARB_signature;

def glGetQueryObjectuivARB_signature func(id GLuint; pname GLenum; params GLuint ref);
var glGetQueryObjectuivARB glGetQueryObjectuivARB_signature;

def glMaxShaderCompilerThreadsARB_signature func(count GLuint);
var glMaxShaderCompilerThreadsARB glMaxShaderCompilerThreadsARB_signature;

def glPointParameterfARB_signature func(pname GLenum; param GLfloat);
var glPointParameterfARB glPointParameterfARB_signature;

def glPointParameterfvARB_signature func(pname GLenum; params GLfloat ref);
var glPointParameterfvARB glPointParameterfvARB_signature;

def glGetGraphicsResetStatusARB_signature func() (result GLenum);
var glGetGraphicsResetStatusARB glGetGraphicsResetStatusARB_signature;

def glGetnTexImageARB_signature func(target GLenum; level GLint; format GLenum; type GLenum; bufSize GLsizei; img u8 ref);
var glGetnTexImageARB glGetnTexImageARB_signature;

def glReadnPixelsARB_signature func(x GLint; y GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; bufSize GLsizei; data u8 ref);
var glReadnPixelsARB glReadnPixelsARB_signature;

def glGetnCompressedTexImageARB_signature func(target GLenum; lod GLint; bufSize GLsizei; img u8 ref);
var glGetnCompressedTexImageARB glGetnCompressedTexImageARB_signature;

def glGetnUniformfvARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLfloat ref);
var glGetnUniformfvARB glGetnUniformfvARB_signature;

def glGetnUniformivARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLint ref);
var glGetnUniformivARB glGetnUniformivARB_signature;

def glGetnUniformuivARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLuint ref);
var glGetnUniformuivARB glGetnUniformuivARB_signature;

def glGetnUniformdvARB_signature func(program GLuint; location GLint; bufSize GLsizei; params GLdouble ref);
var glGetnUniformdvARB glGetnUniformdvARB_signature;

def glGetnMapdvARB_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLdouble ref);
var glGetnMapdvARB glGetnMapdvARB_signature;

def glGetnMapfvARB_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLfloat ref);
var glGetnMapfvARB glGetnMapfvARB_signature;

def glGetnMapivARB_signature func(target GLenum; query GLenum; bufSize GLsizei; v GLint ref);
var glGetnMapivARB glGetnMapivARB_signature;

def glGetnPixelMapfvARB_signature func(map GLenum; bufSize GLsizei; values GLfloat ref);
var glGetnPixelMapfvARB glGetnPixelMapfvARB_signature;

def glGetnPixelMapuivARB_signature func(map GLenum; bufSize GLsizei; values GLuint ref);
var glGetnPixelMapuivARB glGetnPixelMapuivARB_signature;

def glGetnPixelMapusvARB_signature func(map GLenum; bufSize GLsizei; values GLushort ref);
var glGetnPixelMapusvARB glGetnPixelMapusvARB_signature;

def glGetnPolygonStippleARB_signature func(bufSize GLsizei; pattern GLubyte ref);
var glGetnPolygonStippleARB glGetnPolygonStippleARB_signature;

def glGetnColorTableARB_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; table u8 ref);
var glGetnColorTableARB glGetnColorTableARB_signature;

def glGetnConvolutionFilterARB_signature func(target GLenum; format GLenum; type GLenum; bufSize GLsizei; image u8 ref);
var glGetnConvolutionFilterARB glGetnConvolutionFilterARB_signature;

def glGetnSeparableFilterARB_signature func(target GLenum; format GLenum; type GLenum; rowBufSize GLsizei; row u8 ref; columnBufSize GLsizei; column u8 ref; span u8 ref);
var glGetnSeparableFilterARB glGetnSeparableFilterARB_signature;

def glGetnHistogramARB_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var glGetnHistogramARB glGetnHistogramARB_signature;

def glGetnMinmaxARB_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; bufSize GLsizei; values u8 ref);
var glGetnMinmaxARB glGetnMinmaxARB_signature;

def glFramebufferSampleLocationsfvARB_signature func(target GLenum; start GLuint; count GLsizei; v GLfloat ref);
var glFramebufferSampleLocationsfvARB glFramebufferSampleLocationsfvARB_signature;

def glNamedFramebufferSampleLocationsfvARB_signature func(framebuffer GLuint; start GLuint; count GLsizei; v GLfloat ref);
var glNamedFramebufferSampleLocationsfvARB glNamedFramebufferSampleLocationsfvARB_signature;

def glEvaluateDepthValuesARB_signature func();
var glEvaluateDepthValuesARB glEvaluateDepthValuesARB_signature;

def glMinSampleShadingARB_signature func(value GLfloat);
var glMinSampleShadingARB glMinSampleShadingARB_signature;
def GLhandleARB = type u8 ref;
def GLhandleARB = type u32;
def GLcharARB = type u8;

def glDeleteObjectARB_signature func(obj GLhandleARB);
var glDeleteObjectARB glDeleteObjectARB_signature;

def glGetHandleARB_signature func(pname GLenum) (result GLhandleARB);
var glGetHandleARB glGetHandleARB_signature;

def glDetachObjectARB_signature func(containerObj GLhandleARB; attachedObj GLhandleARB);
var glDetachObjectARB glDetachObjectARB_signature;

def glCreateShaderObjectARB_signature func(shaderType GLenum) (result GLhandleARB);
var glCreateShaderObjectARB glCreateShaderObjectARB_signature;

def glShaderSourceARB_signature func(shaderObj GLhandleARB; count GLsizei; string GLcharARB ref ref; length GLint ref);
var glShaderSourceARB glShaderSourceARB_signature;

def glCompileShaderARB_signature func(shaderObj GLhandleARB);
var glCompileShaderARB glCompileShaderARB_signature;

def glCreateProgramObjectARB_signature func() (result GLhandleARB);
var glCreateProgramObjectARB glCreateProgramObjectARB_signature;

def glAttachObjectARB_signature func(containerObj GLhandleARB; obj GLhandleARB);
var glAttachObjectARB glAttachObjectARB_signature;

def glLinkProgramARB_signature func(programObj GLhandleARB);
var glLinkProgramARB glLinkProgramARB_signature;

def glUseProgramObjectARB_signature func(programObj GLhandleARB);
var glUseProgramObjectARB glUseProgramObjectARB_signature;

def glValidateProgramARB_signature func(programObj GLhandleARB);
var glValidateProgramARB glValidateProgramARB_signature;

def glUniform1fARB_signature func(location GLint; v0 GLfloat);
var glUniform1fARB glUniform1fARB_signature;

def glUniform2fARB_signature func(location GLint; v0 GLfloat; v1 GLfloat);
var glUniform2fARB glUniform2fARB_signature;

def glUniform3fARB_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var glUniform3fARB glUniform3fARB_signature;

def glUniform4fARB_signature func(location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var glUniform4fARB glUniform4fARB_signature;

def glUniform1iARB_signature func(location GLint; v0 GLint);
var glUniform1iARB glUniform1iARB_signature;

def glUniform2iARB_signature func(location GLint; v0 GLint; v1 GLint);
var glUniform2iARB glUniform2iARB_signature;

def glUniform3iARB_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint);
var glUniform3iARB glUniform3iARB_signature;

def glUniform4iARB_signature func(location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var glUniform4iARB glUniform4iARB_signature;

def glUniform1fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform1fvARB glUniform1fvARB_signature;

def glUniform2fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform2fvARB glUniform2fvARB_signature;

def glUniform3fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform3fvARB glUniform3fvARB_signature;

def glUniform4fvARB_signature func(location GLint; count GLsizei; value GLfloat ref);
var glUniform4fvARB glUniform4fvARB_signature;

def glUniform1ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform1ivARB glUniform1ivARB_signature;

def glUniform2ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform2ivARB glUniform2ivARB_signature;

def glUniform3ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform3ivARB glUniform3ivARB_signature;

def glUniform4ivARB_signature func(location GLint; count GLsizei; value GLint ref);
var glUniform4ivARB glUniform4ivARB_signature;

def glUniformMatrix2fvARB_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix2fvARB glUniformMatrix2fvARB_signature;

def glUniformMatrix3fvARB_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix3fvARB glUniformMatrix3fvARB_signature;

def glUniformMatrix4fvARB_signature func(location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glUniformMatrix4fvARB glUniformMatrix4fvARB_signature;

def glGetObjectParameterfvARB_signature func(obj GLhandleARB; pname GLenum; params GLfloat ref);
var glGetObjectParameterfvARB glGetObjectParameterfvARB_signature;

def glGetObjectParameterivARB_signature func(obj GLhandleARB; pname GLenum; params GLint ref);
var glGetObjectParameterivARB glGetObjectParameterivARB_signature;

def glGetInfoLogARB_signature func(obj GLhandleARB; maxLength GLsizei; length GLsizei ref; infoLog GLcharARB ref);
var glGetInfoLogARB glGetInfoLogARB_signature;

def glGetAttachedObjectsARB_signature func(containerObj GLhandleARB; maxCount GLsizei; count GLsizei ref; obj GLhandleARB ref);
var glGetAttachedObjectsARB glGetAttachedObjectsARB_signature;

def glGetUniformLocationARB_signature func(programObj GLhandleARB; name GLcharARB ref) (result GLint);
var glGetUniformLocationARB glGetUniformLocationARB_signature;

def glGetActiveUniformARB_signature func(programObj GLhandleARB; index GLuint; maxLength GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLcharARB ref);
var glGetActiveUniformARB glGetActiveUniformARB_signature;

def glGetUniformfvARB_signature func(programObj GLhandleARB; location GLint; params GLfloat ref);
var glGetUniformfvARB glGetUniformfvARB_signature;

def glGetUniformivARB_signature func(programObj GLhandleARB; location GLint; params GLint ref);
var glGetUniformivARB glGetUniformivARB_signature;

def glGetShaderSourceARB_signature func(obj GLhandleARB; maxLength GLsizei; length GLsizei ref; source GLcharARB ref);
var glGetShaderSourceARB glGetShaderSourceARB_signature;

def glNamedStringARB_signature func(type GLenum; namelen GLint; name GLchar ref; stringlen GLint; string GLchar ref);
var glNamedStringARB glNamedStringARB_signature;

def glDeleteNamedStringARB_signature func(namelen GLint; name GLchar ref);
var glDeleteNamedStringARB glDeleteNamedStringARB_signature;

def glCompileShaderIncludeARB_signature func(shader GLuint; count GLsizei; path GLchar ref ref; length GLint ref);
var glCompileShaderIncludeARB glCompileShaderIncludeARB_signature;

def glIsNamedStringARB_signature func(namelen GLint; name GLchar ref) (result GLboolean);
var glIsNamedStringARB glIsNamedStringARB_signature;

def glGetNamedStringARB_signature func(namelen GLint; name GLchar ref; bufSize GLsizei; stringlen GLint ref; string GLchar ref);
var glGetNamedStringARB glGetNamedStringARB_signature;

def glGetNamedStringivARB_signature func(namelen GLint; name GLchar ref; pname GLenum; params GLint ref);
var glGetNamedStringivARB glGetNamedStringivARB_signature;

def glBufferPageCommitmentARB_signature func(target GLenum; offset GLintptr; size GLsizeiptr; commit GLboolean);
var glBufferPageCommitmentARB glBufferPageCommitmentARB_signature;

def glNamedBufferPageCommitmentEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; commit GLboolean);
var glNamedBufferPageCommitmentEXT glNamedBufferPageCommitmentEXT_signature;

def glNamedBufferPageCommitmentARB_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; commit GLboolean);
var glNamedBufferPageCommitmentARB glNamedBufferPageCommitmentARB_signature;

def glTexPageCommitmentARB_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; commit GLboolean);
var glTexPageCommitmentARB glTexPageCommitmentARB_signature;

def glTexBufferARB_signature func(target GLenum; internalformat GLenum; buffer GLuint);
var glTexBufferARB glTexBufferARB_signature;

def glCompressedTexImage3DARB_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var glCompressedTexImage3DARB glCompressedTexImage3DARB_signature;

def glCompressedTexImage2DARB_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var glCompressedTexImage2DARB glCompressedTexImage2DARB_signature;

def glCompressedTexImage1DARB_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; data u8 ref);
var glCompressedTexImage1DARB glCompressedTexImage1DARB_signature;

def glCompressedTexSubImage3DARB_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTexSubImage3DARB glCompressedTexSubImage3DARB_signature;

def glCompressedTexSubImage2DARB_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTexSubImage2DARB glCompressedTexSubImage2DARB_signature;

def glCompressedTexSubImage1DARB_signature func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; data u8 ref);
var glCompressedTexSubImage1DARB glCompressedTexSubImage1DARB_signature;

def glGetCompressedTexImageARB_signature func(target GLenum; level GLint; img u8 ref);
var glGetCompressedTexImageARB glGetCompressedTexImageARB_signature;

def glLoadTransposeMatrixfARB_signature func(m GLfloat ref);
var glLoadTransposeMatrixfARB glLoadTransposeMatrixfARB_signature;

def glLoadTransposeMatrixdARB_signature func(m GLdouble ref);
var glLoadTransposeMatrixdARB glLoadTransposeMatrixdARB_signature;

def glMultTransposeMatrixfARB_signature func(m GLfloat ref);
var glMultTransposeMatrixfARB glMultTransposeMatrixfARB_signature;

def glMultTransposeMatrixdARB_signature func(m GLdouble ref);
var glMultTransposeMatrixdARB glMultTransposeMatrixdARB_signature;

def glWeightbvARB_signature func(size GLint; weights GLbyte ref);
var glWeightbvARB glWeightbvARB_signature;

def glWeightsvARB_signature func(size GLint; weights GLshort ref);
var glWeightsvARB glWeightsvARB_signature;

def glWeightivARB_signature func(size GLint; weights GLint ref);
var glWeightivARB glWeightivARB_signature;

def glWeightfvARB_signature func(size GLint; weights GLfloat ref);
var glWeightfvARB glWeightfvARB_signature;

def glWeightdvARB_signature func(size GLint; weights GLdouble ref);
var glWeightdvARB glWeightdvARB_signature;

def glWeightubvARB_signature func(size GLint; weights GLubyte ref);
var glWeightubvARB glWeightubvARB_signature;

def glWeightusvARB_signature func(size GLint; weights GLushort ref);
var glWeightusvARB glWeightusvARB_signature;

def glWeightuivARB_signature func(size GLint; weights GLuint ref);
var glWeightuivARB glWeightuivARB_signature;

def glWeightPointerARB_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glWeightPointerARB glWeightPointerARB_signature;

def glVertexBlendARB_signature func(count GLint);
var glVertexBlendARB glVertexBlendARB_signature;
def GLsizeiptrARB = type khronos_ssize_t;
def GLintptrARB = type khronos_intptr_t;

def glBindBufferARB_signature func(target GLenum; buffer GLuint);
var glBindBufferARB glBindBufferARB_signature;

def glDeleteBuffersARB_signature func(n GLsizei; buffers GLuint ref);
var glDeleteBuffersARB glDeleteBuffersARB_signature;

def glGenBuffersARB_signature func(n GLsizei; buffers GLuint ref);
var glGenBuffersARB glGenBuffersARB_signature;

def glIsBufferARB_signature func(buffer GLuint) (result GLboolean);
var glIsBufferARB glIsBufferARB_signature;

def glBufferDataARB_signature func(target GLenum; size GLsizeiptrARB; data u8 ref; usage GLenum);
var glBufferDataARB glBufferDataARB_signature;

def glBufferSubDataARB_signature func(target GLenum; offset GLintptrARB; size GLsizeiptrARB; data u8 ref);
var glBufferSubDataARB glBufferSubDataARB_signature;

def glGetBufferSubDataARB_signature func(target GLenum; offset GLintptrARB; size GLsizeiptrARB; data u8 ref);
var glGetBufferSubDataARB glGetBufferSubDataARB_signature;

def glMapBufferARB_signature func(target GLenum; access GLenum) (result u8 ref);
var glMapBufferARB glMapBufferARB_signature;

def glUnmapBufferARB_signature func(target GLenum) (result GLboolean);
var glUnmapBufferARB glUnmapBufferARB_signature;

def glGetBufferParameterivARB_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetBufferParameterivARB glGetBufferParameterivARB_signature;

def glGetBufferPointervARB_signature func(target GLenum; pname GLenum; params u8 ref ref);
var glGetBufferPointervARB glGetBufferPointervARB_signature;

def glVertexAttrib1dARB_signature func(index GLuint; x GLdouble);
var glVertexAttrib1dARB glVertexAttrib1dARB_signature;

def glVertexAttrib1dvARB_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib1dvARB glVertexAttrib1dvARB_signature;

def glVertexAttrib1fARB_signature func(index GLuint; x GLfloat);
var glVertexAttrib1fARB glVertexAttrib1fARB_signature;

def glVertexAttrib1fvARB_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib1fvARB glVertexAttrib1fvARB_signature;

def glVertexAttrib1sARB_signature func(index GLuint; x GLshort);
var glVertexAttrib1sARB glVertexAttrib1sARB_signature;

def glVertexAttrib1svARB_signature func(index GLuint; v GLshort ref);
var glVertexAttrib1svARB glVertexAttrib1svARB_signature;

def glVertexAttrib2dARB_signature func(index GLuint; x GLdouble; y GLdouble);
var glVertexAttrib2dARB glVertexAttrib2dARB_signature;

def glVertexAttrib2dvARB_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib2dvARB glVertexAttrib2dvARB_signature;

def glVertexAttrib2fARB_signature func(index GLuint; x GLfloat; y GLfloat);
var glVertexAttrib2fARB glVertexAttrib2fARB_signature;

def glVertexAttrib2fvARB_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib2fvARB glVertexAttrib2fvARB_signature;

def glVertexAttrib2sARB_signature func(index GLuint; x GLshort; y GLshort);
var glVertexAttrib2sARB glVertexAttrib2sARB_signature;

def glVertexAttrib2svARB_signature func(index GLuint; v GLshort ref);
var glVertexAttrib2svARB glVertexAttrib2svARB_signature;

def glVertexAttrib3dARB_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var glVertexAttrib3dARB glVertexAttrib3dARB_signature;

def glVertexAttrib3dvARB_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib3dvARB glVertexAttrib3dvARB_signature;

def glVertexAttrib3fARB_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat);
var glVertexAttrib3fARB glVertexAttrib3fARB_signature;

def glVertexAttrib3fvARB_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib3fvARB glVertexAttrib3fvARB_signature;

def glVertexAttrib3sARB_signature func(index GLuint; x GLshort; y GLshort; z GLshort);
var glVertexAttrib3sARB glVertexAttrib3sARB_signature;

def glVertexAttrib3svARB_signature func(index GLuint; v GLshort ref);
var glVertexAttrib3svARB glVertexAttrib3svARB_signature;

def glVertexAttrib4NbvARB_signature func(index GLuint; v GLbyte ref);
var glVertexAttrib4NbvARB glVertexAttrib4NbvARB_signature;

def glVertexAttrib4NivARB_signature func(index GLuint; v GLint ref);
var glVertexAttrib4NivARB glVertexAttrib4NivARB_signature;

def glVertexAttrib4NsvARB_signature func(index GLuint; v GLshort ref);
var glVertexAttrib4NsvARB glVertexAttrib4NsvARB_signature;

def glVertexAttrib4NubARB_signature func(index GLuint; x GLubyte; y GLubyte; z GLubyte; w GLubyte);
var glVertexAttrib4NubARB glVertexAttrib4NubARB_signature;

def glVertexAttrib4NubvARB_signature func(index GLuint; v GLubyte ref);
var glVertexAttrib4NubvARB glVertexAttrib4NubvARB_signature;

def glVertexAttrib4NuivARB_signature func(index GLuint; v GLuint ref);
var glVertexAttrib4NuivARB glVertexAttrib4NuivARB_signature;

def glVertexAttrib4NusvARB_signature func(index GLuint; v GLushort ref);
var glVertexAttrib4NusvARB glVertexAttrib4NusvARB_signature;

def glVertexAttrib4bvARB_signature func(index GLuint; v GLbyte ref);
var glVertexAttrib4bvARB glVertexAttrib4bvARB_signature;

def glVertexAttrib4dARB_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glVertexAttrib4dARB glVertexAttrib4dARB_signature;

def glVertexAttrib4dvARB_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib4dvARB glVertexAttrib4dvARB_signature;

def glVertexAttrib4fARB_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glVertexAttrib4fARB glVertexAttrib4fARB_signature;

def glVertexAttrib4fvARB_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib4fvARB glVertexAttrib4fvARB_signature;

def glVertexAttrib4ivARB_signature func(index GLuint; v GLint ref);
var glVertexAttrib4ivARB glVertexAttrib4ivARB_signature;

def glVertexAttrib4sARB_signature func(index GLuint; x GLshort; y GLshort; z GLshort; w GLshort);
var glVertexAttrib4sARB glVertexAttrib4sARB_signature;

def glVertexAttrib4svARB_signature func(index GLuint; v GLshort ref);
var glVertexAttrib4svARB glVertexAttrib4svARB_signature;

def glVertexAttrib4ubvARB_signature func(index GLuint; v GLubyte ref);
var glVertexAttrib4ubvARB glVertexAttrib4ubvARB_signature;

def glVertexAttrib4uivARB_signature func(index GLuint; v GLuint ref);
var glVertexAttrib4uivARB glVertexAttrib4uivARB_signature;

def glVertexAttrib4usvARB_signature func(index GLuint; v GLushort ref);
var glVertexAttrib4usvARB glVertexAttrib4usvARB_signature;

def glVertexAttribPointerARB_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; pointer u8 ref);
var glVertexAttribPointerARB glVertexAttribPointerARB_signature;

def glEnableVertexAttribArrayARB_signature func(index GLuint);
var glEnableVertexAttribArrayARB glEnableVertexAttribArrayARB_signature;

def glDisableVertexAttribArrayARB_signature func(index GLuint);
var glDisableVertexAttribArrayARB glDisableVertexAttribArrayARB_signature;

def glGetVertexAttribdvARB_signature func(index GLuint; pname GLenum; params GLdouble ref);
var glGetVertexAttribdvARB glGetVertexAttribdvARB_signature;

def glGetVertexAttribfvARB_signature func(index GLuint; pname GLenum; params GLfloat ref);
var glGetVertexAttribfvARB glGetVertexAttribfvARB_signature;

def glGetVertexAttribivARB_signature func(index GLuint; pname GLenum; params GLint ref);
var glGetVertexAttribivARB glGetVertexAttribivARB_signature;

def glGetVertexAttribPointervARB_signature func(index GLuint; pname GLenum; pointer u8 ref ref);
var glGetVertexAttribPointervARB glGetVertexAttribPointervARB_signature;

def glBindAttribLocationARB_signature func(programObj GLhandleARB; index GLuint; name GLcharARB ref);
var glBindAttribLocationARB glBindAttribLocationARB_signature;

def glGetActiveAttribARB_signature func(programObj GLhandleARB; index GLuint; maxLength GLsizei; length GLsizei ref; size GLint ref; type GLenum ref; name GLcharARB ref);
var glGetActiveAttribARB glGetActiveAttribARB_signature;

def glGetAttribLocationARB_signature func(programObj GLhandleARB; name GLcharARB ref) (result GLint);
var glGetAttribLocationARB glGetAttribLocationARB_signature;

def glDepthRangeArraydvNV_signature func(first GLuint; count GLsizei; v GLdouble ref);
var glDepthRangeArraydvNV glDepthRangeArraydvNV_signature;

def glDepthRangeIndexeddNV_signature func(index GLuint; n GLdouble; f GLdouble);
var glDepthRangeIndexeddNV glDepthRangeIndexeddNV_signature;

def glWindowPos2dARB_signature func(x GLdouble; y GLdouble);
var glWindowPos2dARB glWindowPos2dARB_signature;

def glWindowPos2dvARB_signature func(v GLdouble ref);
var glWindowPos2dvARB glWindowPos2dvARB_signature;

def glWindowPos2fARB_signature func(x GLfloat; y GLfloat);
var glWindowPos2fARB glWindowPos2fARB_signature;

def glWindowPos2fvARB_signature func(v GLfloat ref);
var glWindowPos2fvARB glWindowPos2fvARB_signature;

def glWindowPos2iARB_signature func(x GLint; y GLint);
var glWindowPos2iARB glWindowPos2iARB_signature;

def glWindowPos2ivARB_signature func(v GLint ref);
var glWindowPos2ivARB glWindowPos2ivARB_signature;

def glWindowPos2sARB_signature func(x GLshort; y GLshort);
var glWindowPos2sARB glWindowPos2sARB_signature;

def glWindowPos2svARB_signature func(v GLshort ref);
var glWindowPos2svARB glWindowPos2svARB_signature;

def glWindowPos3dARB_signature func(x GLdouble; y GLdouble; z GLdouble);
var glWindowPos3dARB glWindowPos3dARB_signature;

def glWindowPos3dvARB_signature func(v GLdouble ref);
var glWindowPos3dvARB glWindowPos3dvARB_signature;

def glWindowPos3fARB_signature func(x GLfloat; y GLfloat; z GLfloat);
var glWindowPos3fARB glWindowPos3fARB_signature;

def glWindowPos3fvARB_signature func(v GLfloat ref);
var glWindowPos3fvARB glWindowPos3fvARB_signature;

def glWindowPos3iARB_signature func(x GLint; y GLint; z GLint);
var glWindowPos3iARB glWindowPos3iARB_signature;

def glWindowPos3ivARB_signature func(v GLint ref);
var glWindowPos3ivARB glWindowPos3ivARB_signature;

def glWindowPos3sARB_signature func(x GLshort; y GLshort; z GLshort);
var glWindowPos3sARB glWindowPos3sARB_signature;

def glWindowPos3svARB_signature func(v GLshort ref);
var glWindowPos3svARB glWindowPos3svARB_signature;

def glBlendBarrierKHR_signature func();
var glBlendBarrierKHR glBlendBarrierKHR_signature;

def glMaxShaderCompilerThreadsKHR_signature func(count GLuint);
var glMaxShaderCompilerThreadsKHR glMaxShaderCompilerThreadsKHR_signature;

def glMultiTexCoord1bOES_signature func(texture GLenum; s GLbyte);
var glMultiTexCoord1bOES glMultiTexCoord1bOES_signature;

def glMultiTexCoord1bvOES_signature func(texture GLenum; coords GLbyte ref);
var glMultiTexCoord1bvOES glMultiTexCoord1bvOES_signature;

def glMultiTexCoord2bOES_signature func(texture GLenum; s GLbyte; t GLbyte);
var glMultiTexCoord2bOES glMultiTexCoord2bOES_signature;

def glMultiTexCoord2bvOES_signature func(texture GLenum; coords GLbyte ref);
var glMultiTexCoord2bvOES glMultiTexCoord2bvOES_signature;

def glMultiTexCoord3bOES_signature func(texture GLenum; s GLbyte; t GLbyte; r GLbyte);
var glMultiTexCoord3bOES glMultiTexCoord3bOES_signature;

def glMultiTexCoord3bvOES_signature func(texture GLenum; coords GLbyte ref);
var glMultiTexCoord3bvOES glMultiTexCoord3bvOES_signature;

def glMultiTexCoord4bOES_signature func(texture GLenum; s GLbyte; t GLbyte; r GLbyte; q GLbyte);
var glMultiTexCoord4bOES glMultiTexCoord4bOES_signature;

def glMultiTexCoord4bvOES_signature func(texture GLenum; coords GLbyte ref);
var glMultiTexCoord4bvOES glMultiTexCoord4bvOES_signature;

def glTexCoord1bOES_signature func(s GLbyte);
var glTexCoord1bOES glTexCoord1bOES_signature;

def glTexCoord1bvOES_signature func(coords GLbyte ref);
var glTexCoord1bvOES glTexCoord1bvOES_signature;

def glTexCoord2bOES_signature func(s GLbyte; t GLbyte);
var glTexCoord2bOES glTexCoord2bOES_signature;

def glTexCoord2bvOES_signature func(coords GLbyte ref);
var glTexCoord2bvOES glTexCoord2bvOES_signature;

def glTexCoord3bOES_signature func(s GLbyte; t GLbyte; r GLbyte);
var glTexCoord3bOES glTexCoord3bOES_signature;

def glTexCoord3bvOES_signature func(coords GLbyte ref);
var glTexCoord3bvOES glTexCoord3bvOES_signature;

def glTexCoord4bOES_signature func(s GLbyte; t GLbyte; r GLbyte; q GLbyte);
var glTexCoord4bOES glTexCoord4bOES_signature;

def glTexCoord4bvOES_signature func(coords GLbyte ref);
var glTexCoord4bvOES glTexCoord4bvOES_signature;

def glVertex2bOES_signature func(x GLbyte; y GLbyte);
var glVertex2bOES glVertex2bOES_signature;

def glVertex2bvOES_signature func(coords GLbyte ref);
var glVertex2bvOES glVertex2bvOES_signature;

def glVertex3bOES_signature func(x GLbyte; y GLbyte; z GLbyte);
var glVertex3bOES glVertex3bOES_signature;

def glVertex3bvOES_signature func(coords GLbyte ref);
var glVertex3bvOES glVertex3bvOES_signature;

def glVertex4bOES_signature func(x GLbyte; y GLbyte; z GLbyte; w GLbyte);
var glVertex4bOES glVertex4bOES_signature;

def glVertex4bvOES_signature func(coords GLbyte ref);
var glVertex4bvOES glVertex4bvOES_signature;
def GLfixed = type khronos_int32_t;

def glAlphaFuncxOES_signature func(func GLenum; ref GLfixed);
var glAlphaFuncxOES glAlphaFuncxOES_signature;

def glClearColorxOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var glClearColorxOES glClearColorxOES_signature;

def glClearDepthxOES_signature func(depth GLfixed);
var glClearDepthxOES glClearDepthxOES_signature;

def glClipPlanexOES_signature func(plane GLenum; equation GLfixed ref);
var glClipPlanexOES glClipPlanexOES_signature;

def glColor4xOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var glColor4xOES glColor4xOES_signature;

def glDepthRangexOES_signature func(n GLfixed; f GLfixed);
var glDepthRangexOES glDepthRangexOES_signature;

def glFogxOES_signature func(pname GLenum; param GLfixed);
var glFogxOES glFogxOES_signature;

def glFogxvOES_signature func(pname GLenum; param GLfixed ref);
var glFogxvOES glFogxvOES_signature;

def glFrustumxOES_signature func(l GLfixed; r GLfixed; b GLfixed; t GLfixed; n GLfixed; f GLfixed);
var glFrustumxOES glFrustumxOES_signature;

def glGetClipPlanexOES_signature func(plane GLenum; equation GLfixed ref);
var glGetClipPlanexOES glGetClipPlanexOES_signature;

def glGetFixedvOES_signature func(pname GLenum; params GLfixed ref);
var glGetFixedvOES glGetFixedvOES_signature;

def glGetTexEnvxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glGetTexEnvxvOES glGetTexEnvxvOES_signature;

def glGetTexParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glGetTexParameterxvOES glGetTexParameterxvOES_signature;

def glLightModelxOES_signature func(pname GLenum; param GLfixed);
var glLightModelxOES glLightModelxOES_signature;

def glLightModelxvOES_signature func(pname GLenum; param GLfixed ref);
var glLightModelxvOES glLightModelxvOES_signature;

def glLightxOES_signature func(light GLenum; pname GLenum; param GLfixed);
var glLightxOES glLightxOES_signature;

def glLightxvOES_signature func(light GLenum; pname GLenum; params GLfixed ref);
var glLightxvOES glLightxvOES_signature;

def glLineWidthxOES_signature func(width GLfixed);
var glLineWidthxOES glLineWidthxOES_signature;

def glLoadMatrixxOES_signature func(m GLfixed ref);
var glLoadMatrixxOES glLoadMatrixxOES_signature;

def glMaterialxOES_signature func(face GLenum; pname GLenum; param GLfixed);
var glMaterialxOES glMaterialxOES_signature;

def glMaterialxvOES_signature func(face GLenum; pname GLenum; param GLfixed ref);
var glMaterialxvOES glMaterialxvOES_signature;

def glMultMatrixxOES_signature func(m GLfixed ref);
var glMultMatrixxOES glMultMatrixxOES_signature;

def glMultiTexCoord4xOES_signature func(texture GLenum; s GLfixed; t GLfixed; r GLfixed; q GLfixed);
var glMultiTexCoord4xOES glMultiTexCoord4xOES_signature;

def glNormal3xOES_signature func(nx GLfixed; ny GLfixed; nz GLfixed);
var glNormal3xOES glNormal3xOES_signature;

def glOrthoxOES_signature func(l GLfixed; r GLfixed; b GLfixed; t GLfixed; n GLfixed; f GLfixed);
var glOrthoxOES glOrthoxOES_signature;

def glPointParameterxvOES_signature func(pname GLenum; params GLfixed ref);
var glPointParameterxvOES glPointParameterxvOES_signature;

def glPointSizexOES_signature func(size GLfixed);
var glPointSizexOES glPointSizexOES_signature;

def glPolygonOffsetxOES_signature func(factor GLfixed; units GLfixed);
var glPolygonOffsetxOES glPolygonOffsetxOES_signature;

def glRotatexOES_signature func(angle GLfixed; x GLfixed; y GLfixed; z GLfixed);
var glRotatexOES glRotatexOES_signature;

def glScalexOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var glScalexOES glScalexOES_signature;

def glTexEnvxOES_signature func(target GLenum; pname GLenum; param GLfixed);
var glTexEnvxOES glTexEnvxOES_signature;

def glTexEnvxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glTexEnvxvOES glTexEnvxvOES_signature;

def glTexParameterxOES_signature func(target GLenum; pname GLenum; param GLfixed);
var glTexParameterxOES glTexParameterxOES_signature;

def glTexParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glTexParameterxvOES glTexParameterxvOES_signature;

def glTranslatexOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var glTranslatexOES glTranslatexOES_signature;

def glAccumxOES_signature func(op GLenum; value GLfixed);
var glAccumxOES glAccumxOES_signature;

def glBitmapxOES_signature func(width GLsizei; height GLsizei; xorig GLfixed; yorig GLfixed; xmove GLfixed; ymove GLfixed; bitmap GLubyte ref);
var glBitmapxOES glBitmapxOES_signature;

def glBlendColorxOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var glBlendColorxOES glBlendColorxOES_signature;

def glClearAccumxOES_signature func(red GLfixed; green GLfixed; blue GLfixed; alpha GLfixed);
var glClearAccumxOES glClearAccumxOES_signature;

def glColor3xOES_signature func(red GLfixed; green GLfixed; blue GLfixed);
var glColor3xOES glColor3xOES_signature;

def glColor3xvOES_signature func(components GLfixed ref);
var glColor3xvOES glColor3xvOES_signature;

def glColor4xvOES_signature func(components GLfixed ref);
var glColor4xvOES glColor4xvOES_signature;

def glConvolutionParameterxOES_signature func(target GLenum; pname GLenum; param GLfixed);
var glConvolutionParameterxOES glConvolutionParameterxOES_signature;

def glConvolutionParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glConvolutionParameterxvOES glConvolutionParameterxvOES_signature;

def glEvalCoord1xOES_signature func(u GLfixed);
var glEvalCoord1xOES glEvalCoord1xOES_signature;

def glEvalCoord1xvOES_signature func(coords GLfixed ref);
var glEvalCoord1xvOES glEvalCoord1xvOES_signature;

def glEvalCoord2xOES_signature func(u GLfixed; v GLfixed);
var glEvalCoord2xOES glEvalCoord2xOES_signature;

def glEvalCoord2xvOES_signature func(coords GLfixed ref);
var glEvalCoord2xvOES glEvalCoord2xvOES_signature;

def glFeedbackBufferxOES_signature func(n GLsizei; type GLenum; buffer GLfixed ref);
var glFeedbackBufferxOES glFeedbackBufferxOES_signature;

def glGetConvolutionParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glGetConvolutionParameterxvOES glGetConvolutionParameterxvOES_signature;

def glGetHistogramParameterxvOES_signature func(target GLenum; pname GLenum; params GLfixed ref);
var glGetHistogramParameterxvOES glGetHistogramParameterxvOES_signature;

def glGetLightxOES_signature func(light GLenum; pname GLenum; params GLfixed ref);
var glGetLightxOES glGetLightxOES_signature;

def glGetMapxvOES_signature func(target GLenum; query GLenum; v GLfixed ref);
var glGetMapxvOES glGetMapxvOES_signature;

def glGetMaterialxOES_signature func(face GLenum; pname GLenum; param GLfixed);
var glGetMaterialxOES glGetMaterialxOES_signature;

def glGetPixelMapxv_signature func(map GLenum; size GLint; values GLfixed ref);
var glGetPixelMapxv glGetPixelMapxv_signature;

def glGetTexGenxvOES_signature func(coord GLenum; pname GLenum; params GLfixed ref);
var glGetTexGenxvOES glGetTexGenxvOES_signature;

def glGetTexLevelParameterxvOES_signature func(target GLenum; level GLint; pname GLenum; params GLfixed ref);
var glGetTexLevelParameterxvOES glGetTexLevelParameterxvOES_signature;

def glIndexxOES_signature func(component GLfixed);
var glIndexxOES glIndexxOES_signature;

def glIndexxvOES_signature func(component GLfixed ref);
var glIndexxvOES glIndexxvOES_signature;

def glLoadTransposeMatrixxOES_signature func(m GLfixed ref);
var glLoadTransposeMatrixxOES glLoadTransposeMatrixxOES_signature;

def glMap1xOES_signature func(target GLenum; u1 GLfixed; u2 GLfixed; stride GLint; order GLint; points GLfixed);
var glMap1xOES glMap1xOES_signature;

def glMap2xOES_signature func(target GLenum; u1 GLfixed; u2 GLfixed; ustride GLint; uorder GLint; v1 GLfixed; v2 GLfixed; vstride GLint; vorder GLint; points GLfixed);
var glMap2xOES glMap2xOES_signature;

def glMapGrid1xOES_signature func(n GLint; u1 GLfixed; u2 GLfixed);
var glMapGrid1xOES glMapGrid1xOES_signature;

def glMapGrid2xOES_signature func(n GLint; u1 GLfixed; u2 GLfixed; v1 GLfixed; v2 GLfixed);
var glMapGrid2xOES glMapGrid2xOES_signature;

def glMultTransposeMatrixxOES_signature func(m GLfixed ref);
var glMultTransposeMatrixxOES glMultTransposeMatrixxOES_signature;

def glMultiTexCoord1xOES_signature func(texture GLenum; s GLfixed);
var glMultiTexCoord1xOES glMultiTexCoord1xOES_signature;

def glMultiTexCoord1xvOES_signature func(texture GLenum; coords GLfixed ref);
var glMultiTexCoord1xvOES glMultiTexCoord1xvOES_signature;

def glMultiTexCoord2xOES_signature func(texture GLenum; s GLfixed; t GLfixed);
var glMultiTexCoord2xOES glMultiTexCoord2xOES_signature;

def glMultiTexCoord2xvOES_signature func(texture GLenum; coords GLfixed ref);
var glMultiTexCoord2xvOES glMultiTexCoord2xvOES_signature;

def glMultiTexCoord3xOES_signature func(texture GLenum; s GLfixed; t GLfixed; r GLfixed);
var glMultiTexCoord3xOES glMultiTexCoord3xOES_signature;

def glMultiTexCoord3xvOES_signature func(texture GLenum; coords GLfixed ref);
var glMultiTexCoord3xvOES glMultiTexCoord3xvOES_signature;

def glMultiTexCoord4xvOES_signature func(texture GLenum; coords GLfixed ref);
var glMultiTexCoord4xvOES glMultiTexCoord4xvOES_signature;

def glNormal3xvOES_signature func(coords GLfixed ref);
var glNormal3xvOES glNormal3xvOES_signature;

def glPassThroughxOES_signature func(token GLfixed);
var glPassThroughxOES glPassThroughxOES_signature;

def glPixelMapx_signature func(map GLenum; size GLint; values GLfixed ref);
var glPixelMapx glPixelMapx_signature;

def glPixelStorex_signature func(pname GLenum; param GLfixed);
var glPixelStorex glPixelStorex_signature;

def glPixelTransferxOES_signature func(pname GLenum; param GLfixed);
var glPixelTransferxOES glPixelTransferxOES_signature;

def glPixelZoomxOES_signature func(xfactor GLfixed; yfactor GLfixed);
var glPixelZoomxOES glPixelZoomxOES_signature;

def glPrioritizeTexturesxOES_signature func(n GLsizei; textures GLuint ref; priorities GLfixed ref);
var glPrioritizeTexturesxOES glPrioritizeTexturesxOES_signature;

def glRasterPos2xOES_signature func(x GLfixed; y GLfixed);
var glRasterPos2xOES glRasterPos2xOES_signature;

def glRasterPos2xvOES_signature func(coords GLfixed ref);
var glRasterPos2xvOES glRasterPos2xvOES_signature;

def glRasterPos3xOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var glRasterPos3xOES glRasterPos3xOES_signature;

def glRasterPos3xvOES_signature func(coords GLfixed ref);
var glRasterPos3xvOES glRasterPos3xvOES_signature;

def glRasterPos4xOES_signature func(x GLfixed; y GLfixed; z GLfixed; w GLfixed);
var glRasterPos4xOES glRasterPos4xOES_signature;

def glRasterPos4xvOES_signature func(coords GLfixed ref);
var glRasterPos4xvOES glRasterPos4xvOES_signature;

def glRectxOES_signature func(x1 GLfixed; y1 GLfixed; x2 GLfixed; y2 GLfixed);
var glRectxOES glRectxOES_signature;

def glRectxvOES_signature func(v1 GLfixed ref; v2 GLfixed ref);
var glRectxvOES glRectxvOES_signature;

def glTexCoord1xOES_signature func(s GLfixed);
var glTexCoord1xOES glTexCoord1xOES_signature;

def glTexCoord1xvOES_signature func(coords GLfixed ref);
var glTexCoord1xvOES glTexCoord1xvOES_signature;

def glTexCoord2xOES_signature func(s GLfixed; t GLfixed);
var glTexCoord2xOES glTexCoord2xOES_signature;

def glTexCoord2xvOES_signature func(coords GLfixed ref);
var glTexCoord2xvOES glTexCoord2xvOES_signature;

def glTexCoord3xOES_signature func(s GLfixed; t GLfixed; r GLfixed);
var glTexCoord3xOES glTexCoord3xOES_signature;

def glTexCoord3xvOES_signature func(coords GLfixed ref);
var glTexCoord3xvOES glTexCoord3xvOES_signature;

def glTexCoord4xOES_signature func(s GLfixed; t GLfixed; r GLfixed; q GLfixed);
var glTexCoord4xOES glTexCoord4xOES_signature;

def glTexCoord4xvOES_signature func(coords GLfixed ref);
var glTexCoord4xvOES glTexCoord4xvOES_signature;

def glTexGenxOES_signature func(coord GLenum; pname GLenum; param GLfixed);
var glTexGenxOES glTexGenxOES_signature;

def glTexGenxvOES_signature func(coord GLenum; pname GLenum; params GLfixed ref);
var glTexGenxvOES glTexGenxvOES_signature;

def glVertex2xOES_signature func(x GLfixed);
var glVertex2xOES glVertex2xOES_signature;

def glVertex2xvOES_signature func(coords GLfixed ref);
var glVertex2xvOES glVertex2xvOES_signature;

def glVertex3xOES_signature func(x GLfixed; y GLfixed);
var glVertex3xOES glVertex3xOES_signature;

def glVertex3xvOES_signature func(coords GLfixed ref);
var glVertex3xvOES glVertex3xvOES_signature;

def glVertex4xOES_signature func(x GLfixed; y GLfixed; z GLfixed);
var glVertex4xOES glVertex4xOES_signature;

def glVertex4xvOES_signature func(coords GLfixed ref);
var glVertex4xvOES glVertex4xvOES_signature;

def glQueryMatrixxOES_signature func(mantissa GLfixed ref; exponent GLint ref) (result GLbitfield);
var glQueryMatrixxOES glQueryMatrixxOES_signature;

def glClearDepthfOES_signature func(depth GLclampf);
var glClearDepthfOES glClearDepthfOES_signature;

def glClipPlanefOES_signature func(plane GLenum; equation GLfloat ref);
var glClipPlanefOES glClipPlanefOES_signature;

def glDepthRangefOES_signature func(n GLclampf; f GLclampf);
var glDepthRangefOES glDepthRangefOES_signature;

def glFrustumfOES_signature func(l GLfloat; r GLfloat; b GLfloat; t GLfloat; n GLfloat; f GLfloat);
var glFrustumfOES glFrustumfOES_signature;

def glGetClipPlanefOES_signature func(plane GLenum; equation GLfloat ref);
var glGetClipPlanefOES glGetClipPlanefOES_signature;

def glOrthofOES_signature func(l GLfloat; r GLfloat; b GLfloat; t GLfloat; n GLfloat; f GLfloat);
var glOrthofOES glOrthofOES_signature;

def glTbufferMask3DFX_signature func(mask GLuint);
var glTbufferMask3DFX glTbufferMask3DFX_signature;

def glDebugMessageEnableAMD_signature func(category GLenum; severity GLenum; count GLsizei; ids GLuint ref; enabled GLboolean);
var glDebugMessageEnableAMD glDebugMessageEnableAMD_signature;

def glDebugMessageInsertAMD_signature func(category GLenum; severity GLenum; id GLuint; length GLsizei; buf GLchar ref);
var glDebugMessageInsertAMD glDebugMessageInsertAMD_signature;

def glDebugMessageCallbackAMD_signature func(callback GLDEBUGPROCAMD; userParam u8 ref);
var glDebugMessageCallbackAMD glDebugMessageCallbackAMD_signature;

def glGetDebugMessageLogAMD_signature func(count GLuint; bufSize GLsizei; categories GLenum ref; severities GLuint ref; ids GLuint ref; lengths GLsizei ref; message GLchar ref) (result GLuint);
var glGetDebugMessageLogAMD glGetDebugMessageLogAMD_signature;

def glBlendFuncIndexedAMD_signature func(buf GLuint; src GLenum; dst GLenum);
var glBlendFuncIndexedAMD glBlendFuncIndexedAMD_signature;

def glBlendFuncSeparateIndexedAMD_signature func(buf GLuint; srcRGB GLenum; dstRGB GLenum; srcAlpha GLenum; dstAlpha GLenum);
var glBlendFuncSeparateIndexedAMD glBlendFuncSeparateIndexedAMD_signature;

def glBlendEquationIndexedAMD_signature func(buf GLuint; mode GLenum);
var glBlendEquationIndexedAMD glBlendEquationIndexedAMD_signature;

def glBlendEquationSeparateIndexedAMD_signature func(buf GLuint; modeRGB GLenum; modeAlpha GLenum);
var glBlendEquationSeparateIndexedAMD glBlendEquationSeparateIndexedAMD_signature;

def glRenderbufferStorageMultisampleAdvancedAMD_signature func(target GLenum; samples GLsizei; storageSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glRenderbufferStorageMultisampleAdvancedAMD glRenderbufferStorageMultisampleAdvancedAMD_signature;

def glNamedRenderbufferStorageMultisampleAdvancedAMD_signature func(renderbuffer GLuint; samples GLsizei; storageSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glNamedRenderbufferStorageMultisampleAdvancedAMD glNamedRenderbufferStorageMultisampleAdvancedAMD_signature;

def glFramebufferSamplePositionsfvAMD_signature func(target GLenum; numsamples GLuint; pixelindex GLuint; values GLfloat ref);
var glFramebufferSamplePositionsfvAMD glFramebufferSamplePositionsfvAMD_signature;

def glNamedFramebufferSamplePositionsfvAMD_signature func(framebuffer GLuint; numsamples GLuint; pixelindex GLuint; values GLfloat ref);
var glNamedFramebufferSamplePositionsfvAMD glNamedFramebufferSamplePositionsfvAMD_signature;

def glGetFramebufferParameterfvAMD_signature func(target GLenum; pname GLenum; numsamples GLuint; pixelindex GLuint; size GLsizei; values GLfloat ref);
var glGetFramebufferParameterfvAMD glGetFramebufferParameterfvAMD_signature;

def glGetNamedFramebufferParameterfvAMD_signature func(framebuffer GLuint; pname GLenum; numsamples GLuint; pixelindex GLuint; size GLsizei; values GLfloat ref);
var glGetNamedFramebufferParameterfvAMD glGetNamedFramebufferParameterfvAMD_signature;
def GLint64EXT = type khronos_int64_t;

def glUniform1i64NV_signature func(location GLint; x GLint64EXT);
var glUniform1i64NV glUniform1i64NV_signature;

def glUniform2i64NV_signature func(location GLint; x GLint64EXT; y GLint64EXT);
var glUniform2i64NV glUniform2i64NV_signature;

def glUniform3i64NV_signature func(location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT);
var glUniform3i64NV glUniform3i64NV_signature;

def glUniform4i64NV_signature func(location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT; w GLint64EXT);
var glUniform4i64NV glUniform4i64NV_signature;

def glUniform1i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var glUniform1i64vNV glUniform1i64vNV_signature;

def glUniform2i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var glUniform2i64vNV glUniform2i64vNV_signature;

def glUniform3i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var glUniform3i64vNV glUniform3i64vNV_signature;

def glUniform4i64vNV_signature func(location GLint; count GLsizei; value GLint64EXT ref);
var glUniform4i64vNV glUniform4i64vNV_signature;

def glUniform1ui64NV_signature func(location GLint; x GLuint64EXT);
var glUniform1ui64NV glUniform1ui64NV_signature;

def glUniform2ui64NV_signature func(location GLint; x GLuint64EXT; y GLuint64EXT);
var glUniform2ui64NV glUniform2ui64NV_signature;

def glUniform3ui64NV_signature func(location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT);
var glUniform3ui64NV glUniform3ui64NV_signature;

def glUniform4ui64NV_signature func(location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT; w GLuint64EXT);
var glUniform4ui64NV glUniform4ui64NV_signature;

def glUniform1ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var glUniform1ui64vNV glUniform1ui64vNV_signature;

def glUniform2ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var glUniform2ui64vNV glUniform2ui64vNV_signature;

def glUniform3ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var glUniform3ui64vNV glUniform3ui64vNV_signature;

def glUniform4ui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var glUniform4ui64vNV glUniform4ui64vNV_signature;

def glGetUniformi64vNV_signature func(program GLuint; location GLint; params GLint64EXT ref);
var glGetUniformi64vNV glGetUniformi64vNV_signature;

def glGetUniformui64vNV_signature func(program GLuint; location GLint; params GLuint64EXT ref);
var glGetUniformui64vNV glGetUniformui64vNV_signature;

def glProgramUniform1i64NV_signature func(program GLuint; location GLint; x GLint64EXT);
var glProgramUniform1i64NV glProgramUniform1i64NV_signature;

def glProgramUniform2i64NV_signature func(program GLuint; location GLint; x GLint64EXT; y GLint64EXT);
var glProgramUniform2i64NV glProgramUniform2i64NV_signature;

def glProgramUniform3i64NV_signature func(program GLuint; location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT);
var glProgramUniform3i64NV glProgramUniform3i64NV_signature;

def glProgramUniform4i64NV_signature func(program GLuint; location GLint; x GLint64EXT; y GLint64EXT; z GLint64EXT; w GLint64EXT);
var glProgramUniform4i64NV glProgramUniform4i64NV_signature;

def glProgramUniform1i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var glProgramUniform1i64vNV glProgramUniform1i64vNV_signature;

def glProgramUniform2i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var glProgramUniform2i64vNV glProgramUniform2i64vNV_signature;

def glProgramUniform3i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var glProgramUniform3i64vNV glProgramUniform3i64vNV_signature;

def glProgramUniform4i64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLint64EXT ref);
var glProgramUniform4i64vNV glProgramUniform4i64vNV_signature;

def glProgramUniform1ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT);
var glProgramUniform1ui64NV glProgramUniform1ui64NV_signature;

def glProgramUniform2ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT; y GLuint64EXT);
var glProgramUniform2ui64NV glProgramUniform2ui64NV_signature;

def glProgramUniform3ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT);
var glProgramUniform3ui64NV glProgramUniform3ui64NV_signature;

def glProgramUniform4ui64NV_signature func(program GLuint; location GLint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT; w GLuint64EXT);
var glProgramUniform4ui64NV glProgramUniform4ui64NV_signature;

def glProgramUniform1ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var glProgramUniform1ui64vNV glProgramUniform1ui64vNV_signature;

def glProgramUniform2ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var glProgramUniform2ui64vNV glProgramUniform2ui64vNV_signature;

def glProgramUniform3ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var glProgramUniform3ui64vNV glProgramUniform3ui64vNV_signature;

def glProgramUniform4ui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var glProgramUniform4ui64vNV glProgramUniform4ui64vNV_signature;

def glVertexAttribParameteriAMD_signature func(index GLuint; pname GLenum; param GLint);
var glVertexAttribParameteriAMD glVertexAttribParameteriAMD_signature;

def glMultiDrawArraysIndirectAMD_signature func(mode GLenum; indirect u8 ref; primcount GLsizei; stride GLsizei);
var glMultiDrawArraysIndirectAMD glMultiDrawArraysIndirectAMD_signature;

def glMultiDrawElementsIndirectAMD_signature func(mode GLenum; type GLenum; indirect u8 ref; primcount GLsizei; stride GLsizei);
var glMultiDrawElementsIndirectAMD glMultiDrawElementsIndirectAMD_signature;

def glGenNamesAMD_signature func(identifier GLenum; num GLuint; names GLuint ref);
var glGenNamesAMD glGenNamesAMD_signature;

def glDeleteNamesAMD_signature func(identifier GLenum; num GLuint; names GLuint ref);
var glDeleteNamesAMD glDeleteNamesAMD_signature;

def glIsNameAMD_signature func(identifier GLenum; name GLuint) (result GLboolean);
var glIsNameAMD glIsNameAMD_signature;

def glQueryObjectParameteruiAMD_signature func(target GLenum; id GLuint; pname GLenum; param GLuint);
var glQueryObjectParameteruiAMD glQueryObjectParameteruiAMD_signature;

def glGetPerfMonitorGroupsAMD_signature func(numGroups GLint ref; groupsSize GLsizei; groups GLuint ref);
var glGetPerfMonitorGroupsAMD glGetPerfMonitorGroupsAMD_signature;

def glGetPerfMonitorCountersAMD_signature func(group GLuint; numCounters GLint ref; maxActiveCounters GLint ref; counterSize GLsizei; counters GLuint ref);
var glGetPerfMonitorCountersAMD glGetPerfMonitorCountersAMD_signature;

def glGetPerfMonitorGroupStringAMD_signature func(group GLuint; bufSize GLsizei; length GLsizei ref; groupString GLchar ref);
var glGetPerfMonitorGroupStringAMD glGetPerfMonitorGroupStringAMD_signature;

def glGetPerfMonitorCounterStringAMD_signature func(group GLuint; counter GLuint; bufSize GLsizei; length GLsizei ref; counterString GLchar ref);
var glGetPerfMonitorCounterStringAMD glGetPerfMonitorCounterStringAMD_signature;

def glGetPerfMonitorCounterInfoAMD_signature func(group GLuint; counter GLuint; pname GLenum; data u8 ref);
var glGetPerfMonitorCounterInfoAMD glGetPerfMonitorCounterInfoAMD_signature;

def glGenPerfMonitorsAMD_signature func(n GLsizei; monitors GLuint ref);
var glGenPerfMonitorsAMD glGenPerfMonitorsAMD_signature;

def glDeletePerfMonitorsAMD_signature func(n GLsizei; monitors GLuint ref);
var glDeletePerfMonitorsAMD glDeletePerfMonitorsAMD_signature;

def glSelectPerfMonitorCountersAMD_signature func(monitor GLuint; enable GLboolean; group GLuint; numCounters GLint; counterList GLuint ref);
var glSelectPerfMonitorCountersAMD glSelectPerfMonitorCountersAMD_signature;

def glBeginPerfMonitorAMD_signature func(monitor GLuint);
var glBeginPerfMonitorAMD glBeginPerfMonitorAMD_signature;

def glEndPerfMonitorAMD_signature func(monitor GLuint);
var glEndPerfMonitorAMD glEndPerfMonitorAMD_signature;

def glGetPerfMonitorCounterDataAMD_signature func(monitor GLuint; pname GLenum; dataSize GLsizei; data GLuint ref; bytesWritten GLint ref);
var glGetPerfMonitorCounterDataAMD glGetPerfMonitorCounterDataAMD_signature;

def glSetMultisamplefvAMD_signature func(pname GLenum; index GLuint; val GLfloat ref);
var glSetMultisamplefvAMD glSetMultisamplefvAMD_signature;

def glTexStorageSparseAMD_signature func(target GLenum; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; layers GLsizei; flags GLbitfield);
var glTexStorageSparseAMD glTexStorageSparseAMD_signature;

def glTextureStorageSparseAMD_signature func(texture GLuint; target GLenum; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; layers GLsizei; flags GLbitfield);
var glTextureStorageSparseAMD glTextureStorageSparseAMD_signature;

def glStencilOpValueAMD_signature func(face GLenum; value GLuint);
var glStencilOpValueAMD glStencilOpValueAMD_signature;

def glTessellationFactorAMD_signature func(factor GLfloat);
var glTessellationFactorAMD glTessellationFactorAMD_signature;

def glTessellationModeAMD_signature func(mode GLenum);
var glTessellationModeAMD glTessellationModeAMD_signature;

def glElementPointerAPPLE_signature func(type GLenum; pointer u8 ref);
var glElementPointerAPPLE glElementPointerAPPLE_signature;

def glDrawElementArrayAPPLE_signature func(mode GLenum; first GLint; count GLsizei);
var glDrawElementArrayAPPLE glDrawElementArrayAPPLE_signature;

def glDrawRangeElementArrayAPPLE_signature func(mode GLenum; start GLuint; end GLuint; first GLint; count GLsizei);
var glDrawRangeElementArrayAPPLE glDrawRangeElementArrayAPPLE_signature;

def glMultiDrawElementArrayAPPLE_signature func(mode GLenum; first GLint ref; count GLsizei ref; primcount GLsizei);
var glMultiDrawElementArrayAPPLE glMultiDrawElementArrayAPPLE_signature;

def glMultiDrawRangeElementArrayAPPLE_signature func(mode GLenum; start GLuint; end GLuint; first GLint ref; count GLsizei ref; primcount GLsizei);
var glMultiDrawRangeElementArrayAPPLE glMultiDrawRangeElementArrayAPPLE_signature;

def glGenFencesAPPLE_signature func(n GLsizei; fences GLuint ref);
var glGenFencesAPPLE glGenFencesAPPLE_signature;

def glDeleteFencesAPPLE_signature func(n GLsizei; fences GLuint ref);
var glDeleteFencesAPPLE glDeleteFencesAPPLE_signature;

def glSetFenceAPPLE_signature func(fence GLuint);
var glSetFenceAPPLE glSetFenceAPPLE_signature;

def glIsFenceAPPLE_signature func(fence GLuint) (result GLboolean);
var glIsFenceAPPLE glIsFenceAPPLE_signature;

def glTestFenceAPPLE_signature func(fence GLuint) (result GLboolean);
var glTestFenceAPPLE glTestFenceAPPLE_signature;

def glFinishFenceAPPLE_signature func(fence GLuint);
var glFinishFenceAPPLE glFinishFenceAPPLE_signature;

def glTestObjectAPPLE_signature func(object GLenum; name GLuint) (result GLboolean);
var glTestObjectAPPLE glTestObjectAPPLE_signature;

def glFinishObjectAPPLE_signature func(object GLenum; name GLint);
var glFinishObjectAPPLE glFinishObjectAPPLE_signature;

def glBufferParameteriAPPLE_signature func(target GLenum; pname GLenum; param GLint);
var glBufferParameteriAPPLE glBufferParameteriAPPLE_signature;

def glFlushMappedBufferRangeAPPLE_signature func(target GLenum; offset GLintptr; size GLsizeiptr);
var glFlushMappedBufferRangeAPPLE glFlushMappedBufferRangeAPPLE_signature;

def glObjectPurgeableAPPLE_signature func(objectType GLenum; name GLuint; option GLenum) (result GLenum);
var glObjectPurgeableAPPLE glObjectPurgeableAPPLE_signature;

def glObjectUnpurgeableAPPLE_signature func(objectType GLenum; name GLuint; option GLenum) (result GLenum);
var glObjectUnpurgeableAPPLE glObjectUnpurgeableAPPLE_signature;

def glGetObjectParameterivAPPLE_signature func(objectType GLenum; name GLuint; pname GLenum; params GLint ref);
var glGetObjectParameterivAPPLE glGetObjectParameterivAPPLE_signature;

def glTextureRangeAPPLE_signature func(target GLenum; length GLsizei; pointer u8 ref);
var glTextureRangeAPPLE glTextureRangeAPPLE_signature;

def glGetTexParameterPointervAPPLE_signature func(target GLenum; pname GLenum; params u8 ref ref);
var glGetTexParameterPointervAPPLE glGetTexParameterPointervAPPLE_signature;

def glBindVertexArrayAPPLE_signature func(array GLuint);
var glBindVertexArrayAPPLE glBindVertexArrayAPPLE_signature;

def glDeleteVertexArraysAPPLE_signature func(n GLsizei; arrays GLuint ref);
var glDeleteVertexArraysAPPLE glDeleteVertexArraysAPPLE_signature;

def glGenVertexArraysAPPLE_signature func(n GLsizei; arrays GLuint ref);
var glGenVertexArraysAPPLE glGenVertexArraysAPPLE_signature;

def glIsVertexArrayAPPLE_signature func(array GLuint) (result GLboolean);
var glIsVertexArrayAPPLE glIsVertexArrayAPPLE_signature;

def glVertexArrayRangeAPPLE_signature func(length GLsizei; pointer u8 ref);
var glVertexArrayRangeAPPLE glVertexArrayRangeAPPLE_signature;

def glFlushVertexArrayRangeAPPLE_signature func(length GLsizei; pointer u8 ref);
var glFlushVertexArrayRangeAPPLE glFlushVertexArrayRangeAPPLE_signature;

def glVertexArrayParameteriAPPLE_signature func(pname GLenum; param GLint);
var glVertexArrayParameteriAPPLE glVertexArrayParameteriAPPLE_signature;

def glEnableVertexAttribAPPLE_signature func(index GLuint; pname GLenum);
var glEnableVertexAttribAPPLE glEnableVertexAttribAPPLE_signature;

def glDisableVertexAttribAPPLE_signature func(index GLuint; pname GLenum);
var glDisableVertexAttribAPPLE glDisableVertexAttribAPPLE_signature;

def glIsVertexAttribEnabledAPPLE_signature func(index GLuint; pname GLenum) (result GLboolean);
var glIsVertexAttribEnabledAPPLE glIsVertexAttribEnabledAPPLE_signature;

def glMapVertexAttrib1dAPPLE_signature func(index GLuint; size GLuint; u1 GLdouble; u2 GLdouble; stride GLint; order GLint; points GLdouble ref);
var glMapVertexAttrib1dAPPLE glMapVertexAttrib1dAPPLE_signature;

def glMapVertexAttrib1fAPPLE_signature func(index GLuint; size GLuint; u1 GLfloat; u2 GLfloat; stride GLint; order GLint; points GLfloat ref);
var glMapVertexAttrib1fAPPLE glMapVertexAttrib1fAPPLE_signature;

def glMapVertexAttrib2dAPPLE_signature func(index GLuint; size GLuint; u1 GLdouble; u2 GLdouble; ustride GLint; uorder GLint; v1 GLdouble; v2 GLdouble; vstride GLint; vorder GLint; points GLdouble ref);
var glMapVertexAttrib2dAPPLE glMapVertexAttrib2dAPPLE_signature;

def glMapVertexAttrib2fAPPLE_signature func(index GLuint; size GLuint; u1 GLfloat; u2 GLfloat; ustride GLint; uorder GLint; v1 GLfloat; v2 GLfloat; vstride GLint; vorder GLint; points GLfloat ref);
var glMapVertexAttrib2fAPPLE glMapVertexAttrib2fAPPLE_signature;

def glDrawBuffersATI_signature func(n GLsizei; bufs GLenum ref);
var glDrawBuffersATI glDrawBuffersATI_signature;

def glElementPointerATI_signature func(type GLenum; pointer u8 ref);
var glElementPointerATI glElementPointerATI_signature;

def glDrawElementArrayATI_signature func(mode GLenum; count GLsizei);
var glDrawElementArrayATI glDrawElementArrayATI_signature;

def glDrawRangeElementArrayATI_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei);
var glDrawRangeElementArrayATI glDrawRangeElementArrayATI_signature;

def glTexBumpParameterivATI_signature func(pname GLenum; param GLint ref);
var glTexBumpParameterivATI glTexBumpParameterivATI_signature;

def glTexBumpParameterfvATI_signature func(pname GLenum; param GLfloat ref);
var glTexBumpParameterfvATI glTexBumpParameterfvATI_signature;

def glGetTexBumpParameterivATI_signature func(pname GLenum; param GLint ref);
var glGetTexBumpParameterivATI glGetTexBumpParameterivATI_signature;

def glGetTexBumpParameterfvATI_signature func(pname GLenum; param GLfloat ref);
var glGetTexBumpParameterfvATI glGetTexBumpParameterfvATI_signature;

def glGenFragmentShadersATI_signature func(range GLuint) (result GLuint);
var glGenFragmentShadersATI glGenFragmentShadersATI_signature;

def glBindFragmentShaderATI_signature func(id GLuint);
var glBindFragmentShaderATI glBindFragmentShaderATI_signature;

def glDeleteFragmentShaderATI_signature func(id GLuint);
var glDeleteFragmentShaderATI glDeleteFragmentShaderATI_signature;

def glBeginFragmentShaderATI_signature func();
var glBeginFragmentShaderATI glBeginFragmentShaderATI_signature;

def glEndFragmentShaderATI_signature func();
var glEndFragmentShaderATI glEndFragmentShaderATI_signature;

def glPassTexCoordATI_signature func(dst GLuint; coord GLuint; swizzle GLenum);
var glPassTexCoordATI glPassTexCoordATI_signature;

def glSampleMapATI_signature func(dst GLuint; interp GLuint; swizzle GLenum);
var glSampleMapATI glSampleMapATI_signature;

def glColorFragmentOp1ATI_signature func(op GLenum; dst GLuint; dstMask GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint);
var glColorFragmentOp1ATI glColorFragmentOp1ATI_signature;

def glColorFragmentOp2ATI_signature func(op GLenum; dst GLuint; dstMask GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint);
var glColorFragmentOp2ATI glColorFragmentOp2ATI_signature;

def glColorFragmentOp3ATI_signature func(op GLenum; dst GLuint; dstMask GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint; arg3 GLuint; arg3Rep GLuint; arg3Mod GLuint);
var glColorFragmentOp3ATI glColorFragmentOp3ATI_signature;

def glAlphaFragmentOp1ATI_signature func(op GLenum; dst GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint);
var glAlphaFragmentOp1ATI glAlphaFragmentOp1ATI_signature;

def glAlphaFragmentOp2ATI_signature func(op GLenum; dst GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint);
var glAlphaFragmentOp2ATI glAlphaFragmentOp2ATI_signature;

def glAlphaFragmentOp3ATI_signature func(op GLenum; dst GLuint; dstMod GLuint; arg1 GLuint; arg1Rep GLuint; arg1Mod GLuint; arg2 GLuint; arg2Rep GLuint; arg2Mod GLuint; arg3 GLuint; arg3Rep GLuint; arg3Mod GLuint);
var glAlphaFragmentOp3ATI glAlphaFragmentOp3ATI_signature;

def glSetFragmentShaderConstantATI_signature func(dst GLuint; value GLfloat ref);
var glSetFragmentShaderConstantATI glSetFragmentShaderConstantATI_signature;

def glMapObjectBufferATI_signature func(buffer GLuint) (result u8 ref);
var glMapObjectBufferATI glMapObjectBufferATI_signature;

def glUnmapObjectBufferATI_signature func(buffer GLuint);
var glUnmapObjectBufferATI glUnmapObjectBufferATI_signature;

def glPNTrianglesiATI_signature func(pname GLenum; param GLint);
var glPNTrianglesiATI glPNTrianglesiATI_signature;

def glPNTrianglesfATI_signature func(pname GLenum; param GLfloat);
var glPNTrianglesfATI glPNTrianglesfATI_signature;

def glStencilOpSeparateATI_signature func(face GLenum; sfail GLenum; dpfail GLenum; dppass GLenum);
var glStencilOpSeparateATI glStencilOpSeparateATI_signature;

def glStencilFuncSeparateATI_signature func(frontfunc GLenum; backfunc GLenum; ref GLint; mask GLuint);
var glStencilFuncSeparateATI glStencilFuncSeparateATI_signature;

def glNewObjectBufferATI_signature func(size GLsizei; pointer u8 ref; usage GLenum) (result GLuint);
var glNewObjectBufferATI glNewObjectBufferATI_signature;

def glIsObjectBufferATI_signature func(buffer GLuint) (result GLboolean);
var glIsObjectBufferATI glIsObjectBufferATI_signature;

def glUpdateObjectBufferATI_signature func(buffer GLuint; offset GLuint; size GLsizei; pointer u8 ref; preserve GLenum);
var glUpdateObjectBufferATI glUpdateObjectBufferATI_signature;

def glGetObjectBufferfvATI_signature func(buffer GLuint; pname GLenum; params GLfloat ref);
var glGetObjectBufferfvATI glGetObjectBufferfvATI_signature;

def glGetObjectBufferivATI_signature func(buffer GLuint; pname GLenum; params GLint ref);
var glGetObjectBufferivATI glGetObjectBufferivATI_signature;

def glFreeObjectBufferATI_signature func(buffer GLuint);
var glFreeObjectBufferATI glFreeObjectBufferATI_signature;

def glArrayObjectATI_signature func(array GLenum; size GLint; type GLenum; stride GLsizei; buffer GLuint; offset GLuint);
var glArrayObjectATI glArrayObjectATI_signature;

def glGetArrayObjectfvATI_signature func(array GLenum; pname GLenum; params GLfloat ref);
var glGetArrayObjectfvATI glGetArrayObjectfvATI_signature;

def glGetArrayObjectivATI_signature func(array GLenum; pname GLenum; params GLint ref);
var glGetArrayObjectivATI glGetArrayObjectivATI_signature;

def glVariantArrayObjectATI_signature func(id GLuint; type GLenum; stride GLsizei; buffer GLuint; offset GLuint);
var glVariantArrayObjectATI glVariantArrayObjectATI_signature;

def glGetVariantArrayObjectfvATI_signature func(id GLuint; pname GLenum; params GLfloat ref);
var glGetVariantArrayObjectfvATI glGetVariantArrayObjectfvATI_signature;

def glGetVariantArrayObjectivATI_signature func(id GLuint; pname GLenum; params GLint ref);
var glGetVariantArrayObjectivATI glGetVariantArrayObjectivATI_signature;

def glVertexAttribArrayObjectATI_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; buffer GLuint; offset GLuint);
var glVertexAttribArrayObjectATI glVertexAttribArrayObjectATI_signature;

def glGetVertexAttribArrayObjectfvATI_signature func(index GLuint; pname GLenum; params GLfloat ref);
var glGetVertexAttribArrayObjectfvATI glGetVertexAttribArrayObjectfvATI_signature;

def glGetVertexAttribArrayObjectivATI_signature func(index GLuint; pname GLenum; params GLint ref);
var glGetVertexAttribArrayObjectivATI glGetVertexAttribArrayObjectivATI_signature;

def glVertexStream1sATI_signature func(stream GLenum; x GLshort);
var glVertexStream1sATI glVertexStream1sATI_signature;

def glVertexStream1svATI_signature func(stream GLenum; coords GLshort ref);
var glVertexStream1svATI glVertexStream1svATI_signature;

def glVertexStream1iATI_signature func(stream GLenum; x GLint);
var glVertexStream1iATI glVertexStream1iATI_signature;

def glVertexStream1ivATI_signature func(stream GLenum; coords GLint ref);
var glVertexStream1ivATI glVertexStream1ivATI_signature;

def glVertexStream1fATI_signature func(stream GLenum; x GLfloat);
var glVertexStream1fATI glVertexStream1fATI_signature;

def glVertexStream1fvATI_signature func(stream GLenum; coords GLfloat ref);
var glVertexStream1fvATI glVertexStream1fvATI_signature;

def glVertexStream1dATI_signature func(stream GLenum; x GLdouble);
var glVertexStream1dATI glVertexStream1dATI_signature;

def glVertexStream1dvATI_signature func(stream GLenum; coords GLdouble ref);
var glVertexStream1dvATI glVertexStream1dvATI_signature;

def glVertexStream2sATI_signature func(stream GLenum; x GLshort; y GLshort);
var glVertexStream2sATI glVertexStream2sATI_signature;

def glVertexStream2svATI_signature func(stream GLenum; coords GLshort ref);
var glVertexStream2svATI glVertexStream2svATI_signature;

def glVertexStream2iATI_signature func(stream GLenum; x GLint; y GLint);
var glVertexStream2iATI glVertexStream2iATI_signature;

def glVertexStream2ivATI_signature func(stream GLenum; coords GLint ref);
var glVertexStream2ivATI glVertexStream2ivATI_signature;

def glVertexStream2fATI_signature func(stream GLenum; x GLfloat; y GLfloat);
var glVertexStream2fATI glVertexStream2fATI_signature;

def glVertexStream2fvATI_signature func(stream GLenum; coords GLfloat ref);
var glVertexStream2fvATI glVertexStream2fvATI_signature;

def glVertexStream2dATI_signature func(stream GLenum; x GLdouble; y GLdouble);
var glVertexStream2dATI glVertexStream2dATI_signature;

def glVertexStream2dvATI_signature func(stream GLenum; coords GLdouble ref);
var glVertexStream2dvATI glVertexStream2dvATI_signature;

def glVertexStream3sATI_signature func(stream GLenum; x GLshort; y GLshort; z GLshort);
var glVertexStream3sATI glVertexStream3sATI_signature;

def glVertexStream3svATI_signature func(stream GLenum; coords GLshort ref);
var glVertexStream3svATI glVertexStream3svATI_signature;

def glVertexStream3iATI_signature func(stream GLenum; x GLint; y GLint; z GLint);
var glVertexStream3iATI glVertexStream3iATI_signature;

def glVertexStream3ivATI_signature func(stream GLenum; coords GLint ref);
var glVertexStream3ivATI glVertexStream3ivATI_signature;

def glVertexStream3fATI_signature func(stream GLenum; x GLfloat; y GLfloat; z GLfloat);
var glVertexStream3fATI glVertexStream3fATI_signature;

def glVertexStream3fvATI_signature func(stream GLenum; coords GLfloat ref);
var glVertexStream3fvATI glVertexStream3fvATI_signature;

def glVertexStream3dATI_signature func(stream GLenum; x GLdouble; y GLdouble; z GLdouble);
var glVertexStream3dATI glVertexStream3dATI_signature;

def glVertexStream3dvATI_signature func(stream GLenum; coords GLdouble ref);
var glVertexStream3dvATI glVertexStream3dvATI_signature;

def glVertexStream4sATI_signature func(stream GLenum; x GLshort; y GLshort; z GLshort; w GLshort);
var glVertexStream4sATI glVertexStream4sATI_signature;

def glVertexStream4svATI_signature func(stream GLenum; coords GLshort ref);
var glVertexStream4svATI glVertexStream4svATI_signature;

def glVertexStream4iATI_signature func(stream GLenum; x GLint; y GLint; z GLint; w GLint);
var glVertexStream4iATI glVertexStream4iATI_signature;

def glVertexStream4ivATI_signature func(stream GLenum; coords GLint ref);
var glVertexStream4ivATI glVertexStream4ivATI_signature;

def glVertexStream4fATI_signature func(stream GLenum; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glVertexStream4fATI glVertexStream4fATI_signature;

def glVertexStream4fvATI_signature func(stream GLenum; coords GLfloat ref);
var glVertexStream4fvATI glVertexStream4fvATI_signature;

def glVertexStream4dATI_signature func(stream GLenum; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glVertexStream4dATI glVertexStream4dATI_signature;

def glVertexStream4dvATI_signature func(stream GLenum; coords GLdouble ref);
var glVertexStream4dvATI glVertexStream4dvATI_signature;

def glNormalStream3bATI_signature func(stream GLenum; nx GLbyte; ny GLbyte; nz GLbyte);
var glNormalStream3bATI glNormalStream3bATI_signature;

def glNormalStream3bvATI_signature func(stream GLenum; coords GLbyte ref);
var glNormalStream3bvATI glNormalStream3bvATI_signature;

def glNormalStream3sATI_signature func(stream GLenum; nx GLshort; ny GLshort; nz GLshort);
var glNormalStream3sATI glNormalStream3sATI_signature;

def glNormalStream3svATI_signature func(stream GLenum; coords GLshort ref);
var glNormalStream3svATI glNormalStream3svATI_signature;

def glNormalStream3iATI_signature func(stream GLenum; nx GLint; ny GLint; nz GLint);
var glNormalStream3iATI glNormalStream3iATI_signature;

def glNormalStream3ivATI_signature func(stream GLenum; coords GLint ref);
var glNormalStream3ivATI glNormalStream3ivATI_signature;

def glNormalStream3fATI_signature func(stream GLenum; nx GLfloat; ny GLfloat; nz GLfloat);
var glNormalStream3fATI glNormalStream3fATI_signature;

def glNormalStream3fvATI_signature func(stream GLenum; coords GLfloat ref);
var glNormalStream3fvATI glNormalStream3fvATI_signature;

def glNormalStream3dATI_signature func(stream GLenum; nx GLdouble; ny GLdouble; nz GLdouble);
var glNormalStream3dATI glNormalStream3dATI_signature;

def glNormalStream3dvATI_signature func(stream GLenum; coords GLdouble ref);
var glNormalStream3dvATI glNormalStream3dvATI_signature;

def glClientActiveVertexStreamATI_signature func(stream GLenum);
var glClientActiveVertexStreamATI glClientActiveVertexStreamATI_signature;

def glVertexBlendEnviATI_signature func(pname GLenum; param GLint);
var glVertexBlendEnviATI glVertexBlendEnviATI_signature;

def glVertexBlendEnvfATI_signature func(pname GLenum; param GLfloat);
var glVertexBlendEnvfATI glVertexBlendEnvfATI_signature;
def GLeglImageOES = type u8 ref;

def glEGLImageTargetTexStorageEXT_signature func(target GLenum; image GLeglImageOES; attrib_list GLint ref);
var glEGLImageTargetTexStorageEXT glEGLImageTargetTexStorageEXT_signature;

def glEGLImageTargetTextureStorageEXT_signature func(texture GLuint; image GLeglImageOES; attrib_list GLint ref);
var glEGLImageTargetTextureStorageEXT glEGLImageTargetTextureStorageEXT_signature;

def glUniformBufferEXT_signature func(program GLuint; location GLint; buffer GLuint);
var glUniformBufferEXT glUniformBufferEXT_signature;

def glGetUniformBufferSizeEXT_signature func(program GLuint; location GLint) (result GLint);
var glGetUniformBufferSizeEXT glGetUniformBufferSizeEXT_signature;

def glGetUniformOffsetEXT_signature func(program GLuint; location GLint) (result GLintptr);
var glGetUniformOffsetEXT glGetUniformOffsetEXT_signature;

def glBlendColorEXT_signature func(red GLfloat; green GLfloat; blue GLfloat; alpha GLfloat);
var glBlendColorEXT glBlendColorEXT_signature;

def glBlendEquationSeparateEXT_signature func(modeRGB GLenum; modeAlpha GLenum);
var glBlendEquationSeparateEXT glBlendEquationSeparateEXT_signature;

def glBlendFuncSeparateEXT_signature func(sfactorRGB GLenum; dfactorRGB GLenum; sfactorAlpha GLenum; dfactorAlpha GLenum);
var glBlendFuncSeparateEXT glBlendFuncSeparateEXT_signature;

def glBlendEquationEXT_signature func(mode GLenum);
var glBlendEquationEXT glBlendEquationEXT_signature;

def glColorSubTableEXT_signature func(target GLenum; start GLsizei; count GLsizei; format GLenum; type GLenum; data u8 ref);
var glColorSubTableEXT glColorSubTableEXT_signature;

def glCopyColorSubTableEXT_signature func(target GLenum; start GLsizei; x GLint; y GLint; width GLsizei);
var glCopyColorSubTableEXT glCopyColorSubTableEXT_signature;

def glLockArraysEXT_signature func(first GLint; count GLsizei);
var glLockArraysEXT glLockArraysEXT_signature;

def glUnlockArraysEXT_signature func();
var glUnlockArraysEXT glUnlockArraysEXT_signature;

def glConvolutionFilter1DEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; image u8 ref);
var glConvolutionFilter1DEXT glConvolutionFilter1DEXT_signature;

def glConvolutionFilter2DEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; image u8 ref);
var glConvolutionFilter2DEXT glConvolutionFilter2DEXT_signature;

def glConvolutionParameterfEXT_signature func(target GLenum; pname GLenum; params GLfloat);
var glConvolutionParameterfEXT glConvolutionParameterfEXT_signature;

def glConvolutionParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glConvolutionParameterfvEXT glConvolutionParameterfvEXT_signature;

def glConvolutionParameteriEXT_signature func(target GLenum; pname GLenum; params GLint);
var glConvolutionParameteriEXT glConvolutionParameteriEXT_signature;

def glConvolutionParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glConvolutionParameterivEXT glConvolutionParameterivEXT_signature;

def glCopyConvolutionFilter1DEXT_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var glCopyConvolutionFilter1DEXT glCopyConvolutionFilter1DEXT_signature;

def glCopyConvolutionFilter2DEXT_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyConvolutionFilter2DEXT glCopyConvolutionFilter2DEXT_signature;

def glGetConvolutionFilterEXT_signature func(target GLenum; format GLenum; type GLenum; image u8 ref);
var glGetConvolutionFilterEXT glGetConvolutionFilterEXT_signature;

def glGetConvolutionParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetConvolutionParameterfvEXT glGetConvolutionParameterfvEXT_signature;

def glGetConvolutionParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetConvolutionParameterivEXT glGetConvolutionParameterivEXT_signature;

def glGetSeparableFilterEXT_signature func(target GLenum; format GLenum; type GLenum; row u8 ref; column u8 ref; span u8 ref);
var glGetSeparableFilterEXT glGetSeparableFilterEXT_signature;

def glSeparableFilter2DEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei; format GLenum; type GLenum; row u8 ref; column u8 ref);
var glSeparableFilter2DEXT glSeparableFilter2DEXT_signature;

def glTangent3bEXT_signature func(tx GLbyte; ty GLbyte; tz GLbyte);
var glTangent3bEXT glTangent3bEXT_signature;

def glTangent3bvEXT_signature func(v GLbyte ref);
var glTangent3bvEXT glTangent3bvEXT_signature;

def glTangent3dEXT_signature func(tx GLdouble; ty GLdouble; tz GLdouble);
var glTangent3dEXT glTangent3dEXT_signature;

def glTangent3dvEXT_signature func(v GLdouble ref);
var glTangent3dvEXT glTangent3dvEXT_signature;

def glTangent3fEXT_signature func(tx GLfloat; ty GLfloat; tz GLfloat);
var glTangent3fEXT glTangent3fEXT_signature;

def glTangent3fvEXT_signature func(v GLfloat ref);
var glTangent3fvEXT glTangent3fvEXT_signature;

def glTangent3iEXT_signature func(tx GLint; ty GLint; tz GLint);
var glTangent3iEXT glTangent3iEXT_signature;

def glTangent3ivEXT_signature func(v GLint ref);
var glTangent3ivEXT glTangent3ivEXT_signature;

def glTangent3sEXT_signature func(tx GLshort; ty GLshort; tz GLshort);
var glTangent3sEXT glTangent3sEXT_signature;

def glTangent3svEXT_signature func(v GLshort ref);
var glTangent3svEXT glTangent3svEXT_signature;

def glBinormal3bEXT_signature func(bx GLbyte; by GLbyte; bz GLbyte);
var glBinormal3bEXT glBinormal3bEXT_signature;

def glBinormal3bvEXT_signature func(v GLbyte ref);
var glBinormal3bvEXT glBinormal3bvEXT_signature;

def glBinormal3dEXT_signature func(bx GLdouble; by GLdouble; bz GLdouble);
var glBinormal3dEXT glBinormal3dEXT_signature;

def glBinormal3dvEXT_signature func(v GLdouble ref);
var glBinormal3dvEXT glBinormal3dvEXT_signature;

def glBinormal3fEXT_signature func(bx GLfloat; by GLfloat; bz GLfloat);
var glBinormal3fEXT glBinormal3fEXT_signature;

def glBinormal3fvEXT_signature func(v GLfloat ref);
var glBinormal3fvEXT glBinormal3fvEXT_signature;

def glBinormal3iEXT_signature func(bx GLint; by GLint; bz GLint);
var glBinormal3iEXT glBinormal3iEXT_signature;

def glBinormal3ivEXT_signature func(v GLint ref);
var glBinormal3ivEXT glBinormal3ivEXT_signature;

def glBinormal3sEXT_signature func(bx GLshort; by GLshort; bz GLshort);
var glBinormal3sEXT glBinormal3sEXT_signature;

def glBinormal3svEXT_signature func(v GLshort ref);
var glBinormal3svEXT glBinormal3svEXT_signature;

def glTangentPointerEXT_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var glTangentPointerEXT glTangentPointerEXT_signature;

def glBinormalPointerEXT_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var glBinormalPointerEXT glBinormalPointerEXT_signature;

def glCopyTexImage1DEXT_signature func(target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; border GLint);
var glCopyTexImage1DEXT glCopyTexImage1DEXT_signature;

def glCopyTexImage2DEXT_signature func(target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint);
var glCopyTexImage2DEXT glCopyTexImage2DEXT_signature;

def glCopyTexSubImage1DEXT_signature func(target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var glCopyTexSubImage1DEXT glCopyTexSubImage1DEXT_signature;

def glCopyTexSubImage2DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTexSubImage2DEXT glCopyTexSubImage2DEXT_signature;

def glCopyTexSubImage3DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTexSubImage3DEXT glCopyTexSubImage3DEXT_signature;

def glCullParameterdvEXT_signature func(pname GLenum; params GLdouble ref);
var glCullParameterdvEXT glCullParameterdvEXT_signature;

def glCullParameterfvEXT_signature func(pname GLenum; params GLfloat ref);
var glCullParameterfvEXT glCullParameterfvEXT_signature;

def glLabelObjectEXT_signature func(type GLenum; object GLuint; length GLsizei; label GLchar ref);
var glLabelObjectEXT glLabelObjectEXT_signature;

def glGetObjectLabelEXT_signature func(type GLenum; object GLuint; bufSize GLsizei; length GLsizei ref; label GLchar ref);
var glGetObjectLabelEXT glGetObjectLabelEXT_signature;

def glInsertEventMarkerEXT_signature func(length GLsizei; marker GLchar ref);
var glInsertEventMarkerEXT glInsertEventMarkerEXT_signature;

def glPushGroupMarkerEXT_signature func(length GLsizei; marker GLchar ref);
var glPushGroupMarkerEXT glPushGroupMarkerEXT_signature;

def glPopGroupMarkerEXT_signature func();
var glPopGroupMarkerEXT glPopGroupMarkerEXT_signature;

def glDepthBoundsEXT_signature func(zmin GLclampd; zmax GLclampd);
var glDepthBoundsEXT glDepthBoundsEXT_signature;

def glMatrixLoadfEXT_signature func(mode GLenum; m GLfloat ref);
var glMatrixLoadfEXT glMatrixLoadfEXT_signature;

def glMatrixLoaddEXT_signature func(mode GLenum; m GLdouble ref);
var glMatrixLoaddEXT glMatrixLoaddEXT_signature;

def glMatrixMultfEXT_signature func(mode GLenum; m GLfloat ref);
var glMatrixMultfEXT glMatrixMultfEXT_signature;

def glMatrixMultdEXT_signature func(mode GLenum; m GLdouble ref);
var glMatrixMultdEXT glMatrixMultdEXT_signature;

def glMatrixLoadIdentityEXT_signature func(mode GLenum);
var glMatrixLoadIdentityEXT glMatrixLoadIdentityEXT_signature;

def glMatrixRotatefEXT_signature func(mode GLenum; angle GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glMatrixRotatefEXT glMatrixRotatefEXT_signature;

def glMatrixRotatedEXT_signature func(mode GLenum; angle GLdouble; x GLdouble; y GLdouble; z GLdouble);
var glMatrixRotatedEXT glMatrixRotatedEXT_signature;

def glMatrixScalefEXT_signature func(mode GLenum; x GLfloat; y GLfloat; z GLfloat);
var glMatrixScalefEXT glMatrixScalefEXT_signature;

def glMatrixScaledEXT_signature func(mode GLenum; x GLdouble; y GLdouble; z GLdouble);
var glMatrixScaledEXT glMatrixScaledEXT_signature;

def glMatrixTranslatefEXT_signature func(mode GLenum; x GLfloat; y GLfloat; z GLfloat);
var glMatrixTranslatefEXT glMatrixTranslatefEXT_signature;

def glMatrixTranslatedEXT_signature func(mode GLenum; x GLdouble; y GLdouble; z GLdouble);
var glMatrixTranslatedEXT glMatrixTranslatedEXT_signature;

def glMatrixFrustumEXT_signature func(mode GLenum; left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble);
var glMatrixFrustumEXT glMatrixFrustumEXT_signature;

def glMatrixOrthoEXT_signature func(mode GLenum; left GLdouble; right GLdouble; bottom GLdouble; top GLdouble; zNear GLdouble; zFar GLdouble);
var glMatrixOrthoEXT glMatrixOrthoEXT_signature;

def glMatrixPopEXT_signature func(mode GLenum);
var glMatrixPopEXT glMatrixPopEXT_signature;

def glMatrixPushEXT_signature func(mode GLenum);
var glMatrixPushEXT glMatrixPushEXT_signature;

def glClientAttribDefaultEXT_signature func(mask GLbitfield);
var glClientAttribDefaultEXT glClientAttribDefaultEXT_signature;

def glPushClientAttribDefaultEXT_signature func(mask GLbitfield);
var glPushClientAttribDefaultEXT glPushClientAttribDefaultEXT_signature;

def glTextureParameterfEXT_signature func(texture GLuint; target GLenum; pname GLenum; param GLfloat);
var glTextureParameterfEXT glTextureParameterfEXT_signature;

def glTextureParameterfvEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLfloat ref);
var glTextureParameterfvEXT glTextureParameterfvEXT_signature;

def glTextureParameteriEXT_signature func(texture GLuint; target GLenum; pname GLenum; param GLint);
var glTextureParameteriEXT glTextureParameteriEXT_signature;

def glTextureParameterivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var glTextureParameterivEXT glTextureParameterivEXT_signature;

def glTextureImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLint; width GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glTextureImage1DEXT glTextureImage1DEXT_signature;

def glTextureImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glTextureImage2DEXT glTextureImage2DEXT_signature;

def glTextureSubImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTextureSubImage1DEXT glTextureSubImage1DEXT_signature;

def glTextureSubImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTextureSubImage2DEXT glTextureSubImage2DEXT_signature;

def glCopyTextureImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; border GLint);
var glCopyTextureImage1DEXT glCopyTextureImage1DEXT_signature;

def glCopyTextureImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint);
var glCopyTextureImage2DEXT glCopyTextureImage2DEXT_signature;

def glCopyTextureSubImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var glCopyTextureSubImage1DEXT glCopyTextureSubImage1DEXT_signature;

def glCopyTextureSubImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTextureSubImage2DEXT glCopyTextureSubImage2DEXT_signature;

def glGetTextureImageEXT_signature func(texture GLuint; target GLenum; level GLint; format GLenum; type GLenum; pixels u8 ref);
var glGetTextureImageEXT glGetTextureImageEXT_signature;

def glGetTextureParameterfvEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLfloat ref);
var glGetTextureParameterfvEXT glGetTextureParameterfvEXT_signature;

def glGetTextureParameterivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var glGetTextureParameterivEXT glGetTextureParameterivEXT_signature;

def glGetTextureLevelParameterfvEXT_signature func(texture GLuint; target GLenum; level GLint; pname GLenum; params GLfloat ref);
var glGetTextureLevelParameterfvEXT glGetTextureLevelParameterfvEXT_signature;

def glGetTextureLevelParameterivEXT_signature func(texture GLuint; target GLenum; level GLint; pname GLenum; params GLint ref);
var glGetTextureLevelParameterivEXT glGetTextureLevelParameterivEXT_signature;

def glTextureImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glTextureImage3DEXT glTextureImage3DEXT_signature;

def glTextureSubImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTextureSubImage3DEXT glTextureSubImage3DEXT_signature;

def glCopyTextureSubImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyTextureSubImage3DEXT glCopyTextureSubImage3DEXT_signature;

def glBindMultiTextureEXT_signature func(texunit GLenum; target GLenum; texture GLuint);
var glBindMultiTextureEXT glBindMultiTextureEXT_signature;

def glMultiTexCoordPointerEXT_signature func(texunit GLenum; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glMultiTexCoordPointerEXT glMultiTexCoordPointerEXT_signature;

def glMultiTexEnvfEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLfloat);
var glMultiTexEnvfEXT glMultiTexEnvfEXT_signature;

def glMultiTexEnvfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var glMultiTexEnvfvEXT glMultiTexEnvfvEXT_signature;

def glMultiTexEnviEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLint);
var glMultiTexEnviEXT glMultiTexEnviEXT_signature;

def glMultiTexEnvivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var glMultiTexEnvivEXT glMultiTexEnvivEXT_signature;

def glMultiTexGendEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; param GLdouble);
var glMultiTexGendEXT glMultiTexGendEXT_signature;

def glMultiTexGendvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLdouble ref);
var glMultiTexGendvEXT glMultiTexGendvEXT_signature;

def glMultiTexGenfEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; param GLfloat);
var glMultiTexGenfEXT glMultiTexGenfEXT_signature;

def glMultiTexGenfvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLfloat ref);
var glMultiTexGenfvEXT glMultiTexGenfvEXT_signature;

def glMultiTexGeniEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; param GLint);
var glMultiTexGeniEXT glMultiTexGeniEXT_signature;

def glMultiTexGenivEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLint ref);
var glMultiTexGenivEXT glMultiTexGenivEXT_signature;

def glGetMultiTexEnvfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var glGetMultiTexEnvfvEXT glGetMultiTexEnvfvEXT_signature;

def glGetMultiTexEnvivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var glGetMultiTexEnvivEXT glGetMultiTexEnvivEXT_signature;

def glGetMultiTexGendvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLdouble ref);
var glGetMultiTexGendvEXT glGetMultiTexGendvEXT_signature;

def glGetMultiTexGenfvEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLfloat ref);
var glGetMultiTexGenfvEXT glGetMultiTexGenfvEXT_signature;

def glGetMultiTexGenivEXT_signature func(texunit GLenum; coord GLenum; pname GLenum; params GLint ref);
var glGetMultiTexGenivEXT glGetMultiTexGenivEXT_signature;

def glMultiTexParameteriEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLint);
var glMultiTexParameteriEXT glMultiTexParameteriEXT_signature;

def glMultiTexParameterivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var glMultiTexParameterivEXT glMultiTexParameterivEXT_signature;

def glMultiTexParameterfEXT_signature func(texunit GLenum; target GLenum; pname GLenum; param GLfloat);
var glMultiTexParameterfEXT glMultiTexParameterfEXT_signature;

def glMultiTexParameterfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var glMultiTexParameterfvEXT glMultiTexParameterfvEXT_signature;

def glMultiTexImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLint; width GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glMultiTexImage1DEXT glMultiTexImage1DEXT_signature;

def glMultiTexImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glMultiTexImage2DEXT glMultiTexImage2DEXT_signature;

def glMultiTexSubImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glMultiTexSubImage1DEXT glMultiTexSubImage1DEXT_signature;

def glMultiTexSubImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glMultiTexSubImage2DEXT glMultiTexSubImage2DEXT_signature;

def glCopyMultiTexImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; border GLint);
var glCopyMultiTexImage1DEXT glCopyMultiTexImage1DEXT_signature;

def glCopyMultiTexImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; x GLint; y GLint; width GLsizei; height GLsizei; border GLint);
var glCopyMultiTexImage2DEXT glCopyMultiTexImage2DEXT_signature;

def glCopyMultiTexSubImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; x GLint; y GLint; width GLsizei);
var glCopyMultiTexSubImage1DEXT glCopyMultiTexSubImage1DEXT_signature;

def glCopyMultiTexSubImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyMultiTexSubImage2DEXT glCopyMultiTexSubImage2DEXT_signature;

def glGetMultiTexImageEXT_signature func(texunit GLenum; target GLenum; level GLint; format GLenum; type GLenum; pixels u8 ref);
var glGetMultiTexImageEXT glGetMultiTexImageEXT_signature;

def glGetMultiTexParameterfvEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLfloat ref);
var glGetMultiTexParameterfvEXT glGetMultiTexParameterfvEXT_signature;

def glGetMultiTexParameterivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var glGetMultiTexParameterivEXT glGetMultiTexParameterivEXT_signature;

def glGetMultiTexLevelParameterfvEXT_signature func(texunit GLenum; target GLenum; level GLint; pname GLenum; params GLfloat ref);
var glGetMultiTexLevelParameterfvEXT glGetMultiTexLevelParameterfvEXT_signature;

def glGetMultiTexLevelParameterivEXT_signature func(texunit GLenum; target GLenum; level GLint; pname GLenum; params GLint ref);
var glGetMultiTexLevelParameterivEXT glGetMultiTexLevelParameterivEXT_signature;

def glMultiTexImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLint; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glMultiTexImage3DEXT glMultiTexImage3DEXT_signature;

def glMultiTexSubImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glMultiTexSubImage3DEXT glMultiTexSubImage3DEXT_signature;

def glCopyMultiTexSubImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; x GLint; y GLint; width GLsizei; height GLsizei);
var glCopyMultiTexSubImage3DEXT glCopyMultiTexSubImage3DEXT_signature;

def glEnableClientStateIndexedEXT_signature func(array GLenum; index GLuint);
var glEnableClientStateIndexedEXT glEnableClientStateIndexedEXT_signature;

def glDisableClientStateIndexedEXT_signature func(array GLenum; index GLuint);
var glDisableClientStateIndexedEXT glDisableClientStateIndexedEXT_signature;

def glGetFloatIndexedvEXT_signature func(target GLenum; index GLuint; data GLfloat ref);
var glGetFloatIndexedvEXT glGetFloatIndexedvEXT_signature;

def glGetDoubleIndexedvEXT_signature func(target GLenum; index GLuint; data GLdouble ref);
var glGetDoubleIndexedvEXT glGetDoubleIndexedvEXT_signature;

def glGetPointerIndexedvEXT_signature func(target GLenum; index GLuint; data u8 ref ref);
var glGetPointerIndexedvEXT glGetPointerIndexedvEXT_signature;

def glEnableIndexedEXT_signature func(target GLenum; index GLuint);
var glEnableIndexedEXT glEnableIndexedEXT_signature;

def glDisableIndexedEXT_signature func(target GLenum; index GLuint);
var glDisableIndexedEXT glDisableIndexedEXT_signature;

def glIsEnabledIndexedEXT_signature func(target GLenum; index GLuint) (result GLboolean);
var glIsEnabledIndexedEXT glIsEnabledIndexedEXT_signature;

def glGetIntegerIndexedvEXT_signature func(target GLenum; index GLuint; data GLint ref);
var glGetIntegerIndexedvEXT glGetIntegerIndexedvEXT_signature;

def glGetBooleanIndexedvEXT_signature func(target GLenum; index GLuint; data GLboolean ref);
var glGetBooleanIndexedvEXT glGetBooleanIndexedvEXT_signature;

def glCompressedTextureImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var glCompressedTextureImage3DEXT glCompressedTextureImage3DEXT_signature;

def glCompressedTextureImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var glCompressedTextureImage2DEXT glCompressedTextureImage2DEXT_signature;

def glCompressedTextureImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var glCompressedTextureImage1DEXT glCompressedTextureImage1DEXT_signature;

def glCompressedTextureSubImage3DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var glCompressedTextureSubImage3DEXT glCompressedTextureSubImage3DEXT_signature;

def glCompressedTextureSubImage2DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var glCompressedTextureSubImage2DEXT glCompressedTextureSubImage2DEXT_signature;

def glCompressedTextureSubImage1DEXT_signature func(texture GLuint; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var glCompressedTextureSubImage1DEXT glCompressedTextureSubImage1DEXT_signature;

def glGetCompressedTextureImageEXT_signature func(texture GLuint; target GLenum; lod GLint; img u8 ref);
var glGetCompressedTextureImageEXT glGetCompressedTextureImageEXT_signature;

def glCompressedMultiTexImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var glCompressedMultiTexImage3DEXT glCompressedMultiTexImage3DEXT_signature;

def glCompressedMultiTexImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var glCompressedMultiTexImage2DEXT glCompressedMultiTexImage2DEXT_signature;

def glCompressedMultiTexImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; internalformat GLenum; width GLsizei; border GLint; imageSize GLsizei; bits u8 ref);
var glCompressedMultiTexImage1DEXT glCompressedMultiTexImage1DEXT_signature;

def glCompressedMultiTexSubImage3DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var glCompressedMultiTexSubImage3DEXT glCompressedMultiTexSubImage3DEXT_signature;

def glCompressedMultiTexSubImage2DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var glCompressedMultiTexSubImage2DEXT glCompressedMultiTexSubImage2DEXT_signature;

def glCompressedMultiTexSubImage1DEXT_signature func(texunit GLenum; target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; imageSize GLsizei; bits u8 ref);
var glCompressedMultiTexSubImage1DEXT glCompressedMultiTexSubImage1DEXT_signature;

def glGetCompressedMultiTexImageEXT_signature func(texunit GLenum; target GLenum; lod GLint; img u8 ref);
var glGetCompressedMultiTexImageEXT glGetCompressedMultiTexImageEXT_signature;

def glMatrixLoadTransposefEXT_signature func(mode GLenum; m GLfloat ref);
var glMatrixLoadTransposefEXT glMatrixLoadTransposefEXT_signature;

def glMatrixLoadTransposedEXT_signature func(mode GLenum; m GLdouble ref);
var glMatrixLoadTransposedEXT glMatrixLoadTransposedEXT_signature;

def glMatrixMultTransposefEXT_signature func(mode GLenum; m GLfloat ref);
var glMatrixMultTransposefEXT glMatrixMultTransposefEXT_signature;

def glMatrixMultTransposedEXT_signature func(mode GLenum; m GLdouble ref);
var glMatrixMultTransposedEXT glMatrixMultTransposedEXT_signature;

def glNamedBufferDataEXT_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; usage GLenum);
var glNamedBufferDataEXT glNamedBufferDataEXT_signature;

def glNamedBufferSubDataEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var glNamedBufferSubDataEXT glNamedBufferSubDataEXT_signature;

def glMapNamedBufferEXT_signature func(buffer GLuint; access GLenum) (result u8 ref);
var glMapNamedBufferEXT glMapNamedBufferEXT_signature;

def glUnmapNamedBufferEXT_signature func(buffer GLuint) (result GLboolean);
var glUnmapNamedBufferEXT glUnmapNamedBufferEXT_signature;

def glGetNamedBufferParameterivEXT_signature func(buffer GLuint; pname GLenum; params GLint ref);
var glGetNamedBufferParameterivEXT glGetNamedBufferParameterivEXT_signature;

def glGetNamedBufferPointervEXT_signature func(buffer GLuint; pname GLenum; params u8 ref ref);
var glGetNamedBufferPointervEXT glGetNamedBufferPointervEXT_signature;

def glGetNamedBufferSubDataEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var glGetNamedBufferSubDataEXT glGetNamedBufferSubDataEXT_signature;

def glProgramUniform1fEXT_signature func(program GLuint; location GLint; v0 GLfloat);
var glProgramUniform1fEXT glProgramUniform1fEXT_signature;

def glProgramUniform2fEXT_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat);
var glProgramUniform2fEXT glProgramUniform2fEXT_signature;

def glProgramUniform3fEXT_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat);
var glProgramUniform3fEXT glProgramUniform3fEXT_signature;

def glProgramUniform4fEXT_signature func(program GLuint; location GLint; v0 GLfloat; v1 GLfloat; v2 GLfloat; v3 GLfloat);
var glProgramUniform4fEXT glProgramUniform4fEXT_signature;

def glProgramUniform1iEXT_signature func(program GLuint; location GLint; v0 GLint);
var glProgramUniform1iEXT glProgramUniform1iEXT_signature;

def glProgramUniform2iEXT_signature func(program GLuint; location GLint; v0 GLint; v1 GLint);
var glProgramUniform2iEXT glProgramUniform2iEXT_signature;

def glProgramUniform3iEXT_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint);
var glProgramUniform3iEXT glProgramUniform3iEXT_signature;

def glProgramUniform4iEXT_signature func(program GLuint; location GLint; v0 GLint; v1 GLint; v2 GLint; v3 GLint);
var glProgramUniform4iEXT glProgramUniform4iEXT_signature;

def glProgramUniform1fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform1fvEXT glProgramUniform1fvEXT_signature;

def glProgramUniform2fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform2fvEXT glProgramUniform2fvEXT_signature;

def glProgramUniform3fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform3fvEXT glProgramUniform3fvEXT_signature;

def glProgramUniform4fvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLfloat ref);
var glProgramUniform4fvEXT glProgramUniform4fvEXT_signature;

def glProgramUniform1ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform1ivEXT glProgramUniform1ivEXT_signature;

def glProgramUniform2ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform2ivEXT glProgramUniform2ivEXT_signature;

def glProgramUniform3ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform3ivEXT glProgramUniform3ivEXT_signature;

def glProgramUniform4ivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLint ref);
var glProgramUniform4ivEXT glProgramUniform4ivEXT_signature;

def glProgramUniformMatrix2fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix2fvEXT glProgramUniformMatrix2fvEXT_signature;

def glProgramUniformMatrix3fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix3fvEXT glProgramUniformMatrix3fvEXT_signature;

def glProgramUniformMatrix4fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix4fvEXT glProgramUniformMatrix4fvEXT_signature;

def glProgramUniformMatrix2x3fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix2x3fvEXT glProgramUniformMatrix2x3fvEXT_signature;

def glProgramUniformMatrix3x2fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix3x2fvEXT glProgramUniformMatrix3x2fvEXT_signature;

def glProgramUniformMatrix2x4fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix2x4fvEXT glProgramUniformMatrix2x4fvEXT_signature;

def glProgramUniformMatrix4x2fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix4x2fvEXT glProgramUniformMatrix4x2fvEXT_signature;

def glProgramUniformMatrix3x4fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix3x4fvEXT glProgramUniformMatrix3x4fvEXT_signature;

def glProgramUniformMatrix4x3fvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLfloat ref);
var glProgramUniformMatrix4x3fvEXT glProgramUniformMatrix4x3fvEXT_signature;

def glTextureBufferEXT_signature func(texture GLuint; target GLenum; internalformat GLenum; buffer GLuint);
var glTextureBufferEXT glTextureBufferEXT_signature;

def glMultiTexBufferEXT_signature func(texunit GLenum; target GLenum; internalformat GLenum; buffer GLuint);
var glMultiTexBufferEXT glMultiTexBufferEXT_signature;

def glTextureParameterIivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var glTextureParameterIivEXT glTextureParameterIivEXT_signature;

def glTextureParameterIuivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLuint ref);
var glTextureParameterIuivEXT glTextureParameterIuivEXT_signature;

def glGetTextureParameterIivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLint ref);
var glGetTextureParameterIivEXT glGetTextureParameterIivEXT_signature;

def glGetTextureParameterIuivEXT_signature func(texture GLuint; target GLenum; pname GLenum; params GLuint ref);
var glGetTextureParameterIuivEXT glGetTextureParameterIuivEXT_signature;

def glMultiTexParameterIivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var glMultiTexParameterIivEXT glMultiTexParameterIivEXT_signature;

def glMultiTexParameterIuivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLuint ref);
var glMultiTexParameterIuivEXT glMultiTexParameterIuivEXT_signature;

def glGetMultiTexParameterIivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLint ref);
var glGetMultiTexParameterIivEXT glGetMultiTexParameterIivEXT_signature;

def glGetMultiTexParameterIuivEXT_signature func(texunit GLenum; target GLenum; pname GLenum; params GLuint ref);
var glGetMultiTexParameterIuivEXT glGetMultiTexParameterIuivEXT_signature;

def glProgramUniform1uiEXT_signature func(program GLuint; location GLint; v0 GLuint);
var glProgramUniform1uiEXT glProgramUniform1uiEXT_signature;

def glProgramUniform2uiEXT_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint);
var glProgramUniform2uiEXT glProgramUniform2uiEXT_signature;

def glProgramUniform3uiEXT_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var glProgramUniform3uiEXT glProgramUniform3uiEXT_signature;

def glProgramUniform4uiEXT_signature func(program GLuint; location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var glProgramUniform4uiEXT glProgramUniform4uiEXT_signature;

def glProgramUniform1uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform1uivEXT glProgramUniform1uivEXT_signature;

def glProgramUniform2uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform2uivEXT glProgramUniform2uivEXT_signature;

def glProgramUniform3uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform3uivEXT glProgramUniform3uivEXT_signature;

def glProgramUniform4uivEXT_signature func(program GLuint; location GLint; count GLsizei; value GLuint ref);
var glProgramUniform4uivEXT glProgramUniform4uivEXT_signature;

def glNamedProgramLocalParameters4fvEXT_signature func(program GLuint; target GLenum; index GLuint; count GLsizei; params GLfloat ref);
var glNamedProgramLocalParameters4fvEXT glNamedProgramLocalParameters4fvEXT_signature;

def glNamedProgramLocalParameterI4iEXT_signature func(program GLuint; target GLenum; index GLuint; x GLint; y GLint; z GLint; w GLint);
var glNamedProgramLocalParameterI4iEXT glNamedProgramLocalParameterI4iEXT_signature;

def glNamedProgramLocalParameterI4ivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLint ref);
var glNamedProgramLocalParameterI4ivEXT glNamedProgramLocalParameterI4ivEXT_signature;

def glNamedProgramLocalParametersI4ivEXT_signature func(program GLuint; target GLenum; index GLuint; count GLsizei; params GLint ref);
var glNamedProgramLocalParametersI4ivEXT glNamedProgramLocalParametersI4ivEXT_signature;

def glNamedProgramLocalParameterI4uiEXT_signature func(program GLuint; target GLenum; index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var glNamedProgramLocalParameterI4uiEXT glNamedProgramLocalParameterI4uiEXT_signature;

def glNamedProgramLocalParameterI4uivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLuint ref);
var glNamedProgramLocalParameterI4uivEXT glNamedProgramLocalParameterI4uivEXT_signature;

def glNamedProgramLocalParametersI4uivEXT_signature func(program GLuint; target GLenum; index GLuint; count GLsizei; params GLuint ref);
var glNamedProgramLocalParametersI4uivEXT glNamedProgramLocalParametersI4uivEXT_signature;

def glGetNamedProgramLocalParameterIivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLint ref);
var glGetNamedProgramLocalParameterIivEXT glGetNamedProgramLocalParameterIivEXT_signature;

def glGetNamedProgramLocalParameterIuivEXT_signature func(program GLuint; target GLenum; index GLuint; params GLuint ref);
var glGetNamedProgramLocalParameterIuivEXT glGetNamedProgramLocalParameterIuivEXT_signature;

def glEnableClientStateiEXT_signature func(array GLenum; index GLuint);
var glEnableClientStateiEXT glEnableClientStateiEXT_signature;

def glDisableClientStateiEXT_signature func(array GLenum; index GLuint);
var glDisableClientStateiEXT glDisableClientStateiEXT_signature;

def glGetFloati_vEXT_signature func(pname GLenum; index GLuint; params GLfloat ref);
var glGetFloati_vEXT glGetFloati_vEXT_signature;

def glGetDoublei_vEXT_signature func(pname GLenum; index GLuint; params GLdouble ref);
var glGetDoublei_vEXT glGetDoublei_vEXT_signature;

def glGetPointeri_vEXT_signature func(pname GLenum; index GLuint; params u8 ref ref);
var glGetPointeri_vEXT glGetPointeri_vEXT_signature;

def glNamedProgramStringEXT_signature func(program GLuint; target GLenum; format GLenum; len GLsizei; string u8 ref);
var glNamedProgramStringEXT glNamedProgramStringEXT_signature;

def glNamedProgramLocalParameter4dEXT_signature func(program GLuint; target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glNamedProgramLocalParameter4dEXT glNamedProgramLocalParameter4dEXT_signature;

def glNamedProgramLocalParameter4dvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLdouble ref);
var glNamedProgramLocalParameter4dvEXT glNamedProgramLocalParameter4dvEXT_signature;

def glNamedProgramLocalParameter4fEXT_signature func(program GLuint; target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glNamedProgramLocalParameter4fEXT glNamedProgramLocalParameter4fEXT_signature;

def glNamedProgramLocalParameter4fvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLfloat ref);
var glNamedProgramLocalParameter4fvEXT glNamedProgramLocalParameter4fvEXT_signature;

def glGetNamedProgramLocalParameterdvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLdouble ref);
var glGetNamedProgramLocalParameterdvEXT glGetNamedProgramLocalParameterdvEXT_signature;

def glGetNamedProgramLocalParameterfvEXT_signature func(program GLuint; target GLenum; index GLuint; params GLfloat ref);
var glGetNamedProgramLocalParameterfvEXT glGetNamedProgramLocalParameterfvEXT_signature;

def glGetNamedProgramivEXT_signature func(program GLuint; target GLenum; pname GLenum; params GLint ref);
var glGetNamedProgramivEXT glGetNamedProgramivEXT_signature;

def glGetNamedProgramStringEXT_signature func(program GLuint; target GLenum; pname GLenum; string u8 ref);
var glGetNamedProgramStringEXT glGetNamedProgramStringEXT_signature;

def glNamedRenderbufferStorageEXT_signature func(renderbuffer GLuint; internalformat GLenum; width GLsizei; height GLsizei);
var glNamedRenderbufferStorageEXT glNamedRenderbufferStorageEXT_signature;

def glGetNamedRenderbufferParameterivEXT_signature func(renderbuffer GLuint; pname GLenum; params GLint ref);
var glGetNamedRenderbufferParameterivEXT glGetNamedRenderbufferParameterivEXT_signature;

def glNamedRenderbufferStorageMultisampleEXT_signature func(renderbuffer GLuint; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glNamedRenderbufferStorageMultisampleEXT glNamedRenderbufferStorageMultisampleEXT_signature;

def glNamedRenderbufferStorageMultisampleCoverageEXT_signature func(renderbuffer GLuint; coverageSamples GLsizei; colorSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glNamedRenderbufferStorageMultisampleCoverageEXT glNamedRenderbufferStorageMultisampleCoverageEXT_signature;

def glCheckNamedFramebufferStatusEXT_signature func(framebuffer GLuint; target GLenum) (result GLenum);
var glCheckNamedFramebufferStatusEXT glCheckNamedFramebufferStatusEXT_signature;

def glNamedFramebufferTexture1DEXT_signature func(framebuffer GLuint; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var glNamedFramebufferTexture1DEXT glNamedFramebufferTexture1DEXT_signature;

def glNamedFramebufferTexture2DEXT_signature func(framebuffer GLuint; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var glNamedFramebufferTexture2DEXT glNamedFramebufferTexture2DEXT_signature;

def glNamedFramebufferTexture3DEXT_signature func(framebuffer GLuint; attachment GLenum; textarget GLenum; texture GLuint; level GLint; zoffset GLint);
var glNamedFramebufferTexture3DEXT glNamedFramebufferTexture3DEXT_signature;

def glNamedFramebufferRenderbufferEXT_signature func(framebuffer GLuint; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var glNamedFramebufferRenderbufferEXT glNamedFramebufferRenderbufferEXT_signature;

def glGetNamedFramebufferAttachmentParameterivEXT_signature func(framebuffer GLuint; attachment GLenum; pname GLenum; params GLint ref);
var glGetNamedFramebufferAttachmentParameterivEXT glGetNamedFramebufferAttachmentParameterivEXT_signature;

def glGenerateTextureMipmapEXT_signature func(texture GLuint; target GLenum);
var glGenerateTextureMipmapEXT glGenerateTextureMipmapEXT_signature;

def glGenerateMultiTexMipmapEXT_signature func(texunit GLenum; target GLenum);
var glGenerateMultiTexMipmapEXT glGenerateMultiTexMipmapEXT_signature;

def glFramebufferDrawBufferEXT_signature func(framebuffer GLuint; mode GLenum);
var glFramebufferDrawBufferEXT glFramebufferDrawBufferEXT_signature;

def glFramebufferDrawBuffersEXT_signature func(framebuffer GLuint; n GLsizei; bufs GLenum ref);
var glFramebufferDrawBuffersEXT glFramebufferDrawBuffersEXT_signature;

def glFramebufferReadBufferEXT_signature func(framebuffer GLuint; mode GLenum);
var glFramebufferReadBufferEXT glFramebufferReadBufferEXT_signature;

def glGetFramebufferParameterivEXT_signature func(framebuffer GLuint; pname GLenum; params GLint ref);
var glGetFramebufferParameterivEXT glGetFramebufferParameterivEXT_signature;

def glNamedCopyBufferSubDataEXT_signature func(readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var glNamedCopyBufferSubDataEXT glNamedCopyBufferSubDataEXT_signature;

def glNamedFramebufferTextureEXT_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint);
var glNamedFramebufferTextureEXT glNamedFramebufferTextureEXT_signature;

def glNamedFramebufferTextureLayerEXT_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint; layer GLint);
var glNamedFramebufferTextureLayerEXT glNamedFramebufferTextureLayerEXT_signature;

def glNamedFramebufferTextureFaceEXT_signature func(framebuffer GLuint; attachment GLenum; texture GLuint; level GLint; face GLenum);
var glNamedFramebufferTextureFaceEXT glNamedFramebufferTextureFaceEXT_signature;

def glTextureRenderbufferEXT_signature func(texture GLuint; target GLenum; renderbuffer GLuint);
var glTextureRenderbufferEXT glTextureRenderbufferEXT_signature;

def glMultiTexRenderbufferEXT_signature func(texunit GLenum; target GLenum; renderbuffer GLuint);
var glMultiTexRenderbufferEXT glMultiTexRenderbufferEXT_signature;

def glVertexArrayVertexOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayVertexOffsetEXT glVertexArrayVertexOffsetEXT_signature;

def glVertexArrayColorOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayColorOffsetEXT glVertexArrayColorOffsetEXT_signature;

def glVertexArrayEdgeFlagOffsetEXT_signature func(vaobj GLuint; buffer GLuint; stride GLsizei; offset GLintptr);
var glVertexArrayEdgeFlagOffsetEXT glVertexArrayEdgeFlagOffsetEXT_signature;

def glVertexArrayIndexOffsetEXT_signature func(vaobj GLuint; buffer GLuint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayIndexOffsetEXT glVertexArrayIndexOffsetEXT_signature;

def glVertexArrayNormalOffsetEXT_signature func(vaobj GLuint; buffer GLuint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayNormalOffsetEXT glVertexArrayNormalOffsetEXT_signature;

def glVertexArrayTexCoordOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayTexCoordOffsetEXT glVertexArrayTexCoordOffsetEXT_signature;

def glVertexArrayMultiTexCoordOffsetEXT_signature func(vaobj GLuint; buffer GLuint; texunit GLenum; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayMultiTexCoordOffsetEXT glVertexArrayMultiTexCoordOffsetEXT_signature;

def glVertexArrayFogCoordOffsetEXT_signature func(vaobj GLuint; buffer GLuint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayFogCoordOffsetEXT glVertexArrayFogCoordOffsetEXT_signature;

def glVertexArraySecondaryColorOffsetEXT_signature func(vaobj GLuint; buffer GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArraySecondaryColorOffsetEXT glVertexArraySecondaryColorOffsetEXT_signature;

def glVertexArrayVertexAttribOffsetEXT_signature func(vaobj GLuint; buffer GLuint; index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei; offset GLintptr);
var glVertexArrayVertexAttribOffsetEXT glVertexArrayVertexAttribOffsetEXT_signature;

def glVertexArrayVertexAttribIOffsetEXT_signature func(vaobj GLuint; buffer GLuint; index GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayVertexAttribIOffsetEXT glVertexArrayVertexAttribIOffsetEXT_signature;

def glEnableVertexArrayEXT_signature func(vaobj GLuint; array GLenum);
var glEnableVertexArrayEXT glEnableVertexArrayEXT_signature;

def glDisableVertexArrayEXT_signature func(vaobj GLuint; array GLenum);
var glDisableVertexArrayEXT glDisableVertexArrayEXT_signature;

def glEnableVertexArrayAttribEXT_signature func(vaobj GLuint; index GLuint);
var glEnableVertexArrayAttribEXT glEnableVertexArrayAttribEXT_signature;

def glDisableVertexArrayAttribEXT_signature func(vaobj GLuint; index GLuint);
var glDisableVertexArrayAttribEXT glDisableVertexArrayAttribEXT_signature;

def glGetVertexArrayIntegervEXT_signature func(vaobj GLuint; pname GLenum; param GLint ref);
var glGetVertexArrayIntegervEXT glGetVertexArrayIntegervEXT_signature;

def glGetVertexArrayPointervEXT_signature func(vaobj GLuint; pname GLenum; param u8 ref ref);
var glGetVertexArrayPointervEXT glGetVertexArrayPointervEXT_signature;

def glGetVertexArrayIntegeri_vEXT_signature func(vaobj GLuint; index GLuint; pname GLenum; param GLint ref);
var glGetVertexArrayIntegeri_vEXT glGetVertexArrayIntegeri_vEXT_signature;

def glGetVertexArrayPointeri_vEXT_signature func(vaobj GLuint; index GLuint; pname GLenum; param u8 ref ref);
var glGetVertexArrayPointeri_vEXT glGetVertexArrayPointeri_vEXT_signature;

def glMapNamedBufferRangeEXT_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr; access GLbitfield) (result u8 ref);
var glMapNamedBufferRangeEXT glMapNamedBufferRangeEXT_signature;

def glFlushMappedNamedBufferRangeEXT_signature func(buffer GLuint; offset GLintptr; length GLsizeiptr);
var glFlushMappedNamedBufferRangeEXT glFlushMappedNamedBufferRangeEXT_signature;

def glNamedBufferStorageEXT_signature func(buffer GLuint; size GLsizeiptr; data u8 ref; flags GLbitfield);
var glNamedBufferStorageEXT glNamedBufferStorageEXT_signature;

def glClearNamedBufferDataEXT_signature func(buffer GLuint; internalformat GLenum; format GLenum; type GLenum; data u8 ref);
var glClearNamedBufferDataEXT glClearNamedBufferDataEXT_signature;

def glClearNamedBufferSubDataEXT_signature func(buffer GLuint; internalformat GLenum; offset GLsizeiptr; size GLsizeiptr; format GLenum; type GLenum; data u8 ref);
var glClearNamedBufferSubDataEXT glClearNamedBufferSubDataEXT_signature;

def glNamedFramebufferParameteriEXT_signature func(framebuffer GLuint; pname GLenum; param GLint);
var glNamedFramebufferParameteriEXT glNamedFramebufferParameteriEXT_signature;

def glGetNamedFramebufferParameterivEXT_signature func(framebuffer GLuint; pname GLenum; params GLint ref);
var glGetNamedFramebufferParameterivEXT glGetNamedFramebufferParameterivEXT_signature;

def glProgramUniform1dEXT_signature func(program GLuint; location GLint; x GLdouble);
var glProgramUniform1dEXT glProgramUniform1dEXT_signature;

def glProgramUniform2dEXT_signature func(program GLuint; location GLint; x GLdouble; y GLdouble);
var glProgramUniform2dEXT glProgramUniform2dEXT_signature;

def glProgramUniform3dEXT_signature func(program GLuint; location GLint; x GLdouble; y GLdouble; z GLdouble);
var glProgramUniform3dEXT glProgramUniform3dEXT_signature;

def glProgramUniform4dEXT_signature func(program GLuint; location GLint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glProgramUniform4dEXT glProgramUniform4dEXT_signature;

def glProgramUniform1dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform1dvEXT glProgramUniform1dvEXT_signature;

def glProgramUniform2dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform2dvEXT glProgramUniform2dvEXT_signature;

def glProgramUniform3dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform3dvEXT glProgramUniform3dvEXT_signature;

def glProgramUniform4dvEXT_signature func(program GLuint; location GLint; count GLsizei; value GLdouble ref);
var glProgramUniform4dvEXT glProgramUniform4dvEXT_signature;

def glProgramUniformMatrix2dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix2dvEXT glProgramUniformMatrix2dvEXT_signature;

def glProgramUniformMatrix3dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix3dvEXT glProgramUniformMatrix3dvEXT_signature;

def glProgramUniformMatrix4dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix4dvEXT glProgramUniformMatrix4dvEXT_signature;

def glProgramUniformMatrix2x3dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix2x3dvEXT glProgramUniformMatrix2x3dvEXT_signature;

def glProgramUniformMatrix2x4dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix2x4dvEXT glProgramUniformMatrix2x4dvEXT_signature;

def glProgramUniformMatrix3x2dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix3x2dvEXT glProgramUniformMatrix3x2dvEXT_signature;

def glProgramUniformMatrix3x4dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix3x4dvEXT glProgramUniformMatrix3x4dvEXT_signature;

def glProgramUniformMatrix4x2dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix4x2dvEXT glProgramUniformMatrix4x2dvEXT_signature;

def glProgramUniformMatrix4x3dvEXT_signature func(program GLuint; location GLint; count GLsizei; transpose GLboolean; value GLdouble ref);
var glProgramUniformMatrix4x3dvEXT glProgramUniformMatrix4x3dvEXT_signature;

def glTextureBufferRangeEXT_signature func(texture GLuint; target GLenum; internalformat GLenum; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glTextureBufferRangeEXT glTextureBufferRangeEXT_signature;

def glTextureStorage1DEXT_signature func(texture GLuint; target GLenum; levels GLsizei; internalformat GLenum; width GLsizei);
var glTextureStorage1DEXT glTextureStorage1DEXT_signature;

def glTextureStorage2DEXT_signature func(texture GLuint; target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glTextureStorage2DEXT glTextureStorage2DEXT_signature;

def glTextureStorage3DEXT_signature func(texture GLuint; target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var glTextureStorage3DEXT glTextureStorage3DEXT_signature;

def glTextureStorage2DMultisampleEXT_signature func(texture GLuint; target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; fixedsamplelocations GLboolean);
var glTextureStorage2DMultisampleEXT glTextureStorage2DMultisampleEXT_signature;

def glTextureStorage3DMultisampleEXT_signature func(texture GLuint; target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedsamplelocations GLboolean);
var glTextureStorage3DMultisampleEXT glTextureStorage3DMultisampleEXT_signature;

def glVertexArrayBindVertexBufferEXT_signature func(vaobj GLuint; bindingindex GLuint; buffer GLuint; offset GLintptr; stride GLsizei);
var glVertexArrayBindVertexBufferEXT glVertexArrayBindVertexBufferEXT_signature;

def glVertexArrayVertexAttribFormatEXT_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; normalized GLboolean; relativeoffset GLuint);
var glVertexArrayVertexAttribFormatEXT glVertexArrayVertexAttribFormatEXT_signature;

def glVertexArrayVertexAttribIFormatEXT_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var glVertexArrayVertexAttribIFormatEXT glVertexArrayVertexAttribIFormatEXT_signature;

def glVertexArrayVertexAttribLFormatEXT_signature func(vaobj GLuint; attribindex GLuint; size GLint; type GLenum; relativeoffset GLuint);
var glVertexArrayVertexAttribLFormatEXT glVertexArrayVertexAttribLFormatEXT_signature;

def glVertexArrayVertexAttribBindingEXT_signature func(vaobj GLuint; attribindex GLuint; bindingindex GLuint);
var glVertexArrayVertexAttribBindingEXT glVertexArrayVertexAttribBindingEXT_signature;

def glVertexArrayVertexBindingDivisorEXT_signature func(vaobj GLuint; bindingindex GLuint; divisor GLuint);
var glVertexArrayVertexBindingDivisorEXT glVertexArrayVertexBindingDivisorEXT_signature;

def glVertexArrayVertexAttribLOffsetEXT_signature func(vaobj GLuint; buffer GLuint; index GLuint; size GLint; type GLenum; stride GLsizei; offset GLintptr);
var glVertexArrayVertexAttribLOffsetEXT glVertexArrayVertexAttribLOffsetEXT_signature;

def glTexturePageCommitmentEXT_signature func(texture GLuint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; commit GLboolean);
var glTexturePageCommitmentEXT glTexturePageCommitmentEXT_signature;

def glVertexArrayVertexAttribDivisorEXT_signature func(vaobj GLuint; index GLuint; divisor GLuint);
var glVertexArrayVertexAttribDivisorEXT glVertexArrayVertexAttribDivisorEXT_signature;

def glColorMaskIndexedEXT_signature func(index GLuint; r GLboolean; g GLboolean; b GLboolean; a GLboolean);
var glColorMaskIndexedEXT glColorMaskIndexedEXT_signature;

def glDrawArraysInstancedEXT_signature func(mode GLenum; start GLint; count GLsizei; primcount GLsizei);
var glDrawArraysInstancedEXT glDrawArraysInstancedEXT_signature;

def glDrawElementsInstancedEXT_signature func(mode GLenum; count GLsizei; type GLenum; indices u8 ref; primcount GLsizei);
var glDrawElementsInstancedEXT glDrawElementsInstancedEXT_signature;

def glDrawRangeElementsEXT_signature func(mode GLenum; start GLuint; end GLuint; count GLsizei; type GLenum; indices u8 ref);
var glDrawRangeElementsEXT glDrawRangeElementsEXT_signature;
def GLeglClientBufferEXT = type u8 ref;

def glBufferStorageExternalEXT_signature func(target GLenum; offset GLintptr; size GLsizeiptr; clientBuffer GLeglClientBufferEXT; flags GLbitfield);
var glBufferStorageExternalEXT glBufferStorageExternalEXT_signature;

def glNamedBufferStorageExternalEXT_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; clientBuffer GLeglClientBufferEXT; flags GLbitfield);
var glNamedBufferStorageExternalEXT glNamedBufferStorageExternalEXT_signature;

def glFogCoordfEXT_signature func(coord GLfloat);
var glFogCoordfEXT glFogCoordfEXT_signature;

def glFogCoordfvEXT_signature func(coord GLfloat ref);
var glFogCoordfvEXT glFogCoordfvEXT_signature;

def glFogCoorddEXT_signature func(coord GLdouble);
var glFogCoorddEXT glFogCoorddEXT_signature;

def glFogCoorddvEXT_signature func(coord GLdouble ref);
var glFogCoorddvEXT glFogCoorddvEXT_signature;

def glFogCoordPointerEXT_signature func(type GLenum; stride GLsizei; pointer u8 ref);
var glFogCoordPointerEXT glFogCoordPointerEXT_signature;

def glBlitFramebufferEXT_signature func(srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var glBlitFramebufferEXT glBlitFramebufferEXT_signature;

def glRenderbufferStorageMultisampleEXT_signature func(target GLenum; samples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glRenderbufferStorageMultisampleEXT glRenderbufferStorageMultisampleEXT_signature;

def glIsRenderbufferEXT_signature func(renderbuffer GLuint) (result GLboolean);
var glIsRenderbufferEXT glIsRenderbufferEXT_signature;

def glBindRenderbufferEXT_signature func(target GLenum; renderbuffer GLuint);
var glBindRenderbufferEXT glBindRenderbufferEXT_signature;

def glDeleteRenderbuffersEXT_signature func(n GLsizei; renderbuffers GLuint ref);
var glDeleteRenderbuffersEXT glDeleteRenderbuffersEXT_signature;

def glGenRenderbuffersEXT_signature func(n GLsizei; renderbuffers GLuint ref);
var glGenRenderbuffersEXT glGenRenderbuffersEXT_signature;

def glRenderbufferStorageEXT_signature func(target GLenum; internalformat GLenum; width GLsizei; height GLsizei);
var glRenderbufferStorageEXT glRenderbufferStorageEXT_signature;

def glGetRenderbufferParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetRenderbufferParameterivEXT glGetRenderbufferParameterivEXT_signature;

def glIsFramebufferEXT_signature func(framebuffer GLuint) (result GLboolean);
var glIsFramebufferEXT glIsFramebufferEXT_signature;

def glBindFramebufferEXT_signature func(target GLenum; framebuffer GLuint);
var glBindFramebufferEXT glBindFramebufferEXT_signature;

def glDeleteFramebuffersEXT_signature func(n GLsizei; framebuffers GLuint ref);
var glDeleteFramebuffersEXT glDeleteFramebuffersEXT_signature;

def glGenFramebuffersEXT_signature func(n GLsizei; framebuffers GLuint ref);
var glGenFramebuffersEXT glGenFramebuffersEXT_signature;

def glCheckFramebufferStatusEXT_signature func(target GLenum) (result GLenum);
var glCheckFramebufferStatusEXT glCheckFramebufferStatusEXT_signature;

def glFramebufferTexture1DEXT_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var glFramebufferTexture1DEXT glFramebufferTexture1DEXT_signature;

def glFramebufferTexture2DEXT_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint);
var glFramebufferTexture2DEXT glFramebufferTexture2DEXT_signature;

def glFramebufferTexture3DEXT_signature func(target GLenum; attachment GLenum; textarget GLenum; texture GLuint; level GLint; zoffset GLint);
var glFramebufferTexture3DEXT glFramebufferTexture3DEXT_signature;

def glFramebufferRenderbufferEXT_signature func(target GLenum; attachment GLenum; renderbuffertarget GLenum; renderbuffer GLuint);
var glFramebufferRenderbufferEXT glFramebufferRenderbufferEXT_signature;

def glGetFramebufferAttachmentParameterivEXT_signature func(target GLenum; attachment GLenum; pname GLenum; params GLint ref);
var glGetFramebufferAttachmentParameterivEXT glGetFramebufferAttachmentParameterivEXT_signature;

def glGenerateMipmapEXT_signature func(target GLenum);
var glGenerateMipmapEXT glGenerateMipmapEXT_signature;

def glProgramParameteriEXT_signature func(program GLuint; pname GLenum; value GLint);
var glProgramParameteriEXT glProgramParameteriEXT_signature;

def glProgramEnvParameters4fvEXT_signature func(target GLenum; index GLuint; count GLsizei; params GLfloat ref);
var glProgramEnvParameters4fvEXT glProgramEnvParameters4fvEXT_signature;

def glProgramLocalParameters4fvEXT_signature func(target GLenum; index GLuint; count GLsizei; params GLfloat ref);
var glProgramLocalParameters4fvEXT glProgramLocalParameters4fvEXT_signature;

def glGetUniformuivEXT_signature func(program GLuint; location GLint; params GLuint ref);
var glGetUniformuivEXT glGetUniformuivEXT_signature;

def glBindFragDataLocationEXT_signature func(program GLuint; color GLuint; name GLchar ref);
var glBindFragDataLocationEXT glBindFragDataLocationEXT_signature;

def glGetFragDataLocationEXT_signature func(program GLuint; name GLchar ref) (result GLint);
var glGetFragDataLocationEXT glGetFragDataLocationEXT_signature;

def glUniform1uiEXT_signature func(location GLint; v0 GLuint);
var glUniform1uiEXT glUniform1uiEXT_signature;

def glUniform2uiEXT_signature func(location GLint; v0 GLuint; v1 GLuint);
var glUniform2uiEXT glUniform2uiEXT_signature;

def glUniform3uiEXT_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint);
var glUniform3uiEXT glUniform3uiEXT_signature;

def glUniform4uiEXT_signature func(location GLint; v0 GLuint; v1 GLuint; v2 GLuint; v3 GLuint);
var glUniform4uiEXT glUniform4uiEXT_signature;

def glUniform1uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform1uivEXT glUniform1uivEXT_signature;

def glUniform2uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform2uivEXT glUniform2uivEXT_signature;

def glUniform3uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform3uivEXT glUniform3uivEXT_signature;

def glUniform4uivEXT_signature func(location GLint; count GLsizei; value GLuint ref);
var glUniform4uivEXT glUniform4uivEXT_signature;

def glVertexAttribI1iEXT_signature func(index GLuint; x GLint);
var glVertexAttribI1iEXT glVertexAttribI1iEXT_signature;

def glVertexAttribI2iEXT_signature func(index GLuint; x GLint; y GLint);
var glVertexAttribI2iEXT glVertexAttribI2iEXT_signature;

def glVertexAttribI3iEXT_signature func(index GLuint; x GLint; y GLint; z GLint);
var glVertexAttribI3iEXT glVertexAttribI3iEXT_signature;

def glVertexAttribI4iEXT_signature func(index GLuint; x GLint; y GLint; z GLint; w GLint);
var glVertexAttribI4iEXT glVertexAttribI4iEXT_signature;

def glVertexAttribI1uiEXT_signature func(index GLuint; x GLuint);
var glVertexAttribI1uiEXT glVertexAttribI1uiEXT_signature;

def glVertexAttribI2uiEXT_signature func(index GLuint; x GLuint; y GLuint);
var glVertexAttribI2uiEXT glVertexAttribI2uiEXT_signature;

def glVertexAttribI3uiEXT_signature func(index GLuint; x GLuint; y GLuint; z GLuint);
var glVertexAttribI3uiEXT glVertexAttribI3uiEXT_signature;

def glVertexAttribI4uiEXT_signature func(index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var glVertexAttribI4uiEXT glVertexAttribI4uiEXT_signature;

def glVertexAttribI1ivEXT_signature func(index GLuint; v GLint ref);
var glVertexAttribI1ivEXT glVertexAttribI1ivEXT_signature;

def glVertexAttribI2ivEXT_signature func(index GLuint; v GLint ref);
var glVertexAttribI2ivEXT glVertexAttribI2ivEXT_signature;

def glVertexAttribI3ivEXT_signature func(index GLuint; v GLint ref);
var glVertexAttribI3ivEXT glVertexAttribI3ivEXT_signature;

def glVertexAttribI4ivEXT_signature func(index GLuint; v GLint ref);
var glVertexAttribI4ivEXT glVertexAttribI4ivEXT_signature;

def glVertexAttribI1uivEXT_signature func(index GLuint; v GLuint ref);
var glVertexAttribI1uivEXT glVertexAttribI1uivEXT_signature;

def glVertexAttribI2uivEXT_signature func(index GLuint; v GLuint ref);
var glVertexAttribI2uivEXT glVertexAttribI2uivEXT_signature;

def glVertexAttribI3uivEXT_signature func(index GLuint; v GLuint ref);
var glVertexAttribI3uivEXT glVertexAttribI3uivEXT_signature;

def glVertexAttribI4uivEXT_signature func(index GLuint; v GLuint ref);
var glVertexAttribI4uivEXT glVertexAttribI4uivEXT_signature;

def glVertexAttribI4bvEXT_signature func(index GLuint; v GLbyte ref);
var glVertexAttribI4bvEXT glVertexAttribI4bvEXT_signature;

def glVertexAttribI4svEXT_signature func(index GLuint; v GLshort ref);
var glVertexAttribI4svEXT glVertexAttribI4svEXT_signature;

def glVertexAttribI4ubvEXT_signature func(index GLuint; v GLubyte ref);
var glVertexAttribI4ubvEXT glVertexAttribI4ubvEXT_signature;

def glVertexAttribI4usvEXT_signature func(index GLuint; v GLushort ref);
var glVertexAttribI4usvEXT glVertexAttribI4usvEXT_signature;

def glVertexAttribIPointerEXT_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glVertexAttribIPointerEXT glVertexAttribIPointerEXT_signature;

def glGetVertexAttribIivEXT_signature func(index GLuint; pname GLenum; params GLint ref);
var glGetVertexAttribIivEXT glGetVertexAttribIivEXT_signature;

def glGetVertexAttribIuivEXT_signature func(index GLuint; pname GLenum; params GLuint ref);
var glGetVertexAttribIuivEXT glGetVertexAttribIuivEXT_signature;

def glGetHistogramEXT_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var glGetHistogramEXT glGetHistogramEXT_signature;

def glGetHistogramParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetHistogramParameterfvEXT glGetHistogramParameterfvEXT_signature;

def glGetHistogramParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetHistogramParameterivEXT glGetHistogramParameterivEXT_signature;

def glGetMinmaxEXT_signature func(target GLenum; reset GLboolean; format GLenum; type GLenum; values u8 ref);
var glGetMinmaxEXT glGetMinmaxEXT_signature;

def glGetMinmaxParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetMinmaxParameterfvEXT glGetMinmaxParameterfvEXT_signature;

def glGetMinmaxParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetMinmaxParameterivEXT glGetMinmaxParameterivEXT_signature;

def glHistogramEXT_signature func(target GLenum; width GLsizei; internalformat GLenum; sink GLboolean);
var glHistogramEXT glHistogramEXT_signature;

def glMinmaxEXT_signature func(target GLenum; internalformat GLenum; sink GLboolean);
var glMinmaxEXT glMinmaxEXT_signature;

def glResetHistogramEXT_signature func(target GLenum);
var glResetHistogramEXT glResetHistogramEXT_signature;

def glResetMinmaxEXT_signature func(target GLenum);
var glResetMinmaxEXT glResetMinmaxEXT_signature;

def glIndexFuncEXT_signature func(func GLenum; ref GLclampf);
var glIndexFuncEXT glIndexFuncEXT_signature;

def glIndexMaterialEXT_signature func(face GLenum; mode GLenum);
var glIndexMaterialEXT glIndexMaterialEXT_signature;

def glApplyTextureEXT_signature func(mode GLenum);
var glApplyTextureEXT glApplyTextureEXT_signature;

def glTextureLightEXT_signature func(pname GLenum);
var glTextureLightEXT glTextureLightEXT_signature;

def glTextureMaterialEXT_signature func(face GLenum; mode GLenum);
var glTextureMaterialEXT glTextureMaterialEXT_signature;

def glGetUnsignedBytevEXT_signature func(pname GLenum; data GLubyte ref);
var glGetUnsignedBytevEXT glGetUnsignedBytevEXT_signature;

def glGetUnsignedBytei_vEXT_signature func(target GLenum; index GLuint; data GLubyte ref);
var glGetUnsignedBytei_vEXT glGetUnsignedBytei_vEXT_signature;

def glDeleteMemoryObjectsEXT_signature func(n GLsizei; memoryObjects GLuint ref);
var glDeleteMemoryObjectsEXT glDeleteMemoryObjectsEXT_signature;

def glIsMemoryObjectEXT_signature func(memoryObject GLuint) (result GLboolean);
var glIsMemoryObjectEXT glIsMemoryObjectEXT_signature;

def glCreateMemoryObjectsEXT_signature func(n GLsizei; memoryObjects GLuint ref);
var glCreateMemoryObjectsEXT glCreateMemoryObjectsEXT_signature;

def glMemoryObjectParameterivEXT_signature func(memoryObject GLuint; pname GLenum; params GLint ref);
var glMemoryObjectParameterivEXT glMemoryObjectParameterivEXT_signature;

def glGetMemoryObjectParameterivEXT_signature func(memoryObject GLuint; pname GLenum; params GLint ref);
var glGetMemoryObjectParameterivEXT glGetMemoryObjectParameterivEXT_signature;

def glTexStorageMem2DEXT_signature func(target GLenum; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; memory GLuint; offset GLuint64);
var glTexStorageMem2DEXT glTexStorageMem2DEXT_signature;

def glTexStorageMem2DMultisampleEXT_signature func(target GLenum; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var glTexStorageMem2DMultisampleEXT glTexStorageMem2DMultisampleEXT_signature;

def glTexStorageMem3DEXT_signature func(target GLenum; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64);
var glTexStorageMem3DEXT glTexStorageMem3DEXT_signature;

def glTexStorageMem3DMultisampleEXT_signature func(target GLenum; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var glTexStorageMem3DMultisampleEXT glTexStorageMem3DMultisampleEXT_signature;

def glBufferStorageMemEXT_signature func(target GLenum; size GLsizeiptr; memory GLuint; offset GLuint64);
var glBufferStorageMemEXT glBufferStorageMemEXT_signature;

def glTextureStorageMem2DEXT_signature func(texture GLuint; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; memory GLuint; offset GLuint64);
var glTextureStorageMem2DEXT glTextureStorageMem2DEXT_signature;

def glTextureStorageMem2DMultisampleEXT_signature func(texture GLuint; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var glTextureStorageMem2DMultisampleEXT glTextureStorageMem2DMultisampleEXT_signature;

def glTextureStorageMem3DEXT_signature func(texture GLuint; levels GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64);
var glTextureStorageMem3DEXT glTextureStorageMem3DEXT_signature;

def glTextureStorageMem3DMultisampleEXT_signature func(texture GLuint; samples GLsizei; internalFormat GLenum; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean; memory GLuint; offset GLuint64);
var glTextureStorageMem3DMultisampleEXT glTextureStorageMem3DMultisampleEXT_signature;

def glNamedBufferStorageMemEXT_signature func(buffer GLuint; size GLsizeiptr; memory GLuint; offset GLuint64);
var glNamedBufferStorageMemEXT glNamedBufferStorageMemEXT_signature;

def glTexStorageMem1DEXT_signature func(target GLenum; levels GLsizei; internalFormat GLenum; width GLsizei; memory GLuint; offset GLuint64);
var glTexStorageMem1DEXT glTexStorageMem1DEXT_signature;

def glTextureStorageMem1DEXT_signature func(texture GLuint; levels GLsizei; internalFormat GLenum; width GLsizei; memory GLuint; offset GLuint64);
var glTextureStorageMem1DEXT glTextureStorageMem1DEXT_signature;

def glImportMemoryFdEXT_signature func(memory GLuint; size GLuint64; handleType GLenum; fd GLint);
var glImportMemoryFdEXT glImportMemoryFdEXT_signature;

def glImportMemoryWin32HandleEXT_signature func(memory GLuint; size GLuint64; handleType GLenum; handle u8 ref);
var glImportMemoryWin32HandleEXT glImportMemoryWin32HandleEXT_signature;

def glImportMemoryWin32NameEXT_signature func(memory GLuint; size GLuint64; handleType GLenum; name u8 ref);
var glImportMemoryWin32NameEXT glImportMemoryWin32NameEXT_signature;

def glMultiDrawArraysEXT_signature func(mode GLenum; first GLint ref; count GLsizei ref; primcount GLsizei);
var glMultiDrawArraysEXT glMultiDrawArraysEXT_signature;

def glMultiDrawElementsEXT_signature func(mode GLenum; count GLsizei ref; type GLenum; indices u8 ref ref; primcount GLsizei);
var glMultiDrawElementsEXT glMultiDrawElementsEXT_signature;

def glSampleMaskEXT_signature func(value GLclampf; invert GLboolean);
var glSampleMaskEXT glSampleMaskEXT_signature;

def glSamplePatternEXT_signature func(pattern GLenum);
var glSamplePatternEXT glSamplePatternEXT_signature;

def glColorTableEXT_signature func(target GLenum; internalFormat GLenum; width GLsizei; format GLenum; type GLenum; table u8 ref);
var glColorTableEXT glColorTableEXT_signature;

def glGetColorTableEXT_signature func(target GLenum; format GLenum; type GLenum; data u8 ref);
var glGetColorTableEXT glGetColorTableEXT_signature;

def glGetColorTableParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetColorTableParameterivEXT glGetColorTableParameterivEXT_signature;

def glGetColorTableParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetColorTableParameterfvEXT glGetColorTableParameterfvEXT_signature;

def glPixelTransformParameteriEXT_signature func(target GLenum; pname GLenum; param GLint);
var glPixelTransformParameteriEXT glPixelTransformParameteriEXT_signature;

def glPixelTransformParameterfEXT_signature func(target GLenum; pname GLenum; param GLfloat);
var glPixelTransformParameterfEXT glPixelTransformParameterfEXT_signature;

def glPixelTransformParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glPixelTransformParameterivEXT glPixelTransformParameterivEXT_signature;

def glPixelTransformParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glPixelTransformParameterfvEXT glPixelTransformParameterfvEXT_signature;

def glGetPixelTransformParameterivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetPixelTransformParameterivEXT glGetPixelTransformParameterivEXT_signature;

def glGetPixelTransformParameterfvEXT_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetPixelTransformParameterfvEXT glGetPixelTransformParameterfvEXT_signature;

def glPointParameterfEXT_signature func(pname GLenum; param GLfloat);
var glPointParameterfEXT glPointParameterfEXT_signature;

def glPointParameterfvEXT_signature func(pname GLenum; params GLfloat ref);
var glPointParameterfvEXT glPointParameterfvEXT_signature;

def glPolygonOffsetEXT_signature func(factor GLfloat; bias GLfloat);
var glPolygonOffsetEXT glPolygonOffsetEXT_signature;

def glPolygonOffsetClampEXT_signature func(factor GLfloat; units GLfloat; clamp GLfloat);
var glPolygonOffsetClampEXT glPolygonOffsetClampEXT_signature;

def glProvokingVertexEXT_signature func(mode GLenum);
var glProvokingVertexEXT glProvokingVertexEXT_signature;

def glRasterSamplesEXT_signature func(samples GLuint; fixedsamplelocations GLboolean);
var glRasterSamplesEXT glRasterSamplesEXT_signature;

def glSecondaryColor3bEXT_signature func(red GLbyte; green GLbyte; blue GLbyte);
var glSecondaryColor3bEXT glSecondaryColor3bEXT_signature;

def glSecondaryColor3bvEXT_signature func(v GLbyte ref);
var glSecondaryColor3bvEXT glSecondaryColor3bvEXT_signature;

def glSecondaryColor3dEXT_signature func(red GLdouble; green GLdouble; blue GLdouble);
var glSecondaryColor3dEXT glSecondaryColor3dEXT_signature;

def glSecondaryColor3dvEXT_signature func(v GLdouble ref);
var glSecondaryColor3dvEXT glSecondaryColor3dvEXT_signature;

def glSecondaryColor3fEXT_signature func(red GLfloat; green GLfloat; blue GLfloat);
var glSecondaryColor3fEXT glSecondaryColor3fEXT_signature;

def glSecondaryColor3fvEXT_signature func(v GLfloat ref);
var glSecondaryColor3fvEXT glSecondaryColor3fvEXT_signature;

def glSecondaryColor3iEXT_signature func(red GLint; green GLint; blue GLint);
var glSecondaryColor3iEXT glSecondaryColor3iEXT_signature;

def glSecondaryColor3ivEXT_signature func(v GLint ref);
var glSecondaryColor3ivEXT glSecondaryColor3ivEXT_signature;

def glSecondaryColor3sEXT_signature func(red GLshort; green GLshort; blue GLshort);
var glSecondaryColor3sEXT glSecondaryColor3sEXT_signature;

def glSecondaryColor3svEXT_signature func(v GLshort ref);
var glSecondaryColor3svEXT glSecondaryColor3svEXT_signature;

def glSecondaryColor3ubEXT_signature func(red GLubyte; green GLubyte; blue GLubyte);
var glSecondaryColor3ubEXT glSecondaryColor3ubEXT_signature;

def glSecondaryColor3ubvEXT_signature func(v GLubyte ref);
var glSecondaryColor3ubvEXT glSecondaryColor3ubvEXT_signature;

def glSecondaryColor3uiEXT_signature func(red GLuint; green GLuint; blue GLuint);
var glSecondaryColor3uiEXT glSecondaryColor3uiEXT_signature;

def glSecondaryColor3uivEXT_signature func(v GLuint ref);
var glSecondaryColor3uivEXT glSecondaryColor3uivEXT_signature;

def glSecondaryColor3usEXT_signature func(red GLushort; green GLushort; blue GLushort);
var glSecondaryColor3usEXT glSecondaryColor3usEXT_signature;

def glSecondaryColor3usvEXT_signature func(v GLushort ref);
var glSecondaryColor3usvEXT glSecondaryColor3usvEXT_signature;

def glSecondaryColorPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glSecondaryColorPointerEXT glSecondaryColorPointerEXT_signature;

def glGenSemaphoresEXT_signature func(n GLsizei; semaphores GLuint ref);
var glGenSemaphoresEXT glGenSemaphoresEXT_signature;

def glDeleteSemaphoresEXT_signature func(n GLsizei; semaphores GLuint ref);
var glDeleteSemaphoresEXT glDeleteSemaphoresEXT_signature;

def glIsSemaphoreEXT_signature func(semaphore GLuint) (result GLboolean);
var glIsSemaphoreEXT glIsSemaphoreEXT_signature;

def glSemaphoreParameterui64vEXT_signature func(semaphore GLuint; pname GLenum; params GLuint64 ref);
var glSemaphoreParameterui64vEXT glSemaphoreParameterui64vEXT_signature;

def glGetSemaphoreParameterui64vEXT_signature func(semaphore GLuint; pname GLenum; params GLuint64 ref);
var glGetSemaphoreParameterui64vEXT glGetSemaphoreParameterui64vEXT_signature;

def glWaitSemaphoreEXT_signature func(semaphore GLuint; numBufferBarriers GLuint; buffers GLuint ref; numTextureBarriers GLuint; textures GLuint ref; srcLayouts GLenum ref);
var glWaitSemaphoreEXT glWaitSemaphoreEXT_signature;

def glSignalSemaphoreEXT_signature func(semaphore GLuint; numBufferBarriers GLuint; buffers GLuint ref; numTextureBarriers GLuint; textures GLuint ref; dstLayouts GLenum ref);
var glSignalSemaphoreEXT glSignalSemaphoreEXT_signature;

def glImportSemaphoreFdEXT_signature func(semaphore GLuint; handleType GLenum; fd GLint);
var glImportSemaphoreFdEXT glImportSemaphoreFdEXT_signature;

def glImportSemaphoreWin32HandleEXT_signature func(semaphore GLuint; handleType GLenum; handle u8 ref);
var glImportSemaphoreWin32HandleEXT glImportSemaphoreWin32HandleEXT_signature;

def glImportSemaphoreWin32NameEXT_signature func(semaphore GLuint; handleType GLenum; name u8 ref);
var glImportSemaphoreWin32NameEXT glImportSemaphoreWin32NameEXT_signature;

def glUseShaderProgramEXT_signature func(type GLenum; program GLuint);
var glUseShaderProgramEXT glUseShaderProgramEXT_signature;

def glActiveProgramEXT_signature func(program GLuint);
var glActiveProgramEXT glActiveProgramEXT_signature;

def glCreateShaderProgramEXT_signature func(type GLenum; string GLchar ref) (result GLuint);
var glCreateShaderProgramEXT glCreateShaderProgramEXT_signature;

def glFramebufferFetchBarrierEXT_signature func();
var glFramebufferFetchBarrierEXT glFramebufferFetchBarrierEXT_signature;

def glBindImageTextureEXT_signature func(index GLuint; texture GLuint; level GLint; layered GLboolean; layer GLint; access GLenum; format GLint);
var glBindImageTextureEXT glBindImageTextureEXT_signature;

def glMemoryBarrierEXT_signature func(barriers GLbitfield);
var glMemoryBarrierEXT glMemoryBarrierEXT_signature;

def glStencilClearTagEXT_signature func(stencilTagBits GLsizei; stencilClearTag GLuint);
var glStencilClearTagEXT glStencilClearTagEXT_signature;

def glActiveStencilFaceEXT_signature func(face GLenum);
var glActiveStencilFaceEXT glActiveStencilFaceEXT_signature;

def glTexSubImage1DEXT_signature func(target GLenum; level GLint; xoffset GLint; width GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTexSubImage1DEXT glTexSubImage1DEXT_signature;

def glTexSubImage2DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; width GLsizei; height GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTexSubImage2DEXT glTexSubImage2DEXT_signature;

def glTexImage3DEXT_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glTexImage3DEXT glTexImage3DEXT_signature;

def glTexSubImage3DEXT_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTexSubImage3DEXT glTexSubImage3DEXT_signature;

def glFramebufferTextureLayerEXT_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; layer GLint);
var glFramebufferTextureLayerEXT glFramebufferTextureLayerEXT_signature;

def glTexBufferEXT_signature func(target GLenum; internalformat GLenum; buffer GLuint);
var glTexBufferEXT glTexBufferEXT_signature;

def glTexParameterIivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glTexParameterIivEXT glTexParameterIivEXT_signature;

def glTexParameterIuivEXT_signature func(target GLenum; pname GLenum; params GLuint ref);
var glTexParameterIuivEXT glTexParameterIuivEXT_signature;

def glGetTexParameterIivEXT_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetTexParameterIivEXT glGetTexParameterIivEXT_signature;

def glGetTexParameterIuivEXT_signature func(target GLenum; pname GLenum; params GLuint ref);
var glGetTexParameterIuivEXT glGetTexParameterIuivEXT_signature;

def glClearColorIiEXT_signature func(red GLint; green GLint; blue GLint; alpha GLint);
var glClearColorIiEXT glClearColorIiEXT_signature;

def glClearColorIuiEXT_signature func(red GLuint; green GLuint; blue GLuint; alpha GLuint);
var glClearColorIuiEXT glClearColorIuiEXT_signature;

def glAreTexturesResidentEXT_signature func(n GLsizei; textures GLuint ref; residences GLboolean ref) (result GLboolean);
var glAreTexturesResidentEXT glAreTexturesResidentEXT_signature;

def glBindTextureEXT_signature func(target GLenum; texture GLuint);
var glBindTextureEXT glBindTextureEXT_signature;

def glDeleteTexturesEXT_signature func(n GLsizei; textures GLuint ref);
var glDeleteTexturesEXT glDeleteTexturesEXT_signature;

def glGenTexturesEXT_signature func(n GLsizei; textures GLuint ref);
var glGenTexturesEXT glGenTexturesEXT_signature;

def glIsTextureEXT_signature func(texture GLuint) (result GLboolean);
var glIsTextureEXT glIsTextureEXT_signature;

def glPrioritizeTexturesEXT_signature func(n GLsizei; textures GLuint ref; priorities GLclampf ref);
var glPrioritizeTexturesEXT glPrioritizeTexturesEXT_signature;

def glTextureNormalEXT_signature func(mode GLenum);
var glTextureNormalEXT glTextureNormalEXT_signature;

def glTexStorage1DEXT_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei);
var glTexStorage1DEXT glTexStorage1DEXT_signature;

def glTexStorage2DEXT_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glTexStorage2DEXT glTexStorage2DEXT_signature;

def glTexStorage3DEXT_signature func(target GLenum; levels GLsizei; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei);
var glTexStorage3DEXT glTexStorage3DEXT_signature;

def glGetQueryObjecti64vEXT_signature func(id GLuint; pname GLenum; params GLint64 ref);
var glGetQueryObjecti64vEXT glGetQueryObjecti64vEXT_signature;

def glGetQueryObjectui64vEXT_signature func(id GLuint; pname GLenum; params GLuint64 ref);
var glGetQueryObjectui64vEXT glGetQueryObjectui64vEXT_signature;

def glBeginTransformFeedbackEXT_signature func(primitiveMode GLenum);
var glBeginTransformFeedbackEXT glBeginTransformFeedbackEXT_signature;

def glEndTransformFeedbackEXT_signature func();
var glEndTransformFeedbackEXT glEndTransformFeedbackEXT_signature;

def glBindBufferRangeEXT_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glBindBufferRangeEXT glBindBufferRangeEXT_signature;

def glBindBufferOffsetEXT_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr);
var glBindBufferOffsetEXT glBindBufferOffsetEXT_signature;

def glBindBufferBaseEXT_signature func(target GLenum; index GLuint; buffer GLuint);
var glBindBufferBaseEXT glBindBufferBaseEXT_signature;

def glTransformFeedbackVaryingsEXT_signature func(program GLuint; count GLsizei; varyings GLchar ref ref; bufferMode GLenum);
var glTransformFeedbackVaryingsEXT glTransformFeedbackVaryingsEXT_signature;

def glGetTransformFeedbackVaryingEXT_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLsizei ref; type GLenum ref; name GLchar ref);
var glGetTransformFeedbackVaryingEXT glGetTransformFeedbackVaryingEXT_signature;

def glArrayElementEXT_signature func(i GLint);
var glArrayElementEXT glArrayElementEXT_signature;

def glColorPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var glColorPointerEXT glColorPointerEXT_signature;

def glDrawArraysEXT_signature func(mode GLenum; first GLint; count GLsizei);
var glDrawArraysEXT glDrawArraysEXT_signature;

def glEdgeFlagPointerEXT_signature func(stride GLsizei; count GLsizei; pointer GLboolean ref);
var glEdgeFlagPointerEXT glEdgeFlagPointerEXT_signature;

def glGetPointervEXT_signature func(pname GLenum; params u8 ref ref);
var glGetPointervEXT glGetPointervEXT_signature;

def glIndexPointerEXT_signature func(type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var glIndexPointerEXT glIndexPointerEXT_signature;

def glNormalPointerEXT_signature func(type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var glNormalPointerEXT glNormalPointerEXT_signature;

def glTexCoordPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var glTexCoordPointerEXT glTexCoordPointerEXT_signature;

def glVertexPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; count GLsizei; pointer u8 ref);
var glVertexPointerEXT glVertexPointerEXT_signature;

def glVertexAttribL1dEXT_signature func(index GLuint; x GLdouble);
var glVertexAttribL1dEXT glVertexAttribL1dEXT_signature;

def glVertexAttribL2dEXT_signature func(index GLuint; x GLdouble; y GLdouble);
var glVertexAttribL2dEXT glVertexAttribL2dEXT_signature;

def glVertexAttribL3dEXT_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var glVertexAttribL3dEXT glVertexAttribL3dEXT_signature;

def glVertexAttribL4dEXT_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glVertexAttribL4dEXT glVertexAttribL4dEXT_signature;

def glVertexAttribL1dvEXT_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL1dvEXT glVertexAttribL1dvEXT_signature;

def glVertexAttribL2dvEXT_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL2dvEXT glVertexAttribL2dvEXT_signature;

def glVertexAttribL3dvEXT_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL3dvEXT glVertexAttribL3dvEXT_signature;

def glVertexAttribL4dvEXT_signature func(index GLuint; v GLdouble ref);
var glVertexAttribL4dvEXT glVertexAttribL4dvEXT_signature;

def glVertexAttribLPointerEXT_signature func(index GLuint; size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glVertexAttribLPointerEXT glVertexAttribLPointerEXT_signature;

def glGetVertexAttribLdvEXT_signature func(index GLuint; pname GLenum; params GLdouble ref);
var glGetVertexAttribLdvEXT glGetVertexAttribLdvEXT_signature;

def glBeginVertexShaderEXT_signature func();
var glBeginVertexShaderEXT glBeginVertexShaderEXT_signature;

def glEndVertexShaderEXT_signature func();
var glEndVertexShaderEXT glEndVertexShaderEXT_signature;

def glBindVertexShaderEXT_signature func(id GLuint);
var glBindVertexShaderEXT glBindVertexShaderEXT_signature;

def glGenVertexShadersEXT_signature func(range GLuint) (result GLuint);
var glGenVertexShadersEXT glGenVertexShadersEXT_signature;

def glDeleteVertexShaderEXT_signature func(id GLuint);
var glDeleteVertexShaderEXT glDeleteVertexShaderEXT_signature;

def glShaderOp1EXT_signature func(op GLenum; res GLuint; arg1 GLuint);
var glShaderOp1EXT glShaderOp1EXT_signature;

def glShaderOp2EXT_signature func(op GLenum; res GLuint; arg1 GLuint; arg2 GLuint);
var glShaderOp2EXT glShaderOp2EXT_signature;

def glShaderOp3EXT_signature func(op GLenum; res GLuint; arg1 GLuint; arg2 GLuint; arg3 GLuint);
var glShaderOp3EXT glShaderOp3EXT_signature;

def glSwizzleEXT_signature func(res GLuint; in GLuint; outX GLenum; outY GLenum; outZ GLenum; outW GLenum);
var glSwizzleEXT glSwizzleEXT_signature;

def glWriteMaskEXT_signature func(res GLuint; in GLuint; outX GLenum; outY GLenum; outZ GLenum; outW GLenum);
var glWriteMaskEXT glWriteMaskEXT_signature;

def glInsertComponentEXT_signature func(res GLuint; src GLuint; num GLuint);
var glInsertComponentEXT glInsertComponentEXT_signature;

def glExtractComponentEXT_signature func(res GLuint; src GLuint; num GLuint);
var glExtractComponentEXT glExtractComponentEXT_signature;

def glGenSymbolsEXT_signature func(datatype GLenum; storagetype GLenum; range GLenum; components GLuint) (result GLuint);
var glGenSymbolsEXT glGenSymbolsEXT_signature;

def glSetInvariantEXT_signature func(id GLuint; type GLenum; addr u8 ref);
var glSetInvariantEXT glSetInvariantEXT_signature;

def glSetLocalConstantEXT_signature func(id GLuint; type GLenum; addr u8 ref);
var glSetLocalConstantEXT glSetLocalConstantEXT_signature;

def glVariantbvEXT_signature func(id GLuint; addr GLbyte ref);
var glVariantbvEXT glVariantbvEXT_signature;

def glVariantsvEXT_signature func(id GLuint; addr GLshort ref);
var glVariantsvEXT glVariantsvEXT_signature;

def glVariantivEXT_signature func(id GLuint; addr GLint ref);
var glVariantivEXT glVariantivEXT_signature;

def glVariantfvEXT_signature func(id GLuint; addr GLfloat ref);
var glVariantfvEXT glVariantfvEXT_signature;

def glVariantdvEXT_signature func(id GLuint; addr GLdouble ref);
var glVariantdvEXT glVariantdvEXT_signature;

def glVariantubvEXT_signature func(id GLuint; addr GLubyte ref);
var glVariantubvEXT glVariantubvEXT_signature;

def glVariantusvEXT_signature func(id GLuint; addr GLushort ref);
var glVariantusvEXT glVariantusvEXT_signature;

def glVariantuivEXT_signature func(id GLuint; addr GLuint ref);
var glVariantuivEXT glVariantuivEXT_signature;

def glVariantPointerEXT_signature func(id GLuint; type GLenum; stride GLuint; addr u8 ref);
var glVariantPointerEXT glVariantPointerEXT_signature;

def glEnableVariantClientStateEXT_signature func(id GLuint);
var glEnableVariantClientStateEXT glEnableVariantClientStateEXT_signature;

def glDisableVariantClientStateEXT_signature func(id GLuint);
var glDisableVariantClientStateEXT glDisableVariantClientStateEXT_signature;

def glBindLightParameterEXT_signature func(light GLenum; value GLenum) (result GLuint);
var glBindLightParameterEXT glBindLightParameterEXT_signature;

def glBindMaterialParameterEXT_signature func(face GLenum; value GLenum) (result GLuint);
var glBindMaterialParameterEXT glBindMaterialParameterEXT_signature;

def glBindTexGenParameterEXT_signature func(unit GLenum; coord GLenum; value GLenum) (result GLuint);
var glBindTexGenParameterEXT glBindTexGenParameterEXT_signature;

def glBindTextureUnitParameterEXT_signature func(unit GLenum; value GLenum) (result GLuint);
var glBindTextureUnitParameterEXT glBindTextureUnitParameterEXT_signature;

def glBindParameterEXT_signature func(value GLenum) (result GLuint);
var glBindParameterEXT glBindParameterEXT_signature;

def glIsVariantEnabledEXT_signature func(id GLuint; cap GLenum) (result GLboolean);
var glIsVariantEnabledEXT glIsVariantEnabledEXT_signature;

def glGetVariantBooleanvEXT_signature func(id GLuint; value GLenum; data GLboolean ref);
var glGetVariantBooleanvEXT glGetVariantBooleanvEXT_signature;

def glGetVariantIntegervEXT_signature func(id GLuint; value GLenum; data GLint ref);
var glGetVariantIntegervEXT glGetVariantIntegervEXT_signature;

def glGetVariantFloatvEXT_signature func(id GLuint; value GLenum; data GLfloat ref);
var glGetVariantFloatvEXT glGetVariantFloatvEXT_signature;

def glGetVariantPointervEXT_signature func(id GLuint; value GLenum; data u8 ref ref);
var glGetVariantPointervEXT glGetVariantPointervEXT_signature;

def glGetInvariantBooleanvEXT_signature func(id GLuint; value GLenum; data GLboolean ref);
var glGetInvariantBooleanvEXT glGetInvariantBooleanvEXT_signature;

def glGetInvariantIntegervEXT_signature func(id GLuint; value GLenum; data GLint ref);
var glGetInvariantIntegervEXT glGetInvariantIntegervEXT_signature;

def glGetInvariantFloatvEXT_signature func(id GLuint; value GLenum; data GLfloat ref);
var glGetInvariantFloatvEXT glGetInvariantFloatvEXT_signature;

def glGetLocalConstantBooleanvEXT_signature func(id GLuint; value GLenum; data GLboolean ref);
var glGetLocalConstantBooleanvEXT glGetLocalConstantBooleanvEXT_signature;

def glGetLocalConstantIntegervEXT_signature func(id GLuint; value GLenum; data GLint ref);
var glGetLocalConstantIntegervEXT glGetLocalConstantIntegervEXT_signature;

def glGetLocalConstantFloatvEXT_signature func(id GLuint; value GLenum; data GLfloat ref);
var glGetLocalConstantFloatvEXT glGetLocalConstantFloatvEXT_signature;

def glVertexWeightfEXT_signature func(weight GLfloat);
var glVertexWeightfEXT glVertexWeightfEXT_signature;

def glVertexWeightfvEXT_signature func(weight GLfloat ref);
var glVertexWeightfvEXT glVertexWeightfvEXT_signature;

def glVertexWeightPointerEXT_signature func(size GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glVertexWeightPointerEXT glVertexWeightPointerEXT_signature;

def glAcquireKeyedMutexWin32EXT_signature func(memory GLuint; key GLuint64; timeout GLuint) (result GLboolean);
var glAcquireKeyedMutexWin32EXT glAcquireKeyedMutexWin32EXT_signature;

def glReleaseKeyedMutexWin32EXT_signature func(memory GLuint; key GLuint64) (result GLboolean);
var glReleaseKeyedMutexWin32EXT glReleaseKeyedMutexWin32EXT_signature;

def glWindowRectanglesEXT_signature func(mode GLenum; count GLsizei; box GLint ref);
var glWindowRectanglesEXT glWindowRectanglesEXT_signature;

def glImportSyncEXT_signature func(external_sync_type GLenum; external_sync GLintptr; flags GLbitfield) (result GLsync);
var glImportSyncEXT glImportSyncEXT_signature;

def glFrameTerminatorGREMEDY_signature func();
var glFrameTerminatorGREMEDY glFrameTerminatorGREMEDY_signature;

def glStringMarkerGREMEDY_signature func(len GLsizei; string u8 ref);
var glStringMarkerGREMEDY glStringMarkerGREMEDY_signature;

def glImageTransformParameteriHP_signature func(target GLenum; pname GLenum; param GLint);
var glImageTransformParameteriHP glImageTransformParameteriHP_signature;

def glImageTransformParameterfHP_signature func(target GLenum; pname GLenum; param GLfloat);
var glImageTransformParameterfHP glImageTransformParameterfHP_signature;

def glImageTransformParameterivHP_signature func(target GLenum; pname GLenum; params GLint ref);
var glImageTransformParameterivHP glImageTransformParameterivHP_signature;

def glImageTransformParameterfvHP_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glImageTransformParameterfvHP glImageTransformParameterfvHP_signature;

def glGetImageTransformParameterivHP_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetImageTransformParameterivHP glGetImageTransformParameterivHP_signature;

def glGetImageTransformParameterfvHP_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetImageTransformParameterfvHP glGetImageTransformParameterfvHP_signature;

def glMultiModeDrawArraysIBM_signature func(mode GLenum ref; first GLint ref; count GLsizei ref; primcount GLsizei; modestride GLint);
var glMultiModeDrawArraysIBM glMultiModeDrawArraysIBM_signature;

def glMultiModeDrawElementsIBM_signature func(mode GLenum ref; count GLsizei ref; type GLenum; indices u8 ref ref; primcount GLsizei; modestride GLint);
var glMultiModeDrawElementsIBM glMultiModeDrawElementsIBM_signature;

def glFlushStaticDataIBM_signature func(target GLenum);
var glFlushStaticDataIBM glFlushStaticDataIBM_signature;

def glColorPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glColorPointerListIBM glColorPointerListIBM_signature;

def glSecondaryColorPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glSecondaryColorPointerListIBM glSecondaryColorPointerListIBM_signature;

def glEdgeFlagPointerListIBM_signature func(stride GLint; pointer GLboolean ref ref; ptrstride GLint);
var glEdgeFlagPointerListIBM glEdgeFlagPointerListIBM_signature;

def glFogCoordPointerListIBM_signature func(type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glFogCoordPointerListIBM glFogCoordPointerListIBM_signature;

def glIndexPointerListIBM_signature func(type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glIndexPointerListIBM glIndexPointerListIBM_signature;

def glNormalPointerListIBM_signature func(type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glNormalPointerListIBM glNormalPointerListIBM_signature;

def glTexCoordPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glTexCoordPointerListIBM glTexCoordPointerListIBM_signature;

def glVertexPointerListIBM_signature func(size GLint; type GLenum; stride GLint; pointer u8 ref ref; ptrstride GLint);
var glVertexPointerListIBM glVertexPointerListIBM_signature;

def glBlendFuncSeparateINGR_signature func(sfactorRGB GLenum; dfactorRGB GLenum; sfactorAlpha GLenum; dfactorAlpha GLenum);
var glBlendFuncSeparateINGR glBlendFuncSeparateINGR_signature;

def glApplyFramebufferAttachmentCMAAINTEL_signature func();
var glApplyFramebufferAttachmentCMAAINTEL glApplyFramebufferAttachmentCMAAINTEL_signature;

def glSyncTextureINTEL_signature func(texture GLuint);
var glSyncTextureINTEL glSyncTextureINTEL_signature;

def glUnmapTexture2DINTEL_signature func(texture GLuint; level GLint);
var glUnmapTexture2DINTEL glUnmapTexture2DINTEL_signature;

def glMapTexture2DINTEL_signature func(texture GLuint; level GLint; access GLbitfield; stride GLint ref; layout GLenum ref) (result u8 ref);
var glMapTexture2DINTEL glMapTexture2DINTEL_signature;

def glVertexPointervINTEL_signature func(size GLint; type GLenum; pointer u8 ref ref);
var glVertexPointervINTEL glVertexPointervINTEL_signature;

def glNormalPointervINTEL_signature func(type GLenum; pointer u8 ref ref);
var glNormalPointervINTEL glNormalPointervINTEL_signature;

def glColorPointervINTEL_signature func(size GLint; type GLenum; pointer u8 ref ref);
var glColorPointervINTEL glColorPointervINTEL_signature;

def glTexCoordPointervINTEL_signature func(size GLint; type GLenum; pointer u8 ref ref);
var glTexCoordPointervINTEL glTexCoordPointervINTEL_signature;

def glBeginPerfQueryINTEL_signature func(queryHandle GLuint);
var glBeginPerfQueryINTEL glBeginPerfQueryINTEL_signature;

def glCreatePerfQueryINTEL_signature func(queryId GLuint; queryHandle GLuint ref);
var glCreatePerfQueryINTEL glCreatePerfQueryINTEL_signature;

def glDeletePerfQueryINTEL_signature func(queryHandle GLuint);
var glDeletePerfQueryINTEL glDeletePerfQueryINTEL_signature;

def glEndPerfQueryINTEL_signature func(queryHandle GLuint);
var glEndPerfQueryINTEL glEndPerfQueryINTEL_signature;

def glGetFirstPerfQueryIdINTEL_signature func(queryId GLuint ref);
var glGetFirstPerfQueryIdINTEL glGetFirstPerfQueryIdINTEL_signature;

def glGetNextPerfQueryIdINTEL_signature func(queryId GLuint; nextQueryId GLuint ref);
var glGetNextPerfQueryIdINTEL glGetNextPerfQueryIdINTEL_signature;

def glGetPerfCounterInfoINTEL_signature func(queryId GLuint; counterId GLuint; counterNameLength GLuint; counterName GLchar ref; counterDescLength GLuint; counterDesc GLchar ref; counterOffset GLuint ref; counterDataSize GLuint ref; counterTypeEnum GLuint ref; counterDataTypeEnum GLuint ref; rawCounterMaxValue GLuint64 ref);
var glGetPerfCounterInfoINTEL glGetPerfCounterInfoINTEL_signature;

def glGetPerfQueryDataINTEL_signature func(queryHandle GLuint; flags GLuint; dataSize GLsizei; data u8 ref; bytesWritten GLuint ref);
var glGetPerfQueryDataINTEL glGetPerfQueryDataINTEL_signature;

def glGetPerfQueryIdByNameINTEL_signature func(queryName GLchar ref; queryId GLuint ref);
var glGetPerfQueryIdByNameINTEL glGetPerfQueryIdByNameINTEL_signature;

def glGetPerfQueryInfoINTEL_signature func(queryId GLuint; queryNameLength GLuint; queryName GLchar ref; dataSize GLuint ref; noCounters GLuint ref; noInstances GLuint ref; capsMask GLuint ref);
var glGetPerfQueryInfoINTEL glGetPerfQueryInfoINTEL_signature;

def glFramebufferParameteriMESA_signature func(target GLenum; pname GLenum; param GLint);
var glFramebufferParameteriMESA glFramebufferParameteriMESA_signature;

def glGetFramebufferParameterivMESA_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetFramebufferParameterivMESA glGetFramebufferParameterivMESA_signature;

def glResizeBuffersMESA_signature func();
var glResizeBuffersMESA glResizeBuffersMESA_signature;

def glWindowPos2dMESA_signature func(x GLdouble; y GLdouble);
var glWindowPos2dMESA glWindowPos2dMESA_signature;

def glWindowPos2dvMESA_signature func(v GLdouble ref);
var glWindowPos2dvMESA glWindowPos2dvMESA_signature;

def glWindowPos2fMESA_signature func(x GLfloat; y GLfloat);
var glWindowPos2fMESA glWindowPos2fMESA_signature;

def glWindowPos2fvMESA_signature func(v GLfloat ref);
var glWindowPos2fvMESA glWindowPos2fvMESA_signature;

def glWindowPos2iMESA_signature func(x GLint; y GLint);
var glWindowPos2iMESA glWindowPos2iMESA_signature;

def glWindowPos2ivMESA_signature func(v GLint ref);
var glWindowPos2ivMESA glWindowPos2ivMESA_signature;

def glWindowPos2sMESA_signature func(x GLshort; y GLshort);
var glWindowPos2sMESA glWindowPos2sMESA_signature;

def glWindowPos2svMESA_signature func(v GLshort ref);
var glWindowPos2svMESA glWindowPos2svMESA_signature;

def glWindowPos3dMESA_signature func(x GLdouble; y GLdouble; z GLdouble);
var glWindowPos3dMESA glWindowPos3dMESA_signature;

def glWindowPos3dvMESA_signature func(v GLdouble ref);
var glWindowPos3dvMESA glWindowPos3dvMESA_signature;

def glWindowPos3fMESA_signature func(x GLfloat; y GLfloat; z GLfloat);
var glWindowPos3fMESA glWindowPos3fMESA_signature;

def glWindowPos3fvMESA_signature func(v GLfloat ref);
var glWindowPos3fvMESA glWindowPos3fvMESA_signature;

def glWindowPos3iMESA_signature func(x GLint; y GLint; z GLint);
var glWindowPos3iMESA glWindowPos3iMESA_signature;

def glWindowPos3ivMESA_signature func(v GLint ref);
var glWindowPos3ivMESA glWindowPos3ivMESA_signature;

def glWindowPos3sMESA_signature func(x GLshort; y GLshort; z GLshort);
var glWindowPos3sMESA glWindowPos3sMESA_signature;

def glWindowPos3svMESA_signature func(v GLshort ref);
var glWindowPos3svMESA glWindowPos3svMESA_signature;

def glWindowPos4dMESA_signature func(x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glWindowPos4dMESA glWindowPos4dMESA_signature;

def glWindowPos4dvMESA_signature func(v GLdouble ref);
var glWindowPos4dvMESA glWindowPos4dvMESA_signature;

def glWindowPos4fMESA_signature func(x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glWindowPos4fMESA glWindowPos4fMESA_signature;

def glWindowPos4fvMESA_signature func(v GLfloat ref);
var glWindowPos4fvMESA glWindowPos4fvMESA_signature;

def glWindowPos4iMESA_signature func(x GLint; y GLint; z GLint; w GLint);
var glWindowPos4iMESA glWindowPos4iMESA_signature;

def glWindowPos4ivMESA_signature func(v GLint ref);
var glWindowPos4ivMESA glWindowPos4ivMESA_signature;

def glWindowPos4sMESA_signature func(x GLshort; y GLshort; z GLshort; w GLshort);
var glWindowPos4sMESA glWindowPos4sMESA_signature;

def glWindowPos4svMESA_signature func(v GLshort ref);
var glWindowPos4svMESA glWindowPos4svMESA_signature;

def glBeginConditionalRenderNVX_signature func(id GLuint);
var glBeginConditionalRenderNVX glBeginConditionalRenderNVX_signature;

def glEndConditionalRenderNVX_signature func();
var glEndConditionalRenderNVX glEndConditionalRenderNVX_signature;

def glUploadGpuMaskNVX_signature func(mask GLbitfield);
var glUploadGpuMaskNVX glUploadGpuMaskNVX_signature;

def glMulticastViewportArrayvNVX_signature func(gpu GLuint; first GLuint; count GLsizei; v GLfloat ref);
var glMulticastViewportArrayvNVX glMulticastViewportArrayvNVX_signature;

def glMulticastViewportPositionWScaleNVX_signature func(gpu GLuint; index GLuint; xcoeff GLfloat; ycoeff GLfloat);
var glMulticastViewportPositionWScaleNVX glMulticastViewportPositionWScaleNVX_signature;

def glMulticastScissorArrayvNVX_signature func(gpu GLuint; first GLuint; count GLsizei; v GLint ref);
var glMulticastScissorArrayvNVX glMulticastScissorArrayvNVX_signature;

def glAsyncCopyBufferSubDataNVX_signature func(waitSemaphoreCount GLsizei; waitSemaphoreArray GLuint ref; fenceValueArray GLuint64 ref; readGpu GLuint; writeGpuMask GLbitfield; readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr; signalSemaphoreCount GLsizei; signalSemaphoreArray GLuint ref; signalValueArray GLuint64 ref) (result GLuint);
var glAsyncCopyBufferSubDataNVX glAsyncCopyBufferSubDataNVX_signature;

def glAsyncCopyImageSubDataNVX_signature func(waitSemaphoreCount GLsizei; waitSemaphoreArray GLuint ref; waitValueArray GLuint64 ref; srcGpu GLuint; dstGpuMask GLbitfield; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; srcWidth GLsizei; srcHeight GLsizei; srcDepth GLsizei; signalSemaphoreCount GLsizei; signalSemaphoreArray GLuint ref; signalValueArray GLuint64 ref) (result GLuint);
var glAsyncCopyImageSubDataNVX glAsyncCopyImageSubDataNVX_signature;

def glLGPUNamedBufferSubDataNVX_signature func(gpuMask GLbitfield; buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var glLGPUNamedBufferSubDataNVX glLGPUNamedBufferSubDataNVX_signature;

def glLGPUCopyImageSubDataNVX_signature func(sourceGpu GLuint; destinationGpuMask GLbitfield; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srxY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; width GLsizei; height GLsizei; depth GLsizei);
var glLGPUCopyImageSubDataNVX glLGPUCopyImageSubDataNVX_signature;

def glLGPUInterlockNVX_signature func();
var glLGPUInterlockNVX glLGPUInterlockNVX_signature;

def glCreateProgressFenceNVX_signature func() (result GLuint);
var glCreateProgressFenceNVX glCreateProgressFenceNVX_signature;

def glSignalSemaphoreui64NVX_signature func(signalGpu GLuint; fenceObjectCount GLsizei; semaphoreArray GLuint ref; fenceValueArray GLuint64 ref);
var glSignalSemaphoreui64NVX glSignalSemaphoreui64NVX_signature;

def glWaitSemaphoreui64NVX_signature func(waitGpu GLuint; fenceObjectCount GLsizei; semaphoreArray GLuint ref; fenceValueArray GLuint64 ref);
var glWaitSemaphoreui64NVX glWaitSemaphoreui64NVX_signature;

def glClientWaitSemaphoreui64NVX_signature func(fenceObjectCount GLsizei; semaphoreArray GLuint ref; fenceValueArray GLuint64 ref);
var glClientWaitSemaphoreui64NVX glClientWaitSemaphoreui64NVX_signature;

def glAlphaToCoverageDitherControlNV_signature func(mode GLenum);
var glAlphaToCoverageDitherControlNV glAlphaToCoverageDitherControlNV_signature;

def glMultiDrawArraysIndirectBindlessNV_signature func(mode GLenum; indirect u8 ref; drawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var glMultiDrawArraysIndirectBindlessNV glMultiDrawArraysIndirectBindlessNV_signature;

def glMultiDrawElementsIndirectBindlessNV_signature func(mode GLenum; type GLenum; indirect u8 ref; drawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var glMultiDrawElementsIndirectBindlessNV glMultiDrawElementsIndirectBindlessNV_signature;

def glMultiDrawArraysIndirectBindlessCountNV_signature func(mode GLenum; indirect u8 ref; drawCount GLsizei; maxDrawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var glMultiDrawArraysIndirectBindlessCountNV glMultiDrawArraysIndirectBindlessCountNV_signature;

def glMultiDrawElementsIndirectBindlessCountNV_signature func(mode GLenum; type GLenum; indirect u8 ref; drawCount GLsizei; maxDrawCount GLsizei; stride GLsizei; vertexBufferCount GLint);
var glMultiDrawElementsIndirectBindlessCountNV glMultiDrawElementsIndirectBindlessCountNV_signature;

def glGetTextureHandleNV_signature func(texture GLuint) (result GLuint64);
var glGetTextureHandleNV glGetTextureHandleNV_signature;

def glGetTextureSamplerHandleNV_signature func(texture GLuint; sampler GLuint) (result GLuint64);
var glGetTextureSamplerHandleNV glGetTextureSamplerHandleNV_signature;

def glMakeTextureHandleResidentNV_signature func(handle GLuint64);
var glMakeTextureHandleResidentNV glMakeTextureHandleResidentNV_signature;

def glMakeTextureHandleNonResidentNV_signature func(handle GLuint64);
var glMakeTextureHandleNonResidentNV glMakeTextureHandleNonResidentNV_signature;

def glGetImageHandleNV_signature func(texture GLuint; level GLint; layered GLboolean; layer GLint; format GLenum) (result GLuint64);
var glGetImageHandleNV glGetImageHandleNV_signature;

def glMakeImageHandleResidentNV_signature func(handle GLuint64; access GLenum);
var glMakeImageHandleResidentNV glMakeImageHandleResidentNV_signature;

def glMakeImageHandleNonResidentNV_signature func(handle GLuint64);
var glMakeImageHandleNonResidentNV glMakeImageHandleNonResidentNV_signature;

def glUniformHandleui64NV_signature func(location GLint; value GLuint64);
var glUniformHandleui64NV glUniformHandleui64NV_signature;

def glUniformHandleui64vNV_signature func(location GLint; count GLsizei; value GLuint64 ref);
var glUniformHandleui64vNV glUniformHandleui64vNV_signature;

def glProgramUniformHandleui64NV_signature func(program GLuint; location GLint; value GLuint64);
var glProgramUniformHandleui64NV glProgramUniformHandleui64NV_signature;

def glProgramUniformHandleui64vNV_signature func(program GLuint; location GLint; count GLsizei; values GLuint64 ref);
var glProgramUniformHandleui64vNV glProgramUniformHandleui64vNV_signature;

def glIsTextureHandleResidentNV_signature func(handle GLuint64) (result GLboolean);
var glIsTextureHandleResidentNV glIsTextureHandleResidentNV_signature;

def glIsImageHandleResidentNV_signature func(handle GLuint64) (result GLboolean);
var glIsImageHandleResidentNV glIsImageHandleResidentNV_signature;

def glBlendParameteriNV_signature func(pname GLenum; value GLint);
var glBlendParameteriNV glBlendParameteriNV_signature;

def glBlendBarrierNV_signature func();
var glBlendBarrierNV glBlendBarrierNV_signature;

def glViewportPositionWScaleNV_signature func(index GLuint; xcoeff GLfloat; ycoeff GLfloat);
var glViewportPositionWScaleNV glViewportPositionWScaleNV_signature;

def glCreateStatesNV_signature func(n GLsizei; states GLuint ref);
var glCreateStatesNV glCreateStatesNV_signature;

def glDeleteStatesNV_signature func(n GLsizei; states GLuint ref);
var glDeleteStatesNV glDeleteStatesNV_signature;

def glIsStateNV_signature func(state GLuint) (result GLboolean);
var glIsStateNV glIsStateNV_signature;

def glStateCaptureNV_signature func(state GLuint; mode GLenum);
var glStateCaptureNV glStateCaptureNV_signature;

def glGetCommandHeaderNV_signature func(tokenID GLenum; size GLuint) (result GLuint);
var glGetCommandHeaderNV glGetCommandHeaderNV_signature;

def glGetStageIndexNV_signature func(shadertype GLenum) (result GLushort);
var glGetStageIndexNV glGetStageIndexNV_signature;

def glDrawCommandsNV_signature func(primitiveMode GLenum; buffer GLuint; indirects GLintptr ref; sizes GLsizei ref; count GLuint);
var glDrawCommandsNV glDrawCommandsNV_signature;

def glDrawCommandsAddressNV_signature func(primitiveMode GLenum; indirects GLuint64 ref; sizes GLsizei ref; count GLuint);
var glDrawCommandsAddressNV glDrawCommandsAddressNV_signature;

def glDrawCommandsStatesNV_signature func(buffer GLuint; indirects GLintptr ref; sizes GLsizei ref; states GLuint ref; fbos GLuint ref; count GLuint);
var glDrawCommandsStatesNV glDrawCommandsStatesNV_signature;

def glDrawCommandsStatesAddressNV_signature func(indirects GLuint64 ref; sizes GLsizei ref; states GLuint ref; fbos GLuint ref; count GLuint);
var glDrawCommandsStatesAddressNV glDrawCommandsStatesAddressNV_signature;

def glCreateCommandListsNV_signature func(n GLsizei; lists GLuint ref);
var glCreateCommandListsNV glCreateCommandListsNV_signature;

def glDeleteCommandListsNV_signature func(n GLsizei; lists GLuint ref);
var glDeleteCommandListsNV glDeleteCommandListsNV_signature;

def glIsCommandListNV_signature func(list GLuint) (result GLboolean);
var glIsCommandListNV glIsCommandListNV_signature;

def glListDrawCommandsStatesClientNV_signature func(list GLuint; segment GLuint; indirects u8 ref ref; sizes GLsizei ref; states GLuint ref; fbos GLuint ref; count GLuint);
var glListDrawCommandsStatesClientNV glListDrawCommandsStatesClientNV_signature;

def glCommandListSegmentsNV_signature func(list GLuint; segments GLuint);
var glCommandListSegmentsNV glCommandListSegmentsNV_signature;

def glCompileCommandListNV_signature func(list GLuint);
var glCompileCommandListNV glCompileCommandListNV_signature;

def glCallCommandListNV_signature func(list GLuint);
var glCallCommandListNV glCallCommandListNV_signature;

def glBeginConditionalRenderNV_signature func(id GLuint; mode GLenum);
var glBeginConditionalRenderNV glBeginConditionalRenderNV_signature;

def glEndConditionalRenderNV_signature func();
var glEndConditionalRenderNV glEndConditionalRenderNV_signature;

def glSubpixelPrecisionBiasNV_signature func(xbits GLuint; ybits GLuint);
var glSubpixelPrecisionBiasNV glSubpixelPrecisionBiasNV_signature;

def glConservativeRasterParameterfNV_signature func(pname GLenum; value GLfloat);
var glConservativeRasterParameterfNV glConservativeRasterParameterfNV_signature;

def glConservativeRasterParameteriNV_signature func(pname GLenum; param GLint);
var glConservativeRasterParameteriNV glConservativeRasterParameteriNV_signature;

def glCopyImageSubDataNV_signature func(srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; width GLsizei; height GLsizei; depth GLsizei);
var glCopyImageSubDataNV glCopyImageSubDataNV_signature;

def glDepthRangedNV_signature func(zNear GLdouble; zFar GLdouble);
var glDepthRangedNV glDepthRangedNV_signature;

def glClearDepthdNV_signature func(depth GLdouble);
var glClearDepthdNV glClearDepthdNV_signature;

def glDepthBoundsdNV_signature func(zmin GLdouble; zmax GLdouble);
var glDepthBoundsdNV glDepthBoundsdNV_signature;

def glDrawTextureNV_signature func(texture GLuint; sampler GLuint; x0 GLfloat; y0 GLfloat; x1 GLfloat; y1 GLfloat; z GLfloat; s0 GLfloat; t0 GLfloat; s1 GLfloat; t1 GLfloat);
var glDrawTextureNV glDrawTextureNV_signature;

def glDrawVkImageNV_signature func(vkImage GLuint64; sampler GLuint; x0 GLfloat; y0 GLfloat; x1 GLfloat; y1 GLfloat; z GLfloat; s0 GLfloat; t0 GLfloat; s1 GLfloat; t1 GLfloat);
var glDrawVkImageNV glDrawVkImageNV_signature;

def glGetVkProcAddrNV_signature func(name GLchar ref) (result GLVULKANPROCNV);
var glGetVkProcAddrNV glGetVkProcAddrNV_signature;

def glWaitVkSemaphoreNV_signature func(vkSemaphore GLuint64);
var glWaitVkSemaphoreNV glWaitVkSemaphoreNV_signature;

def glSignalVkSemaphoreNV_signature func(vkSemaphore GLuint64);
var glSignalVkSemaphoreNV glSignalVkSemaphoreNV_signature;

def glSignalVkFenceNV_signature func(vkFence GLuint64);
var glSignalVkFenceNV glSignalVkFenceNV_signature;

def glMapControlPointsNV_signature func(target GLenum; index GLuint; type GLenum; ustride GLsizei; vstride GLsizei; uorder GLint; vorder GLint; packed GLboolean; points u8 ref);
var glMapControlPointsNV glMapControlPointsNV_signature;

def glMapParameterivNV_signature func(target GLenum; pname GLenum; params GLint ref);
var glMapParameterivNV glMapParameterivNV_signature;

def glMapParameterfvNV_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glMapParameterfvNV glMapParameterfvNV_signature;

def glGetMapControlPointsNV_signature func(target GLenum; index GLuint; type GLenum; ustride GLsizei; vstride GLsizei; packed GLboolean; points u8 ref);
var glGetMapControlPointsNV glGetMapControlPointsNV_signature;

def glGetMapParameterivNV_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetMapParameterivNV glGetMapParameterivNV_signature;

def glGetMapParameterfvNV_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetMapParameterfvNV glGetMapParameterfvNV_signature;

def glGetMapAttribParameterivNV_signature func(target GLenum; index GLuint; pname GLenum; params GLint ref);
var glGetMapAttribParameterivNV glGetMapAttribParameterivNV_signature;

def glGetMapAttribParameterfvNV_signature func(target GLenum; index GLuint; pname GLenum; params GLfloat ref);
var glGetMapAttribParameterfvNV glGetMapAttribParameterfvNV_signature;

def glEvalMapsNV_signature func(target GLenum; mode GLenum);
var glEvalMapsNV glEvalMapsNV_signature;

def glGetMultisamplefvNV_signature func(pname GLenum; index GLuint; val GLfloat ref);
var glGetMultisamplefvNV glGetMultisamplefvNV_signature;

def glSampleMaskIndexedNV_signature func(index GLuint; mask GLbitfield);
var glSampleMaskIndexedNV glSampleMaskIndexedNV_signature;

def glTexRenderbufferNV_signature func(target GLenum; renderbuffer GLuint);
var glTexRenderbufferNV glTexRenderbufferNV_signature;

def glDeleteFencesNV_signature func(n GLsizei; fences GLuint ref);
var glDeleteFencesNV glDeleteFencesNV_signature;

def glGenFencesNV_signature func(n GLsizei; fences GLuint ref);
var glGenFencesNV glGenFencesNV_signature;

def glIsFenceNV_signature func(fence GLuint) (result GLboolean);
var glIsFenceNV glIsFenceNV_signature;

def glTestFenceNV_signature func(fence GLuint) (result GLboolean);
var glTestFenceNV glTestFenceNV_signature;

def glGetFenceivNV_signature func(fence GLuint; pname GLenum; params GLint ref);
var glGetFenceivNV glGetFenceivNV_signature;

def glFinishFenceNV_signature func(fence GLuint);
var glFinishFenceNV glFinishFenceNV_signature;

def glSetFenceNV_signature func(fence GLuint; condition GLenum);
var glSetFenceNV glSetFenceNV_signature;

def glFragmentCoverageColorNV_signature func(color GLuint);
var glFragmentCoverageColorNV glFragmentCoverageColorNV_signature;

def glProgramNamedParameter4fNV_signature func(id GLuint; len GLsizei; name GLubyte ref; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glProgramNamedParameter4fNV glProgramNamedParameter4fNV_signature;

def glProgramNamedParameter4fvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; v GLfloat ref);
var glProgramNamedParameter4fvNV glProgramNamedParameter4fvNV_signature;

def glProgramNamedParameter4dNV_signature func(id GLuint; len GLsizei; name GLubyte ref; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glProgramNamedParameter4dNV glProgramNamedParameter4dNV_signature;

def glProgramNamedParameter4dvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; v GLdouble ref);
var glProgramNamedParameter4dvNV glProgramNamedParameter4dvNV_signature;

def glGetProgramNamedParameterfvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; params GLfloat ref);
var glGetProgramNamedParameterfvNV glGetProgramNamedParameterfvNV_signature;

def glGetProgramNamedParameterdvNV_signature func(id GLuint; len GLsizei; name GLubyte ref; params GLdouble ref);
var glGetProgramNamedParameterdvNV glGetProgramNamedParameterdvNV_signature;

def glCoverageModulationTableNV_signature func(n GLsizei; v GLfloat ref);
var glCoverageModulationTableNV glCoverageModulationTableNV_signature;

def glGetCoverageModulationTableNV_signature func(bufSize GLsizei; v GLfloat ref);
var glGetCoverageModulationTableNV glGetCoverageModulationTableNV_signature;

def glCoverageModulationNV_signature func(components GLenum);
var glCoverageModulationNV glCoverageModulationNV_signature;

def glRenderbufferStorageMultisampleCoverageNV_signature func(target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalformat GLenum; width GLsizei; height GLsizei);
var glRenderbufferStorageMultisampleCoverageNV glRenderbufferStorageMultisampleCoverageNV_signature;

def glProgramVertexLimitNV_signature func(target GLenum; limit GLint);
var glProgramVertexLimitNV glProgramVertexLimitNV_signature;

def glFramebufferTextureEXT_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint);
var glFramebufferTextureEXT glFramebufferTextureEXT_signature;

def glFramebufferTextureFaceEXT_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; face GLenum);
var glFramebufferTextureFaceEXT glFramebufferTextureFaceEXT_signature;

def glRenderGpuMaskNV_signature func(mask GLbitfield);
var glRenderGpuMaskNV glRenderGpuMaskNV_signature;

def glMulticastBufferSubDataNV_signature func(gpuMask GLbitfield; buffer GLuint; offset GLintptr; size GLsizeiptr; data u8 ref);
var glMulticastBufferSubDataNV glMulticastBufferSubDataNV_signature;

def glMulticastCopyBufferSubDataNV_signature func(readGpu GLuint; writeGpuMask GLbitfield; readBuffer GLuint; writeBuffer GLuint; readOffset GLintptr; writeOffset GLintptr; size GLsizeiptr);
var glMulticastCopyBufferSubDataNV glMulticastCopyBufferSubDataNV_signature;

def glMulticastCopyImageSubDataNV_signature func(srcGpu GLuint; dstGpuMask GLbitfield; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; srcWidth GLsizei; srcHeight GLsizei; srcDepth GLsizei);
var glMulticastCopyImageSubDataNV glMulticastCopyImageSubDataNV_signature;

def glMulticastBlitFramebufferNV_signature func(srcGpu GLuint; dstGpu GLuint; srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum);
var glMulticastBlitFramebufferNV glMulticastBlitFramebufferNV_signature;

def glMulticastFramebufferSampleLocationsfvNV_signature func(gpu GLuint; framebuffer GLuint; start GLuint; count GLsizei; v GLfloat ref);
var glMulticastFramebufferSampleLocationsfvNV glMulticastFramebufferSampleLocationsfvNV_signature;

def glMulticastBarrierNV_signature func();
var glMulticastBarrierNV glMulticastBarrierNV_signature;

def glMulticastWaitSyncNV_signature func(signalGpu GLuint; waitGpuMask GLbitfield);
var glMulticastWaitSyncNV glMulticastWaitSyncNV_signature;

def glMulticastGetQueryObjectivNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLint ref);
var glMulticastGetQueryObjectivNV glMulticastGetQueryObjectivNV_signature;

def glMulticastGetQueryObjectuivNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLuint ref);
var glMulticastGetQueryObjectuivNV glMulticastGetQueryObjectuivNV_signature;

def glMulticastGetQueryObjecti64vNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLint64 ref);
var glMulticastGetQueryObjecti64vNV glMulticastGetQueryObjecti64vNV_signature;

def glMulticastGetQueryObjectui64vNV_signature func(gpu GLuint; id GLuint; pname GLenum; params GLuint64 ref);
var glMulticastGetQueryObjectui64vNV glMulticastGetQueryObjectui64vNV_signature;

def glProgramLocalParameterI4iNV_signature func(target GLenum; index GLuint; x GLint; y GLint; z GLint; w GLint);
var glProgramLocalParameterI4iNV glProgramLocalParameterI4iNV_signature;

def glProgramLocalParameterI4ivNV_signature func(target GLenum; index GLuint; params GLint ref);
var glProgramLocalParameterI4ivNV glProgramLocalParameterI4ivNV_signature;

def glProgramLocalParametersI4ivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLint ref);
var glProgramLocalParametersI4ivNV glProgramLocalParametersI4ivNV_signature;

def glProgramLocalParameterI4uiNV_signature func(target GLenum; index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var glProgramLocalParameterI4uiNV glProgramLocalParameterI4uiNV_signature;

def glProgramLocalParameterI4uivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var glProgramLocalParameterI4uivNV glProgramLocalParameterI4uivNV_signature;

def glProgramLocalParametersI4uivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLuint ref);
var glProgramLocalParametersI4uivNV glProgramLocalParametersI4uivNV_signature;

def glProgramEnvParameterI4iNV_signature func(target GLenum; index GLuint; x GLint; y GLint; z GLint; w GLint);
var glProgramEnvParameterI4iNV glProgramEnvParameterI4iNV_signature;

def glProgramEnvParameterI4ivNV_signature func(target GLenum; index GLuint; params GLint ref);
var glProgramEnvParameterI4ivNV glProgramEnvParameterI4ivNV_signature;

def glProgramEnvParametersI4ivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLint ref);
var glProgramEnvParametersI4ivNV glProgramEnvParametersI4ivNV_signature;

def glProgramEnvParameterI4uiNV_signature func(target GLenum; index GLuint; x GLuint; y GLuint; z GLuint; w GLuint);
var glProgramEnvParameterI4uiNV glProgramEnvParameterI4uiNV_signature;

def glProgramEnvParameterI4uivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var glProgramEnvParameterI4uivNV glProgramEnvParameterI4uivNV_signature;

def glProgramEnvParametersI4uivNV_signature func(target GLenum; index GLuint; count GLsizei; params GLuint ref);
var glProgramEnvParametersI4uivNV glProgramEnvParametersI4uivNV_signature;

def glGetProgramLocalParameterIivNV_signature func(target GLenum; index GLuint; params GLint ref);
var glGetProgramLocalParameterIivNV glGetProgramLocalParameterIivNV_signature;

def glGetProgramLocalParameterIuivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var glGetProgramLocalParameterIuivNV glGetProgramLocalParameterIuivNV_signature;

def glGetProgramEnvParameterIivNV_signature func(target GLenum; index GLuint; params GLint ref);
var glGetProgramEnvParameterIivNV glGetProgramEnvParameterIivNV_signature;

def glGetProgramEnvParameterIuivNV_signature func(target GLenum; index GLuint; params GLuint ref);
var glGetProgramEnvParameterIuivNV glGetProgramEnvParameterIuivNV_signature;

def glProgramSubroutineParametersuivNV_signature func(target GLenum; count GLsizei; params GLuint ref);
var glProgramSubroutineParametersuivNV glProgramSubroutineParametersuivNV_signature;

def glGetProgramSubroutineParameteruivNV_signature func(target GLenum; index GLuint; param GLuint ref);
var glGetProgramSubroutineParameteruivNV glGetProgramSubroutineParameteruivNV_signature;
def GLhalfNV = type u16;

def glVertex2hNV_signature func(x GLhalfNV; y GLhalfNV);
var glVertex2hNV glVertex2hNV_signature;

def glVertex2hvNV_signature func(v GLhalfNV ref);
var glVertex2hvNV glVertex2hvNV_signature;

def glVertex3hNV_signature func(x GLhalfNV; y GLhalfNV; z GLhalfNV);
var glVertex3hNV glVertex3hNV_signature;

def glVertex3hvNV_signature func(v GLhalfNV ref);
var glVertex3hvNV glVertex3hvNV_signature;

def glVertex4hNV_signature func(x GLhalfNV; y GLhalfNV; z GLhalfNV; w GLhalfNV);
var glVertex4hNV glVertex4hNV_signature;

def glVertex4hvNV_signature func(v GLhalfNV ref);
var glVertex4hvNV glVertex4hvNV_signature;

def glNormal3hNV_signature func(nx GLhalfNV; ny GLhalfNV; nz GLhalfNV);
var glNormal3hNV glNormal3hNV_signature;

def glNormal3hvNV_signature func(v GLhalfNV ref);
var glNormal3hvNV glNormal3hvNV_signature;

def glColor3hNV_signature func(red GLhalfNV; green GLhalfNV; blue GLhalfNV);
var glColor3hNV glColor3hNV_signature;

def glColor3hvNV_signature func(v GLhalfNV ref);
var glColor3hvNV glColor3hvNV_signature;

def glColor4hNV_signature func(red GLhalfNV; green GLhalfNV; blue GLhalfNV; alpha GLhalfNV);
var glColor4hNV glColor4hNV_signature;

def glColor4hvNV_signature func(v GLhalfNV ref);
var glColor4hvNV glColor4hvNV_signature;

def glTexCoord1hNV_signature func(s GLhalfNV);
var glTexCoord1hNV glTexCoord1hNV_signature;

def glTexCoord1hvNV_signature func(v GLhalfNV ref);
var glTexCoord1hvNV glTexCoord1hvNV_signature;

def glTexCoord2hNV_signature func(s GLhalfNV; t GLhalfNV);
var glTexCoord2hNV glTexCoord2hNV_signature;

def glTexCoord2hvNV_signature func(v GLhalfNV ref);
var glTexCoord2hvNV glTexCoord2hvNV_signature;

def glTexCoord3hNV_signature func(s GLhalfNV; t GLhalfNV; r GLhalfNV);
var glTexCoord3hNV glTexCoord3hNV_signature;

def glTexCoord3hvNV_signature func(v GLhalfNV ref);
var glTexCoord3hvNV glTexCoord3hvNV_signature;

def glTexCoord4hNV_signature func(s GLhalfNV; t GLhalfNV; r GLhalfNV; q GLhalfNV);
var glTexCoord4hNV glTexCoord4hNV_signature;

def glTexCoord4hvNV_signature func(v GLhalfNV ref);
var glTexCoord4hvNV glTexCoord4hvNV_signature;

def glMultiTexCoord1hNV_signature func(target GLenum; s GLhalfNV);
var glMultiTexCoord1hNV glMultiTexCoord1hNV_signature;

def glMultiTexCoord1hvNV_signature func(target GLenum; v GLhalfNV ref);
var glMultiTexCoord1hvNV glMultiTexCoord1hvNV_signature;

def glMultiTexCoord2hNV_signature func(target GLenum; s GLhalfNV; t GLhalfNV);
var glMultiTexCoord2hNV glMultiTexCoord2hNV_signature;

def glMultiTexCoord2hvNV_signature func(target GLenum; v GLhalfNV ref);
var glMultiTexCoord2hvNV glMultiTexCoord2hvNV_signature;

def glMultiTexCoord3hNV_signature func(target GLenum; s GLhalfNV; t GLhalfNV; r GLhalfNV);
var glMultiTexCoord3hNV glMultiTexCoord3hNV_signature;

def glMultiTexCoord3hvNV_signature func(target GLenum; v GLhalfNV ref);
var glMultiTexCoord3hvNV glMultiTexCoord3hvNV_signature;

def glMultiTexCoord4hNV_signature func(target GLenum; s GLhalfNV; t GLhalfNV; r GLhalfNV; q GLhalfNV);
var glMultiTexCoord4hNV glMultiTexCoord4hNV_signature;

def glMultiTexCoord4hvNV_signature func(target GLenum; v GLhalfNV ref);
var glMultiTexCoord4hvNV glMultiTexCoord4hvNV_signature;

def glFogCoordhNV_signature func(fog GLhalfNV);
var glFogCoordhNV glFogCoordhNV_signature;

def glFogCoordhvNV_signature func(fog GLhalfNV ref);
var glFogCoordhvNV glFogCoordhvNV_signature;

def glSecondaryColor3hNV_signature func(red GLhalfNV; green GLhalfNV; blue GLhalfNV);
var glSecondaryColor3hNV glSecondaryColor3hNV_signature;

def glSecondaryColor3hvNV_signature func(v GLhalfNV ref);
var glSecondaryColor3hvNV glSecondaryColor3hvNV_signature;

def glVertexWeighthNV_signature func(weight GLhalfNV);
var glVertexWeighthNV glVertexWeighthNV_signature;

def glVertexWeighthvNV_signature func(weight GLhalfNV ref);
var glVertexWeighthvNV glVertexWeighthvNV_signature;

def glVertexAttrib1hNV_signature func(index GLuint; x GLhalfNV);
var glVertexAttrib1hNV glVertexAttrib1hNV_signature;

def glVertexAttrib1hvNV_signature func(index GLuint; v GLhalfNV ref);
var glVertexAttrib1hvNV glVertexAttrib1hvNV_signature;

def glVertexAttrib2hNV_signature func(index GLuint; x GLhalfNV; y GLhalfNV);
var glVertexAttrib2hNV glVertexAttrib2hNV_signature;

def glVertexAttrib2hvNV_signature func(index GLuint; v GLhalfNV ref);
var glVertexAttrib2hvNV glVertexAttrib2hvNV_signature;

def glVertexAttrib3hNV_signature func(index GLuint; x GLhalfNV; y GLhalfNV; z GLhalfNV);
var glVertexAttrib3hNV glVertexAttrib3hNV_signature;

def glVertexAttrib3hvNV_signature func(index GLuint; v GLhalfNV ref);
var glVertexAttrib3hvNV glVertexAttrib3hvNV_signature;

def glVertexAttrib4hNV_signature func(index GLuint; x GLhalfNV; y GLhalfNV; z GLhalfNV; w GLhalfNV);
var glVertexAttrib4hNV glVertexAttrib4hNV_signature;

def glVertexAttrib4hvNV_signature func(index GLuint; v GLhalfNV ref);
var glVertexAttrib4hvNV glVertexAttrib4hvNV_signature;

def glVertexAttribs1hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var glVertexAttribs1hvNV glVertexAttribs1hvNV_signature;

def glVertexAttribs2hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var glVertexAttribs2hvNV glVertexAttribs2hvNV_signature;

def glVertexAttribs3hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var glVertexAttribs3hvNV glVertexAttribs3hvNV_signature;

def glVertexAttribs4hvNV_signature func(index GLuint; n GLsizei; v GLhalfNV ref);
var glVertexAttribs4hvNV glVertexAttribs4hvNV_signature;

def glGetInternalformatSampleivNV_signature func(target GLenum; internalformat GLenum; samples GLsizei; pname GLenum; count GLsizei; params GLint ref);
var glGetInternalformatSampleivNV glGetInternalformatSampleivNV_signature;

def glGetMemoryObjectDetachedResourcesuivNV_signature func(memory GLuint; pname GLenum; first GLint; count GLsizei; params GLuint ref);
var glGetMemoryObjectDetachedResourcesuivNV glGetMemoryObjectDetachedResourcesuivNV_signature;

def glResetMemoryObjectParameterNV_signature func(memory GLuint; pname GLenum);
var glResetMemoryObjectParameterNV glResetMemoryObjectParameterNV_signature;

def glTexAttachMemoryNV_signature func(target GLenum; memory GLuint; offset GLuint64);
var glTexAttachMemoryNV glTexAttachMemoryNV_signature;

def glBufferAttachMemoryNV_signature func(target GLenum; memory GLuint; offset GLuint64);
var glBufferAttachMemoryNV glBufferAttachMemoryNV_signature;

def glTextureAttachMemoryNV_signature func(texture GLuint; memory GLuint; offset GLuint64);
var glTextureAttachMemoryNV glTextureAttachMemoryNV_signature;

def glNamedBufferAttachMemoryNV_signature func(buffer GLuint; memory GLuint; offset GLuint64);
var glNamedBufferAttachMemoryNV glNamedBufferAttachMemoryNV_signature;

def glBufferPageCommitmentMemNV_signature func(target GLenum; offset GLintptr; size GLsizeiptr; memory GLuint; memOffset GLuint64; commit GLboolean);
var glBufferPageCommitmentMemNV glBufferPageCommitmentMemNV_signature;

def glTexPageCommitmentMemNV_signature func(target GLenum; layer GLint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64; commit GLboolean);
var glTexPageCommitmentMemNV glTexPageCommitmentMemNV_signature;

def glNamedBufferPageCommitmentMemNV_signature func(buffer GLuint; offset GLintptr; size GLsizeiptr; memory GLuint; memOffset GLuint64; commit GLboolean);
var glNamedBufferPageCommitmentMemNV glNamedBufferPageCommitmentMemNV_signature;

def glTexturePageCommitmentMemNV_signature func(texture GLuint; layer GLint; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; width GLsizei; height GLsizei; depth GLsizei; memory GLuint; offset GLuint64; commit GLboolean);
var glTexturePageCommitmentMemNV glTexturePageCommitmentMemNV_signature;

def glDrawMeshTasksNV_signature func(first GLuint; count GLuint);
var glDrawMeshTasksNV glDrawMeshTasksNV_signature;

def glDrawMeshTasksIndirectNV_signature func(indirect GLintptr);
var glDrawMeshTasksIndirectNV glDrawMeshTasksIndirectNV_signature;

def glMultiDrawMeshTasksIndirectNV_signature func(indirect GLintptr; drawcount GLsizei; stride GLsizei);
var glMultiDrawMeshTasksIndirectNV glMultiDrawMeshTasksIndirectNV_signature;

def glMultiDrawMeshTasksIndirectCountNV_signature func(indirect GLintptr; drawcount GLintptr; maxdrawcount GLsizei; stride GLsizei);
var glMultiDrawMeshTasksIndirectCountNV glMultiDrawMeshTasksIndirectCountNV_signature;

def glGenOcclusionQueriesNV_signature func(n GLsizei; ids GLuint ref);
var glGenOcclusionQueriesNV glGenOcclusionQueriesNV_signature;

def glDeleteOcclusionQueriesNV_signature func(n GLsizei; ids GLuint ref);
var glDeleteOcclusionQueriesNV glDeleteOcclusionQueriesNV_signature;

def glIsOcclusionQueryNV_signature func(id GLuint) (result GLboolean);
var glIsOcclusionQueryNV glIsOcclusionQueryNV_signature;

def glBeginOcclusionQueryNV_signature func(id GLuint);
var glBeginOcclusionQueryNV glBeginOcclusionQueryNV_signature;

def glEndOcclusionQueryNV_signature func();
var glEndOcclusionQueryNV glEndOcclusionQueryNV_signature;

def glGetOcclusionQueryivNV_signature func(id GLuint; pname GLenum; params GLint ref);
var glGetOcclusionQueryivNV glGetOcclusionQueryivNV_signature;

def glGetOcclusionQueryuivNV_signature func(id GLuint; pname GLenum; params GLuint ref);
var glGetOcclusionQueryuivNV glGetOcclusionQueryuivNV_signature;

def glProgramBufferParametersfvNV_signature func(target GLenum; bindingIndex GLuint; wordIndex GLuint; count GLsizei; params GLfloat ref);
var glProgramBufferParametersfvNV glProgramBufferParametersfvNV_signature;

def glProgramBufferParametersIivNV_signature func(target GLenum; bindingIndex GLuint; wordIndex GLuint; count GLsizei; params GLint ref);
var glProgramBufferParametersIivNV glProgramBufferParametersIivNV_signature;

def glProgramBufferParametersIuivNV_signature func(target GLenum; bindingIndex GLuint; wordIndex GLuint; count GLsizei; params GLuint ref);
var glProgramBufferParametersIuivNV glProgramBufferParametersIuivNV_signature;

def glGenPathsNV_signature func(range GLsizei) (result GLuint);
var glGenPathsNV glGenPathsNV_signature;

def glDeletePathsNV_signature func(path GLuint; range GLsizei);
var glDeletePathsNV glDeletePathsNV_signature;

def glIsPathNV_signature func(path GLuint) (result GLboolean);
var glIsPathNV glIsPathNV_signature;

def glPathCommandsNV_signature func(path GLuint; numCommands GLsizei; commands GLubyte ref; numCoords GLsizei; coordType GLenum; coords u8 ref);
var glPathCommandsNV glPathCommandsNV_signature;

def glPathCoordsNV_signature func(path GLuint; numCoords GLsizei; coordType GLenum; coords u8 ref);
var glPathCoordsNV glPathCoordsNV_signature;

def glPathSubCommandsNV_signature func(path GLuint; commandStart GLsizei; commandsToDelete GLsizei; numCommands GLsizei; commands GLubyte ref; numCoords GLsizei; coordType GLenum; coords u8 ref);
var glPathSubCommandsNV glPathSubCommandsNV_signature;

def glPathSubCoordsNV_signature func(path GLuint; coordStart GLsizei; numCoords GLsizei; coordType GLenum; coords u8 ref);
var glPathSubCoordsNV glPathSubCoordsNV_signature;

def glPathStringNV_signature func(path GLuint; format GLenum; length GLsizei; pathString u8 ref);
var glPathStringNV glPathStringNV_signature;

def glPathGlyphsNV_signature func(firstPathName GLuint; fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; numGlyphs GLsizei; type GLenum; charcodes u8 ref; handleMissingGlyphs GLenum; pathParameterTemplate GLuint; emScale GLfloat);
var glPathGlyphsNV glPathGlyphsNV_signature;

def glPathGlyphRangeNV_signature func(firstPathName GLuint; fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; firstGlyph GLuint; numGlyphs GLsizei; handleMissingGlyphs GLenum; pathParameterTemplate GLuint; emScale GLfloat);
var glPathGlyphRangeNV glPathGlyphRangeNV_signature;

def glWeightPathsNV_signature func(resultPath GLuint; numPaths GLsizei; paths GLuint ref; weights GLfloat ref);
var glWeightPathsNV glWeightPathsNV_signature;

def glCopyPathNV_signature func(resultPath GLuint; srcPath GLuint);
var glCopyPathNV glCopyPathNV_signature;

def glInterpolatePathsNV_signature func(resultPath GLuint; pathA GLuint; pathB GLuint; weight GLfloat);
var glInterpolatePathsNV glInterpolatePathsNV_signature;

def glTransformPathNV_signature func(resultPath GLuint; srcPath GLuint; transformType GLenum; transformValues GLfloat ref);
var glTransformPathNV glTransformPathNV_signature;

def glPathParameterivNV_signature func(path GLuint; pname GLenum; value GLint ref);
var glPathParameterivNV glPathParameterivNV_signature;

def glPathParameteriNV_signature func(path GLuint; pname GLenum; value GLint);
var glPathParameteriNV glPathParameteriNV_signature;

def glPathParameterfvNV_signature func(path GLuint; pname GLenum; value GLfloat ref);
var glPathParameterfvNV glPathParameterfvNV_signature;

def glPathParameterfNV_signature func(path GLuint; pname GLenum; value GLfloat);
var glPathParameterfNV glPathParameterfNV_signature;

def glPathDashArrayNV_signature func(path GLuint; dashCount GLsizei; dashArray GLfloat ref);
var glPathDashArrayNV glPathDashArrayNV_signature;

def glPathStencilFuncNV_signature func(func GLenum; ref GLint; mask GLuint);
var glPathStencilFuncNV glPathStencilFuncNV_signature;

def glPathStencilDepthOffsetNV_signature func(factor GLfloat; units GLfloat);
var glPathStencilDepthOffsetNV glPathStencilDepthOffsetNV_signature;

def glStencilFillPathNV_signature func(path GLuint; fillMode GLenum; mask GLuint);
var glStencilFillPathNV glStencilFillPathNV_signature;

def glStencilStrokePathNV_signature func(path GLuint; reference GLint; mask GLuint);
var glStencilStrokePathNV glStencilStrokePathNV_signature;

def glStencilFillPathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; fillMode GLenum; mask GLuint; transformType GLenum; transformValues GLfloat ref);
var glStencilFillPathInstancedNV glStencilFillPathInstancedNV_signature;

def glStencilStrokePathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; reference GLint; mask GLuint; transformType GLenum; transformValues GLfloat ref);
var glStencilStrokePathInstancedNV glStencilStrokePathInstancedNV_signature;

def glPathCoverDepthFuncNV_signature func(func GLenum);
var glPathCoverDepthFuncNV glPathCoverDepthFuncNV_signature;

def glCoverFillPathNV_signature func(path GLuint; coverMode GLenum);
var glCoverFillPathNV glCoverFillPathNV_signature;

def glCoverStrokePathNV_signature func(path GLuint; coverMode GLenum);
var glCoverStrokePathNV glCoverStrokePathNV_signature;

def glCoverFillPathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var glCoverFillPathInstancedNV glCoverFillPathInstancedNV_signature;

def glCoverStrokePathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var glCoverStrokePathInstancedNV glCoverStrokePathInstancedNV_signature;

def glGetPathParameterivNV_signature func(path GLuint; pname GLenum; value GLint ref);
var glGetPathParameterivNV glGetPathParameterivNV_signature;

def glGetPathParameterfvNV_signature func(path GLuint; pname GLenum; value GLfloat ref);
var glGetPathParameterfvNV glGetPathParameterfvNV_signature;

def glGetPathCommandsNV_signature func(path GLuint; commands GLubyte ref);
var glGetPathCommandsNV glGetPathCommandsNV_signature;

def glGetPathCoordsNV_signature func(path GLuint; coords GLfloat ref);
var glGetPathCoordsNV glGetPathCoordsNV_signature;

def glGetPathDashArrayNV_signature func(path GLuint; dashArray GLfloat ref);
var glGetPathDashArrayNV glGetPathDashArrayNV_signature;

def glGetPathMetricsNV_signature func(metricQueryMask GLbitfield; numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; stride GLsizei; metrics GLfloat ref);
var glGetPathMetricsNV glGetPathMetricsNV_signature;

def glGetPathMetricRangeNV_signature func(metricQueryMask GLbitfield; firstPathName GLuint; numPaths GLsizei; stride GLsizei; metrics GLfloat ref);
var glGetPathMetricRangeNV glGetPathMetricRangeNV_signature;

def glGetPathSpacingNV_signature func(pathListMode GLenum; numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; advanceScale GLfloat; kerningScale GLfloat; transformType GLenum; returnedSpacing GLfloat ref);
var glGetPathSpacingNV glGetPathSpacingNV_signature;

def glIsPointInFillPathNV_signature func(path GLuint; mask GLuint; x GLfloat; y GLfloat) (result GLboolean);
var glIsPointInFillPathNV glIsPointInFillPathNV_signature;

def glIsPointInStrokePathNV_signature func(path GLuint; x GLfloat; y GLfloat) (result GLboolean);
var glIsPointInStrokePathNV glIsPointInStrokePathNV_signature;

def glGetPathLengthNV_signature func(path GLuint; startSegment GLsizei; numSegments GLsizei) (result GLfloat);
var glGetPathLengthNV glGetPathLengthNV_signature;

def glPointAlongPathNV_signature func(path GLuint; startSegment GLsizei; numSegments GLsizei; distance GLfloat; x GLfloat ref; y GLfloat ref; tangentX GLfloat ref; tangentY GLfloat ref) (result GLboolean);
var glPointAlongPathNV glPointAlongPathNV_signature;

def glMatrixLoad3x2fNV_signature func(matrixMode GLenum; m GLfloat ref);
var glMatrixLoad3x2fNV glMatrixLoad3x2fNV_signature;

def glMatrixLoad3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var glMatrixLoad3x3fNV glMatrixLoad3x3fNV_signature;

def glMatrixLoadTranspose3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var glMatrixLoadTranspose3x3fNV glMatrixLoadTranspose3x3fNV_signature;

def glMatrixMult3x2fNV_signature func(matrixMode GLenum; m GLfloat ref);
var glMatrixMult3x2fNV glMatrixMult3x2fNV_signature;

def glMatrixMult3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var glMatrixMult3x3fNV glMatrixMult3x3fNV_signature;

def glMatrixMultTranspose3x3fNV_signature func(matrixMode GLenum; m GLfloat ref);
var glMatrixMultTranspose3x3fNV glMatrixMultTranspose3x3fNV_signature;

def glStencilThenCoverFillPathNV_signature func(path GLuint; fillMode GLenum; mask GLuint; coverMode GLenum);
var glStencilThenCoverFillPathNV glStencilThenCoverFillPathNV_signature;

def glStencilThenCoverStrokePathNV_signature func(path GLuint; reference GLint; mask GLuint; coverMode GLenum);
var glStencilThenCoverStrokePathNV glStencilThenCoverStrokePathNV_signature;

def glStencilThenCoverFillPathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; fillMode GLenum; mask GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var glStencilThenCoverFillPathInstancedNV glStencilThenCoverFillPathInstancedNV_signature;

def glStencilThenCoverStrokePathInstancedNV_signature func(numPaths GLsizei; pathNameType GLenum; paths u8 ref; pathBase GLuint; reference GLint; mask GLuint; coverMode GLenum; transformType GLenum; transformValues GLfloat ref);
var glStencilThenCoverStrokePathInstancedNV glStencilThenCoverStrokePathInstancedNV_signature;

def glPathGlyphIndexRangeNV_signature func(fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; pathParameterTemplate GLuint; emScale GLfloat; baseAndCount GLuint ref) (result GLenum);
var glPathGlyphIndexRangeNV glPathGlyphIndexRangeNV_signature;

def glPathGlyphIndexArrayNV_signature func(firstPathName GLuint; fontTarget GLenum; fontName u8 ref; fontStyle GLbitfield; firstGlyphIndex GLuint; numGlyphs GLsizei; pathParameterTemplate GLuint; emScale GLfloat) (result GLenum);
var glPathGlyphIndexArrayNV glPathGlyphIndexArrayNV_signature;

def glPathMemoryGlyphIndexArrayNV_signature func(firstPathName GLuint; fontTarget GLenum; fontSize GLsizeiptr; fontData u8 ref; faceIndex GLsizei; firstGlyphIndex GLuint; numGlyphs GLsizei; pathParameterTemplate GLuint; emScale GLfloat) (result GLenum);
var glPathMemoryGlyphIndexArrayNV glPathMemoryGlyphIndexArrayNV_signature;

def glProgramPathFragmentInputGenNV_signature func(program GLuint; location GLint; genMode GLenum; components GLint; coeffs GLfloat ref);
var glProgramPathFragmentInputGenNV glProgramPathFragmentInputGenNV_signature;

def glGetProgramResourcefvNV_signature func(program GLuint; programInterface GLenum; index GLuint; propCount GLsizei; props GLenum ref; count GLsizei; length GLsizei ref; params GLfloat ref);
var glGetProgramResourcefvNV glGetProgramResourcefvNV_signature;

def glPathColorGenNV_signature func(color GLenum; genMode GLenum; colorFormat GLenum; coeffs GLfloat ref);
var glPathColorGenNV glPathColorGenNV_signature;

def glPathTexGenNV_signature func(texCoordSet GLenum; genMode GLenum; components GLint; coeffs GLfloat ref);
var glPathTexGenNV glPathTexGenNV_signature;

def glPathFogGenNV_signature func(genMode GLenum);
var glPathFogGenNV glPathFogGenNV_signature;

def glGetPathColorGenivNV_signature func(color GLenum; pname GLenum; value GLint ref);
var glGetPathColorGenivNV glGetPathColorGenivNV_signature;

def glGetPathColorGenfvNV_signature func(color GLenum; pname GLenum; value GLfloat ref);
var glGetPathColorGenfvNV glGetPathColorGenfvNV_signature;

def glGetPathTexGenivNV_signature func(texCoordSet GLenum; pname GLenum; value GLint ref);
var glGetPathTexGenivNV glGetPathTexGenivNV_signature;

def glGetPathTexGenfvNV_signature func(texCoordSet GLenum; pname GLenum; value GLfloat ref);
var glGetPathTexGenfvNV glGetPathTexGenfvNV_signature;

def glPixelDataRangeNV_signature func(target GLenum; length GLsizei; pointer u8 ref);
var glPixelDataRangeNV glPixelDataRangeNV_signature;

def glFlushPixelDataRangeNV_signature func(target GLenum);
var glFlushPixelDataRangeNV glFlushPixelDataRangeNV_signature;

def glPointParameteriNV_signature func(pname GLenum; param GLint);
var glPointParameteriNV glPointParameteriNV_signature;

def glPointParameterivNV_signature func(pname GLenum; params GLint ref);
var glPointParameterivNV glPointParameterivNV_signature;

def glPresentFrameKeyedNV_signature func(video_slot GLuint; minPresentTime GLuint64EXT; beginPresentTimeId GLuint; presentDurationId GLuint; type GLenum; target0 GLenum; fill0 GLuint; key0 GLuint; target1 GLenum; fill1 GLuint; key1 GLuint);
var glPresentFrameKeyedNV glPresentFrameKeyedNV_signature;

def glPresentFrameDualFillNV_signature func(video_slot GLuint; minPresentTime GLuint64EXT; beginPresentTimeId GLuint; presentDurationId GLuint; type GLenum; target0 GLenum; fill0 GLuint; target1 GLenum; fill1 GLuint; target2 GLenum; fill2 GLuint; target3 GLenum; fill3 GLuint);
var glPresentFrameDualFillNV glPresentFrameDualFillNV_signature;

def glGetVideoivNV_signature func(video_slot GLuint; pname GLenum; params GLint ref);
var glGetVideoivNV glGetVideoivNV_signature;

def glGetVideouivNV_signature func(video_slot GLuint; pname GLenum; params GLuint ref);
var glGetVideouivNV glGetVideouivNV_signature;

def glGetVideoi64vNV_signature func(video_slot GLuint; pname GLenum; params GLint64EXT ref);
var glGetVideoi64vNV glGetVideoi64vNV_signature;

def glGetVideoui64vNV_signature func(video_slot GLuint; pname GLenum; params GLuint64EXT ref);
var glGetVideoui64vNV glGetVideoui64vNV_signature;

def glPrimitiveRestartNV_signature func();
var glPrimitiveRestartNV glPrimitiveRestartNV_signature;

def glPrimitiveRestartIndexNV_signature func(index GLuint);
var glPrimitiveRestartIndexNV glPrimitiveRestartIndexNV_signature;

def glQueryResourceNV_signature func(queryType GLenum; tagId GLint; count GLuint; buffer GLint ref) (result GLint);
var glQueryResourceNV glQueryResourceNV_signature;

def glGenQueryResourceTagNV_signature func(n GLsizei; tagIds GLint ref);
var glGenQueryResourceTagNV glGenQueryResourceTagNV_signature;

def glDeleteQueryResourceTagNV_signature func(n GLsizei; tagIds GLint ref);
var glDeleteQueryResourceTagNV glDeleteQueryResourceTagNV_signature;

def glQueryResourceTagNV_signature func(tagId GLint; tagString GLchar ref);
var glQueryResourceTagNV glQueryResourceTagNV_signature;

def glCombinerParameterfvNV_signature func(pname GLenum; params GLfloat ref);
var glCombinerParameterfvNV glCombinerParameterfvNV_signature;

def glCombinerParameterfNV_signature func(pname GLenum; param GLfloat);
var glCombinerParameterfNV glCombinerParameterfNV_signature;

def glCombinerParameterivNV_signature func(pname GLenum; params GLint ref);
var glCombinerParameterivNV glCombinerParameterivNV_signature;

def glCombinerParameteriNV_signature func(pname GLenum; param GLint);
var glCombinerParameteriNV glCombinerParameteriNV_signature;

def glCombinerInputNV_signature func(stage GLenum; portion GLenum; variable GLenum; input GLenum; mapping GLenum; componentUsage GLenum);
var glCombinerInputNV glCombinerInputNV_signature;

def glCombinerOutputNV_signature func(stage GLenum; portion GLenum; abOutput GLenum; cdOutput GLenum; sumOutput GLenum; scale GLenum; bias GLenum; abDotProduct GLboolean; cdDotProduct GLboolean; muxSum GLboolean);
var glCombinerOutputNV glCombinerOutputNV_signature;

def glFinalCombinerInputNV_signature func(variable GLenum; input GLenum; mapping GLenum; componentUsage GLenum);
var glFinalCombinerInputNV glFinalCombinerInputNV_signature;

def glGetCombinerInputParameterfvNV_signature func(stage GLenum; portion GLenum; variable GLenum; pname GLenum; params GLfloat ref);
var glGetCombinerInputParameterfvNV glGetCombinerInputParameterfvNV_signature;

def glGetCombinerInputParameterivNV_signature func(stage GLenum; portion GLenum; variable GLenum; pname GLenum; params GLint ref);
var glGetCombinerInputParameterivNV glGetCombinerInputParameterivNV_signature;

def glGetCombinerOutputParameterfvNV_signature func(stage GLenum; portion GLenum; pname GLenum; params GLfloat ref);
var glGetCombinerOutputParameterfvNV glGetCombinerOutputParameterfvNV_signature;

def glGetCombinerOutputParameterivNV_signature func(stage GLenum; portion GLenum; pname GLenum; params GLint ref);
var glGetCombinerOutputParameterivNV glGetCombinerOutputParameterivNV_signature;

def glGetFinalCombinerInputParameterfvNV_signature func(variable GLenum; pname GLenum; params GLfloat ref);
var glGetFinalCombinerInputParameterfvNV glGetFinalCombinerInputParameterfvNV_signature;

def glGetFinalCombinerInputParameterivNV_signature func(variable GLenum; pname GLenum; params GLint ref);
var glGetFinalCombinerInputParameterivNV glGetFinalCombinerInputParameterivNV_signature;

def glCombinerStageParameterfvNV_signature func(stage GLenum; pname GLenum; params GLfloat ref);
var glCombinerStageParameterfvNV glCombinerStageParameterfvNV_signature;

def glGetCombinerStageParameterfvNV_signature func(stage GLenum; pname GLenum; params GLfloat ref);
var glGetCombinerStageParameterfvNV glGetCombinerStageParameterfvNV_signature;

def glFramebufferSampleLocationsfvNV_signature func(target GLenum; start GLuint; count GLsizei; v GLfloat ref);
var glFramebufferSampleLocationsfvNV glFramebufferSampleLocationsfvNV_signature;

def glNamedFramebufferSampleLocationsfvNV_signature func(framebuffer GLuint; start GLuint; count GLsizei; v GLfloat ref);
var glNamedFramebufferSampleLocationsfvNV glNamedFramebufferSampleLocationsfvNV_signature;

def glResolveDepthValuesNV_signature func();
var glResolveDepthValuesNV glResolveDepthValuesNV_signature;

def glScissorExclusiveNV_signature func(x GLint; y GLint; width GLsizei; height GLsizei);
var glScissorExclusiveNV glScissorExclusiveNV_signature;

def glScissorExclusiveArrayvNV_signature func(first GLuint; count GLsizei; v GLint ref);
var glScissorExclusiveArrayvNV glScissorExclusiveArrayvNV_signature;

def glMakeBufferResidentNV_signature func(target GLenum; access GLenum);
var glMakeBufferResidentNV glMakeBufferResidentNV_signature;

def glMakeBufferNonResidentNV_signature func(target GLenum);
var glMakeBufferNonResidentNV glMakeBufferNonResidentNV_signature;

def glIsBufferResidentNV_signature func(target GLenum) (result GLboolean);
var glIsBufferResidentNV glIsBufferResidentNV_signature;

def glMakeNamedBufferResidentNV_signature func(buffer GLuint; access GLenum);
var glMakeNamedBufferResidentNV glMakeNamedBufferResidentNV_signature;

def glMakeNamedBufferNonResidentNV_signature func(buffer GLuint);
var glMakeNamedBufferNonResidentNV glMakeNamedBufferNonResidentNV_signature;

def glIsNamedBufferResidentNV_signature func(buffer GLuint) (result GLboolean);
var glIsNamedBufferResidentNV glIsNamedBufferResidentNV_signature;

def glGetBufferParameterui64vNV_signature func(target GLenum; pname GLenum; params GLuint64EXT ref);
var glGetBufferParameterui64vNV glGetBufferParameterui64vNV_signature;

def glGetNamedBufferParameterui64vNV_signature func(buffer GLuint; pname GLenum; params GLuint64EXT ref);
var glGetNamedBufferParameterui64vNV glGetNamedBufferParameterui64vNV_signature;

def glGetIntegerui64vNV_signature func(value GLenum; result GLuint64EXT ref);
var glGetIntegerui64vNV glGetIntegerui64vNV_signature;

def glUniformui64NV_signature func(location GLint; value GLuint64EXT);
var glUniformui64NV glUniformui64NV_signature;

def glUniformui64vNV_signature func(location GLint; count GLsizei; value GLuint64EXT ref);
var glUniformui64vNV glUniformui64vNV_signature;

def glProgramUniformui64NV_signature func(program GLuint; location GLint; value GLuint64EXT);
var glProgramUniformui64NV glProgramUniformui64NV_signature;

def glProgramUniformui64vNV_signature func(program GLuint; location GLint; count GLsizei; value GLuint64EXT ref);
var glProgramUniformui64vNV glProgramUniformui64vNV_signature;

def glBindShadingRateImageNV_signature func(texture GLuint);
var glBindShadingRateImageNV glBindShadingRateImageNV_signature;

def glGetShadingRateImagePaletteNV_signature func(viewport GLuint; entry GLuint; rate GLenum ref);
var glGetShadingRateImagePaletteNV glGetShadingRateImagePaletteNV_signature;

def glGetShadingRateSampleLocationivNV_signature func(rate GLenum; samples GLuint; index GLuint; location GLint ref);
var glGetShadingRateSampleLocationivNV glGetShadingRateSampleLocationivNV_signature;

def glShadingRateImageBarrierNV_signature func(synchronize GLboolean);
var glShadingRateImageBarrierNV glShadingRateImageBarrierNV_signature;

def glShadingRateImagePaletteNV_signature func(viewport GLuint; first GLuint; count GLsizei; rates GLenum ref);
var glShadingRateImagePaletteNV glShadingRateImagePaletteNV_signature;

def glShadingRateSampleOrderNV_signature func(order GLenum);
var glShadingRateSampleOrderNV glShadingRateSampleOrderNV_signature;

def glShadingRateSampleOrderCustomNV_signature func(rate GLenum; samples GLuint; locations GLint ref);
var glShadingRateSampleOrderCustomNV glShadingRateSampleOrderCustomNV_signature;

def glTextureBarrierNV_signature func();
var glTextureBarrierNV glTextureBarrierNV_signature;

def glTexImage2DMultisampleCoverageNV_signature func(target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; fixedSampleLocations GLboolean);
var glTexImage2DMultisampleCoverageNV glTexImage2DMultisampleCoverageNV_signature;

def glTexImage3DMultisampleCoverageNV_signature func(target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean);
var glTexImage3DMultisampleCoverageNV glTexImage3DMultisampleCoverageNV_signature;

def glTextureImage2DMultisampleNV_signature func(texture GLuint; target GLenum; samples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; fixedSampleLocations GLboolean);
var glTextureImage2DMultisampleNV glTextureImage2DMultisampleNV_signature;

def glTextureImage3DMultisampleNV_signature func(texture GLuint; target GLenum; samples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean);
var glTextureImage3DMultisampleNV glTextureImage3DMultisampleNV_signature;

def glTextureImage2DMultisampleCoverageNV_signature func(texture GLuint; target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; fixedSampleLocations GLboolean);
var glTextureImage2DMultisampleCoverageNV glTextureImage2DMultisampleCoverageNV_signature;

def glTextureImage3DMultisampleCoverageNV_signature func(texture GLuint; target GLenum; coverageSamples GLsizei; colorSamples GLsizei; internalFormat GLint; width GLsizei; height GLsizei; depth GLsizei; fixedSampleLocations GLboolean);
var glTextureImage3DMultisampleCoverageNV glTextureImage3DMultisampleCoverageNV_signature;

def glCreateSemaphoresNV_signature func(n GLsizei; semaphores GLuint ref);
var glCreateSemaphoresNV glCreateSemaphoresNV_signature;

def glSemaphoreParameterivNV_signature func(semaphore GLuint; pname GLenum; params GLint ref);
var glSemaphoreParameterivNV glSemaphoreParameterivNV_signature;

def glGetSemaphoreParameterivNV_signature func(semaphore GLuint; pname GLenum; params GLint ref);
var glGetSemaphoreParameterivNV glGetSemaphoreParameterivNV_signature;

def glBeginTransformFeedbackNV_signature func(primitiveMode GLenum);
var glBeginTransformFeedbackNV glBeginTransformFeedbackNV_signature;

def glEndTransformFeedbackNV_signature func();
var glEndTransformFeedbackNV glEndTransformFeedbackNV_signature;

def glTransformFeedbackAttribsNV_signature func(count GLsizei; attribs GLint ref; bufferMode GLenum);
var glTransformFeedbackAttribsNV glTransformFeedbackAttribsNV_signature;

def glBindBufferRangeNV_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr; size GLsizeiptr);
var glBindBufferRangeNV glBindBufferRangeNV_signature;

def glBindBufferOffsetNV_signature func(target GLenum; index GLuint; buffer GLuint; offset GLintptr);
var glBindBufferOffsetNV glBindBufferOffsetNV_signature;

def glBindBufferBaseNV_signature func(target GLenum; index GLuint; buffer GLuint);
var glBindBufferBaseNV glBindBufferBaseNV_signature;

def glTransformFeedbackVaryingsNV_signature func(program GLuint; count GLsizei; locations GLint ref; bufferMode GLenum);
var glTransformFeedbackVaryingsNV glTransformFeedbackVaryingsNV_signature;

def glActiveVaryingNV_signature func(program GLuint; name GLchar ref);
var glActiveVaryingNV glActiveVaryingNV_signature;

def glGetVaryingLocationNV_signature func(program GLuint; name GLchar ref) (result GLint);
var glGetVaryingLocationNV glGetVaryingLocationNV_signature;

def glGetActiveVaryingNV_signature func(program GLuint; index GLuint; bufSize GLsizei; length GLsizei ref; size GLsizei ref; type GLenum ref; name GLchar ref);
var glGetActiveVaryingNV glGetActiveVaryingNV_signature;

def glGetTransformFeedbackVaryingNV_signature func(program GLuint; index GLuint; location GLint ref);
var glGetTransformFeedbackVaryingNV glGetTransformFeedbackVaryingNV_signature;

def glTransformFeedbackStreamAttribsNV_signature func(count GLsizei; attribs GLint ref; nbuffers GLsizei; bufstreams GLint ref; bufferMode GLenum);
var glTransformFeedbackStreamAttribsNV glTransformFeedbackStreamAttribsNV_signature;

def glBindTransformFeedbackNV_signature func(target GLenum; id GLuint);
var glBindTransformFeedbackNV glBindTransformFeedbackNV_signature;

def glDeleteTransformFeedbacksNV_signature func(n GLsizei; ids GLuint ref);
var glDeleteTransformFeedbacksNV glDeleteTransformFeedbacksNV_signature;

def glGenTransformFeedbacksNV_signature func(n GLsizei; ids GLuint ref);
var glGenTransformFeedbacksNV glGenTransformFeedbacksNV_signature;

def glIsTransformFeedbackNV_signature func(id GLuint) (result GLboolean);
var glIsTransformFeedbackNV glIsTransformFeedbackNV_signature;

def glPauseTransformFeedbackNV_signature func();
var glPauseTransformFeedbackNV glPauseTransformFeedbackNV_signature;

def glResumeTransformFeedbackNV_signature func();
var glResumeTransformFeedbackNV glResumeTransformFeedbackNV_signature;

def glDrawTransformFeedbackNV_signature func(mode GLenum; id GLuint);
var glDrawTransformFeedbackNV glDrawTransformFeedbackNV_signature;
def GLvdpauSurfaceNV = type GLintptr;

def glVDPAUInitNV_signature func(vdpDevice u8 ref; getProcAddress u8 ref);
var glVDPAUInitNV glVDPAUInitNV_signature;

def glVDPAUFiniNV_signature func();
var glVDPAUFiniNV glVDPAUFiniNV_signature;

def glVDPAURegisterVideoSurfaceNV_signature func(vdpSurface u8 ref; target GLenum; numTextureNames GLsizei; textureNames GLuint ref) (result GLvdpauSurfaceNV);
var glVDPAURegisterVideoSurfaceNV glVDPAURegisterVideoSurfaceNV_signature;

def glVDPAURegisterOutputSurfaceNV_signature func(vdpSurface u8 ref; target GLenum; numTextureNames GLsizei; textureNames GLuint ref) (result GLvdpauSurfaceNV);
var glVDPAURegisterOutputSurfaceNV glVDPAURegisterOutputSurfaceNV_signature;

def glVDPAUIsSurfaceNV_signature func(surface GLvdpauSurfaceNV) (result GLboolean);
var glVDPAUIsSurfaceNV glVDPAUIsSurfaceNV_signature;

def glVDPAUUnregisterSurfaceNV_signature func(surface GLvdpauSurfaceNV);
var glVDPAUUnregisterSurfaceNV glVDPAUUnregisterSurfaceNV_signature;

def glVDPAUGetSurfaceivNV_signature func(surface GLvdpauSurfaceNV; pname GLenum; count GLsizei; length GLsizei ref; values GLint ref);
var glVDPAUGetSurfaceivNV glVDPAUGetSurfaceivNV_signature;

def glVDPAUSurfaceAccessNV_signature func(surface GLvdpauSurfaceNV; access GLenum);
var glVDPAUSurfaceAccessNV glVDPAUSurfaceAccessNV_signature;

def glVDPAUMapSurfacesNV_signature func(numSurfaces GLsizei; surfaces GLvdpauSurfaceNV ref);
var glVDPAUMapSurfacesNV glVDPAUMapSurfacesNV_signature;

def glVDPAUUnmapSurfacesNV_signature func(numSurface GLsizei; surfaces GLvdpauSurfaceNV ref);
var glVDPAUUnmapSurfacesNV glVDPAUUnmapSurfacesNV_signature;

def glVDPAURegisterVideoSurfaceWithPictureStructureNV_signature func(vdpSurface u8 ref; target GLenum; numTextureNames GLsizei; textureNames GLuint ref; isFrameStructure GLboolean) (result GLvdpauSurfaceNV);
var glVDPAURegisterVideoSurfaceWithPictureStructureNV glVDPAURegisterVideoSurfaceWithPictureStructureNV_signature;

def glFlushVertexArrayRangeNV_signature func();
var glFlushVertexArrayRangeNV glFlushVertexArrayRangeNV_signature;

def glVertexArrayRangeNV_signature func(length GLsizei; pointer u8 ref);
var glVertexArrayRangeNV glVertexArrayRangeNV_signature;

def glVertexAttribL1i64NV_signature func(index GLuint; x GLint64EXT);
var glVertexAttribL1i64NV glVertexAttribL1i64NV_signature;

def glVertexAttribL2i64NV_signature func(index GLuint; x GLint64EXT; y GLint64EXT);
var glVertexAttribL2i64NV glVertexAttribL2i64NV_signature;

def glVertexAttribL3i64NV_signature func(index GLuint; x GLint64EXT; y GLint64EXT; z GLint64EXT);
var glVertexAttribL3i64NV glVertexAttribL3i64NV_signature;

def glVertexAttribL4i64NV_signature func(index GLuint; x GLint64EXT; y GLint64EXT; z GLint64EXT; w GLint64EXT);
var glVertexAttribL4i64NV glVertexAttribL4i64NV_signature;

def glVertexAttribL1i64vNV_signature func(index GLuint; v GLint64EXT ref);
var glVertexAttribL1i64vNV glVertexAttribL1i64vNV_signature;

def glVertexAttribL2i64vNV_signature func(index GLuint; v GLint64EXT ref);
var glVertexAttribL2i64vNV glVertexAttribL2i64vNV_signature;

def glVertexAttribL3i64vNV_signature func(index GLuint; v GLint64EXT ref);
var glVertexAttribL3i64vNV glVertexAttribL3i64vNV_signature;

def glVertexAttribL4i64vNV_signature func(index GLuint; v GLint64EXT ref);
var glVertexAttribL4i64vNV glVertexAttribL4i64vNV_signature;

def glVertexAttribL1ui64NV_signature func(index GLuint; x GLuint64EXT);
var glVertexAttribL1ui64NV glVertexAttribL1ui64NV_signature;

def glVertexAttribL2ui64NV_signature func(index GLuint; x GLuint64EXT; y GLuint64EXT);
var glVertexAttribL2ui64NV glVertexAttribL2ui64NV_signature;

def glVertexAttribL3ui64NV_signature func(index GLuint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT);
var glVertexAttribL3ui64NV glVertexAttribL3ui64NV_signature;

def glVertexAttribL4ui64NV_signature func(index GLuint; x GLuint64EXT; y GLuint64EXT; z GLuint64EXT; w GLuint64EXT);
var glVertexAttribL4ui64NV glVertexAttribL4ui64NV_signature;

def glVertexAttribL1ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var glVertexAttribL1ui64vNV glVertexAttribL1ui64vNV_signature;

def glVertexAttribL2ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var glVertexAttribL2ui64vNV glVertexAttribL2ui64vNV_signature;

def glVertexAttribL3ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var glVertexAttribL3ui64vNV glVertexAttribL3ui64vNV_signature;

def glVertexAttribL4ui64vNV_signature func(index GLuint; v GLuint64EXT ref);
var glVertexAttribL4ui64vNV glVertexAttribL4ui64vNV_signature;

def glGetVertexAttribLi64vNV_signature func(index GLuint; pname GLenum; params GLint64EXT ref);
var glGetVertexAttribLi64vNV glGetVertexAttribLi64vNV_signature;

def glGetVertexAttribLui64vNV_signature func(index GLuint; pname GLenum; params GLuint64EXT ref);
var glGetVertexAttribLui64vNV glGetVertexAttribLui64vNV_signature;

def glVertexAttribLFormatNV_signature func(index GLuint; size GLint; type GLenum; stride GLsizei);
var glVertexAttribLFormatNV glVertexAttribLFormatNV_signature;

def glBufferAddressRangeNV_signature func(pname GLenum; index GLuint; address GLuint64EXT; length GLsizeiptr);
var glBufferAddressRangeNV glBufferAddressRangeNV_signature;

def glVertexFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var glVertexFormatNV glVertexFormatNV_signature;

def glNormalFormatNV_signature func(type GLenum; stride GLsizei);
var glNormalFormatNV glNormalFormatNV_signature;

def glColorFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var glColorFormatNV glColorFormatNV_signature;

def glIndexFormatNV_signature func(type GLenum; stride GLsizei);
var glIndexFormatNV glIndexFormatNV_signature;

def glTexCoordFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var glTexCoordFormatNV glTexCoordFormatNV_signature;

def glEdgeFlagFormatNV_signature func(stride GLsizei);
var glEdgeFlagFormatNV glEdgeFlagFormatNV_signature;

def glSecondaryColorFormatNV_signature func(size GLint; type GLenum; stride GLsizei);
var glSecondaryColorFormatNV glSecondaryColorFormatNV_signature;

def glFogCoordFormatNV_signature func(type GLenum; stride GLsizei);
var glFogCoordFormatNV glFogCoordFormatNV_signature;

def glVertexAttribFormatNV_signature func(index GLuint; size GLint; type GLenum; normalized GLboolean; stride GLsizei);
var glVertexAttribFormatNV glVertexAttribFormatNV_signature;

def glVertexAttribIFormatNV_signature func(index GLuint; size GLint; type GLenum; stride GLsizei);
var glVertexAttribIFormatNV glVertexAttribIFormatNV_signature;

def glGetIntegerui64i_vNV_signature func(value GLenum; index GLuint; result GLuint64EXT ref);
var glGetIntegerui64i_vNV glGetIntegerui64i_vNV_signature;

def glAreProgramsResidentNV_signature func(n GLsizei; programs GLuint ref; residences GLboolean ref) (result GLboolean);
var glAreProgramsResidentNV glAreProgramsResidentNV_signature;

def glBindProgramNV_signature func(target GLenum; id GLuint);
var glBindProgramNV glBindProgramNV_signature;

def glDeleteProgramsNV_signature func(n GLsizei; programs GLuint ref);
var glDeleteProgramsNV glDeleteProgramsNV_signature;

def glExecuteProgramNV_signature func(target GLenum; id GLuint; params GLfloat ref);
var glExecuteProgramNV glExecuteProgramNV_signature;

def glGenProgramsNV_signature func(n GLsizei; programs GLuint ref);
var glGenProgramsNV glGenProgramsNV_signature;

def glGetProgramParameterdvNV_signature func(target GLenum; index GLuint; pname GLenum; params GLdouble ref);
var glGetProgramParameterdvNV glGetProgramParameterdvNV_signature;

def glGetProgramParameterfvNV_signature func(target GLenum; index GLuint; pname GLenum; params GLfloat ref);
var glGetProgramParameterfvNV glGetProgramParameterfvNV_signature;

def glGetProgramivNV_signature func(id GLuint; pname GLenum; params GLint ref);
var glGetProgramivNV glGetProgramivNV_signature;

def glGetProgramStringNV_signature func(id GLuint; pname GLenum; program GLubyte ref);
var glGetProgramStringNV glGetProgramStringNV_signature;

def glGetTrackMatrixivNV_signature func(target GLenum; address GLuint; pname GLenum; params GLint ref);
var glGetTrackMatrixivNV glGetTrackMatrixivNV_signature;

def glGetVertexAttribdvNV_signature func(index GLuint; pname GLenum; params GLdouble ref);
var glGetVertexAttribdvNV glGetVertexAttribdvNV_signature;

def glGetVertexAttribfvNV_signature func(index GLuint; pname GLenum; params GLfloat ref);
var glGetVertexAttribfvNV glGetVertexAttribfvNV_signature;

def glGetVertexAttribivNV_signature func(index GLuint; pname GLenum; params GLint ref);
var glGetVertexAttribivNV glGetVertexAttribivNV_signature;

def glGetVertexAttribPointervNV_signature func(index GLuint; pname GLenum; pointer u8 ref ref);
var glGetVertexAttribPointervNV glGetVertexAttribPointervNV_signature;

def glIsProgramNV_signature func(id GLuint) (result GLboolean);
var glIsProgramNV glIsProgramNV_signature;

def glLoadProgramNV_signature func(target GLenum; id GLuint; len GLsizei; program GLubyte ref);
var glLoadProgramNV glLoadProgramNV_signature;

def glProgramParameter4dNV_signature func(target GLenum; index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glProgramParameter4dNV glProgramParameter4dNV_signature;

def glProgramParameter4dvNV_signature func(target GLenum; index GLuint; v GLdouble ref);
var glProgramParameter4dvNV glProgramParameter4dvNV_signature;

def glProgramParameter4fNV_signature func(target GLenum; index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glProgramParameter4fNV glProgramParameter4fNV_signature;

def glProgramParameter4fvNV_signature func(target GLenum; index GLuint; v GLfloat ref);
var glProgramParameter4fvNV glProgramParameter4fvNV_signature;

def glProgramParameters4dvNV_signature func(target GLenum; index GLuint; count GLsizei; v GLdouble ref);
var glProgramParameters4dvNV glProgramParameters4dvNV_signature;

def glProgramParameters4fvNV_signature func(target GLenum; index GLuint; count GLsizei; v GLfloat ref);
var glProgramParameters4fvNV glProgramParameters4fvNV_signature;

def glRequestResidentProgramsNV_signature func(n GLsizei; programs GLuint ref);
var glRequestResidentProgramsNV glRequestResidentProgramsNV_signature;

def glTrackMatrixNV_signature func(target GLenum; address GLuint; matrix GLenum; transform GLenum);
var glTrackMatrixNV glTrackMatrixNV_signature;

def glVertexAttribPointerNV_signature func(index GLuint; fsize GLint; type GLenum; stride GLsizei; pointer u8 ref);
var glVertexAttribPointerNV glVertexAttribPointerNV_signature;

def glVertexAttrib1dNV_signature func(index GLuint; x GLdouble);
var glVertexAttrib1dNV glVertexAttrib1dNV_signature;

def glVertexAttrib1dvNV_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib1dvNV glVertexAttrib1dvNV_signature;

def glVertexAttrib1fNV_signature func(index GLuint; x GLfloat);
var glVertexAttrib1fNV glVertexAttrib1fNV_signature;

def glVertexAttrib1fvNV_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib1fvNV glVertexAttrib1fvNV_signature;

def glVertexAttrib1sNV_signature func(index GLuint; x GLshort);
var glVertexAttrib1sNV glVertexAttrib1sNV_signature;

def glVertexAttrib1svNV_signature func(index GLuint; v GLshort ref);
var glVertexAttrib1svNV glVertexAttrib1svNV_signature;

def glVertexAttrib2dNV_signature func(index GLuint; x GLdouble; y GLdouble);
var glVertexAttrib2dNV glVertexAttrib2dNV_signature;

def glVertexAttrib2dvNV_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib2dvNV glVertexAttrib2dvNV_signature;

def glVertexAttrib2fNV_signature func(index GLuint; x GLfloat; y GLfloat);
var glVertexAttrib2fNV glVertexAttrib2fNV_signature;

def glVertexAttrib2fvNV_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib2fvNV glVertexAttrib2fvNV_signature;

def glVertexAttrib2sNV_signature func(index GLuint; x GLshort; y GLshort);
var glVertexAttrib2sNV glVertexAttrib2sNV_signature;

def glVertexAttrib2svNV_signature func(index GLuint; v GLshort ref);
var glVertexAttrib2svNV glVertexAttrib2svNV_signature;

def glVertexAttrib3dNV_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble);
var glVertexAttrib3dNV glVertexAttrib3dNV_signature;

def glVertexAttrib3dvNV_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib3dvNV glVertexAttrib3dvNV_signature;

def glVertexAttrib3fNV_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat);
var glVertexAttrib3fNV glVertexAttrib3fNV_signature;

def glVertexAttrib3fvNV_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib3fvNV glVertexAttrib3fvNV_signature;

def glVertexAttrib3sNV_signature func(index GLuint; x GLshort; y GLshort; z GLshort);
var glVertexAttrib3sNV glVertexAttrib3sNV_signature;

def glVertexAttrib3svNV_signature func(index GLuint; v GLshort ref);
var glVertexAttrib3svNV glVertexAttrib3svNV_signature;

def glVertexAttrib4dNV_signature func(index GLuint; x GLdouble; y GLdouble; z GLdouble; w GLdouble);
var glVertexAttrib4dNV glVertexAttrib4dNV_signature;

def glVertexAttrib4dvNV_signature func(index GLuint; v GLdouble ref);
var glVertexAttrib4dvNV glVertexAttrib4dvNV_signature;

def glVertexAttrib4fNV_signature func(index GLuint; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glVertexAttrib4fNV glVertexAttrib4fNV_signature;

def glVertexAttrib4fvNV_signature func(index GLuint; v GLfloat ref);
var glVertexAttrib4fvNV glVertexAttrib4fvNV_signature;

def glVertexAttrib4sNV_signature func(index GLuint; x GLshort; y GLshort; z GLshort; w GLshort);
var glVertexAttrib4sNV glVertexAttrib4sNV_signature;

def glVertexAttrib4svNV_signature func(index GLuint; v GLshort ref);
var glVertexAttrib4svNV glVertexAttrib4svNV_signature;

def glVertexAttrib4ubNV_signature func(index GLuint; x GLubyte; y GLubyte; z GLubyte; w GLubyte);
var glVertexAttrib4ubNV glVertexAttrib4ubNV_signature;

def glVertexAttrib4ubvNV_signature func(index GLuint; v GLubyte ref);
var glVertexAttrib4ubvNV glVertexAttrib4ubvNV_signature;

def glVertexAttribs1dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var glVertexAttribs1dvNV glVertexAttribs1dvNV_signature;

def glVertexAttribs1fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var glVertexAttribs1fvNV glVertexAttribs1fvNV_signature;

def glVertexAttribs1svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var glVertexAttribs1svNV glVertexAttribs1svNV_signature;

def glVertexAttribs2dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var glVertexAttribs2dvNV glVertexAttribs2dvNV_signature;

def glVertexAttribs2fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var glVertexAttribs2fvNV glVertexAttribs2fvNV_signature;

def glVertexAttribs2svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var glVertexAttribs2svNV glVertexAttribs2svNV_signature;

def glVertexAttribs3dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var glVertexAttribs3dvNV glVertexAttribs3dvNV_signature;

def glVertexAttribs3fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var glVertexAttribs3fvNV glVertexAttribs3fvNV_signature;

def glVertexAttribs3svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var glVertexAttribs3svNV glVertexAttribs3svNV_signature;

def glVertexAttribs4dvNV_signature func(index GLuint; count GLsizei; v GLdouble ref);
var glVertexAttribs4dvNV glVertexAttribs4dvNV_signature;

def glVertexAttribs4fvNV_signature func(index GLuint; count GLsizei; v GLfloat ref);
var glVertexAttribs4fvNV glVertexAttribs4fvNV_signature;

def glVertexAttribs4svNV_signature func(index GLuint; count GLsizei; v GLshort ref);
var glVertexAttribs4svNV glVertexAttribs4svNV_signature;

def glVertexAttribs4ubvNV_signature func(index GLuint; count GLsizei; v GLubyte ref);
var glVertexAttribs4ubvNV glVertexAttribs4ubvNV_signature;

def glBeginVideoCaptureNV_signature func(video_capture_slot GLuint);
var glBeginVideoCaptureNV glBeginVideoCaptureNV_signature;

def glBindVideoCaptureStreamBufferNV_signature func(video_capture_slot GLuint; stream GLuint; frame_region GLenum; offset GLintptrARB);
var glBindVideoCaptureStreamBufferNV glBindVideoCaptureStreamBufferNV_signature;

def glBindVideoCaptureStreamTextureNV_signature func(video_capture_slot GLuint; stream GLuint; frame_region GLenum; target GLenum; texture GLuint);
var glBindVideoCaptureStreamTextureNV glBindVideoCaptureStreamTextureNV_signature;

def glEndVideoCaptureNV_signature func(video_capture_slot GLuint);
var glEndVideoCaptureNV glEndVideoCaptureNV_signature;

def glGetVideoCaptureivNV_signature func(video_capture_slot GLuint; pname GLenum; params GLint ref);
var glGetVideoCaptureivNV glGetVideoCaptureivNV_signature;

def glGetVideoCaptureStreamivNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLint ref);
var glGetVideoCaptureStreamivNV glGetVideoCaptureStreamivNV_signature;

def glGetVideoCaptureStreamfvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLfloat ref);
var glGetVideoCaptureStreamfvNV glGetVideoCaptureStreamfvNV_signature;

def glGetVideoCaptureStreamdvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLdouble ref);
var glGetVideoCaptureStreamdvNV glGetVideoCaptureStreamdvNV_signature;

def glVideoCaptureNV_signature func(video_capture_slot GLuint; sequence_num GLuint ref; capture_time GLuint64EXT ref) (result GLenum);
var glVideoCaptureNV glVideoCaptureNV_signature;

def glVideoCaptureStreamParameterivNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLint ref);
var glVideoCaptureStreamParameterivNV glVideoCaptureStreamParameterivNV_signature;

def glVideoCaptureStreamParameterfvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLfloat ref);
var glVideoCaptureStreamParameterfvNV glVideoCaptureStreamParameterfvNV_signature;

def glVideoCaptureStreamParameterdvNV_signature func(video_capture_slot GLuint; stream GLuint; pname GLenum; params GLdouble ref);
var glVideoCaptureStreamParameterdvNV glVideoCaptureStreamParameterdvNV_signature;

def glViewportSwizzleNV_signature func(index GLuint; swizzlex GLenum; swizzley GLenum; swizzlez GLenum; swizzlew GLenum);
var glViewportSwizzleNV glViewportSwizzleNV_signature;

def glFramebufferTextureMultiviewOVR_signature func(target GLenum; attachment GLenum; texture GLuint; level GLint; baseViewIndex GLint; numViews GLsizei);
var glFramebufferTextureMultiviewOVR glFramebufferTextureMultiviewOVR_signature;

def glHintPGI_signature func(target GLenum; mode GLint);
var glHintPGI glHintPGI_signature;

def glDetailTexFuncSGIS_signature func(target GLenum; n GLsizei; points GLfloat ref);
var glDetailTexFuncSGIS glDetailTexFuncSGIS_signature;

def glGetDetailTexFuncSGIS_signature func(target GLenum; points GLfloat ref);
var glGetDetailTexFuncSGIS glGetDetailTexFuncSGIS_signature;

def glFogFuncSGIS_signature func(n GLsizei; points GLfloat ref);
var glFogFuncSGIS glFogFuncSGIS_signature;

def glGetFogFuncSGIS_signature func(points GLfloat ref);
var glGetFogFuncSGIS glGetFogFuncSGIS_signature;

def glSampleMaskSGIS_signature func(value GLclampf; invert GLboolean);
var glSampleMaskSGIS glSampleMaskSGIS_signature;

def glSamplePatternSGIS_signature func(pattern GLenum);
var glSamplePatternSGIS glSamplePatternSGIS_signature;

def glPixelTexGenParameteriSGIS_signature func(pname GLenum; param GLint);
var glPixelTexGenParameteriSGIS glPixelTexGenParameteriSGIS_signature;

def glPixelTexGenParameterivSGIS_signature func(pname GLenum; params GLint ref);
var glPixelTexGenParameterivSGIS glPixelTexGenParameterivSGIS_signature;

def glPixelTexGenParameterfSGIS_signature func(pname GLenum; param GLfloat);
var glPixelTexGenParameterfSGIS glPixelTexGenParameterfSGIS_signature;

def glPixelTexGenParameterfvSGIS_signature func(pname GLenum; params GLfloat ref);
var glPixelTexGenParameterfvSGIS glPixelTexGenParameterfvSGIS_signature;

def glGetPixelTexGenParameterivSGIS_signature func(pname GLenum; params GLint ref);
var glGetPixelTexGenParameterivSGIS glGetPixelTexGenParameterivSGIS_signature;

def glGetPixelTexGenParameterfvSGIS_signature func(pname GLenum; params GLfloat ref);
var glGetPixelTexGenParameterfvSGIS glGetPixelTexGenParameterfvSGIS_signature;

def glPointParameterfSGIS_signature func(pname GLenum; param GLfloat);
var glPointParameterfSGIS glPointParameterfSGIS_signature;

def glPointParameterfvSGIS_signature func(pname GLenum; params GLfloat ref);
var glPointParameterfvSGIS glPointParameterfvSGIS_signature;

def glSharpenTexFuncSGIS_signature func(target GLenum; n GLsizei; points GLfloat ref);
var glSharpenTexFuncSGIS glSharpenTexFuncSGIS_signature;

def glGetSharpenTexFuncSGIS_signature func(target GLenum; points GLfloat ref);
var glGetSharpenTexFuncSGIS glGetSharpenTexFuncSGIS_signature;

def glTexImage4DSGIS_signature func(target GLenum; level GLint; internalformat GLenum; width GLsizei; height GLsizei; depth GLsizei; size4d GLsizei; border GLint; format GLenum; type GLenum; pixels u8 ref);
var glTexImage4DSGIS glTexImage4DSGIS_signature;

def glTexSubImage4DSGIS_signature func(target GLenum; level GLint; xoffset GLint; yoffset GLint; zoffset GLint; woffset GLint; width GLsizei; height GLsizei; depth GLsizei; size4d GLsizei; format GLenum; type GLenum; pixels u8 ref);
var glTexSubImage4DSGIS glTexSubImage4DSGIS_signature;

def glTextureColorMaskSGIS_signature func(red GLboolean; green GLboolean; blue GLboolean; alpha GLboolean);
var glTextureColorMaskSGIS glTextureColorMaskSGIS_signature;

def glGetTexFilterFuncSGIS_signature func(target GLenum; filter GLenum; weights GLfloat ref);
var glGetTexFilterFuncSGIS glGetTexFilterFuncSGIS_signature;

def glTexFilterFuncSGIS_signature func(target GLenum; filter GLenum; n GLsizei; weights GLfloat ref);
var glTexFilterFuncSGIS glTexFilterFuncSGIS_signature;

def glAsyncMarkerSGIX_signature func(marker GLuint);
var glAsyncMarkerSGIX glAsyncMarkerSGIX_signature;

def glFinishAsyncSGIX_signature func(markerp GLuint ref) (result GLint);
var glFinishAsyncSGIX glFinishAsyncSGIX_signature;

def glPollAsyncSGIX_signature func(markerp GLuint ref) (result GLint);
var glPollAsyncSGIX glPollAsyncSGIX_signature;

def glGenAsyncMarkersSGIX_signature func(range GLsizei) (result GLuint);
var glGenAsyncMarkersSGIX glGenAsyncMarkersSGIX_signature;

def glDeleteAsyncMarkersSGIX_signature func(marker GLuint; range GLsizei);
var glDeleteAsyncMarkersSGIX glDeleteAsyncMarkersSGIX_signature;

def glIsAsyncMarkerSGIX_signature func(marker GLuint) (result GLboolean);
var glIsAsyncMarkerSGIX glIsAsyncMarkerSGIX_signature;

def glFlushRasterSGIX_signature func();
var glFlushRasterSGIX glFlushRasterSGIX_signature;

def glFragmentColorMaterialSGIX_signature func(face GLenum; mode GLenum);
var glFragmentColorMaterialSGIX glFragmentColorMaterialSGIX_signature;

def glFragmentLightfSGIX_signature func(light GLenum; pname GLenum; param GLfloat);
var glFragmentLightfSGIX glFragmentLightfSGIX_signature;

def glFragmentLightfvSGIX_signature func(light GLenum; pname GLenum; params GLfloat ref);
var glFragmentLightfvSGIX glFragmentLightfvSGIX_signature;

def glFragmentLightiSGIX_signature func(light GLenum; pname GLenum; param GLint);
var glFragmentLightiSGIX glFragmentLightiSGIX_signature;

def glFragmentLightivSGIX_signature func(light GLenum; pname GLenum; params GLint ref);
var glFragmentLightivSGIX glFragmentLightivSGIX_signature;

def glFragmentLightModelfSGIX_signature func(pname GLenum; param GLfloat);
var glFragmentLightModelfSGIX glFragmentLightModelfSGIX_signature;

def glFragmentLightModelfvSGIX_signature func(pname GLenum; params GLfloat ref);
var glFragmentLightModelfvSGIX glFragmentLightModelfvSGIX_signature;

def glFragmentLightModeliSGIX_signature func(pname GLenum; param GLint);
var glFragmentLightModeliSGIX glFragmentLightModeliSGIX_signature;

def glFragmentLightModelivSGIX_signature func(pname GLenum; params GLint ref);
var glFragmentLightModelivSGIX glFragmentLightModelivSGIX_signature;

def glFragmentMaterialfSGIX_signature func(face GLenum; pname GLenum; param GLfloat);
var glFragmentMaterialfSGIX glFragmentMaterialfSGIX_signature;

def glFragmentMaterialfvSGIX_signature func(face GLenum; pname GLenum; params GLfloat ref);
var glFragmentMaterialfvSGIX glFragmentMaterialfvSGIX_signature;

def glFragmentMaterialiSGIX_signature func(face GLenum; pname GLenum; param GLint);
var glFragmentMaterialiSGIX glFragmentMaterialiSGIX_signature;

def glFragmentMaterialivSGIX_signature func(face GLenum; pname GLenum; params GLint ref);
var glFragmentMaterialivSGIX glFragmentMaterialivSGIX_signature;

def glGetFragmentLightfvSGIX_signature func(light GLenum; pname GLenum; params GLfloat ref);
var glGetFragmentLightfvSGIX glGetFragmentLightfvSGIX_signature;

def glGetFragmentLightivSGIX_signature func(light GLenum; pname GLenum; params GLint ref);
var glGetFragmentLightivSGIX glGetFragmentLightivSGIX_signature;

def glGetFragmentMaterialfvSGIX_signature func(face GLenum; pname GLenum; params GLfloat ref);
var glGetFragmentMaterialfvSGIX glGetFragmentMaterialfvSGIX_signature;

def glGetFragmentMaterialivSGIX_signature func(face GLenum; pname GLenum; params GLint ref);
var glGetFragmentMaterialivSGIX glGetFragmentMaterialivSGIX_signature;

def glLightEnviSGIX_signature func(pname GLenum; param GLint);
var glLightEnviSGIX glLightEnviSGIX_signature;

def glFrameZoomSGIX_signature func(factor GLint);
var glFrameZoomSGIX glFrameZoomSGIX_signature;

def glIglooInterfaceSGIX_signature func(pname GLenum; params u8 ref);
var glIglooInterfaceSGIX glIglooInterfaceSGIX_signature;

def glGetInstrumentsSGIX_signature func() (result GLint);
var glGetInstrumentsSGIX glGetInstrumentsSGIX_signature;

def glInstrumentsBufferSGIX_signature func(size GLsizei; buffer GLint ref);
var glInstrumentsBufferSGIX glInstrumentsBufferSGIX_signature;

def glPollInstrumentsSGIX_signature func(marker_p GLint ref) (result GLint);
var glPollInstrumentsSGIX glPollInstrumentsSGIX_signature;

def glReadInstrumentsSGIX_signature func(marker GLint);
var glReadInstrumentsSGIX glReadInstrumentsSGIX_signature;

def glStartInstrumentsSGIX_signature func();
var glStartInstrumentsSGIX glStartInstrumentsSGIX_signature;

def glStopInstrumentsSGIX_signature func(marker GLint);
var glStopInstrumentsSGIX glStopInstrumentsSGIX_signature;

def glGetListParameterfvSGIX_signature func(list GLuint; pname GLenum; params GLfloat ref);
var glGetListParameterfvSGIX glGetListParameterfvSGIX_signature;

def glGetListParameterivSGIX_signature func(list GLuint; pname GLenum; params GLint ref);
var glGetListParameterivSGIX glGetListParameterivSGIX_signature;

def glListParameterfSGIX_signature func(list GLuint; pname GLenum; param GLfloat);
var glListParameterfSGIX glListParameterfSGIX_signature;

def glListParameterfvSGIX_signature func(list GLuint; pname GLenum; params GLfloat ref);
var glListParameterfvSGIX glListParameterfvSGIX_signature;

def glListParameteriSGIX_signature func(list GLuint; pname GLenum; param GLint);
var glListParameteriSGIX glListParameteriSGIX_signature;

def glListParameterivSGIX_signature func(list GLuint; pname GLenum; params GLint ref);
var glListParameterivSGIX glListParameterivSGIX_signature;

def glPixelTexGenSGIX_signature func(mode GLenum);
var glPixelTexGenSGIX glPixelTexGenSGIX_signature;

def glDeformationMap3dSGIX_signature func(target GLenum; u1 GLdouble; u2 GLdouble; ustride GLint; uorder GLint; v1 GLdouble; v2 GLdouble; vstride GLint; vorder GLint; w1 GLdouble; w2 GLdouble; wstride GLint; worder GLint; points GLdouble ref);
var glDeformationMap3dSGIX glDeformationMap3dSGIX_signature;

def glDeformationMap3fSGIX_signature func(target GLenum; u1 GLfloat; u2 GLfloat; ustride GLint; uorder GLint; v1 GLfloat; v2 GLfloat; vstride GLint; vorder GLint; w1 GLfloat; w2 GLfloat; wstride GLint; worder GLint; points GLfloat ref);
var glDeformationMap3fSGIX glDeformationMap3fSGIX_signature;

def glDeformSGIX_signature func(mask GLbitfield);
var glDeformSGIX glDeformSGIX_signature;

def glLoadIdentityDeformationMapSGIX_signature func(mask GLbitfield);
var glLoadIdentityDeformationMapSGIX glLoadIdentityDeformationMapSGIX_signature;

def glReferencePlaneSGIX_signature func(equation GLdouble ref);
var glReferencePlaneSGIX glReferencePlaneSGIX_signature;

def glSpriteParameterfSGIX_signature func(pname GLenum; param GLfloat);
var glSpriteParameterfSGIX glSpriteParameterfSGIX_signature;

def glSpriteParameterfvSGIX_signature func(pname GLenum; params GLfloat ref);
var glSpriteParameterfvSGIX glSpriteParameterfvSGIX_signature;

def glSpriteParameteriSGIX_signature func(pname GLenum; param GLint);
var glSpriteParameteriSGIX glSpriteParameteriSGIX_signature;

def glSpriteParameterivSGIX_signature func(pname GLenum; params GLint ref);
var glSpriteParameterivSGIX glSpriteParameterivSGIX_signature;

def glTagSampleBufferSGIX_signature func();
var glTagSampleBufferSGIX glTagSampleBufferSGIX_signature;

def glColorTableSGI_signature func(target GLenum; internalformat GLenum; width GLsizei; format GLenum; type GLenum; table u8 ref);
var glColorTableSGI glColorTableSGI_signature;

def glColorTableParameterfvSGI_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glColorTableParameterfvSGI glColorTableParameterfvSGI_signature;

def glColorTableParameterivSGI_signature func(target GLenum; pname GLenum; params GLint ref);
var glColorTableParameterivSGI glColorTableParameterivSGI_signature;

def glCopyColorTableSGI_signature func(target GLenum; internalformat GLenum; x GLint; y GLint; width GLsizei);
var glCopyColorTableSGI glCopyColorTableSGI_signature;

def glGetColorTableSGI_signature func(target GLenum; format GLenum; type GLenum; table u8 ref);
var glGetColorTableSGI glGetColorTableSGI_signature;

def glGetColorTableParameterfvSGI_signature func(target GLenum; pname GLenum; params GLfloat ref);
var glGetColorTableParameterfvSGI glGetColorTableParameterfvSGI_signature;

def glGetColorTableParameterivSGI_signature func(target GLenum; pname GLenum; params GLint ref);
var glGetColorTableParameterivSGI glGetColorTableParameterivSGI_signature;

def glFinishTextureSUNX_signature func();
var glFinishTextureSUNX glFinishTextureSUNX_signature;

def glGlobalAlphaFactorbSUN_signature func(factor GLbyte);
var glGlobalAlphaFactorbSUN glGlobalAlphaFactorbSUN_signature;

def glGlobalAlphaFactorsSUN_signature func(factor GLshort);
var glGlobalAlphaFactorsSUN glGlobalAlphaFactorsSUN_signature;

def glGlobalAlphaFactoriSUN_signature func(factor GLint);
var glGlobalAlphaFactoriSUN glGlobalAlphaFactoriSUN_signature;

def glGlobalAlphaFactorfSUN_signature func(factor GLfloat);
var glGlobalAlphaFactorfSUN glGlobalAlphaFactorfSUN_signature;

def glGlobalAlphaFactordSUN_signature func(factor GLdouble);
var glGlobalAlphaFactordSUN glGlobalAlphaFactordSUN_signature;

def glGlobalAlphaFactorubSUN_signature func(factor GLubyte);
var glGlobalAlphaFactorubSUN glGlobalAlphaFactorubSUN_signature;

def glGlobalAlphaFactorusSUN_signature func(factor GLushort);
var glGlobalAlphaFactorusSUN glGlobalAlphaFactorusSUN_signature;

def glGlobalAlphaFactoruiSUN_signature func(factor GLuint);
var glGlobalAlphaFactoruiSUN glGlobalAlphaFactoruiSUN_signature;

def glDrawMeshArraysSUN_signature func(mode GLenum; first GLint; count GLsizei; width GLsizei);
var glDrawMeshArraysSUN glDrawMeshArraysSUN_signature;

def glReplacementCodeuiSUN_signature func(code GLuint);
var glReplacementCodeuiSUN glReplacementCodeuiSUN_signature;

def glReplacementCodeusSUN_signature func(code GLushort);
var glReplacementCodeusSUN glReplacementCodeusSUN_signature;

def glReplacementCodeubSUN_signature func(code GLubyte);
var glReplacementCodeubSUN glReplacementCodeubSUN_signature;

def glReplacementCodeuivSUN_signature func(code GLuint ref);
var glReplacementCodeuivSUN glReplacementCodeuivSUN_signature;

def glReplacementCodeusvSUN_signature func(code GLushort ref);
var glReplacementCodeusvSUN glReplacementCodeusvSUN_signature;

def glReplacementCodeubvSUN_signature func(code GLubyte ref);
var glReplacementCodeubvSUN glReplacementCodeubvSUN_signature;

def glReplacementCodePointerSUN_signature func(type GLenum; stride GLsizei; pointer u8 ref ref);
var glReplacementCodePointerSUN glReplacementCodePointerSUN_signature;

def glColor4ubVertex2fSUN_signature func(r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat);
var glColor4ubVertex2fSUN glColor4ubVertex2fSUN_signature;

def glColor4ubVertex2fvSUN_signature func(c GLubyte ref; v GLfloat ref);
var glColor4ubVertex2fvSUN glColor4ubVertex2fvSUN_signature;

def glColor4ubVertex3fSUN_signature func(r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat; z GLfloat);
var glColor4ubVertex3fSUN glColor4ubVertex3fSUN_signature;

def glColor4ubVertex3fvSUN_signature func(c GLubyte ref; v GLfloat ref);
var glColor4ubVertex3fvSUN glColor4ubVertex3fvSUN_signature;

def glColor3fVertex3fSUN_signature func(r GLfloat; g GLfloat; b GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glColor3fVertex3fSUN glColor3fVertex3fSUN_signature;

def glColor3fVertex3fvSUN_signature func(c GLfloat ref; v GLfloat ref);
var glColor3fVertex3fvSUN glColor3fVertex3fvSUN_signature;

def glNormal3fVertex3fSUN_signature func(nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glNormal3fVertex3fSUN glNormal3fVertex3fSUN_signature;

def glNormal3fVertex3fvSUN_signature func(n GLfloat ref; v GLfloat ref);
var glNormal3fVertex3fvSUN glNormal3fVertex3fvSUN_signature;

def glColor4fNormal3fVertex3fSUN_signature func(r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glColor4fNormal3fVertex3fSUN glColor4fNormal3fVertex3fSUN_signature;

def glColor4fNormal3fVertex3fvSUN_signature func(c GLfloat ref; n GLfloat ref; v GLfloat ref);
var glColor4fNormal3fVertex3fvSUN glColor4fNormal3fVertex3fvSUN_signature;

def glTexCoord2fVertex3fSUN_signature func(s GLfloat; t GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glTexCoord2fVertex3fSUN glTexCoord2fVertex3fSUN_signature;

def glTexCoord2fVertex3fvSUN_signature func(tc GLfloat ref; v GLfloat ref);
var glTexCoord2fVertex3fvSUN glTexCoord2fVertex3fvSUN_signature;

def glTexCoord4fVertex4fSUN_signature func(s GLfloat; t GLfloat; p GLfloat; q GLfloat; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glTexCoord4fVertex4fSUN glTexCoord4fVertex4fSUN_signature;

def glTexCoord4fVertex4fvSUN_signature func(tc GLfloat ref; v GLfloat ref);
var glTexCoord4fVertex4fvSUN glTexCoord4fVertex4fvSUN_signature;

def glTexCoord2fColor4ubVertex3fSUN_signature func(s GLfloat; t GLfloat; r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat; z GLfloat);
var glTexCoord2fColor4ubVertex3fSUN glTexCoord2fColor4ubVertex3fSUN_signature;

def glTexCoord2fColor4ubVertex3fvSUN_signature func(tc GLfloat ref; c GLubyte ref; v GLfloat ref);
var glTexCoord2fColor4ubVertex3fvSUN glTexCoord2fColor4ubVertex3fvSUN_signature;

def glTexCoord2fColor3fVertex3fSUN_signature func(s GLfloat; t GLfloat; r GLfloat; g GLfloat; b GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glTexCoord2fColor3fVertex3fSUN glTexCoord2fColor3fVertex3fSUN_signature;

def glTexCoord2fColor3fVertex3fvSUN_signature func(tc GLfloat ref; c GLfloat ref; v GLfloat ref);
var glTexCoord2fColor3fVertex3fvSUN glTexCoord2fColor3fVertex3fvSUN_signature;

def glTexCoord2fNormal3fVertex3fSUN_signature func(s GLfloat; t GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glTexCoord2fNormal3fVertex3fSUN glTexCoord2fNormal3fVertex3fSUN_signature;

def glTexCoord2fNormal3fVertex3fvSUN_signature func(tc GLfloat ref; n GLfloat ref; v GLfloat ref);
var glTexCoord2fNormal3fVertex3fvSUN glTexCoord2fNormal3fVertex3fvSUN_signature;

def glTexCoord2fColor4fNormal3fVertex3fSUN_signature func(s GLfloat; t GLfloat; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glTexCoord2fColor4fNormal3fVertex3fSUN glTexCoord2fColor4fNormal3fVertex3fSUN_signature;

def glTexCoord2fColor4fNormal3fVertex3fvSUN_signature func(tc GLfloat ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var glTexCoord2fColor4fNormal3fVertex3fvSUN glTexCoord2fColor4fNormal3fVertex3fvSUN_signature;

def glTexCoord4fColor4fNormal3fVertex4fSUN_signature func(s GLfloat; t GLfloat; p GLfloat; q GLfloat; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat; w GLfloat);
var glTexCoord4fColor4fNormal3fVertex4fSUN glTexCoord4fColor4fNormal3fVertex4fSUN_signature;

def glTexCoord4fColor4fNormal3fVertex4fvSUN_signature func(tc GLfloat ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var glTexCoord4fColor4fNormal3fVertex4fvSUN glTexCoord4fColor4fNormal3fVertex4fvSUN_signature;

def glReplacementCodeuiVertex3fSUN_signature func(rc GLuint; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiVertex3fSUN glReplacementCodeuiVertex3fSUN_signature;

def glReplacementCodeuiVertex3fvSUN_signature func(rc GLuint ref; v GLfloat ref);
var glReplacementCodeuiVertex3fvSUN glReplacementCodeuiVertex3fvSUN_signature;

def glReplacementCodeuiColor4ubVertex3fSUN_signature func(rc GLuint; r GLubyte; g GLubyte; b GLubyte; a GLubyte; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiColor4ubVertex3fSUN glReplacementCodeuiColor4ubVertex3fSUN_signature;

def glReplacementCodeuiColor4ubVertex3fvSUN_signature func(rc GLuint ref; c GLubyte ref; v GLfloat ref);
var glReplacementCodeuiColor4ubVertex3fvSUN glReplacementCodeuiColor4ubVertex3fvSUN_signature;

def glReplacementCodeuiColor3fVertex3fSUN_signature func(rc GLuint; r GLfloat; g GLfloat; b GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiColor3fVertex3fSUN glReplacementCodeuiColor3fVertex3fSUN_signature;

def glReplacementCodeuiColor3fVertex3fvSUN_signature func(rc GLuint ref; c GLfloat ref; v GLfloat ref);
var glReplacementCodeuiColor3fVertex3fvSUN glReplacementCodeuiColor3fVertex3fvSUN_signature;

def glReplacementCodeuiNormal3fVertex3fSUN_signature func(rc GLuint; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiNormal3fVertex3fSUN glReplacementCodeuiNormal3fVertex3fSUN_signature;

def glReplacementCodeuiNormal3fVertex3fvSUN_signature func(rc GLuint ref; n GLfloat ref; v GLfloat ref);
var glReplacementCodeuiNormal3fVertex3fvSUN glReplacementCodeuiNormal3fVertex3fvSUN_signature;

def glReplacementCodeuiColor4fNormal3fVertex3fSUN_signature func(rc GLuint; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiColor4fNormal3fVertex3fSUN glReplacementCodeuiColor4fNormal3fVertex3fSUN_signature;

def glReplacementCodeuiColor4fNormal3fVertex3fvSUN_signature func(rc GLuint ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var glReplacementCodeuiColor4fNormal3fVertex3fvSUN glReplacementCodeuiColor4fNormal3fVertex3fvSUN_signature;

def glReplacementCodeuiTexCoord2fVertex3fSUN_signature func(rc GLuint; s GLfloat; t GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiTexCoord2fVertex3fSUN glReplacementCodeuiTexCoord2fVertex3fSUN_signature;

def glReplacementCodeuiTexCoord2fVertex3fvSUN_signature func(rc GLuint ref; tc GLfloat ref; v GLfloat ref);
var glReplacementCodeuiTexCoord2fVertex3fvSUN glReplacementCodeuiTexCoord2fVertex3fvSUN_signature;

def glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN_signature func(rc GLuint; s GLfloat; t GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN_signature;

def glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN_signature func(rc GLuint ref; tc GLfloat ref; n GLfloat ref; v GLfloat ref);
var glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN_signature;

def glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN_signature func(rc GLuint; s GLfloat; t GLfloat; r GLfloat; g GLfloat; b GLfloat; a GLfloat; nx GLfloat; ny GLfloat; nz GLfloat; x GLfloat; y GLfloat; z GLfloat);
var glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN_signature;

def glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN_signature func(rc GLuint ref; tc GLfloat ref; c GLfloat ref; n GLfloat ref; v GLfloat ref);
var glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN_signature;

// file: gl/wglext.h


def wglCreateBufferRegionARB func(hDC HDC; iLayerPlane s32; uType UINT) (result HANDLE) extern_binding_lib("opengl32.lib");

def wglDeleteBufferRegionARB func(hRegion HANDLE) (result VOID) extern_binding_lib("opengl32.lib");

def wglSaveBufferRegionARB func(hRegion HANDLE; x s32; y s32; width s32; height s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglRestoreBufferRegionARB func(hRegion HANDLE; x s32; y s32; width s32; height s32; xSrc s32; ySrc s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglCreateContextAttribsARB func(hDC HDC; hShareContext HGLRC; attribList s32 ref) (result HGLRC) extern_binding_lib("opengl32.lib");

def wglGetExtensionsStringARB func(hdc HDC) (result u8 ref) extern_binding_lib("opengl32.lib");

def wglMakeContextCurrentARB func(hDrawDC HDC; hReadDC HDC; hglrc HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetCurrentReadDCARB func() (result HDC) extern_binding_lib("opengl32.lib");

def wglCreatePbufferARB func(hDC HDC; iPixelFormat s32; iWidth s32; iHeight s32; piAttribList s32 ref) (result HPBUFFERARB) extern_binding_lib("opengl32.lib");

def wglGetPbufferDCARB func(hPbuffer HPBUFFERARB) (result HDC) extern_binding_lib("opengl32.lib");

def wglReleasePbufferDCARB func(hPbuffer HPBUFFERARB; hDC HDC) (result s32) extern_binding_lib("opengl32.lib");

def wglDestroyPbufferARB func(hPbuffer HPBUFFERARB) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryPbufferARB func(hPbuffer HPBUFFERARB; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetPixelFormatAttribivARB func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; piValues s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetPixelFormatAttribfvARB func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; pfValues FLOAT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglChoosePixelFormatARB func(hdc HDC; piAttribIList s32 ref; pfAttribFList FLOAT ref; nMaxFormats UINT; piFormats s32 ref; nNumFormats UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglBindTexImageARB func(hPbuffer HPBUFFERARB; iBuffer s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglReleaseTexImageARB func(hPbuffer HPBUFFERARB; iBuffer s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSetPbufferAttribARB func(hPbuffer HPBUFFERARB; piAttribList s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSetStereoEmitterState3DL func(hDC HDC; uState UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGPUIDsAMD func(maxCount UINT; ids UINT ref) (result UINT) extern_binding_lib("opengl32.lib");

def wglGetGPUInfoAMD func(id UINT; property INT; dataType GLenum; size UINT; data u8 ref) (result INT) extern_binding_lib("opengl32.lib");

def wglGetContextGPUIDAMD func(hglrc HGLRC) (result UINT) extern_binding_lib("opengl32.lib");

def wglCreateAssociatedContextAMD func(id UINT) (result HGLRC) extern_binding_lib("opengl32.lib");

def wglCreateAssociatedContextAttribsAMD func(id UINT; hShareContext HGLRC; attribList s32 ref) (result HGLRC) extern_binding_lib("opengl32.lib");

def wglDeleteAssociatedContextAMD func(hglrc HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglMakeAssociatedContextCurrentAMD func(hglrc HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetCurrentAssociatedContextAMD func() (result HGLRC) extern_binding_lib("opengl32.lib");

def wglBlitContextFramebufferAMD func(dstCtx HGLRC; srcX0 GLint; srcY0 GLint; srcX1 GLint; srcY1 GLint; dstX0 GLint; dstY0 GLint; dstX1 GLint; dstY1 GLint; mask GLbitfield; filter GLenum) (result VOID) extern_binding_lib("opengl32.lib");

def wglCreateDisplayColorTableEXT func(id GLushort) (result GLboolean) extern_binding_lib("opengl32.lib");

def wglLoadDisplayColorTableEXT func(table GLushort ref; length GLuint) (result GLboolean) extern_binding_lib("opengl32.lib");

def wglBindDisplayColorTableEXT func(id GLushort) (result GLboolean) extern_binding_lib("opengl32.lib");

def wglDestroyDisplayColorTableEXT func(id GLushort) (result VOID) extern_binding_lib("opengl32.lib");

def wglGetExtensionsStringEXT func() (result u8 ref) extern_binding_lib("opengl32.lib");

def wglMakeContextCurrentEXT func(hDrawDC HDC; hReadDC HDC; hglrc HGLRC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetCurrentReadDCEXT func() (result HDC) extern_binding_lib("opengl32.lib");

def wglCreatePbufferEXT func(hDC HDC; iPixelFormat s32; iWidth s32; iHeight s32; piAttribList s32 ref) (result HPBUFFEREXT) extern_binding_lib("opengl32.lib");

def wglGetPbufferDCEXT func(hPbuffer HPBUFFEREXT) (result HDC) extern_binding_lib("opengl32.lib");

def wglReleasePbufferDCEXT func(hPbuffer HPBUFFEREXT; hDC HDC) (result s32) extern_binding_lib("opengl32.lib");

def wglDestroyPbufferEXT func(hPbuffer HPBUFFEREXT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryPbufferEXT func(hPbuffer HPBUFFEREXT; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetPixelFormatAttribivEXT func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; piValues s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetPixelFormatAttribfvEXT func(hdc HDC; iPixelFormat s32; iLayerPlane s32; nAttributes UINT; piAttributes s32 ref; pfValues FLOAT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglChoosePixelFormatEXT func(hdc HDC; piAttribIList s32 ref; pfAttribFList FLOAT ref; nMaxFormats UINT; piFormats s32 ref; nNumFormats UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSwapIntervalEXT func(interval s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetSwapIntervalEXT func() (result s32) extern_binding_lib("opengl32.lib");

def wglGetDigitalVideoParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSetDigitalVideoParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGammaTableParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSetGammaTableParametersI3D func(hDC HDC; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGammaTableI3D func(hDC HDC; iEntries s32; puRed USHORT ref; puGreen USHORT ref; puBlue USHORT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSetGammaTableI3D func(hDC HDC; iEntries s32; puRed USHORT ref; puGreen USHORT ref; puBlue USHORT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglEnableGenlockI3D func(hDC HDC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDisableGenlockI3D func(hDC HDC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglIsEnabledGenlockI3D func(hDC HDC; pFlag BOOL ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGenlockSourceI3D func(hDC HDC; uSource UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGenlockSourceI3D func(hDC HDC; uSource UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGenlockSourceEdgeI3D func(hDC HDC; uEdge UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGenlockSourceEdgeI3D func(hDC HDC; uEdge UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGenlockSampleRateI3D func(hDC HDC; uRate UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGenlockSampleRateI3D func(hDC HDC; uRate UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGenlockSourceDelayI3D func(hDC HDC; uDelay UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetGenlockSourceDelayI3D func(hDC HDC; uDelay UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryGenlockMaxSourceDelayI3D func(hDC HDC; uMaxLineDelay UINT ref; uMaxPixelDelay UINT ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglCreateImageBufferI3D func(hDC HDC; dwSize DWORD; uFlags UINT) (result LPVOID) extern_binding_lib("opengl32.lib");

def wglDestroyImageBufferI3D func(hDC HDC; pAddress LPVOID) (result BOOL) extern_binding_lib("opengl32.lib");

def wglAssociateImageBufferEventsI3D func(hDC HDC; pEvent HANDLE ref; pAddress LPVOID ref; pSize DWORD ref; count UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglReleaseImageBufferEventsI3D func(hDC HDC; pAddress LPVOID ref; count UINT) (result BOOL) extern_binding_lib("opengl32.lib");

def wglEnableFrameLockI3D func() (result BOOL) extern_binding_lib("opengl32.lib");

def wglDisableFrameLockI3D func() (result BOOL) extern_binding_lib("opengl32.lib");

def wglIsEnabledFrameLockI3D func(pFlag BOOL ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryFrameLockMasterI3D func(pFlag BOOL ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetFrameUsageI3D func(pUsage f32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglBeginFrameTrackingI3D func() (result BOOL) extern_binding_lib("opengl32.lib");

def wglEndFrameTrackingI3D func() (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryFrameTrackingI3D func(pFrameCount DWORD ref; pMissedFrames DWORD ref; pLastMissedUsage f32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDXSetResourceShareHandleNV func(dxObject u8 ref; shareHandle HANDLE) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDXOpenDeviceNV func(dxDevice u8 ref) (result HANDLE) extern_binding_lib("opengl32.lib");

def wglDXCloseDeviceNV func(hDevice HANDLE) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDXRegisterObjectNV func(hDevice HANDLE; dxObject u8 ref; name GLuint; type GLenum; access GLenum) (result HANDLE) extern_binding_lib("opengl32.lib");

def wglDXUnregisterObjectNV func(hDevice HANDLE; hObject HANDLE) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDXObjectAccessNV func(hObject HANDLE; access GLenum) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDXLockObjectsNV func(hDevice HANDLE; count GLint; hObjects HANDLE ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDXUnlockObjectsNV func(hDevice HANDLE; count GLint; hObjects HANDLE ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglCopyImageSubDataNV func(hSrcRC HGLRC; srcName GLuint; srcTarget GLenum; srcLevel GLint; srcX GLint; srcY GLint; srcZ GLint; hDstRC HGLRC; dstName GLuint; dstTarget GLenum; dstLevel GLint; dstX GLint; dstY GLint; dstZ GLint; width GLsizei; height GLsizei; depth GLsizei) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDelayBeforeSwapNV func(hDC HDC; seconds GLfloat) (result BOOL) extern_binding_lib("opengl32.lib");

def wglEnumGpusNV func(iGpuIndex UINT; phGpu HGPUNV ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglEnumGpuDevicesNV func(hGpu HGPUNV; iDeviceIndex UINT; lpGpuDevice PGPU_DEVICE) (result BOOL) extern_binding_lib("opengl32.lib");

def wglCreateAffinityDCNV func(phGpuList HGPUNV ref) (result HDC) extern_binding_lib("opengl32.lib");

def wglEnumGpusFromAffinityDCNV func(hAffinityDC HDC; iGpuIndex UINT; hGpu HGPUNV ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglDeleteDCNV func(hdc HDC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglEnumerateVideoDevicesNV func(hDc HDC; phDeviceList HVIDEOOUTPUTDEVICENV ref) (result s32) extern_binding_lib("opengl32.lib");

def wglBindVideoDeviceNV func(hDc HDC; uVideoSlot u32; hVideoDevice HVIDEOOUTPUTDEVICENV; piAttribList s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryCurrentContextNV func(iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglJoinSwapGroupNV func(hDC HDC; group GLuint) (result BOOL) extern_binding_lib("opengl32.lib");

def wglBindSwapBarrierNV func(group GLuint; barrier GLuint) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQuerySwapGroupNV func(hDC HDC; group GLuint ref; barrier GLuint ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryMaxSwapGroupsNV func(hDC HDC; maxGroups GLuint ref; maxBarriers GLuint ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryFrameCountNV func(hDC HDC; count GLuint ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglResetFrameCountNV func(hDC HDC) (result BOOL) extern_binding_lib("opengl32.lib");

def wglAllocateMemoryNV func(size GLsizei; readfreq GLfloat; writefreq GLfloat; priority GLfloat) (result u8 ref) extern_binding_lib("opengl32.lib");

def wglFreeMemoryNV func(pointer u8 ref) extern_binding_lib("opengl32.lib");

def wglBindVideoCaptureDeviceNV func(uVideoSlot UINT; hDevice HVIDEOINPUTDEVICENV) (result BOOL) extern_binding_lib("opengl32.lib");

def wglEnumerateVideoCaptureDevicesNV func(hDc HDC; phDeviceList HVIDEOINPUTDEVICENV ref) (result UINT) extern_binding_lib("opengl32.lib");

def wglLockVideoCaptureDeviceNV func(hDc HDC; hDevice HVIDEOINPUTDEVICENV) (result BOOL) extern_binding_lib("opengl32.lib");

def wglQueryVideoCaptureDeviceNV func(hDc HDC; hDevice HVIDEOINPUTDEVICENV; iAttribute s32; piValue s32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglReleaseVideoCaptureDeviceNV func(hDc HDC; hDevice HVIDEOINPUTDEVICENV) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetVideoDeviceNV func(hDC HDC; numDevices s32; hVideoDevice HPVIDEODEV ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglReleaseVideoDeviceNV func(hVideoDevice HPVIDEODEV) (result BOOL) extern_binding_lib("opengl32.lib");

def wglBindVideoImageNV func(hVideoDevice HPVIDEODEV; hPbuffer HPBUFFERARB; iVideoBuffer s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglReleaseVideoImageNV func(hPbuffer HPBUFFERARB; iVideoBuffer s32) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSendPbufferToVideoNV func(hPbuffer HPBUFFERARB; iBufferType s32; pulCounterPbuffer unsigned long ref; bBlock BOOL) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetVideoInfoNV func(hpVideoDevice HPVIDEODEV; pulCounterOutputPbuffer unsigned long ref; pulCounterOutputVideo unsigned long ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetSyncValuesOML func(hdc HDC; ust INT64 ref; msc INT64 ref; sbc INT64 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglGetMscRateOML func(hdc HDC; numerator INT32 ref; denominator INT32 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglSwapBuffersMscOML func(hdc HDC; target_msc INT64; divisor INT64; remainder INT64) (result INT64) extern_binding_lib("opengl32.lib");

def wglSwapLayerBuffersMscOML func(hdc HDC; fuPlanes INT; target_msc INT64; divisor INT64; remainder INT64) (result INT64) extern_binding_lib("opengl32.lib");

def wglWaitForMscOML func(hdc HDC; target_msc INT64; divisor INT64; remainder INT64; ust INT64 ref; msc INT64 ref; sbc INT64 ref) (result BOOL) extern_binding_lib("opengl32.lib");

def wglWaitForSbcOML func(hdc HDC; target_sbc INT64; ust INT64 ref; msc INT64 ref; sbc INT64 ref) (result BOOL) extern_binding_lib("opengl32.lib");
