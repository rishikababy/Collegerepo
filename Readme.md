# 1-Bit Comparator

## Overview
This project implements a simple 1-bit digital comparator in Verilog. It compares two 1-bit inputs (`A` and `B`) and produces three outputs:
- `o1`: High when A > B
- `o2`: High when A == B
- `o3`: High when A < B

The outputs are mutually exclusive – only one is high at a time.

## Files
- `comp1.v`: Verilog module for the comparator.
- `tb1.v`: Testbench to simulate the comparator.

## How to Simulate (Using Icarus Verilog)
```bash
iverilog -o comp1_test comp1.v tb1.v
vvp comp1_test
