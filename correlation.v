`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.08.2024 11:22:25
// Design Name: 
// Module Name: corre
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

module correlation(
input clk,
input [7:0] X,
output [15:0]Y
);

wire [15:0] psum_0;
wire [15:0] psum_1;
 
pe1 PE0(.clk(clk),.x(X),.psum(psum_0));
pe2 PE1(.clk(clk),.x(X),.psum_temp(psum_0),.psum(psum_1));
pe3 PE2(.clk(clk),.x(X),.psum_temp(psum_1),.psum(Y));

endmodule

module pe1(
input [7:0] x,
input clk,
output reg[15:0] psum
);


reg [7:0] w1 = 2;
always@(posedge clk)
begin
psum <= x * w1;
end
endmodule

module pe2(
input clk,
input [7:0] x,
input [15:0] psum_temp,
output reg [15:0] psum
);

reg [7:0] w2 = 3;
always@(posedge clk)
begin
psum <= psum_temp + x * w2 ;
end
endmodule


module pe3(
input clk,
input [7:0] x,
input [15:0] psum_temp,
output reg [15:0] psum
);

reg [7:0] w3 = 4;
always@(posedge clk)
begin
psum <= x * w3 + psum_temp;
end
endmodule

