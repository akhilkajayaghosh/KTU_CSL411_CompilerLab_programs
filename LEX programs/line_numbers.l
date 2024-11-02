%{
	int c=1;
%}
%%
["\n"] { c++; printf("%d ",c);}
["$"] {return 0;}
. ;
%%
int yywrap(){}
int main(){
	printf("Enter $ to end code: \n1 ");
	yylex();
}
