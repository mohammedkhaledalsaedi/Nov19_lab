`timescale 1ns / 1ps

module nmod_sevseg(

  input wire [15:0] SW,
  input wire CLK100MHZ,    // using the same name as pin names
  input wire CPU_RESETN,
  output wire CA, CB, CC, CD, CE, CF, CG, DP,
  output wire [7:0] AN,   
  input wire BTNC
);
localparam N = 50000000;
localparam n=$clog2(N);

//wire [3:0]D1; 
//wire [3:0] sum;
//wire [3:0] x;
////wire [3:0]D2;
//wire [3:0]Q1; 
//wire [3:0]Q2;
wire [31:0] count2;
wire R,clk,sub,load;
//assign D1 = SW[3:0];
//assign x = SW[7:4];
//assign sub = SW[8];
//assign load = SW[9];
//assign D2 = SW[7:4];
assign R = CPU_RESETN;
assign clk = CLK100MHZ;


nmodclock #(.n(n), .N(N)) dut(
.R(R),
.clk(clk),
.count2(count2)
);

//Dregisterbeha dut2(
//    .D(D2),
//    .R(R),
//    .clk(clk),
//    .Q(Q2)
//);



sev_seg_top ssdt(
    .t(count2),
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
