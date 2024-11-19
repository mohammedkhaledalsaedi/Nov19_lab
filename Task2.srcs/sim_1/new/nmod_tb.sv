`timescale 1ns / 1ps

module nmod_tb;

localparam N = 100000000;
localparam n =$clog2(N);

logic clk;
logic Q2;
logic [31:0] count2;
//logic [n-1:0] D2;
//logic [n-1:0] Q1;
logic R;
//logic load,sub;

//Dregister dut(
//.D(D1),
//.R(R),
//.clk(clk),
//.Q(Q1)
//);

nmodclock #(.n(n), .N(N))nmod(
    .R(R),
    .clk(clk),
    .Q(Q2),
    .count2(count2)
);


initial begin 
clk = 0;

forever #5 clk = ~clk;
end
initial begin 
R = 0; #20;
R=1; #1000000000;
R=1; #1000000000;
R=1; #1000000000;
//R = 0; load = 0; D2 = 0;sub = 0; #5;
//R = 1;   D2 = 0; load = 1; sub = 0; #5;
//R = 1;   D2 =0; load = 1;sub = 0; #5;
//R = 1;   D2 =0; load = 0;sub = 0; #50;

$finish;
end

endmodule