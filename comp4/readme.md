# 4-Bit Comparator

## 🧩 Overview
This module implements a 4-bit digital comparator using Verilog. It compares two 4-bit binary inputs (`A[3:0]` and `B[3:0]`) and produces three mutually exclusive outputs:

- `o1`: High (`1`) if A > B  
- `o2`: High (`1`) if A == B  
- `o3`: High (`1`) if A < B  

Only one output is active at a time, representing the comparison result.

---

## 🛠 Design Approaches

This 4-bit comparator can be implemented in two styles:

1. **Behavioral Modeling**  
   Uses `if-else` or `case` statements to describe the logic at a high level.

2. **Structural Modeling**  
   Built using cascading instances of 1-bit comparators (reusable and scalable).

---

## 📂 Files Included

- `comparator_4bit.v` – Verilog code for the 4-bit comparator  
- `tb_comparator_4bit.v` – Testbench to simulate and verify the design  

---

## ▶️ How to Simulate (with Icarus Verilog)

Use the following commands to compile and run the simulation:

```bash
iverilog -o comp4_test comparator_4bit.v tb_comparator_4bit.v
vvp comp4_test
