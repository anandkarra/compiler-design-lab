%{
#undef yywrap
#define yywrap() 1
#include <stdio.h>
    int find_idtf();
    
    int location = 0;
    char st[50][10];
%}
TYPE int|char|bool|float|void|for|do|while|if|else|return|void
%option yylineno
%option noyywrap

%%
{TYPE} {
    printf("Entered Keyword: %s\n", yytext);
    if(find_idtf(yytext) != -1)
        printf("Keyword found at index: %d\n", find_idtf(yytext));
    else{
        printf("Keyword not found in symbol table. Inserting...\n");
        //st[location] = yytext;
        memcpy(st[location], yytext, yyleng);
        location++;
        printf("Keyword inserted at index: %d\n", find_idtf(yytext));
    }
}
.   {printf("Invalid keyword entered.\n");}
%%

int find_idtf(char *s){
    int i;
    for(i = 0; i < 50; i++){
        if(strcmp(st[i],s) == 0)
            return i;
    }
    return -1;
}

int main(){
    yylex();
}