module ShifterSignExtender(
	output reg [31:0] 	out, 
	output reg 			shiftCout,
	input 				cIn,
	input [31:0] IR, Rm);
	
	reg [31:0] temp; //temporary register
	reg leastBit; //least significant bit
	integer i;
	reg debug =0;
	
		reg [63:0] temp2; //temporary register


	task  print;
		input[58*8:0] mode;
		input[31:0] value;
		input[31:0] shift;
		input[31:0] shiftOut;
		begin
			$display("--------------------------- SE ---------------------------");
			$display("%s",mode);
			$display("value \t\t\t\t\t shift \t out");
			$display("%b \t%b \t\t%b",
				value, shift, shiftOut);
			$display("%d \t\t\t\t%d \t\t\t\t\t%d",
				value, shift, shiftOut);
			$display("--------------------------- ALU ---------------------------");
		end
	endtask 

	always @(IR, Rm) begin
		case(IR[27:25])
			3'b000: begin //Data processing immediate shift
				if(IR[4] == 1'b0) begin
					case(IR[6:5])
						2'b00: begin //LSL
							out = (Rm << IR[11:7]);
							if(IR[11:7] == 5'b00000)	shiftCout = cIn;
							else shiftCout = Rm[32-{IR[11:7]}];
							print("Data Processing Imm LSL", Rm, IR[11:7],out);
						end
						2'b01: begin //LSR
							out = (Rm >> IR[11:7]);
							if(IR[11:7] == 5'b00000)	shiftCout = Rm[31];
							else shiftCout = out[{IR[11:7]}-1];
							print("Data Processing Imm LSR", Rm, IR[11:7],out);
						end
						2'b10: begin //ASR
							if(IR[11:7] == 5'b00000) begin
                                if(Rm[31] == 1'b0) begin
									out = 32'b0;
                                    shiftCout = Rm[31];
                                end
                                else begin
                                    out = 32'hFFFFFFFF;
                                    shiftCout = Rm[31];
                                end
							end
                            else begin
                                begin
                                    {out} = $signed(Rm) >>> IR[11:7];
                                    shiftCout = Rm[{IR[11:7]}-1];
                                end
							end
							print("Data Processing Imm ASR", Rm, IR[11:7],out);
						end
						2'b11: begin //ROR
							if(IR[11:7] == 5'b00000) begin
								{out} <= (cIn << 31) | (Rm >> 1);
                                shiftCout <= Rm[0];
                            end
                            else begin
                                {out} <= {Rm, Rm} >> IR[11:7];
                                shiftCout <= Rm[{IR[11:7]}-1];
                            end
							print("Data Processing Imm ROR", Rm, IR[11:7],temp);
						end
					endcase
				end
				else begin//Data processing register shift
					$display("Error: Data processing Shift by Reg not implemented");
				end
			end
			3'b001: begin //Data processing immediate
				temp = IR[7:0];
                {out} = {temp, temp} >> (2 * IR[11:8]);
				if(IR[11:8] == 4'b0000)
                    shiftCout <= cIn;
                else
                    shiftCout <= out[31];
				print("Data Processing Imm Shifter", IR[7:0], 2 * IR[11:8],out);
		    end

			3'b010: begin //Load/Store immediate
				out <= IR[11:0];
				print("Data Load/Store Imm", IR[11:0], 0,IR[11:0]);
			end

			3'b011: begin //Load/Store register
				temp <= IR[7:0];
				for(i=0; i<(IR[11:8])*2; i=i+1)
					begin
						leastBit <= temp[0];
						temp <= temp >> 1;
						temp[31] <= leastBit;
					end
				out <= temp;
				print("Data Load/Store Reg", IR[7:0], IR[11:8]*2,temp);
			end

			3'b101: begin //Branch and Branch & Link
				//IR[23:0]*4 -> offset x 4
				//{8{IR[23]}} -> concatenating 8 copies
				//assign out = { {8{IR[23]}}, IR[23:0]} << 2;
				out <= {IR[23],IR[23],IR[23],IR[23],IR[23],IR[23],IR[23],IR[23],(IR[23:0]*24'd4) };
				//print("Branch and Branch & Link", 0, 0;
			end

			default: begin
				out <= Rm;
				//print("Default", 0, 0;
			end
		endcase
	end
endmodule