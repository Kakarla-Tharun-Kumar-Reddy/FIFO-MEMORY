

# FIFO Memory Implementation in Verilog

## Overview

This project implements a First-In-First-Out (FIFO) memory buffer in Verilog. FIFO buffers are essential in digital systems for data flow management, particularly when dealing with asynchronous systems or systems where the data producer and consumer operate at different speeds.

Specifications

- Data Width: 8 bits
- FIFO Depth: 16 entries
- Control Signals:
  - Write Enable (`wren`): Enables writing data to the FIFO.
  - Read Enable (`rden`): Enables reading data from the FIFO.
  - Reset (`reset`): Resets the FIFO to its initial state.
  - Clock (`clock`): Drives the operations of the FIFO.
- Status Signals:
  - Full (`full`): Indicates when the FIFO is full and cannot accept more data.
  - Empty (`empty`): Indicates when the FIFO is empty and no data is available for reading.

## Module Description

### FIFO Module

The main module, `FIFO`, handles data storage and retrieval, ensuring that data is read in the same order it was written.

#### Inputs:
- `clock`: System clock signal.
- `reset`: Resets the FIFO to its initial state.
- `wren`: Write enable signal, active high.
- `rden`: Read enable signal, active high.
- `data_in`: 8-bit data input to be written to the FIFO.

#### Outputs:
- `data_out`: 8-bit data output from the FIFO.
- `full`: Indicates whether the FIFO is full.
- `empty`: Indicates whether the FIFO is empty.

#### Internal Registers:
- `wraddr`: Write pointer, points to the location where the next data will be written.
- `rdaddr`: Read pointer, points to the location where the next data will be read.
- `mem`: Memory array with 16 locations, each capable of storing 8-bit data.

### FIFO Operation

1. Write Operation:
   - When `wren` is high and `full` is low, data from `data_in` is written into the FIFO at the location pointed to by `wraddr`.
   - The `wraddr` is incremented after each write operation.

2. Read Operation:
   - When `rden` is high and `empty` is low, data is read from the FIFO from the location pointed to by `rdaddr` and output to `data_out`.
   - The `rdaddr` is incremented after each read operation.

3. Full and Empty Conditions:
   - The FIFO is considered full when the next write operation would cause `wraddr` to equal `rdaddr`.
   - The FIFO is considered empty when `wraddr` equals `rdaddr`.

### Testbench

A testbench, `FIFO_tb`, is provided to simulate and verify the FIFO operation.

- Clock Generation: A clock signal is generated with a period of 20 time units.
- Reset: The FIFO is reset at the beginning of the simulation.
- Write and Read Operations: The testbench performs a series of write and read operations, ensuring that the FIFO functions correctly under different conditions.

### Key Features of the Testbench:
- Initialization: Sets all signals to their initial states.
- Reset Task: Resets the FIFO.
- Write Task: Writes random data to the FIFO.
- Read Task: Reads data from the FIFO.

## How to Run the Simulation

1. Open the project in your preferred Verilog simulation tool (e.g., Xilinx Vivado, ModelSim).
2. Compile the `FIFO` and `FIFO_tb` modules.
3. Run the simulation to observe the FIFO operations and verify its functionality.

## Conclusion

This project demonstrates the design and verification of a simple FIFO buffer in Verilog. The FIFO is essential for various applications in digital systems, particularly in managing data flow between different clock domains or components operating at different speeds.

## License

This project is open-source and available under the MIT License.

