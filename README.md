<h1 align="center">RISC-V Assembly Exercises</h1>

<p align="center">Some exercises of ASM for RISC-V processors made during my first year of university</p>

---

## 1) Repository structure and content of the files

As you may expect, each folder contains the exercises done in each lecture (we did exercises only on certain lessons), plus a couple exercises done for fun / personal projects. I'll mark here below all the files with what it should be the main point of the program (at a certain point I stopped writing them, I wasn't originally planning to publish them).

```
RISC-V Exercises
 ├ Exercise 01
 │  └ riscv1-ex1.asm | Sum two numbers and save the result in the memory
 ├ Exercise 02
 │  ├ riscv1-ex1.asm | Print different strings based on the initial number
 │  ├ riscv1-ex2.asm | Print the length of the string
 │  └ riscv1-ex3.asm | Print the smaller integer between the given two
 ├ Exercise 03
 │  ├ riscv1-ex1.asm | Print the sum of all the array's values
 │  └ riscv1-ex2.asm | Print the array's value in the Nth position, where N is the first given integer
 ├ Exercise 04
 │  ├ riscv1-persproj.asm | Given a string of a roman number, it decodes it into a decimal number
 │  └ riscv1-ex2.asm | Print the factorial of a number iteratively
 ├ Exercise 05
 │  ├ riscv1-ex1.asm | Print all the numbers fron N to 1
 │  └ riscv1-ex2.asm | Print the biggest number in an array
 ├ Exercise 06
 │  ├ riscv1-ex1.asm | Example of a function
 │  ├ riscv1-ex2.asm | Print two strings with a new line between the two words
 │  └ riscv1-ex3.asm | Example of a recursive function that computes the factorial of a number
 ├ Exercise 07
 │  ├ riscv1-ex1.asm | Print the length of a linked list
 │  └ riscv1-ex2.asm | Print the length of a linked list recursively
 ├ Exercise 08
 │  ├ riscv1-ex1.asm | Print the bigger integer between the two given ones
 │  ├ riscv1-ex2.asm | Previous exercise but with labels (with pseudo-instructions)
 │  ├ riscv1-ex3.asm | Print all the numbers between y and x
 │  ├ riscv1-ex4.asm | Print if the first number is in the array
 │  ├ riscv1-ex5.asm | Print the numbers in the even positions of the array
 │  ├ riscv1-ex6.asm | Print the sum of all the values of the linked list
 │  ├ riscv1-ex7.asm | Print the sum (obtained recursively) of all the items of the linked list
 │  ├ riscv1-ex8.asm | Reverse a list recursively
 │  └ riscv1-ex9.asm | Solution for the previous exercise
 ├ Exercise 09
 │  ├ riscv1-ex1.asm | Print how many times both numbers x and y appear in the array
 │  ├ riscv1-ex2.asm | Count the rows in a matrix
 │  ├ riscv1-ex3.asm | Print the elements in the diagonal of a NxN matrix
 │  ├ riscv1-ex4.asm | Traverse a binary tree and print the number of nodes
 │  └ riscv1-ex5.asm | Given a linked list and an integer x, print how many times the integer appears in the list [INCOMPLETE]
 ├ Exercise 10
 │  ├ riscv1-ex1-solution.asm | Print the number of nodes in a n-ary tree [SOLUTION]
 │  ├ riscv1-ex2.asm | Print the sum of the positive numbers in the array
 │  └ riscv1-ex3.asm | Print the Maximum Common Divisor between two numbers x and y
 └ Exercise [Extra Batch]
    ├ riscv1-ex1.asm | Reverse an array recursively
    ├ riscv1-ex2.asm | Print the length of a linked list by using recursion
    └ riscv1-ex3.asm | Count the sum of the values of a binary tree
```

## 2) RARS theme ([OneDark](https://github.com/joshdick/onedark.vim) based)

<img align="right" src="https://i.imgur.com/lvb3NvF.png" width=50%>

With a bit of patience, I've been able to (*kind-of*) reproduce the One Dark color theme on [RARS](https://github.com/TheThirdOne/rars). I haven't yet discovered if there is a way to export color schemes, so I'm listing all the colors here (in RGB format, since all the colors have the A value equal to `255`. Please note that, in order to change the editor's colors, you have to go to `Settings > Editor...`). The font that I'm using is the **beloved** [JetBrains Mono font](https://www.jetbrains.com/lp/mono/), `plain` style, with `15pt` size.

For the editor:
 - Background: `35, 39, 46`;
 - Foreground: `228, 192, 123` (this edits both the line numbers and all the text sections that are not instructions / register / comments...);
 - Line Highlight: `44, 49, 60`;
 - Text Selection: `61, 69, 85`;
 - Caret: `82, 138, 251`;

For the keywords:
 - Label: `228, 192, 123`;
 - Instruction: `97, 174, 238`;
 - Assembler Directive: `198, 120, 221`;
 - Register: `213, 104, 113`;
 
If I'll find out how to edit the color of the UI too, then I will update this `README` file with the necessary instructions to change it.
 
## 3) Further informations & credits

These exercises come from the lectures of [professor Mei](http://wwwusers.di.uniroma1.it/~mei/) @ [Sapienza](https://www.uniroma1.it). Further informations regarding the course can be found [here](https://corsidilaurea.uniroma1.it/it/view-course-details/2022/30786/20190322084705/8b2780f8-63fd-464f-bd7b-cec85d425e3c/563a787b-d89f-4266-b681-64a9f5367faa/0a1a2f92-c45e-4ea7-bc89-af3f93772dc8/e757cc43-5a0d-4405-9223-0b6373c96b59?guid_cv=563a787b-d89f-4266-b681-64a9f5367faa&current_erogata=8b2780f8-63fd-464f-bd7b-cec85d425e3c).

All the exercises were made with the [RARS software](https://github.com/TheThirdOne/rars)
