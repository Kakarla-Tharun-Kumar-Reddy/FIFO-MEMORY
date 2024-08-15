`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 20:23:01
// Design Name: 
// Module Name: FIFO_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO_tb();
reg clk,rst,wren,rden;
reg [7:0] data_in;
wire [7:0] data_out;
wire full,empty;

FIFO DUT(
.clock(clk),
.reset(rst),
.wren(wren),
.rden(rden),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty)

    );
task initialize();
    begin
        clk = 1'b0;
        rst = 1'b0;
        wren = 1'b0;
        rden = 1'b0;
    end
endtask

always #10 clk = ~ clk;
task rst_dut();
begin
    @(negedge clk);
    rst=1'b1;
    @(negedge clk);
    rst=1'b0;

end
endtask
task write(input[7:0] data);
begin
    @(negedge clk);
    wren=1'b1;
    data_in=data;
end
endtask
task read();
begin
    @(negedge clk)
        rden=1'b1;
end
endtask
 initial
 begin
    initialize;
        #50
        rst_dut;
        repeat(17)
        write({$random}%8);
        wren = 1'b0;
        repeat(17)
        read();
        rden=1'b0;
        repeat(17)
        write({$random}%8);
 end
endmodule
