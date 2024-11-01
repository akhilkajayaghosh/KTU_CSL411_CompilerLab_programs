%{
char k[100];
%}
%%
([Ss][Uu][Nn]|[Mm][Oo][Nn]|[Tt][Ue][Ee][Ss]|[Ww][Ee][Dd][Nn][Ee][Ss]|[Tt][Hh][Uu][Rr][Ss]|[Ff][Rr][Ii])[Dd][Aa][Yy] {printf("%s is a day",yytext);}
.+ {printf("%s is not a day",yytext);}
%%
int yywrap()
{}
int main()
{
	printf("Enter a week day:\n");
	yylex();
}
