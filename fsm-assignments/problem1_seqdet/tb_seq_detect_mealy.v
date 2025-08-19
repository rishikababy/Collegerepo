module tb_seq_detect_mealy;

reg clk, rst, din;
wire y;

seq_detect_mealy dut(.clk(clk), .rst(rst), .din(din), .y(y));


initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    $dumpfile("tb_seq_detect_mealy");
    $dumpvars(0, tb_seq_detect_mealy);
end

initial begin
    rst = 1;
    din = 0;
    #10 rst = 0;

    #10 din = 1; 
    #10 din = 1; 
    #10 din = 0; 
    #10 din = 1; 
    #10 din = 1; 
    #10 din = 0; 
    #10 din = 1;
    #10 din = 1;
   
    #10 din = 1;
   
    #10 din = 0;
    
    #10 din = 1; 

    #50 $finish; 
end

endmodule