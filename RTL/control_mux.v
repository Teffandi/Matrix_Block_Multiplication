//control logic for handling input streaming

module control_mux(

input [15:0] input_1_0, 
input [15:0] input_2_0,
input [15:0] input_3_0,
input [15:0] input_4_0,

input [15:0] input_1_1, 
input [15:0] input_2_1,
input [15:0] input_3_1,
input [15:0] input_4_1,

input [15:0] input_1_2, 
input [15:0] input_2_2,
input [15:0] input_3_2,
input [15:0] input_4_2,

input [15:0] input_1_3, 
input [15:0] input_2_3,
input [15:0] input_3_3,
input [15:0] input_4_3,

input clock;
input reset;

output [15:0] out_0,
output [15:0] out_1, 
output [15:0] out_2, 
output [15:0] out_3

):

reg [7:0] counter; //for controlling reset


//control section
always(posedge clock) begin

if (!reset) begin
    counter <= (counter >> 1)|(counter<<7); //circular shift magic
end else begin
    counter <= 8'b00000111;
end

end

mux_4_1 mux_0 (
    
    .input_1(input_1_0), 
    .input_2(input_2_0),
    .input_3(input_3_0),
    .input_4(input_4_0),
    .reset(counter[3]),
    .clock(clock),
    .out(out_0)
);

mux_4_1 mux_1 (
    
    .input_1(input_1_0), 
    .input_2(input_2_0),
    .input_3(input_3_0),
    .input_4(input_4_0),
    .reset(counter[2]),
    .clock(clock),
    .out(out_1)
);

mux_4_1 mux_2 (
    
    .input_1(input_1_0), 
    .input_2(input_2_0),
    .input_3(input_3_0),
    .input_4(input_4_0),
    .reset(counter[1]),
    .clock(clock),
    .out(out_2)
);

mux_4_1 mux_3 (
    
    .input_1(input_1_0), 
    .input_2(input_2_0),
    .input_3(input_3_0),
    .input_4(input_4_0),
    .reset(counter[0]),
    .clock(clock),
    .out(out_3)
);


endmodule