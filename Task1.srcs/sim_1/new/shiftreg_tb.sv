`timescale 1ns / 1ps

module shiftreg_tb;

logic D2;
logic [7:0] Q1;
logic R,clk,en;

//Dregister dut(
//.D(D1),
//.R(R),
//.clk(clk),
//.Q(Q1)
//);

shiftreg dut2(
    .D(D2),
    .R(R),
    .en(en),
    .clk(clk),
    .Q(Q1)
);


//nbitcounter dut1(
//    .D(D2),
//    .R(R),
//    .load(load),
//    .sub(sub),
//    .clk(clk),
//    .Q(Q2)
//);
initial begin 
clk = 0;

forever #1 clk = ~clk;
end
initial begin 
R = 0; D2 = 0; en = 0; #3;
R = 1;   D2 = 0; en = 1;  #3;
R = 1;   D2 =1; #3;
R = 1;   D2 = 1;  #3;
R = 1;   D2 = 0;  #3;
R = 1;   D2 = 0;  #3;
R = 1;   D2 = 1;  #3;
R = 1;   D2 = 0;  #3;
$finish;
end

endmodule
