module ControlUnit (output FR_ld, RF_ld, IR_ld, MAR_ld, MDR_ld, R_W, MOV, MA1, MA0, MB1, MB0, MC, MD, ME,
    output [4:0] OP,
    input [31:0] IR
    input MOC, COND, clk, clr,
    input ZF, N, C, V, //Flags
    );


endmodule


module NextStateDecoder (output reg[4:0] NS, input[31:0] IR, input Cond, MOC, input[5:0] S);


endmodule


module StateReg (output reg[4:0] Q, input [4:0] D, input clk, clr);
    always @(posedge clk, clr)
        if(clr == 1'b0)
            Q <= 5'b00000;
        else
            Q <= D;
endmodule


module ControlSignalsEncoder (
    output reg FR_ld,
    output reg RF_ld,
    output reg IR_ld,
    output reg MAR_ld,
    output reg MDR_ld,
    output reg R_W,
    output reg MOV,
    output reg MA1, MA0, MB1, MB0, MC, MD, ME,
    output reg [4:0] OP,
    input [4:0] S
    );
    always @ (S) begin
        case (S)
	
            //State 0
            5'b00000:
            begin
                FR_ld <= 0;
                RF_ld <= 1;
                IR_ld <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA1 <= 0;
                MA0 <= 0;
                MB1 <= 1;
                MB0 <= 1;
                MC <= 1;
                MD <= 1;
                ME <= 0;
                OP <= 5'b01101;
            end

            //State 1
            5'b00001:
            begin
                FR_ld <= 0;
                RF_ld <= 0;
                IR_ld <= 0;
                MAR_ld <= 1;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA1 <= 1;
                MA0 <= 0;
                MB1 <= 0;
                MB0 <= 0;
                MC <= 0;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10000;
            end

            //State 2
            5'b00010:
            begin
                FR_ld <= 0;
                RF_ld <= 1;
                IR_ld <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA1 <= 1;
                MA0 <= 0;
                MB1 <= 0;
                MB0 <= 0;
                MC <= 1;
                MD <= 1;
                ME <= 0;
                OP <= 5'b10001;
            end

            //State 3
            5'b00011:
            begin
                FR_ld <= 0;
                RF_ld <= 0;
                IR_ld <= 1;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 1;
                MOV <= 1;
                MA1 <= 0;
                MA0 <= 0;
                MB1 <= 0;
                MB0 <= 0;
                MC <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

            //State 4
            5'b00100:
            begin
                FR_ld <= 0;
                RF_ld <= 0;
                IR_ld <= 0;
                MAR_ld <= 0;
                MDR_ld <= 0;
                R_W <= 0;
                MOV <= 0;
                MA1 <= 0;
                MA0 <= 0;
                MB1 <= 0;
                MB0 <= 0;
                MC <= 0;
                MD <= 0;
                ME <= 0;
                OP <= 5'b00000;
            end

	    //State 5
            5'b00101:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 6
            5'b00110:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 7
            5'b00111:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 8
            5'b01000:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 9
            5'b01001:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 10
            5'b01010:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 11
            5'b01011:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 12
            5'b01100:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 13
            5'b01101:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 14
            5'b01110:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 15
            5'b001111:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 16
            5'b10000:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 17
            5'b10001:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 18
            5'b10010:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 19
            5'b10011:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 20
            5'b10100:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 21
            5'b10101:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 22
            5'b10110:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 23
            5'b10111:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 24
            5'b11000:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 25
            5'b11001:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 26
            5'b11010:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 27
            5'b11011:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 28
            5'b11100:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 29
            5'b11101:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 30
            5'b11110:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            //State 31
            5'b11111:
            begin
                FR_ld <= ;
                RF_ld <= ;
                IR_ld <= ;
                MAR_ld <= ;
                MDR_ld <= ;
                R_W <= ;
                MOV <= ;
                MA1 <= ;
                MA0 <= ;
                MB1 <= ;
                MB0 <= ;
                MC <= ;
                MD <= ;
                ME <= ;
                OP <= 5'b;
            end

            default:
                $display("Error: Control Signals Encoder. State not recognized S = %b", S);
            endcase
endmodule