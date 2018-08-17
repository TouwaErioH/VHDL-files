#include <stdio.h>

int main()
{
	int n=0;
	float salary=0;
	while(1)
	{
		scanf("%d",&n);
		if(n==-1)
		{
			break;
		}
		salary=200+0.09*n;
		printf("%.2f\n",salary);
	}
	return 0;
}
