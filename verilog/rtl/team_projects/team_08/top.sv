`default_nettype none

module top 
(
  // I/O ports
  input  logic hwclk, reset,
  input  logic [20:0] pb,
  output logic [7:0] left, right,
         ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0,
  output logic red, green, blue

  // UART ports
  // output logic [7:0] txdata,
  // input  logic [7:0] rxdata,
  // output logic txclk, rxclk,
  // input  logic txready, rxready
);

  // Simple Tests
  // assign right[1] = pb[0];
  // assign left[7] = pb[1];
  // assign left[7] = hwclk;

  // PLL Tests
  // pll mypll (.in_clk(hwclk), .lcd_clk(right[0]), .locked());
  // assign left[7] = hwclk;

  // Instantiate top module
  snakeGame DESIGN (
    .clk(hwclk),
    .rst(~pb[19]),
    .up(pb[2]),
    
    .tft_sck(right[0]),
    .tft_sdi(ss0[2]),
    .tft_dc(ss0[0]),
    .tft_reset(ss0[6]),
    .tft_cs(ss0[4]),
    
    .tft_sdo(),  // BELOW PORTS ARE NOT USED
    .leds(),
    .dac_sdi(),
    .dac_cs(),
    .dac_sck(),
    .test(),
    .tftstate()
  );

endmodule