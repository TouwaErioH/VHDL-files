#include <stdio.h>
int main()
{
    long int a,b,c,d;
    printf("input a,b,c\n");
    scanf("%ld%ld%ld",&a,&b,&c);
    d=a+b+c;
    printf("a+b+c=%ld",d);
    return 0;
}
