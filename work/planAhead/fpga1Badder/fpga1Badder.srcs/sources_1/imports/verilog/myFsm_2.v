/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module myFsm_2 (
    input clk,
    input rst,
    input up,
    input down,
    input left,
    output reg a,
    input aM,
    output reg b,
    input bM,
    output reg cin,
    input cinM,
    input sum,
    input cout,
    output reg error
  );
  
  
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_3 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  localparam MANUAL_state = 5'd0;
  localparam AUTO_state = 5'd1;
  localparam TEST_state = 5'd2;
  localparam A_state = 5'd3;
  localparam B_state = 5'd4;
  localparam AB_state = 5'd5;
  localparam CIN_state = 5'd6;
  localparam AC_state = 5'd7;
  localparam BC_state = 5'd8;
  localparam ABC_state = 5'd9;
  localparam ERRORTEST_state = 5'd10;
  localparam ERRORA_state = 5'd11;
  localparam ERRORB_state = 5'd12;
  localparam ERRORAB_state = 5'd13;
  localparam ERRORCIN_state = 5'd14;
  localparam ERRORAC_state = 5'd15;
  localparam ERRORBC_state = 5'd16;
  localparam ERRORABC_state = 5'd17;
  
  reg [4:0] M_state_d, M_state_q = MANUAL_state;
  reg [25:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    error = 1'h0;
    a = 1'h0;
    b = 1'h0;
    cin = 1'h0;
    M_counter_d = M_counter_q + 1'h1;
    M_edge_detector_in = M_counter_q[25+0-:1];
    
    case (M_state_q)
      MANUAL_state: begin
        M_counter_d = 1'h0;
        a = aM;
        b = bM;
        cin = cinM;
        if (left) begin
          M_state_d = AUTO_state;
        end
      end
      AUTO_state: begin
        a = M_counter_q[24+0-:1];
        b = M_counter_q[24+0-:1];
        cin = M_counter_q[24+0-:1];
        if (up) begin
          M_state_d = MANUAL_state;
        end else begin
          if (down) begin
            M_counter_d = 1'h0;
            M_state_d = TEST_state;
          end
        end
      end
      TEST_state: begin
        a = 1'h0;
        b = 1'h0;
        cin = 1'h0;
        error = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h0) begin
            M_state_d = A_state;
          end else begin
            M_state_d = ERRORTEST_state;
          end
        end
      end
      A_state: begin
        a = 1'h1;
        b = 1'h0;
        cin = 1'h0;
        error = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h0) begin
            M_state_d = B_state;
          end else begin
            M_state_d = ERRORA_state;
          end
        end
      end
      B_state: begin
        a = 1'h0;
        b = 1'h1;
        cin = 1'h0;
        error = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h0) begin
            M_state_d = AB_state;
          end else begin
            M_state_d = ERRORB_state;
          end
        end
      end
      AB_state: begin
        a = 1'h1;
        b = 1'h1;
        cin = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h1) begin
            M_state_d = CIN_state;
          end else begin
            M_state_d = ERRORAB_state;
          end
        end
      end
      CIN_state: begin
        a = 1'h0;
        b = 1'h0;
        cin = 1'h1;
        error = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h0) begin
            M_state_d = AC_state;
          end else begin
            M_state_d = ERRORCIN_state;
          end
        end
      end
      AC_state: begin
        a = 1'h1;
        b = 1'h0;
        cin = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h1) begin
            M_state_d = BC_state;
          end else begin
            M_state_d = ERRORAC_state;
          end
        end
      end
      BC_state: begin
        a = 1'h0;
        b = 1'h1;
        cin = 1'h1;
        error = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h1) begin
            M_state_d = ABC_state;
          end else begin
            M_state_d = ERRORBC_state;
          end
        end
      end
      ABC_state: begin
        a = 1'h1;
        b = 1'h1;
        cin = 1'h1;
        error = 1'h0;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h1) begin
            M_state_d = AUTO_state;
          end else begin
            M_state_d = ERRORABC_state;
          end
        end
      end
      ERRORTEST_state: begin
        a = M_counter_q[21+0-:1];
        b = M_counter_q[21+0-:1];
        cin = M_counter_q[21+0-:1];
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h0) begin
            M_state_d = A_state;
          end
        end
      end
      ERRORA_state: begin
        a = M_counter_q[23+0-:1];
        b = 1'h0;
        cin = 1'h0;
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h0) begin
            M_state_d = B_state;
          end
        end
      end
      ERRORB_state: begin
        a = 1'h0;
        b = M_counter_q[23+0-:1];
        cin = 1'h0;
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h0) begin
            M_state_d = AB_state;
          end
        end
      end
      ERRORAB_state: begin
        a = M_counter_q[23+0-:1];
        b = M_counter_q[23+0-:1];
        cin = 1'h0;
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h1) begin
            M_state_d = CIN_state;
          end
        end
      end
      ERRORCIN_state: begin
        a = 1'h0;
        b = 1'h0;
        cin = M_counter_q[23+0-:1];
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h0) begin
            M_state_d = AC_state;
          end
        end
      end
      ERRORAC_state: begin
        a = M_counter_q[23+0-:1];
        b = 1'h0;
        cin = M_counter_q[23+0-:1];
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h1) begin
            M_state_d = BC_state;
          end
        end
      end
      ERRORBC_state: begin
        a = M_counter_q[23+0-:1];
        b = M_counter_q[23+0-:1];
        cin = 1'h0;
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h0 && cout == 1'h1) begin
            M_state_d = ABC_state;
          end
        end
      end
      ERRORABC_state: begin
        a = M_counter_q[23+0-:1];
        b = M_counter_q[23+0-:1];
        cin = M_counter_q[23+0-:1];
        error = 1'h1;
        if (M_edge_detector_out) begin
          if (sum == 1'h1 && cout == 1'h1) begin
            M_state_d = TEST_state;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
