`include "control_mux.v"
`include "mux_4_1.v"
`include "systolic_array.v"


module temp_top_level(

input [63:0] input_row_0,
input [63:0] input_row_1,
input [63:0] input_row_2,
input [63:0] input_row_3,
input [63:0] input_col_0,
input [63:0] input_col_1,
input [63:0] input_col_2,
input [63:0] input_col_3,
input clock,
input reset,
output done
);


wire [15:0] temp_inp_west0;
wire [15:0] temp_inp_west4;
wire [15:0] temp_inp_west8;
wire [15:0] temp_inp_west12;
wire [15:0] temp_inp_north0;
wire [15:0] temp_inp_north1;
wire [15:0] temp_inp_north2;
wire [15:0] temp_inp_north3;


wire [3:0] mux_control_west;
wire [3:0] mux_control_north;

control_mux control_mux_west(
.clock(clock),
.reset(reset),
.mux_reset(mux_control_west)
);

control_mux control_mux_north(
.clock(clock),
.reset(reset),
.mux_reset(mux_control_north)
);


mux_4_1 mux_0_W (

   .input_1(input_row_0[63:48]), 
   .input_2(input_row_0[47:32]),
   .input_3(input_row_0[31:16]),
   .input_4(input_row_0[15:0]),
   .reset(mux_control_west[3]),
   .clock(clock),
   .out(temp_inp_west0)
);

mux_4_1 mux_1_W (

   .input_1(input_row_1[63:48]), 
   .input_2(input_row_1[47:32]),
   .input_3(input_row_1[31:16]),
   .input_4(input_row_1[15:0]),
   .reset(mux_control_west[2]),
   .clock(clock),
   .out(temp_inp_west4)
);

mux_4_1 mux_2_W (

   .input_1(input_row_2[63:48]), 
   .input_2(input_row_2[47:32]),
   .input_3(input_row_2[31:16]),
   .input_4(input_row_2[15:0]),
   .reset(mux_control_west[1]),
   .clock(clock),
   .out(temp_inp_west8)
);

mux_4_1 mux_3_W (

   .input_1(input_row_3[63:48]), 
   .input_2(input_row_3[47:32]),
   .input_3(input_row_3[31:16]),
   .input_4(input_row_3[15:0]),
   .reset(mux_control_west[0]),
   .clock(clock),
   .out(temp_inp_west12)
);


mux_4_1 mux_0_N (

   .input_1(input_col_0[63:48]), 
   .input_2(input_col_0[47:32]),
   .input_3(input_col_0[31:16]),
   .input_4(input_col_0[15:0]),
   .reset(mux_control_north[3]),
   .clock(clock),
   .out(temp_inp_north0)
);

mux_4_1 mux_1_N (

   .input_1(input_col_1[63:48]), 
   .input_2(input_col_1[47:32]),
   .input_3(input_col_1[31:16]),
   .input_4(input_col_1[15:0]),
   .reset(mux_control_north[2]),
   .clock(clock),
   .out(temp_inp_north1)
);

mux_4_1 mux_2_N (

   .input_1(input_col_2[63:48]), 
   .input_2(input_col_2[47:32]),
   .input_3(input_col_2[31:16]),
   .input_4(input_col_2[15:0]),
   .reset(mux_control_north[1]),
   .clock(clock),
   .out(temp_inp_north2)
);

mux_4_1 mux_3_N (

   .input_1(input_col_3[63:48]), 
   .input_2(input_col_3[47:32]),
   .input_3(input_col_3[31:16]),
   .input_4(input_col_3[15:0]),
   .reset(mux_control_north[0]),
   .clock(clock),
   .out(temp_inp_north3)
);



systolic_array sys_0 (
.inp_west0(temp_inp_west0), 
.inp_west4(temp_inp_west4), 
.inp_west8(temp_inp_west8), 
.inp_west12(temp_inp_west12),	      
.inp_north0(temp_inp_north0), 
.inp_north1(temp_inp_north1), 
.inp_north2(temp_inp_north2), 
.inp_north3(temp_inp_north3),
.clk(clock), 
.rst(reset), 
.done(done)
);
	


endmodule

