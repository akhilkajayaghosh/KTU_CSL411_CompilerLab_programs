%{
	int v = 0;
	int c = 0;
%}

%%
[AEIOUaeiou] {v++;}
[A-Za-z] {c++;}
. ;
["\n"] {return 0;}
%%

int yywrap() {}
int main() {
	printf("Enter the text: ");
	yylex();
	printf("No of vowels: %d\nNo of consonents: %d\n", v, c);
}
