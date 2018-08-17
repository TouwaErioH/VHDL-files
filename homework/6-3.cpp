#include <stdio.h>
#include <stdlib.h>
float CALCU(float a);
int main()
{
	float m;
	float e;
	printf("输入正整数m，计算1+1/1!+…+1/m！\n");
	scanf("%f", &m);
	e = CALCU(m)+1;
	printf("%f", e);
	system("pause");
	return 0;
}

float CALCU(float a)
{
	float result = 1;
		for (a; a >= 2; a--)
			result = result * (1 / a) + 1;

	return result;
}
