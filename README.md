# PIC18F4550 Assembly Delay Routines

Assembly project for the PIC18F4550 microcontroller implementing software-based delay routines for different oscillator frequencies. The project includes delay functions calculated for 8 MHz, 4 MHz, and 1 MHz operation and demonstrates how instruction cycles can be used to generate approximate timing intervals.

This project was developed as an embedded systems practice to understand low-level timing, instruction cycle counting, and loop-based delay generation in PIC Assembly.

## Features

* Implements multiple delay routines using Assembly loops.
* Includes timing calculations for 8 MHz, 4 MHz, and 1 MHz oscillator frequencies.
* Uses nested counters to generate short and long delays.
* Demonstrates instruction cycle counting with `DECFSZ`, `BRA`, `NOP`, and `RETURN`.
* Includes a compiled Intel HEX output file.

## Technologies Used

* PIC18F4550 microcontroller
* Assembly language
* MPLAB / MPASM
* Intel HEX output
* Low-level timing control
* Register-based counter variables

## Project Structure

```text
src/
├── main.asm      # Main Assembly source file with delay routines
└── config.h      # PIC18F4550 configuration bits

build/
└── delays.hex    # Compiled HEX file
```

## Implemented Delay Routines

| Routine       | Target Frequency | Approximate Delay |
| ------------- | ---------------: | ----------------: |
| `delay_100us` |            8 MHz |            100 µs |
| `delay_250us` |            8 MHz |            250 µs |
| `delay_3ms`   |            8 MHz |              3 ms |
| `delay_300us` |            4 MHz |            300 µs |
| `delay_500us` |            1 MHz |            500 µs |
| `delay_100ms` |            1 MHz |            100 ms |
| `delay_0.75s` |            1 MHz |            0.75 s |

## How It Works

PIC microcontrollers execute instructions based on the oscillator frequency divided by four. For example, with an 8 MHz oscillator, the instruction cycle frequency is approximately 2 MHz.

The delay routines use loop counters and branch instructions to consume a calculated number of instruction cycles. Short delays are implemented with a single loop, while longer delays use nested loops and additional `NOP` instructions to fine-tune the final timing.

## Example

```asm
START
    CALL delay_100us
    CALL delay_300us
    GOTO $
```

The example program calls selected delay routines and then remains in an infinite loop.

## Learning Outcomes

Through this project, I practiced:

* Writing Assembly code for PIC microcontrollers.
* Calculating instruction cycles based on oscillator frequency.
* Creating software-based delay functions.
* Using nested loops for longer timing intervals.
* Understanding how low-level timing depends on clock frequency.
* Organizing microcontroller code with configuration headers.

## Notes

This project was originally developed as an academic embedded systems practice and later organized as part of a technical portfolio. The delays are software-based approximations and may vary slightly depending on oscillator configuration and instruction timing.
