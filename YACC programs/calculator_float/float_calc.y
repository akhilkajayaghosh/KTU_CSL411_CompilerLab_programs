%{
#include <stdio.h>
#include <math.h>

int count = 1;

void yyerror(char *str)
{
    printf("%s at line %d\n", str, count);
}

int yywrap()
{
    return 1;
}

%}

%union {
    float fval;
}

%token <fval> NUMBER
%type <fval> expr

%left '+' '-'
%left '*' '/' '%'
%right '^'
%right UMINUS

%%
list: stat list | /* empty */
stat: expr '\n' { printf("%.6f\n", $1); ++count; };
expr: '(' expr ')' { $$ = $2; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '^' expr { $$ = pow($1, $3); }
    | expr '%' expr { $$ = fmod($1, $3); }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | NUMBER
    ;
%%

int main()
{
    yyparse();
    return 0;
}
