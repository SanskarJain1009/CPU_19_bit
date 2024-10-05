//alu.v - ALU Module

module alu(
	input [18:0] a, b,				//Operands
	input [2:0] alu_ctrl,			//ALU Control
	output reg [18:0] alu_out,		//ALU output
	input L,
	output zero							//Zero flag
	);
	
always@(a, b, alu_ctrl) begin
	case(alu_ctrl)
	3'b000 : alu_out <= a+b ;
	3'b001 : alu_out <= a + ~b +1;
	3'b010 : alu_out <= a * b;
	3'b011 : alu_out <= a / b;
	3'b100 : alu_out <= a & b;
	3'b101 : alu_out <= a | b;
	3'b110 : alu_out <= a ^ b;	
	default: alu_out =0;
	endcase
	if(L==1) 
	begin
			case(alu_ctrl)  
			3'b000 : alu_out <= a + 1 ;
			3'b001 : alu_out <= a - 1 ;
			3'b010 : alu_out <=~a;
			endcase
	end
end

assign zero = (alu_out==0) ? 1'b1 : 1'b0;
endmodule
