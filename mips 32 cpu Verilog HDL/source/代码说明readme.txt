1) \CoDWork\SCPUSIM  单周期CPU ModelSim工程示例 (支持jal指令)

2) \CoDWork\SCPUSIM_woJAL  单周期CPU ModelSim工程示例 (不支持jal指令)

3) \CoDWork\SCPU_SOC 单周期CPU Vivado工程示例 (支持jal指令)

4) \source\SCPU 和 \source\SIMTop 用于建立ModelSIm工程SCPUSIM的Verilog代码

5) \source\SCPU 和 \source\FPGATop 用于建立Vivado工程SCPU_SOC的Verilog代码

6) 约束文件
\source\Nexys4DDR_CPU.xdc

7) 示例ModelSim工程SCPUSIM的ASM代码
\source\mipstestloop_sim.asm （没有jal指令）
\source\mipstestloop_sim.dat

\source\mipstestloopjal_sim.asm （有jal指令）
\source\mipstestloopjal_sim.dat

8) 示例Vivado工程SCPU_SOC的ASM代码
\source\mipstestloop_fpga.asm
\source\mipstestloop_fpga.dat
\source\mipstestloop_fpga.coe

9) 单周期CPU扩展指令仿真测试ASM代码1
\source\mipstest_extloop.asm
\source\mipstest_extloop.dat

10) 单周期CPU扩展指令仿真测试ASM代码2
\source\extendedtest.asm
\source\extendedtest.dat

11) 流水线CPU扩展指令仿真测试ASM代码
\source\mipstest_pipelinedloop.asm
\source\mipstest_pipelinedloop.dat

12) 学号排序参考ASM代码
\source\studentnosorting.asm
\source\studentnosorting.dat
\source\studentnosorting.coe
