
//CB/RCB DECODER:
module decoder #(parameter wlength=4)(
  input wire clk,
  input wire [3:0] in,
  output reg [wlength-1:0] out
);

reg [wlength-1:0] out_temp_reg;
reg negate;

always@(posedge clk) begin
  case(in[2:1])
    'd0: out_temp_reg <= {wlength/4{4'b0000}};
    'd1: out_temp_reg <= {wlength/4{4'b0101}};
    'd2: out_temp_reg <= {wlength/4{4'b0011}};
    default: out_temp_reg <= {wlength{1'bx}};
  endcase
  negate <= in[3]~^in[0];
  out <= negate ? ~out_temp_reg : out_temp_reg;
end

endmodule
