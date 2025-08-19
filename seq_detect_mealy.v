module seq_detect_mealy(
    input wire clk,
    input wire rst,
    input wire din,
    output wire y
);
localparam S0 = 2'b00; 
localparam S1 = 2'b01; 
localparam S2 = 2'b10; 
localparam S3 = 2'b11; 
reg [1:0] current_state, next_state;

always @(posedge clk) begin
    if (rst) begin
        current_state <= S0;
    end else begin
        current_state <= next_state;
    end
end

always @(*) begin
    next_state = current_state; 
    case (current_state)
        S0: if (din == 1'b1) next_state = S1;
        S1: if (din == 1'b0) next_state = S0;
            else next_state = S2;
        S2: if (din == 1'b0) next_state = S3;
            else next_state = S2;
        S3: if (din == 1'b0) next_state = S0;
            else next_state = S1;
        default: next_state = S0;
    endcase
end

assign y = (current_state == S3) && (din == 1'b1);

endmodule
