
//Comparator:
module comparator #(parameter wlength=4)(
  input wire clk,
  input wire [wlength-1:0] in1, in2,
  output reg out
);

wire check;
assign check = (in1 == in2) ? 1'b 1 : 1'b 0;
always@(posedge clk) begin
  out <= check;
end

endmodule
