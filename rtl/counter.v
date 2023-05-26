
//COUNTER
module counter #(parameter length = 12)(
  input wire clk, ud, en, rst,
  output wire [length-1:0] q,
  output stop
);

reg [length-1:0] cnt_reg;

always @(posedge clk) begin
  if(rst|stop) cnt_reg <= {length{1'b0}};
  else if (en) begin
    if (ud) begin
      cnt_reg <= cnt_reg + 1;
    end
    else cnt_reg <= cnt_reg - 1;
  end
end

assign q = cnt_reg;
assign stop = cnt_reg[length-1]&cnt_reg[length-2];

endmodule
