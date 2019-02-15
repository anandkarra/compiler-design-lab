%{
#include<stdio.h>
#include<ctype.h>
%}

%token num
%left '+''-'
%left '*' '/'
%right '^'

%%

s:e'\n'{printf("Value of expression is %d\nAccepted\n",$$);}
e:e'+'t{printf("reduce E->E+T\n");$$=$1+$3;}
|t{printf("reduce E->T\n");$$=$1;}
t:t'*'f{printf("reduce T->T*F\n");$$=$1*$3;}
|f{printf("reduce T->F\n");$$=$1;}
f:'('e')'{printf("reduce F->(F)\n");$$=$1;}
|num{printf("reduce f->id\n");$$=$1;}
;

%%

yylex(){
        int c=getchar();
        if(isdigit(c)){
                yylval=c-'0';
		printf("Shift %c\n",c);
                return num;
        }
        if(c!='\n')
		printf("Shift %c\n",c);
        return c;
}

int yywrap(){
        return 1;
}

int yyerror(){
        return 1;
}

int main(){
	printf("Operator precedence parser with * having greater precedence than +\n\n");
        yyparse();

        return 1;
}
