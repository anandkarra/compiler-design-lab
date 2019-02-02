%{
#undef yywrap
#define yywrap() 1
#include<stdio.h>
    int statements = 0;
    int ids = 0;
    int assign = 0;
    int ops = 0;
    int keywords = 0;
    int integers = 0; 
%}
DIGIT [0-9]
LETTER [A-Za-z]
TYPE int|char|bool|float|void|for|do|while|if|else|return|void
%option yylineno
%option noyywrap

%%

\n {statements++;}
{TYPE} {/*printf("%s\n",yytext);*/keywords++;}
(<|>|<=|>=|==) {ops++;}
'#'/[a-zA-Z0-9]*    {;}
[a-zA-Z]+[a-zA-Z0-9]* {printf("%s\n",yytext);ids++;}
= {assign++;}
[0-9]+ {integers++;}
.      {;}

%%

int main(){
    FILE *fh;
    if (fh = fopen("in.c", "r")) {
      yyin = fh;
    }
    yylex();
    printf("Identifiers = %d | Keywords = %d | Operators = %d \n",ids,keywords,ops);
}