%{
#undef yywrap
#define yywrap() 1
#include <stdio.h>
    int find_idtf();
    
    int location = 0;
    char st[50][10];
%}
%option yylineno
%option noyywrap

%%
[a-zA-Z]+[a-zA-Z0-9]* {
    printf("Entered identifier: %s\n", yytext);
    if(find_idtf(yytext) != -1)
        printf("Identifier found at index: %d\n", find_idtf(yytext));
    else{
        printf("Identifier not found in symbol table. Inserting...\n");
        //st[location] = yytext;
        memcpy(st[location], yytext, yyleng);
        location++;
        printf("Identifier inserted at index: %d\n", find_idtf(yytext));
    }
}
.   {printf("Invalid identifier entered.\n");}
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