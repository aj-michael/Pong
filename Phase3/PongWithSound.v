`timescale 1ns / 1ps
// File: 		PongWithSound.v
// Created by:	Adam Michael, CM1884
//					Mohammad
// Date: 		November 6, 2015
// Summary: 	This module plays the Pong game with sound on collisions.
module PongWithSound(
   input Clock, Reset, rota, rotb,
	output [2:0] red,
   output [2:0] green,
   output [1:0] blue,
   output hsync, vsync
);

	wire [9:0] xpos;
	wire [9:0] ypos;

	parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
	parameter [9:0] SystemClockFreq=10'd100, CRTClockFreq=10'd25; //MHz 

	CRTcontroller2015fall VGAdisplay(NumberofPixels, NumberofLines, SystemClockFreq, CRTClockFreq, hsync, vsync, xpos, ypos, Reset, Clock);
	GameWithSound game_inst(Clock, Reset, xpos, ypos, rota, rotb, red, green, blue);
endmodule
