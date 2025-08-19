module master_fsm(
    input wire clk,
    input wire rst,
    input wire ack,
    output wire req,
    output wire [7:0] data,
    output wire done
);

localparam IDLE = 3'b000;
localparam REQ = 3'b001;
localparam WAIT_ACK = 3'b010;
localparam WAIT_ACK_DROP = 3'b011;
localparam DONE_STATE = 3'b100;

reg [2:0] current_state, next_state;
reg [1:0] byte_index;
reg [7:0] data_reg;
reg req_reg;
reg done_reg;

always @(posedge clk) begin
    if (rst) begin
        current_state <= IDLE;
        byte_index <= 0;
    end else begin
        current_state <= next_state;
        if ((current_state == WAIT_ACK_DROP) && (byte_index < 3)) begin
            byte_index <= byte_index + 1;
        end
    end
end

always @(*) begin
    next_state = current_state;
    case (current_state)
        IDLE: begin
            req_reg = 0;
            done_reg = 0;
 
            next_state = REQ;
        end
        REQ: begin
            req_reg = 1;
            next_state = WAIT_ACK;
        end
        WAIT_ACK: begin
            req_reg = 1;
            if (ack) next_state = WAIT_ACK_DROP;
        end
        WAIT_ACK_DROP: begin
            req_reg = 0;
            if (!ack) begin
                if (byte_index == 3) next_state = DONE_STATE;
                else next_state = REQ;
            end
        end
        DONE_STATE: begin
            done_reg = 1;
            next_state = IDLE;
        end
        default: begin
            next_state = IDLE;
            req_reg = 0;
            done_reg = 0;
        end
    endcase
end

assign req = req_reg;
assign data = data_reg;
assign done = done_reg;

endmodule