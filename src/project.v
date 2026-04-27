/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_fullsub (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire       ena,      
    input  wire       clk,      
    input  wire       rst_n     
);

    // Inputs for full subtractor
    wire A   = ui_in[0];
    wire B   = ui_in[1];
    wire Bin = ui_in[2];

    // Outputs
    wire Diff, Bout;

    // Full subtractor logic
    assign Diff = A ^ B ^ Bin;
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);

    // Assign outputs
    assign uo_out[0] = Diff;
    assign uo_out[1] = Bout;
    assign uo_out[7:2] = 6'b000000;

    // Unused bidirectional IOs
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    // Prevent unused warnings
    wire _unused = &{uio_in, ena, clk, rst_n, 1'b0};

endmodule
