%{
#include<stdio.h>
int i,temp=1;
int val;
int count=1;

void yyerror(char *str)
{
printf("%s at line %d\n", str, count);
}

int yywrap()
{
return 1;
}

%}

%token DIGIT
%left '+' '-'
%left '*' '/' '%'
%right '#'
%right UMINUS

%%
list: stat list|/*fds*/
stat: expr '\n'{printf("%d\n",$1);++count;};
expr: '('expr')' {$$=$2;}
|expr '+' expr{$$=$1+$3;}
|expr '-' expr{$$=$1-$3;}
|expr '/' expr{$$=$1/$3;}
|expr '*' expr{$$=$1*$3;}
|expr '#' expr{for(i=0;i<$3;i++)
temp=temp*$1;
$$=temp;
temp=1;
}
|expr '%' expr{$$=$1%$3;}
|'-'expr %prec UMINUS{$$=-$2;}
|number;
number: DIGIT{$$=$1;}|number DIGIT{$$=10*$1+$2;};
%%

void main()
{
yyparse();
}
