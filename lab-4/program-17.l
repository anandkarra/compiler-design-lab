%{
#include<stdio.h>
int sf=0,pf=0;
%}

%%
"scanf"	{ sf++; fprintf(yyout,"readf");}
"printf" { pf++; fprintf(yyout,"writef");}


%%

int main(){
	yyin=fopen("in.c","r");
	yyout=fopen("out.c","w");
	yylex();
	printf("Number of scanf = %d\nNumber of printf = %d\n",sf,pf);
	return 0;
}