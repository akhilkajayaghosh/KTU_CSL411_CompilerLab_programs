%{
	#include <stdio.h>
%}

%%
[\n\t\v\r\fA-Z] ;
[" "] ;
. {fprintf(yyout, "%s", yytext);}
%%

int yywrap() {}
int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("in8.txt", "r");
	yyout = fopen("out8.txt", "w");
	yylex();
}
