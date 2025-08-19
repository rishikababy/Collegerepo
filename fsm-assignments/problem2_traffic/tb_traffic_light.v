module tb_traffic_light;

reg clk, rst;
wire tick;

wire ns_g, ns_y, ns_r;
wire ew_g, ew_y, ew_r;

tick_prescaler #(
    .CLK_FREQ_HZ(100),
    .TICK_HZ(5)
) u_prescaler (
    .clk(clk),
    .rst(rst),
    .tick(tick)
);

traffic_light dut(
    .clk(clk), .rst(rst), .tick(tick),
    .ns_g(ns_g), .ns_y(ns_y), .ns_r(ns_r),
    .ew_g(ew_g), .ew_y(ew_y), .ew_r(ew_r)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    $dumpfile("tb_traffic_light");
    $dumpvars(0, tb_traffic_light);
end

initial begin
    rst = 1;
    #10 rst = 0;

    #2000 $finish;
end

endmodule