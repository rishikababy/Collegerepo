// File: tb_vending_mealy.v
module tb_vending_mealy;

reg clk, rst;
reg [1:0] coin;
wire dispense, chg5;

vending_mealy dut(.clk(clk), .rst(rst), .coin(coin),
                  .dispense(dispense), .chg5(chg5));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("tb_vending-mealy.vcd");
    $dumpvars(0, tb_vending_mealy);
end

initial begin
    // Reset
    rst = 1; coin = 2'b00;
    #10 rst = 0;

    #10 coin = 2'b01; 
    #10 coin = 2'b01; 
    #10 coin = 2'b10; 
    #10 coin = 2'b00;

    #10 coin = 2'b01; 
    #10 coin = 2'b10; 
    #10 coin = 2'b10; 
    #10 coin = 2'b00;

    #10 coin = 2'b10; 
    #10 coin = 2'b10; 
    #10 coin = 2'b00;

    #50 $finish;
end

endmodule