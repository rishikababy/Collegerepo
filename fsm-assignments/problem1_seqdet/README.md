# Problem 1: Overlapping Sequence Detector (Mealy)

This project implements a Mealy Finite State Machine (FSM) to detect the overlapping bit sequence **1101**. The FSM is synchronous and uses an active-high reset.

## Deliverables
- **State Diagram**: A state diagram showing states S0, S1, S2, and S3, with transitions labeled based on the `din` input.
- **Verilog Code**: `seq_detect_mealy.v` (RTL) and `tb_seq_detect_mealy.v` (testbench).
- **Waveforms**: Screenshots of key events from the simulation.
- **README**: This document.

## How to Compile, Run, and Visualize

This design can be simulated with Icarus Verilog and GTKWave.

1.  **Create the waveform directory:**
    ```bash
    mkdir waves
    ```

2.  **Compile the Verilog files:**
    ```bash
    iverilog -o sim.out tb_seq_detect_mealy.v
    ```

3.  **Run the simulation:**
    ```bash
    vvp sim.out
    ```
    This will generate the `dump.vcd` file in the `waves/` directory.

4.  **Visualize the waveforms:**
    ```bash
    gtkwave waves/dump.vcd
    ```

## Tested Streams and Expected Pulses

-   **Input Stream**: `11011011101`
-   **Expected `y` Pulses**:
    -   The first pulse is expected at time `45` ns (after 4 clock cycles), corresponding to the end of the `1101` sequence.
    -   The second pulse is expected at time `75` ns (after 7 clock cycles), due to the overlapping `1101` sequence.
    -   The third pulse is expected at time `115` ns (after 11 clock cycles), for the final `1101` sequence.

The included waveforms in the `waves/` folder verify this behavior.