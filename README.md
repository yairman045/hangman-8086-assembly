# Hangman – 8086 Assembly

A classic Hangman game implemented in Intel 8086 Assembly language as part of a software engineering course.

**Developed by:** Yair Man  
**Language:** Assembly (Intel 8086)  
**Project type:** Educational console game

## Overview

This project implements a two-player Hangman game. One player enters a secret word, and the second player tries to guess it one letter at a time.

The game reveals correctly guessed letters, tracks incorrect guesses, and progressively displays a Hangman drawing.

## Features

- Secret word input (1–9 characters)
- Letter-by-letter guessing
- Revealing all matching letters in the word
- Tracking incorrect guesses
- Progressive ASCII Hangman drawing
- Win and loss detection
- Console input and output using DOS interrupts

## Technologies and Concepts

- Intel 8086 Assembly
- 16-bit registers (AX, BX, CX, DX)
- Memory segments and arrays
- Conditional jumps and loops
- DOS interrupt INT 21h
- BIOS video interrupt INT 10h
- ASCII character handling

## Project Structure

```text
hangman-8086-assembly/
├── src/
│   └── hangman.asm
└── README.md
```

## How to Run

The source code is intended for an 8086-compatible assembler and DOS execution environment.

1. Open src/hangman.asm in a compatible 8086 Assembly development environment.
2. Assemble and run the program.
3. Enter the length of the secret word and then the word itself.
4. Guess letters until the word is revealed or six incorrect guesses have been made.

Note: The published source has not yet been independently tested in an emulator.

## Author

**Yair Man**

Developed as an educational project while studying software engineering.
