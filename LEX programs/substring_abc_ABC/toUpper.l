%{
	#include <stdio.h>
	char mod[4] = "ABC";
%}

%%
abc {fprintf(yyout, "%s", mod);}
. {fprintf(yyout, "%s", yytext);}
%%

int yywrap() {}

int main() {
	extern FILE *yyin, *yyout;
	yyin = fopen("in9.txt", "r");
	yyout = fopen("out9.txt", "w");
	yylex();
}
