%{#include<iostream.h>
	#include<string.h>
%}
digit[0-9]
letter[a-zA-Z_]
TYPE scanf|printf|int|char|bool|float|void|for|do|while|if|else|return|void
%%
{TYPE} {
	char* s = yytext;
	while(*s) 
    {
        *s = (*s >= 'a' && *s <= 'z') ? *s-32 : *s;
        s++;
    }
	fprintf(yyout, "%s", yytext);
}
%%
int main()
{
  FILE *fh, *fout;
  if (fh = fopen("in.c", "r")) {
    yyin = fh;
  }
  yyout = fopen("out.c", "w");
 yylex();
 return 0;
} 