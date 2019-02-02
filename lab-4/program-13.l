    int num=0;

%%
"one" {num+=1;}
"two" {num+=2;}
"three" {num+=3;}
"four" {num+=4;}
"five" {num+=5;}
"six" {num+=6;}
"seven" {num+=7;}
"eight" {num+=8;}
"nine" {num+=9;}
"ten" {num+=10;}

"eleven" {num+=11;}
"twelve"  {num+=12;}
"thirteen"    {num+=13;}
"fourteen"    {num+=14;}
"fifteen"     {num+=15;}
"sixteen"     {num+=16;}
"seventeen"   {num+=17;}
"eighteen"    {num+=18;}
"nineteen"    {num+=19;}

"twenty"    {num+=20;}
"thrity"    {num+=30;}
"forty"     {num+=40;}
"fifty"     {num+=50;}
"sixty"     {num+=60;}
"seventy"   {num+=70;}
"eighty"    {num+=80;}
"ninety"    {num+=90;}

"hundred"   {num*=100;}
%%

int main(){
    yylex();
    printf("Number = %d\n", num);
    return 0;
}
