%{
#include <stdio.h>
#include<ctype.h>
%}

%token DIGIT
%left '+'
%left '*'

%%

S:  E'\n'{printf("\n%d",$1);}
E:  E'+'E       {$$=$1+$1;}
    | E'*'E     {$$=$1*$1;}
    | '('E')'   {$$=$1}
    | DIGIT
    ;

%%

yylex(){
    int c=getchar();
    if(isdigit(c)){
            yylval=c-'0';
            return DIGIT;
    }
    return c;
}

int yywrap(){
    return 1;
}

int yyerror(){
    return 1;
}

int main(){
        yyparse();
        printf("\n");
        return 1;
}