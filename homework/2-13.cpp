#include <stdio.h>
int main()
{
    long int a,b,c,d,e,f,g;
    printf("input a,b\n");
    scanf("%ld%ld",&a,&b);
    c=a+b;
    d=a*b;
    e=a-b;
    f=a/b;
    g=a%b;
    printf("a+b=%ld a*b=%ld a-b=%ld a/b=%ld a%%b=%ld\n",c,d,e,f,g);
    return 0;
}
