#include <stdio.h>
int seconds(int a,int b,int c);

int main()
{
    int a1,b1,c1,a2,b2,c2;
    printf("input the first time,like a(hour) b(minute) c(second),a should be between 0 and 12\n");
    scanf("%d%d%d",&a1,&b1,&c1);
     printf("input the second time,like a(hour) b(minute) c(second),a should be between 0 and 12\n");
    scanf("%d%d%d",&a2,&b2,&c2);
    printf("the difference are %d seconds\n",seconds(a1,b1,c1)-seconds(a2,b2,c2));
    return 0;
}

int seconds(int a,int b,int c)
{
    int d;
    d=a*60*60+b*60+c;
    return d;
}
