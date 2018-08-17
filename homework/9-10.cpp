#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 50

struct node{
char chu[MAX];
struct node *next;
};

struct node* creat();
void print(struct node* pp3);
struct node *re(struct node* pp3);

int main()
{
    struct node *p=creat();
    struct node *p1;
    p1=re(p);
    print(p1);
system ("pause");
return 0;
}

struct node* creat()
{
struct node *head,*New,*tail;
head=NULL;
char n[MAX];
printf("输入字符串创建链表，仅输入字符b为结束标志\n");
 scanf("%s",n);
while(n[0]!='b')
{
    New=(struct node*)malloc(sizeof(struct node));
    strcpy(New->chu,n);
    New->next=NULL;
    if(head==NULL)
        head=New;
    else
        tail->next=New;
    tail=New;
    scanf("%s",n);
}
fflush(stdin);
return head;
}

void print(struct node* pp3)
{

if(pp3==NULL)
    return;
else
    {
   struct node *New=pp3;
    while(New->next!=NULL)
    {
        printf("%s\n",New->chu);
        New=New->next;
    }
    printf("%s\n",New->chu);
}
}

struct node* re(struct node* pp3)//简单思路
{
 struct node *after,*New,*NNext,*ret;
 if(pp3==NULL)
    return pp3;
 else
    New=pp3;
    after=pp3->next;
    while(after!=NULL)
    {
        NNext=after->next;
        after->next=New;
        New=after;
        after=NNext;
    }
    pp3->next=NULL;
    ret=New;
    return ret;
}

//可以递归
