%{
#include<stdio.h>
#include<ctype.h>
%}

%token num
%left '+''-'
%left '*' '/'
%right '^'

%%

s:exp'\n'{printf("Accepted\n"); return 0;}
exp:exp'+'exp{printf("reduce e->e+e\n");}
|exp'*'exp{printf("reduce e->e*e\n");}
|num{printf("reduce e->id\n");}
;

%%

yylex(){
        int c=getchar();
        if(isdigit(c)){
                yylval=c-'0';
		printf("shift %c\n",c);
                return num;
        }
        if(c!='\n')
		printf("shift %c\n",c);
        return c;
}

int yywrap(){
        return 1;
}

int yyerror(){
        return 1;
}

int main(){
        printf("Grammer is:\n");
        printf("E->E*E\n");
        printf("E->E+E\n");
        printf("E->id\n\n");

        printf("Enter expression\n\n");

        yyparse();

        return 1;
}
