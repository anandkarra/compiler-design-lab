%{#include<iostream.h>
int count_v=0,count_c;
%}
VOWELS a|e|i|o|u|A|E|I|O|U
ALPHA [a-z A-Z]

%%

{VOWELS} {
    count_v++;
}

{ALPHA} {
count_c++;
}
.   |
\n  ;

%%
int main()
{
    FILE *f;
    if(f=fopen("in.c","r")) {
    	yyin = f;
    }
    yylex();
    printf("# of vowels : %d\t # of consonants : %d\n",count_v,count_c);
    return 0;
} 