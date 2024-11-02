%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B NL
%%
stmt: S NL { printf("\nValid string -- a^nb^n.\n");
exit(0); }
;
S: A S B |
;
%%
int yyerror(char *msg){
printf("\nInvalid string -- Not a^nb^n. \n");
exit(0);
}
main(){
printf("Enter the string: \n");
yyparse();
}