%{
#include<stdio.h>
int v=1;
%}
%token num id op
%%
start : id '=' s ';'
s : id x
| num x
| '-' num x
| '(' s ')' x
;
x : op s
| '-' s
|
;
%%
int yyerror(){
v=0;
printf("Invalid arithmetic expression.\n");
return 0;
}
int main(){
printf("Enter the arithmetic expression: \n");
yyparse();
if(v){
printf("Valid expression.\n");
}
}