/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input [15:0] a,
    output reg [15:0] make_a
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  reg [15:0] b;
  
  reg [5:0] alufn;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_sel = 4'hf;
    b = 16'h0000;
    alufn = 6'h00;
    make_a = {b};
    io_led[0+15-:16] = io_dip[0+15-:16];
    b = {io_dip[8+7-:8], io_dip[0+7-:8]};
    if (io_button[0+0-:1]) begin
      make_a = b;
    end
    make_a = a;
  end
endmodule