#include <iostream>
#include <string.h>
using namespace std;

struct Trie{    //字典树定义
    Trie* next[130];
    int flag;
    Trie()    //构造函数初始化
    {
        int i;
        for(i=0;i<130;i++){
            next[i] = NULL;
        }
        flag=0;
    }
};
Trie root;
void Insert(char word[])    //将字符串word插入到字典树中
{
    Trie *p = &root;
    int i;
    for(i=0;word[i];i++){    //遍历word的每一个字符
        if(p->next[word[i]-31]==NULL)    //如果该字符没有对应的节点
            p->next[word[i]-31] = new Trie;    //创建一个
        p = p->next[word[i]-31];
    }
    p->flag=1;
}
int Find(char word[])    //返回以字符串word为前缀的单词的数量
{
    Trie *p = &root;
    int i;
    for(i=0;word[i];i++){    //在字典树找到该单词的结尾位置
        if(p->next[word[i]-31]==NULL)
            return 0;
        p = p->next[word[i]-31];
    }
    if(p->flag==1)
    return 1;
    return 0;
}

int main()
{
    char word[30];
    printf("输入黑名单，一行一个，仅输入9时停止\n");
    scanf("%s",word);
    while(word[0]!='9')
        {Insert(word);
            scanf("%s",word);
        }
   printf("输入给定的网址，一行一个,仅输入9时停止\n");
       scanf("%s",word);
        while(word[0]!='9')
{
 if(Find(word))
printf("%s在黑名单中\n",word);
scanf("%s",word);
}
    return 0;
}
