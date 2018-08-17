#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main()
{
	int min,max;
	int n;
	scanf("%d",&n);
	if(isalnum==0)
	{
		exit(0);
	} 		
	else if(isalnum!=0&&isalpha==0)  
	{
	exit(0);
    }
	if(n==-1)
	{
		exit(0);
	}
	min=n;
	max=n;
	while(1)
	{
		scanf("%d",&n);
		if(n==-1)
		{
			break;
		}
		else
		if(n>max)
		{
			max=n;
		}
		if(n<min)
		{
			min=n;
		}
	}
	printf("max=%d, min=%d",max,min);
	return 0;
} 
