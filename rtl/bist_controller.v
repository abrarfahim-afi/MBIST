
//BIST CONTROLLER:
module BIST_controller (
  input wire start, rst, clk, stop,
  output wire tmode
);

parameter reset = 1'b 0, test = 1'b 1;

reg current = reset;
always @ (posedge clk) begin
  if (rst)
    current <= reset;
  else
  case(current)
    reset: if (start)
      current <= test;
      else
      current <= reset;
    test: if (stop)
      current <= reset;
      else
      current <= test;
  default:
    current <= reset;
  endcase
end

assign tmode = (current == test) ? 1'b 1 : 1'b 0;

endmodule
