
//Testbench
module mbist_tb #(parameter wcount=256, wlength=4)();

reg start, rst, clk, rwbarin;
reg [wlength-1:0] datain;
reg [$clog2(wcount)-1:0] address;
wire [wlength-1:0] dataout;
wire fail;

TOP #(.wcount(wcount),.wlength(wlength)) DUT (
  .start(start),
  .rst(rst),
  .clk(clk),
  .rwbarin(rwbarin),
  .datain(datain),
  .address(address),
  .dataout(dataout),
  .fail(fail)
);

initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars;
end

initial begin
    clk = 'b0;
    forever #5 clk = ~clk;
end

initial begin
    rwbarin = 1'b0;
    datain = {wlength{1'b0}};
    address = {$clog2(wcount){1'b0}};
    #10;
    rst = 1;
    #10;
    rst = 0;
    #100;
    start = 1;
    #10;
    start = 0;
    #31000;
    start = 1;
    #10;
    start =0;
    #100;
    $finish;
end

endmodule
