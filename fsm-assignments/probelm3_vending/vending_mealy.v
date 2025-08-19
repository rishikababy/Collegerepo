module vending_mealy(
    input wire clk,
    input wire rst,
    input wire [1:0] coin, 
    output wire dispense, 
    output wire chg5      
);

localparam S0 = 3'b000;  
localparam S5 = 3'b001;  
localparam S10 = 3'b010; 
localparam S15 = 3'b011; 
localparam S20 = 3'b100; 

reg [2:0] current_state, next_state;

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
        S0: begin
            if (coin == 2'b01) next_state = S5;
            else if (coin == 2'b10) next_state = S10;
        end
        S5: begin
            if (coin == 2'b01) next_state = S10;
            else if (coin == 2'b10) next_state = S15;
        end
        S10: begin
            if (coin == 2'b01) next_state = S15;
            else if (coin == 2'b10) next_state = S20;
        end
        S15: begin
            if (coin == 2'b01) next_state = S20;
            else if (coin == 2'b10) next_state = S0; 
        end
        S20: begin
            if (coin == 2'b01) next_state = S0; 
            else if (coin == 2'b10) next_state = S0; 
        end
        default: next_state = S0;
    endcase
end

assign dispense = ((current_state == S15) && (coin == 2'b10)) ||
                  ((current_state == S20) && (coin == 2'b01)) ||
                  ((current_state == S20) && (coin == 2'b10));

assign chg5 = ((current_state == S15) && (coin == 2'b10)) ||
              ((current_state == S20) && (coin == 2'b01));

endmodule