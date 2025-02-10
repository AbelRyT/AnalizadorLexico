%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Definicion para exportar funciones en Windows */
#ifdef _WIN32
  #define EXPORT __declspec(dllexport)
#else
  #define EXPORT
#endif

/* Variables globales para el manejo del bufer de salida */
static char* currentOutputBuffer = NULL;
static size_t currentBufferSize = 0;
static size_t currentOutputLength = 0;

/* Funcion auxiliar para concatenar cadenas al bufer dinamico */
static void appendOutput(const char* str) {
    size_t len = strlen(str);
    if (currentOutputLength + len + 1 > currentBufferSize) {
        currentBufferSize = (currentOutputLength + len + 1) * 2;
        currentOutputBuffer = realloc(currentOutputBuffer, currentBufferSize);
        if (!currentOutputBuffer) {
            fprintf(stderr, "Error al asignar memoria\n");
            exit(1);
        }
    }
    strcpy(currentOutputBuffer + currentOutputLength, str);
    currentOutputLength += len;
}
%}

%option noyywrap

%%

"//".*  { 
            appendOutput("Comentario de linea detectado\n"); 
        }

"/*"([^*]|\*+[^*/])*\*+"/" { 
            appendOutput("Comentario de bloque detectado\n"); 
        }

"abstract"         { appendOutput("Palabra reservada: abstract\n"); }
"as"               { appendOutput("Palabra reservada: as\n"); }
"base"             { appendOutput("Palabra reservada: base\n"); }
"break"            { appendOutput("Palabra reservada: break\n"); }
"case"             { appendOutput("Palabra reservada: case\n"); }
"catch"            { appendOutput("Palabra reservada: catch\n"); }
"checked"          { appendOutput("Palabra reservada: checked\n"); }
"class"            { appendOutput("Palabra reservada: class\n"); }
"const"            { appendOutput("Palabra reservada: const\n"); }
"continue"         { appendOutput("Palabra reservada: continue\n"); }
"decimal"          { appendOutput("Palabra reservada: decimal\n"); }
"default"          { appendOutput("Palabra reservada: default\n"); }
"delegate"         { appendOutput("Palabra reservada: delegate\n"); }
"do"               { appendOutput("Palabra reservada: do\n"); }
"else"             { appendOutput("Palabra reservada: else\n"); }
"enum"             { appendOutput("Palabra reservada: enum\n"); }
"event"            { appendOutput("Palabra reservada: event\n"); }
"explicit"         { appendOutput("Palabra reservada: explicit\n"); }
"extern"           { appendOutput("Palabra reservada: extern\n"); }
"false"            { appendOutput("Palabra reservada: false\n"); }
"finally"          { appendOutput("Palabra reservada: finally\n"); }
"fixed"            { appendOutput("Palabra reservada: fixed\n"); }
"for"              { appendOutput("Palabra reservada: for\n"); }
"foreach"          { appendOutput("Palabra reservada: foreach\n"); }
"goto"             { appendOutput("Palabra reservada: goto\n"); }
"if"               { appendOutput("Palabra reservada: if\n"); }
"implicit"         { appendOutput("Palabra reservada: implicit\n"); }
"in"               { appendOutput("Palabra reservada: in\n"); }
"int"              { appendOutput("Palabra reservada: int\n"); }
"interface"        { appendOutput("Palabra reservada: interface\n"); }
"internal"         { appendOutput("Palabra reservada: internal\n"); }
"is"               { appendOutput("Palabra reservada: is\n"); }
"lock"             { appendOutput("Palabra reservada: lock\n"); }
"long"             { appendOutput("Palabra reservada: long\n"); }
"namespace"        { appendOutput("Palabra reservada: namespace\n"); }
"new"              { appendOutput("Palabra reservada: new\n"); }
"null"             { appendOutput("Palabra reservada: null\n"); }
"object"           { appendOutput("Palabra reservada: object\n"); }
"operator"         { appendOutput("Palabra reservada: operator\n"); }
"out"              { appendOutput("Palabra reservada: out\n"); }
"override"         { appendOutput("Palabra reservada: override\n"); }
"params"           { appendOutput("Palabra reservada: params\n"); }
"private"          { appendOutput("Palabra reservada: private\n"); }
"protected"        { appendOutput("Palabra reservada: protected\n"); }
"public"           { appendOutput("Palabra reservada: public\n"); }
"readonly"         { appendOutput("Palabra reservada: readonly\n"); }
"ref"              { appendOutput("Palabra reservada: ref\n"); }
"return"           { appendOutput("Palabra reservada: return\n"); }
"sbyte"            { appendOutput("Palabra reservada: sbyte\n"); }
"sealed"           { appendOutput("Palabra reservada: sealed\n"); }
"short"            { appendOutput("Palabra reservada: short\n"); }
"sizeof"           { appendOutput("Palabra reservada: sizeof\n"); }
"stackalloc"       { appendOutput("Palabra reservada: stackalloc\n"); }
"static"           { appendOutput("Palabra reservada: static\n"); }
"string"           { appendOutput("Palabra reservada: string\n"); }
"struct"           { appendOutput("Palabra reservada: struct\n"); }
"switch"           { appendOutput("Palabra reservada: switch\n"); }
"this"             { appendOutput("Palabra reservada: this\n"); }
"throw"            { appendOutput("Palabra reservada: throw\n"); }
"true"             { appendOutput("Palabra reservada: true\n"); }
"try"              { appendOutput("Palabra reservada: try\n"); }
"typeof"           { appendOutput("Palabra reservada: typeof\n"); }
"uint"             { appendOutput("Palabra reservada: uint\n"); }
"ulong"            { appendOutput("Palabra reservada: ulong\n"); }
"unchecked"        { appendOutput("Palabra reservada: unchecked\n"); }
"unsafe"           { appendOutput("Palabra reservada: unsafe\n"); }
"ushort"           { appendOutput("Palabra reservada: ushort\n"); }
"using"            { appendOutput("Palabra reservada: using\n"); }
"virtual"          { appendOutput("Palabra reservada: virtual\n"); }
"void"             { appendOutput("Palabra reservada: void\n"); }
"volatile"         { appendOutput("Palabra reservada: volatile\n"); }
"while"            { appendOutput("Palabra reservada: while\n"); }

