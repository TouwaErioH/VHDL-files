#include <stdio.h>
#include <stdlib.h>
#define MAX 30

int main()
{
    typedef struct Stu{
char num[MAX];
char name[MAX];
double grades[3];

}SStu;
    SStu stu[10];
    double classes[10]={0};
    int n=0;
    int account=0;
    while(n<3)
    {printf("按顺序输入第%d位同学的学号，姓名，3个成绩：\n",n+1);
    scanf("%s%s%lf%lf%lf",stu[n].num,stu[n].name,&stu[n].grades[0],&stu[n].grades[1],&stu[n].grades[2]);
    classes[n]=((stu[n].grades[0]+stu[n].grades[1]+stu[n].grades[2])/3);
    if(classes[n]>85)
        account++;
    n++;
    }
    printf("平均分超过85分的有%d人",account);
    system("pause");
    return 0;
}
