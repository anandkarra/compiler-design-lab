#include<stdio.h>
#include<string.h>

int k=0,z=0,i=0,j=0,c=0;
char a[16],ac[20],stk[15],act[10];

void check(){
	strcpy(ac,"REDUCE TO E");
    for(z=0; z<c; z++){
    	if(stk[z]=='4'){
        	stk[z]='E';
        	stk[z+1]='\0';
        	printf("\n$%s\t%s$\t%s",stk,a,ac);
        }
	}
    for(z=0; z<c; z++){
    	if(stk[z]=='2' && stk[z+1]=='E' && stk[z+2]=='2'){
        	stk[z]='E';
        	stk[z+1]='\0';
        	stk[z+2]='\0';
        	printf("\n$%s\t%s$\t%s",stk,a,ac);
        	i=i-2;
        }
	}
    for(z=0; z<c; z++){
    	if(stk[z]=='3' && stk[z+1]=='E' && stk[z+2]=='3'){
        	stk[z]='E';
        	stk[z+1]='\0';
    		stk[z+2]='\0';
        	printf("\n$%s\t%s$\t%s",stk,a,ac);
        	i=i-2;
        }
	}
}

int main(){
    puts("GRAMMAR is \nE->2E2 \nE->3E3 \nE->4");
    puts("enter input string: ");
    scanf("%s",a);
	c=strlen(a);
	strcpy(act,"SHIFT -> ");
	puts("\nStack \t Input \t Action");
	puts("------------------------");
	for(k=0,i=0; j<c; k++,i++,j++){
		if(a[j]=='4'){
        	stk[i]=a[j];
            a[j]=' ';
            printf("\n$%s\t%s$\t%s4",stk,a,act);
            check();
        }
        else{
            stk[i]=a[j];
            a[j]=' ';
            printf("\n$%s\t%s$\t%ssymbols",stk,a,act);
            check();
           }
    }
    if(stk[0]!='E')
    	printf("\n\nInvalid String");
	else
		printf("\n\nAccepted");
	
    printf("\n");
    return 0;
}