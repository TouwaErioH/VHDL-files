#include <stdio.h>
#define max 10000 

int main()
{
	char p=0;
	int a[max],b[max],c[max],n=0,m=0,o=0;
	while(p=getchar()!='\n')
	{
		if(p==' ')   n++;
		else    a[n]=10*a[n]+(int)p; 
		setbuf(stdin,NULL);
	}
	setbuf(stdin,NULL);
	while(p=getchar()!='\n')
	{
		if(p==' ')   m++;
		else    b[n]=10*b[n]+(int)p; 
		setbuf(stdin,NULL);
	}
	for(;m>=0;m--)
	{
		for(int i=n;i>=0;i--)
		{
			if(b[m]>a[i])
			{
				c[m+i+1-o]=b[m];
				c[m+i-o]=a[i];
				o++;
			}
			else
			{
				c[m+i+1-o]=a[i];
			}
		}
	}
	for(int i=0;i<m+n+1;i++)
	{
		printf("%d\x20",c[i]);
	}
	return 0;
 } 
