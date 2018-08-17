#include <stdio.h>
#define MAX 30
int main()
{
    long int a;
    printf("输入正整数，三位分节输出\n");
    scanf("%ld",&a);
    int num[MAX],n=0;
    while(n<30)
    {
        num[n]=-1;
        n++;
    }
    n=0;
    while(a!=0)
    {
        num[n]=a%10;
        a=a/10;
        n++;
    }
    if(n%3==1)
    {
        printf("%d ",num[n-1]);
        n=n-1;
        while(n!=0)
        {
        printf("%d%d%d ",num[n-1],num[n-2],num[n-3]);
        n=n-3;
        }

    }
        else if(n%3==2)
              {
        printf("%d%d ",num[n-1],num[n-2]);
        n=n-2;
        while(n!=0)
        {
        printf("%d%d%d ",num[n-1],num[n-2],num[n-3]);
        n=n-3;
        }

    }
          else
              {
        while(n!=0)
        {
        printf("%d%d%d ",num[n-1],num[n-2],num[n-3]);
        n=n-3;
        }

    }
    return 0;
}
