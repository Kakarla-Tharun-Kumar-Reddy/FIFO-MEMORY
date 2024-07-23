`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 19:47:46
// Design Name: 
// Module Name: FIFO
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


module FIFO(
input clock,
input reset,
input wren,
input rden,
input [7:0] data_in,
output reg [7:0] data_out,
output full,empty

    );
    
reg [3:0] wraddr,rdaddr;
reg [7:0] mem [15:0];
always@(posedge clock)
    begin
        if(reset)
        begin
            wraddr<=4'd0;
            rdaddr<=4'd0;
            data_out<=8'd0;
       end
    end
always@(posedge clock)
begin
    if(wren & !full)
    begin
        mem[wraddr] <= data_in;
        wraddr<=wraddr+1;
    end

end

always@(posedge clock)
begin
    if(rden & !empty)
    begin
        data_out<=mem[rdaddr];
        rdaddr<=rdaddr+1;
    end

end
assign full = ((wraddr+1'b1)==rdaddr);
assign empty = (wraddr == rdaddr);
            
endmodule
