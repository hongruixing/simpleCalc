%option noyywrap

%{
#include "parser.hpp"
%}

%%
"+"     { return ADD; }
"-"     { return SUB;}
"*"     { return MUL; }
"/"     { return DIV; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* Ignore white space */ }
.       { printf("Mystery character %c\n", *yytext); }
%%
