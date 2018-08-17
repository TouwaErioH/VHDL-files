#include <stdio.h>
#include <stdlib.h>

void sum(double *a,int n,int& pos,int& neg);

int main()
{
	double a[10]={10,24.90,24.39,5.9,3.8,2.4,2.1,3.6,7.8,-3.6};
    int n=10,q,p;
	sum(a,n,q,p);
	printf("%lf %lf\n %d  %d",a[0],a[1],q,p);
    return 0;
}

void sum(double *a,int n,int& pos,int& neg)
{
	int x=0,y=0;
	double plus[2]={0,0};
	for(n=n-1;n>=0;n--)
	{
		if(a[n]>0.0)
		{
			plus[0]+=a[n];
			x++;
		}
		else if(a[n]<0.0)
		{
			plus[1]+=a[n];
			y++;
		}
	}
	a[0]=plus[0];
	a[1]=plus[1];
	pos=x;
	neg=y;
}
