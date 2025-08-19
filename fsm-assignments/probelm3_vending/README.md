# Problem 3: Vending Machine with Change (Mealy)

This project implements a **Mealy** Finite State Machine (FSM) for a vending machine. The price is 20, and the machine accepts 5 and 10 coins. The outputs, `dispense` and `chg5`, are single-cycle pulses.

## Justification for Mealy FSM
A Mealy FSM is used because the outputs (`dispense` and `chg5`) are dependent on both the current state (the total amount accumulated) and the current input (the coin inserted). This allows the outputs to be generated on the very same clock cycle that the total reaches or exceeds 20, which is the required behavior.

## Deliverables
- **State Diagram**: A state diagram showing the states based on the accumulated total (S0, S5, S10, S15, S20) and the transitions for each coin input.
- **Verilog Code**: `vending_mealy.v` (RTL) and `tb_vending_mealy.v` (testbench).
- **Waveforms**: Annotated screenshots highlighting the `dispense` and `chg5` pulses.
- **README**: This document, outlining the project and simulation steps.

## How to Compile, Run, and Visualize

This design can be simulated with Icarus Verilog and GTKWave.

1.  **Create the waveform directory:**
    ```sh
    mkdir waves
    ```

2.  **Compile the Verilog files:**
    ```sh
    iverilog -o sim.out vending_mealy.v tb_vending_mealy.v
    ```

3.  **Run the simulation:**
    ```sh
    vvp sim.out
    ```
    This command executes the testbench and generates a `dump.vcd` file in the `waves/` directory.

4.  **Visualize the waveforms:**
    ```sh
    gtkwave waves/dump.vcd
    ```
    Open the `dump.vcd` file in GTKWave to view the simulation results.

## Expected Behavior
The testbench simulates three scenarios to verify the vending machine's logic:
1.  **5 + 5 + 10 = 20:** A single `dispense` pulse is expected when the final 10 coin is inserted.
2.  **5 + 10 + 10 = 25:** A `dispense` pulse and a `chg5` pulse are expected simultaneously when the final 10 coin is inserted. The FSM should reset to the initial state (S0).
3.  **10 + 10 = 20:** A single `dispense` pulse is expected when the final 10 coin is inserted.

The included waveforms in the `waves/` folder verify these behaviors.