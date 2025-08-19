# Problem 4: Master-Slave Handshake

This project implements a system with two interacting FSMs: a **Master** and a **Slave**. They communicate using a 4-phase `req/ack` handshake protocol to transfer four 8-bit data bytes.

## Deliverables
- **State Diagrams**: Separate state diagrams for both the Master and Slave FSMs. A timing diagram illustrating the `req/ack/data` handshake is also included.
- **Verilog Code**: `master_fsm.v`, `slave_fsm.v`, `link_top.v`, and `tb_link_top.v`.
- **Waveforms**: Annotated screenshots showing the four handshakes and the final `done` pulse.
- **README**: This document, detailing the project and simulation steps.

## How to Compile, Run, and Visualize

This design can be simulated with Icarus Verilog and GTKWave.

1.  **Create the waveform directory:**
    ```sh
    mkdir waves
    ```

2.  **Compile the Verilog files:**
    ```sh
    iverilog -o sim.out master_fsm.v slave_fsm.v link_top.v tb_link_top.v
    ```
    This command compiles all the necessary modules for the system and the testbench.

3.  **Run the simulation:**
    ```sh
    vvp sim.out
    ```
    This command executes the simulation, which will generate a `dump.vcd` file in the `waves/` directory.

4.  **Visualize the waveforms:**
    ```sh
    gtkwave waves/dump.vcd
    ```
    Open the `dump.vcd` file in GTKWave to view the simulation results. You should highlight the `req`, `ack`, `data`, and `done` signals to verify the handshake protocol.

## Expected Behavior
The simulation should demonstrate four complete 4-phase handshakes between the Master and Slave FSMs.
- The **Master** initiates each transfer by raising `req` and driving the `data` bus.
- The **Slave** responds by asserting `ack` after latching the data.
- The **Master** drops `req` upon seeing `ack`.
- The **Slave** drops `ack` after the Master drops `req`.

This handshake sequence repeats four times. After the fourth successful handshake, the **Master** FSM should assert the `done` pulse for one clock cycle. The included waveforms in the `waves/` folder verify this behavior.