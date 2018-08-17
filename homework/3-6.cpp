#include <stdio.h>
int main()
{
    int a,b,c,d,e,f;
    printf("input 五位正整数\n");
    scanf("%d",&a);
    b=a/10000;
    c=(a%10000)/1000;
    d=(a%1000)/100;
    e=(a%100)/10;
    f=a%10;
    printf("%3d%3d%3d%3d%3d\n",b,c,d,e,f);
    return 0;
}
