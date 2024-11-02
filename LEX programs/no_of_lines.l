%{
    int c = 0;
%}

%%
["\n"] {c++;}
["$"] {return 0;}
. ;
%%

int yywrap() {}

int main() {
    printf("Enter $ to end the code: \n");
    yylex();
    printf("Number of lines in the code is %d\n", c);
}
