# Euler's Method in MIPS Assembly

This project implements a numerical solution for a first-order ordinary differential equation (ODE) using Euler's method in MIPS assembly language, executed in the MARS simulator. It provides practical experience with assembly programming, focusing on I/O operations, loops, conditionals, and modular function design.

## Project Overview

### Objective  
Develop an assembly function named `euler_fn` that solves a first-order ODE using Euler's method. The function iteratively computes the next value of \( y \) based on the formula:

$$ y_{n+1} = y_n + h \times F(x_n, y_n) $$

### Differential Equation  
The differential equation addressed by this project is:

$$ y' = -283x^3 + 22x^2 + 12x + 279y^3 - 20y^2 - 30y - 7 $$

### Function \( F(x) \)  
In this implementation, the function used for the \( x \)-dependent part is:

$$ F(x) = -283x^3 + 22x^2 + 12x + 279 $$

Euler's method approximates the solution by updating \( y \) using the derivative provided by \( F(x) \) and the step size \( h \).

### Parameter Input  
The program receives three parameters via the MARS `pa` option:
- Initial value \( y(0) \)
- Step size \( h \)
- Number of steps

### Output Handling  
The computed value of \( y \) after the given number of steps is returned in register `$v0` and stored at the memory address `0x10010000`.

## How to Run

Use the following command to execute the assembly program in the MARS simulator:

```bash
java -jar Mars4_5.jar v0 0x10010000-0x10010000 np 2100913.asm pa 0 1 1
```

### Explanation:
- `v0` specifies that the result should be printed from register `$v0`.
- `0x10010000-0x10010000` defines the memory range where the output is stored.
- `np` disables the prompt for file input.
- `2100913.asm` is the name of the assembly file.
- `pa 0 1 1` passes the parameters to the program: initial value \( y(0) = 0 \), step size \( h = 1 \), and number of steps \( = 1 \).
