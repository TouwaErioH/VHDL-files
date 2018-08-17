#include <stdio.h>
#include <stdlib.h>
int LineCount(char *name);
#define MAX 50
int main()
{
    char name[MAX];
    printf("输入文件名（包括路径）\n");
    scanf("%s",name);
    int d=0;
    d=LineCount(name);
    printf("文件共有%d行。\n",d);
    system("pause");
    return 0;
}

int LineCount(char *name)
{
    FILE *fp=fopen(name,"r");
    if(fp==NULL)
    {
        printf("File open error！");
        exit(1);
    }
    int n=0;
    char c;
   while(!feof(fp))
    {
        c=fgetc(fp);
        if(c=='\n')//问题在于如果没有用回车换行则输出0行
            n++;
    }
    fclose(fp);
    return n;
}

