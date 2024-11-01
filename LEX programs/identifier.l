%{
%}
l[_a-zA-Z]
d[0-9]
%%
{l}({l}|{d})* {printf("Valid identifier");}
.* {printf("Invalid identifier");}
%%
int yywrap(){}
int main()
{
	printf("Enter Identifier\n");
	yylex();
}
