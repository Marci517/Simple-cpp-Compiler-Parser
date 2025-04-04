# C++ Interpreter with Flex & Bison

This project implements a simple interpreter for a small subset of a C-like language using **Flex** for lexical analysis and **Bison** for syntax analysis. It supports basic variable declarations, arithmetic and logical operations, `if` and `while` control structures, and simple type checking with a symbol table.

## Features

- **Lexical Analysis with Flex**

  - Recognizes integers, floats, variables, operators, and keywords (`if`, `else`, `while`, etc.).
  - Tracks line and column numbers for error reporting.
  - Uses `unordered_map` for symbol table storage.

- **Syntax Analysis with Bison**

  - Supports `int` and `float` variable declarations with type checking.
  - Implements arithmetic operations (`+`, `-`, `*`, `/`, `%`) and logical comparisons (`==`, `!=`, `<`, `>`, `&&`, `||`).
  - Allows assignment and expression evaluation.
  - Includes `if-else` and `while` control flow.
  - Outputs interpreted results and error messages (e.g., type mismatches, undeclared variables).

- **Code Execution**
  - Input programs are read from a file and parsed/executed directly.
  - Code outputs variable values and control flow to standard output.

## Files

- `flexFile.l`: Contains the lexer rules for tokens.
- `bisonFile.y`: Contains grammar rules and semantic actions.
- `input.txt`: Sample input file to run and test the interpreter.
- `tryMyGenCode.cpp`: Sample C++ logic for primality testing and computing Fibonacci numbers using the code generated by the interpreter.
- `run.sh`: A script to compile and run the interpreter.
