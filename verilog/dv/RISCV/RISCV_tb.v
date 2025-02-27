// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

module RISCV_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;
	
	reg design_rst;
	assign mprj_io[0] = design_rst;
	
	wire [15:0] bus_out = mprj_io[20:5];
	assign mprj_io[20:5] = bus_dir && !OEb ? mem_out : 16'hzzzz;
	wire le_lo = mprj_io[21];
	wire le_hi = mprj_io[22];
	wire bus_dir = mprj_io[23];
	wire OEb = mprj_io[24];
	wire WEb_lo = mprj_io[25];
	wire WEb_hi = mprj_io[26];
	wire [5:0] PORT_out = mprj_io[37:32];
	
	wire SCLK = mprj_io[27];
	assign mprj_io[28] = 1'b0;
	wire SDO = mprj_io[29];
	
	//TRANSPARENT address latch
	reg [31:0] addr_latch;
	wire [31:0] full_addr = {le_hi ? bus_out : addr_latch[31:16], le_lo ? bus_out : addr_latch[15:0]};
	
	reg [7:0] memory [32767:0];

	wire [15:0] mem_out = {memory[(full_addr[14:0] << 1) | 1], memory[(full_addr[14:0] << 1)]};
	
	assign mprj_io[4] = 1'b0;
	assign mprj_io[2] = 1'b0;
	assign mprj_io[3] = CSB;
	
	always #15 clock <= (clock === 1'b0);
	
	integer halted = 0;
	always @(negedge WEb_lo) begin
		memory[full_addr[14:0] << 1] <= bus_out[7:0];
		if(full_addr == 'h00200006) begin
			$write("%c", bus_out[7:0]);
			$fflush();
		end
		if(full_addr == 'h0020000C) begin
			halted = 1;
		end
	end

	always @(negedge WEb_hi) begin
		memory[(full_addr[14:0] << 1) | 1] <= bus_out[15:8];
	end

	initial begin
		clock = 0;
		design_rst = 0;
		addr_latch = 0;
		for(integer i = 0; i < 32768; i = i + 1) begin
			memory[i] = (i % 4) == 0 ? 8'h13 : 8'h00;
		end
		$readmemh("pgm.txt", memory, 0, 32767);
	end
	
	always @(negedge le_lo) addr_latch[15:0] <= bus_out;
	always @(negedge le_hi) addr_latch[31:16] <= bus_out;

	integer test;
	initial begin
		test = 4000;

		while(test > 2)  begin
			repeat (50) @(posedge clock);
			$fflush();
			test -= 1;
		end
			$display("%c[1;31m",27);
			`ifdef GL
				$display ("Monitor: TIMEOUT (GL)");
			`else
				$display ("Monitor: TIMEOUT (RTL)");
			`endif
			$display("%c[0m",27);
		$finish;
	end

	integer counter = 0;
	integer failures = 0;
	initial begin
		//$dumpfile("RISCV.vcd");
		//$dumpvars(0, RISCV_tb);
		@(posedge gpio);
		@(negedge gpio);
		@(posedge gpio);
		$dumpfile("RISCV.vcd");
		$dumpvars(0, RISCV_tb);
		repeat (4) @(posedge clock);
		#10;
		design_rst = 1;
		$display("Reset released");
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		while(!halted) @(posedge clock);
		
		failures += PORT_out != 6'h15;

		if(!failures) begin
			$display("%c[1;32m", 27);
			`ifdef GL
			$display("Monitor: Test (GL) Passed");
			`else
			$display("Monitor: Test (RTL) Passed");
			`endif
			$display("%c[0m", 27);
		end else begin
			$display("%c[1;31m",27);
			`ifdef GL
				$display ("Monitor: Test (GL) Failed");
			`else
				$display ("Monitor: Test (RTL) Failed");
			`endif
			$display("%c[0m",27);
		end
		$finish();
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#100000;
		//CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("RISCV.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);
endmodule
`default_nettype wire
