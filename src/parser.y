%{
#include <iostream>

extern int yylex (void);
extern int yyparse (void);

void yyerror (const char* s) {
    std::cerr << "Error: " << s << std::endl;
}
%}

/* Declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

program:
|   exp EOL { printf("= %d\n", $1); }
;

exp: factor
|   exp ADD factor  { $$ = $1 + $3; }
|   exp SUB factor  { $$ = $1 - $3; }
;

factor: term
|   factor MUL term { $$ = $1 * $3; }
|   factor DIV term { $$ = $1 / $3; }
;

term: NUMBER
|   ABS term    { $$ = $2 >= 0? $2 : - $2; }
;

%%
