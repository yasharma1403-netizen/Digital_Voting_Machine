# Digital_Voting_Machine
Overview

This project presents the design and simulation of a digital voting machine implemented using Verilog HDL. The system is capable of registering and logging votes through button-based inputs and provides visual feedback using LEDs. The design focuses on correctness, simplicity, and verifiable functionality through simulation.

Design Description

The voting machine accepts button inputs corresponding to different candidates. When a valid button press is detected, the control logic processes the input and updates the appropriate vote counter. The votes are stored in internal registers, ensuring accurate counting throughout the voting process. LED outputs are used to indicate successful vote registration and to display voting results during simulation.

Verification

A dedicated Verilog testbench was developed to validate the functionality of the voting machine. The testbench applies various voting scenarios, including multiple button presses and sequential votes, to ensure reliable operation. Simulation waveforms were analyzed to confirm correct vote counting, proper control logic behavior, and accurate LED output responses.

Tools and Technologies

The project is implemented in Verilog HDL and verified using industry-standard simulators such as ModelSim, Questa, or equivalent tools. Simulation-based verification was used to validate the overall design behavior.
