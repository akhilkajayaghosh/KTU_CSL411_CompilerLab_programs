%{
%}

%%
[" "] ;
[A-Za-z0-9]+ {printf("The length of the word \"%s\" is: %d\n", yytext, yyleng);}
["$"] {return 0;} 
%%

int yywrap() {}
int main() {
	printf("Enter $ to stop typing...\n");
	yylex();
}
