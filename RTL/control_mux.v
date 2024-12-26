//control logic for handling input streaming

module control_mux(

input clock,
input reset,
output wire [3:0] mux_reset
);

reg [7:0] counter; //for controlling reset

assign mux_reset = counter[3:0];

//control section
always@(posedge clock) begin

if (!reset) begin
    counter <= (counter >> 1)|(counter<<7); //circular shift magic
end else begin
    counter <= 8'b10000111;
end

end



endmodule