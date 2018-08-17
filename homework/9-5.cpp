#include <stdio.h>
#include <stdlib.h>
struct Date{
int year;
int month;
int date;
};

int main()
{
    int years,days;
    int month=1;
    int n=0;
    struct Date thedate;
    int normal[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    int abnormal[12]={31,29,31,30,31,30,31,31,30,31,30,31};
    printf("按顺序先后输入年份和第几天:\n");
    scanf("%d%d",&years,&days);
    thedate.year=years;
    if(years%4!=0||years%400!=0)
    {
        if(days<=31)
        {thedate.month=1;
        thedate.date=days;
        }
        else
        {while(days-normal[n]>normal[n+1])
        {
            days=days-normal[n];
            n++;
        }

        thedate.month=n+2;
        thedate.date=days-normal[n];}
    }
    else
         {
        if(days<=31)
        {thedate.month=1;
        thedate.date=days;
        }
        else
        {while(days-abnormal[n]>abnormal[n+1])
        {
            days=days-abnormal[n];
            n++;
        }

        thedate.month=n+2;
        thedate.date=days-abnormal[n];}
    }
    printf("%d.%d.%d",thedate.year,thedate.month,thedate.date);
    system("pause");
    return 0;
}
