%option caseless
%{
#include "y.tab.h"
%}
%%
[a] {return A;}
[b] {return B;}
\n  {return NL;}
.   {return yytext[0];}
%%