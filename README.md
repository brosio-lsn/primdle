# Primdle: Prime Number Guessing Game on FPGA

## Overview
Primdle is a unique FPGA-based game inspired by Wordle, where players guess prime numbers instead of words. Developed in VHDL, it offers an engaging way to interact with prime numbers on the Gecko4Education board.

## Game Mechanics
- Players guess a prime number (golden key) using the Gecko4Education board.
- The game provides hints for each guess using colored LED tiles: green for correct digits in the correct position, yellow for correct digits but in the wrong position, and black for incorrect digits.
- The game ends when the golden key is guessed correctly, after 30 attempts, or after 5 valid guesses.

## Technical Aspects
- VHDL implementation for FPGA.
- Utilizes LED displays and matrices for input/output.
- Random prime number generation as the golden key.
- Modular design with separate tasks tested in an auto-grader.

## Gameplay Image
![Primdle Gameplay](https://github.com/brosio-lsn/primdle/blob/main/view.png)

## Acknowledgments
- Inspired by the popular word-guessing game Wordle.
- Designed for the system-oriented programming course at EPFL.

