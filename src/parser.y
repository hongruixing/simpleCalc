%{
#include <iostream>
%}

%parse-param {int* result}

%{
#define yyterminate() return END

extern int yylex (void);

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
%token EOL
%token END 0
%%

program: EOL { *result = 0; yyterminate(); }
| exp EOL { *result = $1; yyterminate(); }
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
