%option noyywrap

%{
#include <iostream>
#include "parser.hpp"
%}

%%
[0-9]+  { yylval = atoi(yytext); return NUMBER; }

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }

"|"     { return ABS; }

"("     { return LPARAN; }
")"     { return RPARAN; }
"{"     { return LCBRACKET; }
"}"     { return RCBRACKET; }
"["     { return LSBRACKET; }
"]"     { return RSBRACKET; }

\n      { return EOL; }
[ \t]   { /* Ignore white space */ }
.       { std::cout << "Mystery character: " << *yytext << std::endl; }
%%
