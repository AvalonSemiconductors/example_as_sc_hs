`default_nettype none
module wrapped_tholin_riscv(
`ifdef USE_POWER_PINS
    inout vccd1,
    inout vssd1,
`endif
    input wb_clk_i,
    input rst_n,
    input [32:0] io_in,
    output [37:0] io_oeb,
    output [37:0] io_out,
    input [1:0] custom_settings,
    output [127:0] la_data_out,
    
    output [2:0] irq,
    input [31:0] wbs_dat_i,
    output reg [31:0] wbs_dat_o,
    output reg wbs_ack_o,
    input wbs_cyc_i,
    input wbs_stb_i,
    input wbs_we_i,
    input wb_rst_i
);
assign io_oeb[33] = 1'b1;
assign io_oeb[37:34] = 4'hF;
assign io_out[37:33] = 5'h1A;
assign irq = 3'h0;

wire bus_dir;
assign io_oeb[15:0] = {16{bus_dir}};
assign io_oeb[16] = 1'b0;
assign io_oeb[17] = 1'b0;
assign io_oeb[18] = 1'b0;
assign io_out[18] = bus_dir;
assign io_oeb[19] = 1'b0;
assign io_oeb[20] = 1'b0;
assign io_oeb[21] = 1'b0;
wire WEb_lo;
wire WEb_hi;
assign io_out[20] = custom_settings[1:0] == 2'b01 ? (WEb_lo | wb_clk_i) : (custom_settings[1:0] == 2'b10 ? (WEb_lo | (~wb_clk_i)) : WEb_lo);
assign io_out[21] = custom_settings[1:0] == 2'b01 ? (WEb_hi | wb_clk_i) : (custom_settings[1:0] == 2'b10 ? (WEb_hi | (~wb_clk_i)) : WEb_hi);
assign io_oeb[22] = 1'b0;
assign io_oeb[23] = 1'b1;
assign io_oeb[24] = 1'b0;
assign io_oeb[25] = 1'b0;
assign io_oeb[26] = 1'b1;
wire [5:0] PORT_dir;
assign io_oeb[32:27] = ~PORT_dir;
assign io_out[26] = 1'b0;
assign io_out[23] = 1'b0;
tholin_riscv tholin_riscv(
    .clk(wb_clk_i),
    .rst_n(rst_n),
    .bus_out(io_out[15:0]),
    .bus_in(io_in[15:0]),
    .le_lo(io_out[16]),
    .le_hi(io_out[17]),
    .bus_dir(bus_dir),
    .OEb(io_out[19]),
    .WEb_lo(WEb_lo),
    .WEb_hi(WEb_hi),

    .SCLK(io_out[22]),
    .SDI(io_in[23]),
    .SDO(io_out[24]),
    .TXD(io_out[25]),
    .RXD(io_in[26]),
    .PORT_dir(PORT_dir),
    .PORT_out(io_out[32:27]),
    .PORT_in(io_in[32:27]),
    
    .la_data_out(la_data_out),
    .wishbone_in(wishbone_in),
    .wishbone_out(wishbone_out)
);

wire wb_valid = wbs_cyc_i && wbs_stb_i;
reg wb_feedback_delay;
reg [31:0] wishbone_in;
wire [31:0] wishbone_out;
always @(posedge wb_clk_i) begin
	if(wb_rst_i) begin
		wbs_ack_o <= 1'b0;
		wbs_dat_o <= 32'hFFFFFFFF;
		wb_feedback_delay <= 1'b0;
	end else begin
		if(wb_valid && wb_feedback_delay && !wbs_ack_o) begin
			if(wbs_we_i) wishbone_in <= wbs_dat_i;
			else wbs_dat_o <= wishbone_out;
		end
		wb_feedback_delay <= wb_valid;
		wbs_ack_o <= wb_feedback_delay;
	end
end

endmodule
