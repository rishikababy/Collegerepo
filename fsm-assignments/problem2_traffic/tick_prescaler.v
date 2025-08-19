
module tick_prescaler #(
    parameter integer CLK_FREQ_HZ = 50_000_000,
    parameter integer TICK_HZ = 1
) (
    input wire clk,
    input wire rst,
    output wire tick
);

localparam integer TERMINAL_COUNT = CLK_FREQ_HZ / TICK_HZ;

reg [31:0] counter;
reg tick_reg;

always @(posedge clk) begin
    if (rst) begin
        counter <= 0;
        tick_reg <= 0;
    end else begin
        if (counter == TERMINAL_COUNT - 1) begin
            counter <= 0;
            tick_reg <= 1;
        end else begin
            counter <= counter + 1;
            tick_reg <= 0;
        end
    end
end

assign tick = tick_reg;

endmodule