# D_latch vs. DFF

## D_latch
![D_latch](./wave/D_latch.png)

D锁存器，存在空翻问题，当时钟处于高电平的时候，输出Q随着输入D变化而变化（电平敏感）。

## DFF
![DFF](./wave/DFF.png)

D边沿触发器，解决空翻问题。上升沿敏感，具备异步置零、置一指令。
