#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;

const int N=130;

int n,m,tag[520];

struct Trie{
    int count;      //是否为该单词的最后一个节点
    Trie *fail;     //失败指针
    Trie *next[N];

    Trie(){     //构造函数初始化
        count=0;
        fail=NULL;
        memset(next,0,sizeof(next));
    }
}*q[5000010];       //队列，方便用于bfs构造失败指针

char word[520];     //输入的单词
char str[1000010];  //模式串
int head,tail;      //队列的头尾指针



//建立Trie
void Insert(char *str,Trie *Root,int id){
    Trie *loc=Root;
    int i=0;
    while(str[i]!='\0'){
        int id=str[i]-31;
        if(loc->next[id]==NULL)
            loc->next[id]=new Trie();
        loc=loc->next[id];
        i++;
    }
    loc->count=id;      //初始化为0，++后为1，表示是一个单词的结尾
}


//构造失败指针
void AC_automation(Trie *Root){
    Root->fail=NULL;
    q[head++]=Root;
    Trie *cur,*tmp;
    while(head!=tail){
        cur=q[tail++];      //拿到一个节点
        tmp=NULL;
        for(int i=0;i<N;i++){
            if(cur->next[i]!=NULL){     //若其i孩子非空
                if(cur==Root)   //他自己是头，其孩子的失败指针指向头
                    cur->next[i]->fail=Root;
                else{   //普通节点
                    tmp=cur->fail;  //指向自己的失败指针
                    while(tmp!=NULL){
                        if(tmp->next[i]!=NULL){     //失败指针有i孩子
                            cur->next[i]->fail=tmp->next[i];    //当前节点的i孩子的失败指针指向失败指针的i孩子，然后跳出
                            break;
                        }
                        tmp=tmp->fail;  //继续找失败指针
                    }
                    if(tmp==NULL)       //若失败指针为空
                        cur->next[i]->fail=Root;    //当前节点的i孩子的失败指针指向头
                }
                q[head++]=cur->next[i]; //进去的都是定义过失败指针的,故此过程是给其孩子定义失败指针
            }
        }
    }
}


//匹配过程
int query(Trie *Root){
    int i=0,cnt=0;
    Trie *loc=Root,*tmp;
    while(str[i]!='\0'){
        int id=str[i]-31;   //计算孩子的位置   32开始ASCII是space
        while(loc->next[id]==NULL && loc!=Root){
            loc=loc->fail;  //若没有i孩子节点，通过失败指针找与这之前相同的有i孩子的节点
        }
        loc=loc->next[id];      //指向其i孩子
        loc=(loc==NULL)?Root:loc;
        tmp=loc;
        while(tmp!=Root && tmp->count!=0){
            if(tmp->count!=0 && !tag[tmp->count]){  //主要是改这里
                cnt++;
                tag[tmp->count]=1;
            }
            tmp=tmp->fail;
        }
        i++;
    }
    return cnt;
}

int main(){

printf("输入正整数N，代表黑名单网址，IP个数\n");
       printf("之后N行分别输入这些网址，ip，会自动编号：1-N\n");
    while(scanf("%d",&n)!=0){
        head=tail=0;
        Trie *Root=new Trie();
                getchar();
        for(int i=1;i<=n;i++){
            gets(word);
            Insert(word,Root,i);
        }
        AC_automation(Root);
         printf("输入正整数M，代表给定的网址，ip个数\n");
               printf("之后M行分别输入这些网址，ip（注意，不能相同），会自动编号：1-M\n");
        scanf("%d",&m);
        int total=0;
        for(int i=1;i<=m;i++){
            memset(tag,0,sizeof(tag));
            scanf("%s",str);
            int flag=query(Root);
            if(flag){
                printf("给定的网址%d包含于黑名单",i);
                for(int j=1;j<=n;j++)
                    if(tag[j])
                        printf(" %d",j);
                printf("\n");
                total++;
            }
        }
        printf("total: %d\n",total);
    }
    return 0;
}
