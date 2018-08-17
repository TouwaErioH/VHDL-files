#include <stdio.h>
#define MAX 50
void func1(int a);
void func2(int a);

int main()
{
    printf("input a positive integer\n");
    int a;
    scanf("%d",&a);
    func1(a);
    func2(a);
    return 0;
}

void func1(int a)
{
    char c[MAX]={'0'};
    int cou=0;
    while(a!=0)
    {
        c[cou]=a%7+'0';
        a=a/7;
        cou++;
    }
    while(cou!=0)
    {
        printf("%c",c[cou-1]);

        cou--;
    }
      printf("\n");
}

void func2(int a)
{
     int i=a/7;
    if((a/7)!=0)

    func2(i);
    printf("%d",a%7);
}