"async"            { appendOutput("Palabra reservada: async\n"); }
"await"            { appendOutput("Palabra reservada: await\n"); }
"dynamic"          { appendOutput("Palabra reservada: dynamic\n"); }
"var"              { appendOutput("Palabra reservada: var\n"); }
"get"              { appendOutput("Palabra reservada: get\n"); }
"set"              { appendOutput("Palabra reservada: set\n"); }
"add"              { appendOutput("Palabra reservada: add\n"); }
"remove"           { appendOutput("Palabra reservada: remove\n"); }
"orderby"          { appendOutput("Palabra reservada: orderby\n"); }
"select"           { appendOutput("Palabra reservada: select\n"); }
"from"             { appendOutput("Palabra reservada: from\n"); }
"where"            { appendOutput("Palabra reservada: where\n"); }
"group"            { appendOutput("Palabra reservada: group\n"); }
"into"             { appendOutput("Palabra reservada: into\n"); }
"join"             { appendOutput("Palabra reservada: join\n"); }
"let"              { appendOutput("Palabra reservada: let\n"); }
"yield"            { appendOutput("Palabra reservada: yield\n"); }

"++"               { appendOutput("Operador: incremento (++).\n"); }
"--"               { appendOutput("Operador: decremento (--).\n"); }
"+"                { appendOutput("Operador: suma (+).\n"); }
"-"                { appendOutput("Operador: resta (-).\n"); }
"*"                { appendOutput("Operador: multiplicacion (*).\n"); }
"/"                { appendOutput("Operador: division (/).\n"); }
"%"                { appendOutput("Operador: modulo (%).\n"); }
"+="               { appendOutput("Operador: suma asignacion (+=).\n"); }
"-="               { appendOutput("Operador: resta asignacion (-=).\n"); }
"*="               { appendOutput("Operador: multiplicacion asignacion (*=).\n"); }
"/="               { appendOutput("Operador: division asignacion (/=).\n"); }
"%="               { appendOutput("Operador: modulo asignacion (%=).\n"); }

"="                { appendOutput("Operador: asignacion (=).\n"); }
"=="               { appendOutput("Operador: igualdad (==).\n"); }
"!="               { appendOutput("Operador: desigualdad (!=).\n"); }
"<="               { appendOutput("Operador: menor o igual (<=).\n"); }
">="               { appendOutput("Operador: mayor o igual (>=).\n"); }
"<"                { appendOutput("Operador: menor que (<).\n"); }
">"                { appendOutput("Operador: mayor que (>).\n"); }

"&&"               { appendOutput("Operador: AND logico (&&).\n"); }
"||"               { appendOutput("Operador: OR logico (||).\n"); }
"!"                { appendOutput("Operador: NOT logico (!).\n"); }

