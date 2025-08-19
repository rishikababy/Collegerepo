module slave_fsm(
    input wire clk,
    input wire rst,
    input wire req,
    input wire [7:0] data_in,
    output wire ack,
    output wire [7:0] last_byte
);

localparam IDLE = 2'b00;
localparam GOT_REQ = 2'b01;
localparam ACK_HOLD1 = 2'b10;
localparam ACK_HOLD2 = 2'b11;

reg [1:0] current_state, next_state;
reg ack_reg;
reg [7:0] last_byte_reg;

always @(posedge clk) begin
    if (rst) begin
        current_state <= IDLE;
        ack_reg <= 0;
    end else begin
        current_state <= next_state;
    end
end

always @(*) begin
    next_state = current_state;
    case (current_state)
        IDLE: begin
            if (req) begin
                last_byte_reg = data_in; 
                ack_reg = 1;
                next_state = GOT_REQ;
            end
        end
        GOT_REQ: begin
            ack_reg = 1;
            next_state = ACK_HOLD1;
        end
        ACK_HOLD1: begin
            ack_reg = 1;
            next_state = ACK_HOLD2;
        end
        ACK_HOLD2: begin
            ack_reg = 1;
            if (!req) begin
                ack_reg = 0;
                next_state = IDLE;
            end
        end
        default: begin
            next_state = IDLE;
            ack_reg = 0;
        end
    endcase
end

assign ack = ack_reg;
assign last_byte = last_byte_reg;

endmodule