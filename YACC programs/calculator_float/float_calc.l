%{
#include <stdio.h>
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%
[\t]   { /* ignore whitespace */ }
[0-9]+(\.[0-9]+)? {
    yylval.fval = atof(yytext);
    return NUMBER;
}
\n      { return '\n'; }
.       { return yytext[0]; }
%%

