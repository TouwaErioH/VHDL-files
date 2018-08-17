#include <stdio.h>
#include <stdlib.h>
struct BOOK{
char bookname[30];
char writer[20];
double price;
int amount;
};
#define MAX 2
int main()
{
   struct BOOK newbooks[MAX];
   struct BOOK temp;
   int n=0;
   FILE *fp2,*fp3;
   fp2=fopen("C:\\Users\\lenovo\\Desktop\\book.dat","r") ;
   fp3=fopen("C:\\Users\\lenovo\\Desktop\\newbook.dat","w") ;
   while(n!=MAX)
   {
       fscanf(fp2,"%s%s%lf%d",newbooks[n].bookname,newbooks[n].writer,&newbooks[n].price,&newbooks[n].amount);
       n++;
   }
  int i,j;
    for (i = 0; i < MAX - 1; i++)
        {for (j = 0; j < MAX - 1 - i; j++)
            if (newbooks[j].price > newbooks[j + 1].price)
           {
            temp = newbooks[j];
            newbooks[j] = newbooks[j + 1];
            newbooks[j + 1] = temp;
           }
        }
         n=0;
   while(n!=MAX)
   {
       fprintf(fp3,"%s %s %lf %d\n",newbooks[n].bookname,newbooks[n].writer,newbooks[n].price,newbooks[n].amount);
       n++;
   };
   fclose(fp2);
   fclose(fp3);
    return 0;
}
