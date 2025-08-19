module traffic_light(
    input wire clk,
    input wire rst,
    input wire tick,
    output wire ns_g,
    output wire ns_y,
    output wire ns_r,
    output wire ew_g,
    output wire ew_y,
    output wire ew_r
);

localparam NS_G_STATE = 2'b00;
localparam NS_Y_STATE = 2'b01;
localparam EW_G_STATE = 2'b10;
localparam EW_Y_STATE = 2'b11;

reg [1:0] current_state, next_state;
reg [3:0] counter; // 4 bits for a max count of 15

always @(posedge clk) begin
    if (rst) begin
        current_state <= NS_G_STATE;
        counter <= 0;
    end else begin
        current_state <= next_state;
        if (tick) begin
            counter <= counter + 1;
        end
    end
end

always @(*) begin
    next_state = current_state;
    case (current_state)
        NS_G_STATE: if (counter == 5-1) next_state = NS_Y_STATE;
        NS_Y_STATE: if (counter == 2-1) next_state = EW_G_STATE;
        EW_G_STATE: if (counter == 5-1) next_state = EW_Y_STATE;
        EW_Y_STATE: if (counter == 2-1) next_state = NS_G_STATE;
    endcase
end

assign ns_g = (current_state == NS_G_STATE);
assign ns_y = (current_state == NS_Y_STATE);
assign ns_r = (current_state == EW_G_STATE) || (current_state == EW_Y_STATE);

assign ew_g = (current_state == EW_G_STATE);
assign ew_y = (current_state == EW_Y_STATE);
assign ew_r = (current_state == NS_G_STATE) || (current_state == NS_Y_STATE);

endmodule