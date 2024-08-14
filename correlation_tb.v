`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.08.2024 11:30:50
// Design Name: 
// Module Name: tb
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


module tb(

    );
endmodule
`timescale 1ns / 1ps

module corre_tb;

  // Inputs
  reg clk;
  reg [7:0] X;

  // Outputs
  wire [15:0] Y;

  // Instantiate the Unit Under Test (UUT)
  corre uut (
    .clk(clk),
    .X(X),
    .Y(Y)
  );

  // Clock generation
  always #5 clk = ~clk; // 10ns period (100MHz clock)

  initial begin
    // Initialize Inputs
    clk = 0;
    X = 0;

    // Apply test vectors
    #20; // Wait for 2 clock cycle
    X = 8'd1; // First value
    #10; // Wait for next clock cycle
    X = 8'd2; // Second value
    #10; // Wait for next clock cycle
    X = 8'd3; // Third value
    #10; // Wait for next clock cycle
    X = 8'd4; // Third value
    // Wait for a few clock cycles to observe the results
    #50;
    
    // End the simulation
    $stop;
  end

  // Monitor the output
  initial begin
    $monitor("At time %t, X = %d, Y = %d", $time, X, Y);
  end

endmodule
