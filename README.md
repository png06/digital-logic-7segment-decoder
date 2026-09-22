# Structural Verilog 3-to-7 Segment Decoder

A digital logic design project implementing an optimized 3-to-7 segment display decoder. This repository contains the structural SystemVerilog source code, simulation testbenches, Karnaugh map (K-map) optimization documentation, and physical breadboard hardware validation.

## Technical Specifications
* **HDL Language:** SystemVerilog (`.sv`)
* **Design Style:** Structural / Gate-Level Modeling
* **Optimization Method:** 3-variable Karnaugh Maps (Sum-of-Products)
* **Hardware:** 7400-Series TTL Logic ICs (7404 NOT, 7408 AND, 7432 OR), DIP switches, Common-Anode 7-Segment Display

---

## Logic Optimization & Metrics
The standard canonical Sum-of-Products (SOP) expressions for outputs $a$ through $g$ were minimized using K-maps to reduce physical gate count and propagation delay prior to hardware construction.

* **Original Literal Inputs:** 140
* **Optimized Literal Inputs:** 54
* **Total Gate Reduction:** **42%** (Reduced total IC requirement on physical breadboard)

---

## Repository Structure
```text
├── src/
│   └── design.sv                 # Structural Verilog gate-level code
├── testbench/
│   └── testbench.sv              # Testbench for output validation
├── docs/
│   └── kmap_derivations.pdf      # Complete K-map minimization proofs
└── images/
    └── breadboard_testing.jpg    # Hardware verification photo
```
---

## Hardware Validation & Visuals

The optimized structural Verilog design was physically implemented on a breadboard using 7400-series TTL logic ICs and validated across all decimal inputs (0 through 7).

<p align="center">
  <img src="images/breadboard_testing.jpg" width="600" alt="Breadboard Hardware Validation">
  <br>
  <em>Figure 1: Physical TTL hardware implementation driven by DIP switch inputs and tested on a common-anode 7-segment display.</em>
</p>

---

## Boolean Logic & K-Map Derivations

All outputs were minimized using 3-variable Karnaugh Maps ($A, B, C$) in Sum-of-Products (SOP) form before hardware assembly.

<p align="center">
  <img src="images/KmapA.png" width="600" alt="K-Map Derivations Preview">
  <br>
    
<p align="center">
  <img src="images/KmapB.png" width="600" alt="K-Map Derivations Preview">
  <br>
        
  <em>Figure 2: Handwritten Karnaugh Map derivations showing minimal prime implicants. Full derivation sheet available in <code>docs/kmap_derivations.pdf</code>.</em>
</p>

### Optimized Logic Expressions
* **Segment a:** $a = A + A'C'$
* **Segment b:** $b = A' + B'C' + A B C$
* **Segment c:** $c = A'B' + AC + A'C'$
* **Segment d:** $d = B C' + A'C + A B' C$
* **Segment e:** $e = C'B + A'B'C'$
* **Segment f:** $f = A(B'+C') + A'B'C'$
* **Segment g:** $g = A'B + A C'$

---

## How to Run Simulation

1. Load `src/design.sv` and `testbench/testbench.sv` into your preferred SystemVerilog simulator (e.g., ModelSim, Vivado, EDA Playground).
2. Run the simulation testbench to print the truth table verification output to the console:

```text
 A B C | a b c d e f g
-----------------------
 0 0 0 | 1 1 1 1 1 1 0
 0 0 1 | 0 1 1 0 0 0 0
 0 1 0 | 1 1 0 1 1 0 1
 ...
