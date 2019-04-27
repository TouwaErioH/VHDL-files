

结束一下e盘的文件夹
pipe3是我做的。 出错了。pipecu的问题（因为metoo 其他部件和twq的一致只有名字有点区别罢了，包括cpu，只有pipecu不同，跑通出错。出错的现象和我尝试用twq的alu以及我的ctrl一起用表现的形式一致）（已经删掉了）
success是twq的
success metoo是我模仿twq的。 alu用的单周期alu，cu用的twq的cu。出错了，只能跑我自己的sort，twq的跑错了。
metoo2 在metoo的基础上，根据我自己的单周期的ctrl修改了cu的aluc，irj型的wire，以及wreg。成功

pipecpu是采用新排序方法的，fpgatop修改过的，下板用的代码。主体为metoo2


为了消除控制冒险，在mysortong.asm中，每一个j，bne，jr，jal等j型指令后面都加了一个nop

