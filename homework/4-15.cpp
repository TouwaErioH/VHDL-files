// xiti415.cpp: 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <stdlib.h>

int main()
{
	char i, j, k;
	printf("\n安排比赛场次\n\n");
	for (i = 'x'; i <= 'z'; i++)

	
		for (j = 'x'; j <= 'z'; j++)
		{
			if (i != j)
				for (k = 'x'; k <= 'z'; k++)
				{
					if (i != k && j != k)
					{
						if (i != 'x'&&k != 'x'&&k != 'z')
						printf("\n game: a vs %c\tb vs %c\tc vs %c\n\n", i, j, k);
					}
				}
		}
	
	system("pause");
    return 0;
}

