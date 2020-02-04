%{
#include <iostream>
%}

%parse-param {int* result}

%{
typedef struct yy_buffer_state * YY_BUFFER_STATE;
#define yyterminate() return END

extern int yylex (void);
extern YY_BUFFER_STATE yy_scan_string(const char * str);
extern void yy_delete_buffer(YY_BUFFER_STATE buffer);

int yyparse (int* result);
void yyerror (int* result, const char* s) {
    std::cerr << "Error: " << s << std::endl;
}
%}

/* Declare tokens */
%token NUMBER
%left ADD SUB
%left MUL DIV
%token ABS LPARAN RPARAN LCBRACKET RCBRACKET LSBRACKET RSBRACKET
%token END 0
%%

program:
|   exp { *result = $1; yyterminate(); }
;

exp: NUMBER
|   ADD exp { $$ = $2; }
|   SUB exp { $$ = - $2; }
|   exp ADD exp  { $$ = $1 + $3; }
|   exp SUB exp  { $$ = $1 - $3; }
|   exp MUL exp { $$ = $1 * $3; }
|   exp DIV exp { $$ = $1 / $3; }
|   LPARAN exp RPARAN { $$ = $2; }
|   LCBRACKET exp RCBRACKET { $$ = $2; }
|   LSBRACKET exp RSBRACKET { $$ = $2; }
|   ABS exp ABS { $$ = $2 >= 0 ? $2 : - $2; }
;

%%

bool parse_str (const std::string& expression, int& ans) {
    YY_BUFFER_STATE buffer = yy_scan_string(expression.c_str());
    int err = yyparse(&ans);
    yy_delete_buffer(buffer);

    return err == 0;
}
