<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

How it works: This project implements a 1-bit full subtractor using combinational logic, where ui[0], ui[1], and ui[2] are the inputs A, B, and Borrow In respectively, and the outputs Difference and Borrow Out are produced on uo[0] and uo[1] using the equations Difference = A XOR B XOR Borrow In and Borrow Out = (~A & B) | (~A & Borrow In) | (B & Borrow In).

How to test: Apply all possible combinations of A, B, and Borrow In to ui[0], ui[1], and ui[2], then observe the outputs on uo[0] for Difference and uo[1] for Borrow Out, verifying that the outputs match the expected full subtractor truth table.

External hardware: No external hardware is required; inputs can be provided through the Tiny Tapeout input pins and outputs can be observed directly from the output pins.
