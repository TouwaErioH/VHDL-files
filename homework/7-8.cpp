#include <stdio.h>

int main()
{
	char a='(',b=')',buf;
	int left=0,right=0;
	while(1)
	{
		buf=getchar();
		if(buf==a)
		{
			left++;
		}
		else if(buf==b)
		{
			right++;
		}
		else if(buf=='\n')
		{
			break;
		}
	}
	printf("situation 1:");
	if(left==right)
	{
		printf("YES");
	}
	else
	{
		printf("NO");
	}
	printf("situation 2:");
	if(left>=right)
	{
		printf("YES");
	}
	else
	{
		printf("NO");
	}
	return 0;
}
