# Hangman – 8086 Assembly

A classic two-player Hangman game developed in Intel 8086 Assembly as part of a software engineering course.

**Developed by:** Yair Man  
**Language:** Intel 8086 Assembly  
**Project type:** Educational console game

## Overview

This project implements the classic Hangman game using 8086 Assembly language.

One player enters a secret word, and another player guesses letters until the word is revealed or the maximum number of incorrect guesses is reached.

The game uses low-level programming concepts such as registers, memory addressing, loops, conditional jumps, and DOS interrupts.

## Features

- Secret word input (1–9 characters)
- Letter-by-letter guessing
- Revealing all matching occurrences of a guessed letter
- Tracking incorrect guesses
- Progressive ASCII Hangman drawing
- Automatic win and loss detection
- Console input and output using DOS interrupts
- Two source-code versions for different assembly environments

## Technologies and Concepts

- Intel 8086 Assembly
- 16-bit registers (AX, BX, CX, DX)
- Memory segments and arrays
- Indexed memory addressing
- Conditional jumps and loops
- DOS interrupts (INT 21h)
- BIOS video interrupt (INT 10h) in the original version
- ASCII character handling

## Project Structure

```text
hangman-8086-assembly/
├── src/
│   ├── hangman.asm
│   └── hangman_easycpu.asm
└── README.md
```

## Source Code Versions

### 1. Original Classroom Version – hangman.asm

This is the original classroom-style implementation, written using traditional MASM/TASM-style 8086 Assembly syntax.

It preserves the structure and programming approach used during the assembly course.

This version has not yet been independently verified in its intended execution environment.

### 2. EasyCPU Version – hangman_easycpu.asm

This version was adapted for the EasyCPU – 8086 Assembly Simulator, which was used to develop and test the game on macOS.

The adaptations include:

- EasyCPU-compatible memory declarations
- Indexed memory access using expressions such as `[BX+target]`
- Terminal clearing using ANSI escape sequences
- Adjustments to assembly syntax and memory references

The EasyCPU version was successfully assembled and tested on macOS.

Both versions implement the same core Hangman game logic.

## How to Run

### EasyCPU Version (Tested on macOS)

1. Open the EasyCPU – 8086 Assembly Simulator.
2. Open `src/hangman_easycpu.asm`.
3. Click **Assemble** and run the program.
4. Enter the length of the secret word (1–9).
5. Enter the secret word.
6. Guess letters until the word is revealed or six incorrect guesses have been made.

### Original Classroom Version

1. Open `src/hangman.asm` in a compatible MASM/TASM-style 8086 Assembly development environment.
2. Assemble and run the program.

**Note:** The original version has not yet been independently tested in its intended environment.

## What I Learned

Through this project, I practiced:

- Working with CPU registers and memory segments
- Storing and accessing characters in arrays
- Implementing loops and conditional branching
- Handling keyboard input and console output
- Managing game state and win/loss conditions
- Adapting assembly code to different development environments

## Author

**Yair Man**

Developed as an educational project during my software engineering studies.
