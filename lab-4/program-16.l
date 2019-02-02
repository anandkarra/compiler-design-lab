%{
    #include<string.h>

    int longest = 0;
    char longword[100];
%}
%option yylineno
%option noyywrap

%%
[a-zA-Z]+   {
    if(yyleng > longest){
        longest = yyleng;
        strcpy(longword, yytext);
    }
}
.   |
\n  ;
%%

char *strrev(char *str)
{
      char *p1, *p2;

      if (! str || ! *str)
            return str;
      for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
      {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
      }
      return str;
}

int main(void){
    yyin = fopen("sentence.txt","r");
    yylex();

    printf("Longest word is  = %s\n", longword);

    strrev(longword);

    printf("Reversed word is = %s\n", longword);
    return 0;
}