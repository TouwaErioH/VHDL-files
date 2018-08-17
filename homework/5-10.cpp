#include <stdio.h>
#include <time.h>
#include <stdlib.h>
int flip();

int main()
{
    time_t t;
     srand((unsigned int)time(&t));
    int pos=0,neg=0,n=1,num=0;
    while(n<101)
    {
        num=flip();
        if((num%2)==0)
            pos++;
        else
            neg++;
        n++;
    }
    printf("positive %d; negetive %d",pos,neg);
    return 0;
}


int flip()
{
    int a;


    a=rand();
    return a;
}
