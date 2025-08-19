module tb_link_top;

reg clk, rst;
wire done;

link_top dut(.clk(clk), .rst(rst), .done(done));

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("tb_top_link.vcd");
    $dumpvars(0, tb_link_top);
end

initial begin
    rst = 1;
    #10 rst = 0;

    @(posedge done);

    #10 $finish;
end

endmodule