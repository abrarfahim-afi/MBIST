
//MUX:
module mux #(parameter length=4)(
  input clk,
  input sel,
  input wire [length-1:0] in0, in1,
  output reg [length-1:0] out
);

always@(posedge clk) begin
  case(sel)
    'd0: out <= in0;
    'd1: out <= in1;
    default: out <= {length{1'bx}};
  endcase
end

endmodule
