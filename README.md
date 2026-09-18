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
