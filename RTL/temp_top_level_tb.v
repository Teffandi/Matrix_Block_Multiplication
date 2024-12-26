/*

MIT License

Copyright (c) 2020 Debtanu Mukherjee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/
`include "temp_top_level.v"

module temp_top_level_tb;

reg reset, clock;
wire done;

reg [63:0] input_row_0;
reg [63:0] input_row_1;
reg [63:0] input_row_2;
reg [63:0] input_row_3;
reg [63:0] input_col_0;
reg [63:0] input_col_1;
reg [63:0] input_col_2;
reg [63:0] input_col_3;


temp_top_level uut (

.input_row_0(input_row_0),
.input_row_1(input_row_1),
.input_row_2(input_row_2),
.input_row_3(input_row_3),
.input_col_0(input_col_0),
.input_col_1(input_col_1),
.input_col_2(input_col_2),
.input_col_3(input_col_3),
.clock(clock),
.reset(reset),
.done(done)
);



initial begin
input_row_0 <= {16'h0300,16'h0200,16'h0100,16'h0000};
input_row_1 <= {16'h0700,16'h0600,16'h0500,16'h0400};
input_row_2 <= {16'h0100,16'h0100,16'h0900,16'h0800};
input_row_3 <= {16'h0500,16'h0400,16'h0300,16'h0200};

input_col_0 <= {16'h0100,16'h0800,16'h0400,16'h0000};
input_col_1 <= {16'h0100,16'h0900,16'h0500,16'h0100};
input_col_2 <= {16'h0400,16'h0100,16'h0600,16'h0200};
input_col_3 <= {16'h0500,16'h0100,16'h0700,16'h0300};


end

initial begin
reset <= 1;
clock <= 1;
#1
reset <= 0;
end

initial begin
	repeat(21)
		#5 clock <= ~clock;
end



initial begin
	$dumpfile("wave_temp_top_level.vcd");
	$dumpvars(0, temp_top_level_tb);
end



endmodule
