`timescale 1ns / 1ps

module shiftreg_sevseg(

  input wire [15:0] SW,
  input wire CLK100MHZ,    // using the same name as pin names
  input wire CPU_RESETN,
  output wire CA, CB, CC, CD, CE, CF, CG, DP,
  output wire [7:0] AN,   
  input wire BTNC
);
wire D1; 
//wire [3:0]D2;
wire [7:0]Q1; 
//wire [3:0]Q2;
wire R,clk,sub,en;
assign D1 = SW[0];
assign sub = SW[4];
assign en = SW[1];
//assign D2 = SW[7:4];
assign R = CPU_RESETN;
assign clk = BTNC;

shiftreg dut(
.D(D1),
.R(R),
.en(en),
.clk(clk),
.Q(Q1)
);

//Dregisterbeha dut2(
//    .D(D2),
//    .R(R),
//    .clk(clk),
//    .Q(Q2)
//);



sev_seg_top ssdt(
    .t(Q1),
    .CLK100MHZ(CLK100MHZ),
    .CPU_RESETN(CPU_RESETN),
    .CA(CA),
    .CB(CB),
    .CC(CC),
    .CD(CD),
    .CE(CE),
    .CF(CF),
    .CG(CG),
    .AN(AN)
);


//initial begin 
//clk = 0;
//forever #1 clk = ~clk;
//end
//initial begin 
//R = 1;  D1 = 4'b0000; D2 = 4'b0000; #10;
//R = 1;  D1 = 4'b0001; D2 =4'b0001; #10;
//R = 1;  D1 = 4'b0010; D2 = 4'b0010; #10;
//R = 0;  D1 = 4'b1010; D2 = 4'b1010; #10;
//$finish;
//end

endmodule
