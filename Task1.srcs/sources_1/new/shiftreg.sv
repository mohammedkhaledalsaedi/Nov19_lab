`timescale 1ns / 1ps

module shiftreg(
    input D,
    input clk, R,
    input en,
    output reg [7:0] Q

    );
    
    always_ff@(negedge clk, negedge R)
        begin  
            if (R == 0) Q<=0;
            else if (en == 1) begin
                 Q[0]<=D;
                 Q[1]<=Q[0];
                 Q[2]<=Q[1];
                 Q[3]<=Q[2];
                 Q[4]<=Q[3];
                 Q[5]<=Q[4];
                 Q[6]<=Q[5];
                 Q[7]<=Q[6];
                 
                 end
        end 
endmodule
