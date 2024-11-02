%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
int c=0;
%}
%%
" " {;}
[0-9] {c=yytext[0];yylval=c-'0';return DIGIT;}
[^a-z ^0-9] {c=yytext[0];yylval=c;return c;}
%%
