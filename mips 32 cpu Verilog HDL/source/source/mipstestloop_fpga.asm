# Test the MIPS processor in FPGA SOC
# add, sub, and, or, slt, addi, lw, sw, beq, j, sll
# If successful, it should write the value 7 to address 84

#        Assembly                  Description           Instr   Address Machine
main:    addi $2, $0, 5          # initialize $2 = 5     00      0       20020005
         addi $3, $0, 12         # initialize $3 = 12    01      4       2003000c
         addi $7, $3, -9         # initialize $7 = 3     02      8       2067fff7
         or   $4, $7, $2         # $4 = (3 or 5) = 7     03      c       00e22025
         and  $5, $3, $4         # $5 = (12 and 7) = 4   04      10      00642824
         add  $5, $5, $4         # $5 = 4 + 7 = 11       05      14      00a42820
         beq  $5, $7, label2     # shouldn't be taken    06      18      10a7000a
         slt  $4, $3, $4         # $4 = (12 < 7) = 0     07      1c      0064202a
         beq  $4, $0, label1     # should be taken       08      20      10800001
         addi $5, $0, 0          # shouldn't happen      09      24      20050000
label1:  slt  $4, $7, $2         # $4 = (3 < 5) = 1      0A      28      00e2202a
         add  $7, $4, $5         # $7 = 1 + 11 = 12      0B      2c      00853820
         sub  $7, $7, $2         # $7 = 12 - 5 = 7       0C      30      00e23822
         sw   $7, 68($3)         # [80] = 7              0D      34      ac670044
         lw   $2, 80($0)         # $2 = [80] = 7         0E      38      8c020050
         j    label2             # should be taken       0F      3c      08000011
         addi $2, $0, 1          # shouldn't happen      10      40      20020001
label2:  sw   $2, 84($0)         # write adr 84 = 7      11      44      ac020054
         addi $10, $0, -1        # $10 = 0xFFFFFFFF      12      48      200affff
         add  $10, $10, $10      # $10 = 0xFFFFFFFE      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFFFC      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFFF8      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFFF0      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFFE0      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFFC0      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFF80      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFF00      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFE00      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFFC00      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFF800      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFF000      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFE000      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFFC000      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFF8000      16      58      014a5020
         add  $10, $10, $10      # $10 = 0xFFFF0000      16      58      014a5020
         addi $12, $10, 0x4      # $12 = 0xFFFF0004      18      50      214c0004
         addi $14, $10, 0xC      # $14 = 0xFFFF000C      19      60      214e000c
display: lw   $13, 0($12)        # $13 = status of SWs   20      54      8d8d0000
         sw   $13, 0($14)        # $13 to seg7           21      64      adcd0000
         j    display            # loop display          22      68      08000025

# $0  = 0  # $1  = 0  # $2  = 7  # $3  = c
# $4  = 1  # $5  = b  # $7  = 7
# $10 = 0xFFFF0000,   #13 = status of SWs
# $12 = 0xFFFF0004,   #14 = 0xFFFF000C
# [0x50] = 7  [0x54] = 7
