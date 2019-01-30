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
[-|+|*|/|%|=|>|<|>=] {
    printf("Entered Operator: %s\n", yytext);
    if(find_idtf(yytext) != -1)
        printf("Operator found at index: %d\n", find_idtf(yytext));
    else{
        printf("Operator not found in symbol table. Inserting...\n");
        //st[location] = yytext;
        memcpy(st[location], yytext, yyleng);
        location++;
        printf("Operator inserted at index: %d\n", find_idtf(yytext));
    }
}
.   {printf("Invalid operator entered.\n");}
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