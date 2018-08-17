#include <stdio.h>
#include <string.h>
#include <conio.h>

int main()
{
	int num[5],keynum[5],readnum[100],n=0,i=0,j=0,x=0,y=0,buf=0;
	char key[5][20],ch,read[100][20];
	memset(num,0,5*sizeof(keynum[0]));
	memset(keynum,0,5*sizeof(num[0]));
	memset(readnum,0,100*sizeof(readnum[0]));
	for(i=0;i<5;i++)
	{
	    printf("keyword%d is:",i+1);
	    while((ch=getch())!='\n')
	    {
	    	key[i][j]=ch;
	    	j++;
	    	printf("%c",key[i][j]);
		}
		j=0;
		setbuf(stdin,NULL);
	}                                 //input keywords 
	for(y=0;y<keynum[0];y++)
	{
		printf("%c",key[0][y]);
	}
	i=0;
	j=0;
	while((ch=getchar())!='\n')
	{
		if(ch=='\x20')
		{
			i++;
			j=0;
		}
		else
		{
			read[i][j]=ch;
			j++;
			readnum[i]++;
		}
		setbuf(stdin,NULL);
	}                                 //input string 
	for(;x<=i;x++)
	{
		for(j=0;j<5;j++)
		{
			if(readnum[x]==keynum[j])    //jugde the equality ofthe number of character in a key and a word in the string
			{
				for(;y<keynum[j];y++)
				{
					if(key[j][y]!=read[x][y])     //judge whether the same
					{
						buf=1;
					}
				}
				if(buf==0)                       //if same, plus 1 to its occurence number
				{
					num[j]++;
				}
			}
		}
	}
	for(i=0;i<5;i++)
	{
		if(num[i]!=0)
		{
			for(j=0;j<keynum[i];j++)
			{
				printf("%c",key[i][j]);
			}
			printf(":%d\n",num[i]);
		}
	}
	return 0;
} 
