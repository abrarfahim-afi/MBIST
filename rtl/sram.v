
//SRAM:
module single_port_ram #(parameter wcount=256, wlength=4) (
  input wire [wlength-1:0] datain,
  input wire [$clog2(wcount)-1:0] addr,
  input wire we, clk,
  output reg [wlength-1:0] dataout
);

/* Declare the RAM variable - split into multiple RAMs */
reg [wlength-1:0] ram1[(wcount/8)-1:0];
reg [wlength-1:0] ram2[(wcount/8)-1:0];
reg [wlength-1:0] ram3[(wcount/8)-1:0];
reg [wlength-1:0] ram4[(wcount/8)-1:0];
reg [wlength-1:0] ram5[(wcount/8)-1:0];
reg [wlength-1:0] ram6[(wcount/8)-1:0];
reg [wlength-1:0] ram7[(wcount/8)-1:0];
reg [wlength-1:0] ram8[(wcount/8)-1:0];

/* Pipelining write address decode + Variable to hold the registered read address*/
reg [2:0] mem_sel, mem_sel_reg;
reg [$clog2(wcount)-4:0] mem_addr, mem_addr_reg;
reg [wlength-1:0] datain_reg, dataout_buffer1, dataout_buffer2, dataout_buffer3, dataout_buffer4, dataout_buffer5, dataout_buffer6, dataout_buffer7, dataout_buffer8;
reg we_reg;

always@(posedge clk) begin
  /*Write*/
  mem_sel <= addr[$clog2(wcount)-1:$clog2(wcount)-3];
  mem_addr <= addr[$clog2(wcount)-4:0];
  datain_reg <= datain;
  we_reg <= we;
  if (we_reg) begin
    case(mem_sel)
      'd0: ram1[mem_addr] <= datain_reg;
      'd1: ram2[mem_addr] <= datain_reg;
      'd2: ram3[mem_addr] <= datain_reg;
      'd3: ram4[mem_addr] <= datain_reg;
      'd4: ram5[mem_addr] <= datain_reg;
      'd5: ram6[mem_addr] <= datain_reg;
      'd6: ram7[mem_addr] <= datain_reg;
      'd7: ram8[mem_addr] <= datain_reg;
      default: ; //do nothing
    endcase
  end
  dataout_buffer1 <= ram1[mem_addr];
  dataout_buffer2 <= ram2[mem_addr];
  dataout_buffer3 <= ram3[mem_addr];
  dataout_buffer4 <= ram4[mem_addr];
  dataout_buffer5 <= ram5[mem_addr];
  dataout_buffer6 <= ram6[mem_addr];
  dataout_buffer7 <= ram7[mem_addr];
  dataout_buffer8 <= ram8[mem_addr];
  mem_sel_reg <= mem_sel;
  //mem_addr_reg <= mem_addr;
end

/* Continuous assignment implies read returns NEW datain.
This is the natural behavior of the TriMatrix memory blocks in Single Port mode*/
always@(*) begin
  case(mem_sel_reg)
    'd0: dataout = dataout_buffer1;
    'd1: dataout = dataout_buffer2;
    'd2: dataout = dataout_buffer3;
    'd3: dataout = dataout_buffer4;
    'd4: dataout = dataout_buffer5;
    'd5: dataout = dataout_buffer6;
    'd6: dataout = dataout_buffer7;
    'd7: dataout = dataout_buffer8;
    default: ; //do nothing
  endcase
end
endmodule

