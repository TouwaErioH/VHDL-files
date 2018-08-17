#include <stdio.h>
#include <stdlib.h>

int main()
{
  char temp;
  FILE *fp1,*fp2;
   fp1=fopen("C:\\Users\\lenovo\\Desktop\\old.dat","r") ;
   fp2=fopen("C:\\Users\\lenovo\\Desktop\\new.dat","w") ;
   if(fp1==NULL)
   {
       printf("open wrong!");
       exit(1);
   }
     if(fp2==NULL)
   {
       printf("write wrong!");
       exit(1);
   }
   fseek(fp1,0L,SEEK_END);
   long tlength=ftell(fp1);
   long goback;

 for(goback=1;goback<=tlength;goback++)
   {
       fseek(fp1,-goback,SEEK_END);
       temp=fgetc(fp1);
       fprintf(fp2,"%c",temp);
   }
   fclose(fp1);
   fclose(fp2);
    return 0;
}
