# Problem 2: Two-Road Traffic Light (Moore)

This project implements a **Moore** Finite State Machine (FSM) to control a two-road traffic light system. The FSM is synchronous with an active-high reset and uses a `tick` signal to manage timing.

## Deliverables
- [cite_start]**State Diagram**: A state diagram showing the four phases of the traffic light cycle and tick-based transitions[cite: 115].
- [cite_start]**Verilog Code**: `traffic_light.v` (RTL) and `tb_traffic_light.v` (testbench)[cite: 124, 137].
- [cite_start]**Waveforms**: Screenshots showing the durations of each light phase (5/2/5/2 ticks)[cite: 116].
- [cite_start]**README**: This document, outlining the project and simulation steps[cite: 24].

## How to Compile, Run, and Visualize

This design can be simulated with Icarus Verilog and GTKWave.

1.  **Create the waveform directory:**
    ```sh
    mkdir waves
    ```

2.  **Compile the Verilog files:**
    ```sh
    iverilog -o sim.out traffic_light.v tb_traffic_light.v
    ```
    [cite_start]This command compiles the traffic light FSM and its testbench, which includes the fast `tick` generator[cite: 117].

3.  **Run the simulation:**
    ```sh
    vvp sim.out
    ```
    This command executes the simulation and generates a `dump.vcd` file in the `waves/` directory.

4.  **Visualize the waveforms:**
    ```sh
    gtkwave waves/dump.vcd
    ```
    Open the `dump.vcd` file in GTKWave to view the simulation results.

## Verification and Expected Behavior

[cite_start]The `tick` pulse is a single-cycle pulse that marks a specific time interval, simplifying the FSM's control logic[cite: 291]. [cite_start]For simulation, the `tb_traffic_light.v` file generates a fast `tick` pulse every 20 clock cycles, as documented in the assignment[cite: 353].

Based on a `TICK_HZ` of 5 and a `CLK_FREQ_HZ` of 100, each tick corresponds to 20 clock cycles. Therefore, the expected durations are:
-   **NS Green**: 5 ticks (100 clock cycles)
-   **NS Yellow**: 2 ticks (40 clock cycles)
-   **EW Green**: 5 ticks (100 clock cycles)
-   **EW Yellow**: 2 ticks (40 clock cycles)

The included waveforms in the `waves/` folder verify these durations and that the FSM transitions correctly through all four phases.