"~"                { appendOutput("Operador: NOT bit a bit (~).\n"); }
"&"                { appendOutput("Operador: AND bit a bit (&).\n"); }
"|"                { appendOutput("Operador: OR bit a bit (|).\n"); }
"^"                { appendOutput("Operador: XOR bit a bit (^).\n"); }
"<<"               { appendOutput("Operador: desplazamiento a la izquierda (<<).\n"); }
">>"               { appendOutput("Operador: desplazamiento a la derecha (>>).\n"); }
"&="               { appendOutput("Operador: AND bit a bit asignacion (&=).\n"); }
"|="               { appendOutput("Operador: OR bit a bit asignacion (|=).\n"); }
"^="               { appendOutput("Operador: XOR bit a bit asignacion (^=).\n"); }
"<<="              { appendOutput("Operador: desplazamiento a la izquierda asignacion (<<=).\n"); }
">>="              { appendOutput("Operador: desplazamiento a la derecha asignacion (>>=).\n"); }

"=>"               { appendOutput("Operador: lambda (=>).\n"); }
"??"               { appendOutput("Operador: null-coalescing (??).\n"); }
"??="              { appendOutput("Operador: null-coalescing asignacion (??=).\n"); }
"?"                { appendOutput("Operador: condicional (?).\n"); }
":"                { appendOutput("Operador: dos puntos (:).\n"); }
";"                { appendOutput("Operador: punto y coma (;).\n"); }
","                { appendOutput("Operador: coma (,).\n"); }
"."                { appendOutput("Operador: punto (.).\n"); }

"("                { appendOutput("Delimitador: parentesis izquierdo (().\n"); }
")"                { appendOutput("Delimitador: parentesis derecho ()).\n"); }
"{"                { appendOutput("Delimitador: llave izquierda ({).\n"); }
"}"                { appendOutput("Delimitador: llave derecha (}).\n"); }
"["                { appendOutput("Delimitador: corchete izquierdo ([).\n"); }
"]"                { appendOutput("Delimitador: corchete derecho (]).\n"); }


"0[xX][0-9a-fA-F]+" {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Numero hexadecimal: %s\n", yytext);
    appendOutput(buffer);
}

"0[bB][01]+" {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Numero binario: %s\n", yytext);
    appendOutput(buffer);
}

[0-9]+\.[0-9]+([eE][-+]?[0-9]+)?[fFdD]? {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Numero flotante: %s\n", yytext);
    appendOutput(buffer);
}

[0-9]+ {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Numero entero: %s\n", yytext);
    appendOutput(buffer);
}



\"([^\\\"\n]|\\.)*\" {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Cadena: %s\n", yytext);
    appendOutput(buffer);
}


\'([^\\\']|\\.)\' {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Caracter: %s\n", yytext);
    appendOutput(buffer);
}


[a-zA-Z_][a-zA-Z0-9_]* {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Identificador: %s\n", yytext);
    appendOutput(buffer);
}


[ \t\r\n]+    { /* Ignorar espacios y saltos de linea */ }


. {
    char buffer[256];
    snprintf(buffer, sizeof(buffer), "Caracter desconocido: %s\n", yytext);
    appendOutput(buffer);
}

%%

/* Funcion exportada para realizar el analisis lexico. Recibe una cadena 'input'
   con el codigo a analizar y retorna un puntero a un bufer dinamico con el resultado.
   Se recomienda que, una vez procesado el resultado, se invoque LiberarMemoria para liberar la memoria asignada.
*/
EXPORT char* analizarLexico(const char* input) {
    /* Si existe un bufer previo se libera antes de iniciar un nuevo analisis */
    if (currentOutputBuffer != NULL) {
        free(currentOutputBuffer);
        currentOutputBuffer = NULL;
    }
    currentBufferSize = 1024;
    currentOutputBuffer = (char*)malloc(currentBufferSize);
    if (!currentOutputBuffer) {
        return NULL;
    }
    currentOutputBuffer[0] = '\0';
    currentOutputLength = 0;

    /* Configuramos el escaner para leer desde la cadena 'input' */
    YY_BUFFER_STATE bufferState = yy_scan_string(input);
    yylex();
    yy_delete_buffer(bufferState);

    return currentOutputBuffer;
}

/* Funcion exportada para liberar la memoria asignada al bufer generado por analizarLexico.
   El parametro 'ptr' debe ser el puntero retornado por analizarLexico.
*/
EXPORT void LiberarMemoria(char* ptr) {
    if (ptr != NULL) {
        free(ptr);
        /* Si el puntero liberado es el mismo que el global, se reinicializa */
        if (ptr == currentOutputBuffer) {
            currentOutputBuffer = NULL;
        }
    }
}

/* No se define main() ya que se compilara como DLL */
