%{
	int l = 0;
	int b = 0;
	int w = 0;
	int c = 0;
%}

%%
["\n"] {l++;}
[" "] {b++;}
[a-zA-Z0-9]+ {w++; c += yyleng;}
["$"] {return 0;}
%%

int yywrap() {}

int main() {
	printf("Enter $ to stop typing...\n");
	yylex();
	printf("No of lines: %d\nNo of blanks: %d\nNo of words: %d\nNo of characters: %d\n", l, b, w, c);
}
