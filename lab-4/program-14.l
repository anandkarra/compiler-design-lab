%{
#undef yywrap
#define yywrap() 1
#include<stdio.h>
    int count = 0; 
%}
%option yylineno
%option noyywrap

%%

"ab"/.* {count++;}

%%

int main(){
    FILE *fh;
    if (fh = fopen("in.c", "r")) {
      yyin = fh;
    }
    yylex();
    printf("\n\nNo. of words starting with \"ab\": %d\n",count);
}