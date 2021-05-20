module accelerator(
    input logic clk, reset, enable,
    input logic [WIDTH-1 : 0] in_a, in_b,
    output logic [WIDTH-1 : 0] out);
    
    parameter WIDTH = 32;
    
    logic [2*WIDTH-1 : 0] temp;
    
    always_ff@(posedge clk)
        begin
        if(~reset) temp <= 0;
        else if(reset && enable) temp <= in_a * in_b;
        end
        
    assign out = temp[WIDTH-1 : 0];
    
endmodule

