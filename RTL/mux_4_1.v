
module mux_4_1 (
    
   input [15:0] input_1, 
   input [15:0] input_2,
   input [15:0] input_3,
   input [15:0] input_4,
   input reset,
   input [1:0] select,
   output reg [15:0] out
);

 always @(*) begin

if (!reset) begin 
case (select)
    2'b00 : out = input_1;
    2'b01 : out = input_2;
    2'b10 : out = input_3;
    2'b11 : out = input_4;

endcase
end else begin
    out = 16'd0;
end

end

endmodule