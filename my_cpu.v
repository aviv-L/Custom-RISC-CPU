`timescale 1ns / 1ps

`define ADD_REG  4'b0000
`define SUB      4'b0001
`define MUL      4'b0010
`define CMP_REG  4'b0011
`define MOV      4'b0100
`define LD       4'b0101
`define ST       4'b0110
`define NOP      4'b0111
`define LD_IMM   6'b100000
`define CMP_IMM  6'b100011
`define INC      6'b100100
`define DEC      6'b100101
`define INPUT    6'b100110
`define OUTPUT   6'b100111
`define PUSH     6'b101000
`define POP      6'b101001
`define BRA      6'b101010
`define BHI      6'b101100
`define BEQ      6'b101101


`define FETCH      3'b001
`define EXECUTE    3'b010
`define WRITE_BACK 3'b100

`define R1  2'b00
`define R2  2'b01
`define R3  2'b10
`define R4  2'b11

module my_cpu(
input clk,
input rst,
input [7:0]program_bus,
input [7:0]in_port1,
input [7:0]in_port2,
input [7:0]in_port3,
input [7:0]in_port4,
output reg [3:0]in_strobe,
output [7:0]out_port1,  
output [7:0]out_port2,     
output [7:0]out_port3,      
output [7:0]out_port4,      
output reg [3:0]out_strobe,     
output [7:0] program_adress

     );

     
    reg [7:0]out_port[3:0];
    wire [7:0]in_port[3:0];
    
    
    reg [7:0]r[3:0];
    reg [7:0]instruction;
    wire [3:0]cat1;
    wire [5:0]cat2;
    wire [1:0]RA1;
    wire [1:0]RA2;
    wire [1:0]RB;
    reg [7:0]temp;
    reg [7:0]pc;
    reg [4:0] sp;     // Stack Pointer to Data Memory
    reg Z;  // Zero Flag
    reg C;  // Carry Bitreg [1:0]states;
    reg N;  // Negative Flag
    reg V;  // Overflow Flag
    reg [7:0]result;
    reg A7, B7, R7;
    reg [15:0]mult;
    reg [7:0]mem[255:0];
    reg [7:0]stack[31:0];
    
    reg [2:0]state;
     
    assign out_port1 = out_port[0];
    assign out_port2 = out_port[1];
    assign out_port3 = out_port[2];
    assign out_port4 = out_port[3];
   
    
    assign in_port[0] = in_port1 ;
    assign in_port[1] = in_port2 ;
    assign in_port[2] = in_port3 ;
    assign in_port[3] = in_port4 ;
    
    assign cat1 = program_bus[7:4];
    assign cat2 = program_bus[7:2];
    assign program_adress = pc;
    assign RA1 = program_bus[3:2];
    assign RB = program_bus[1:0];
    assign RA2 = program_bus[1:0];
    
    
    always@(posedge clk)
    begin
    if ( !rst ) begin
        state <= `FETCH;
        pc <= 8'b0000_0000;
        instruction <= 8'b0000_0000;
        sp <= 8'b0000_0;
        r[0] <= 8'b0000_0000;
        r[1] <= 8'b0000_0000;
        r[2] <= 8'b0000_0000;
        r[3] <= 8'b0000_0000;
        Z <= 0;
        C <= 0;
        N <= 0;
        V <= 0;
        in_strobe <= 4'b0;
        out_strobe <= 4'b0;
    end  
    else begin
        case(state)
        
        `FETCH: begin
            in_strobe <= 4'b0; 
            out_strobe <= 4'b0;
            
            instruction <= program_bus;
            
            if (program_bus[7] == 0) begin
                case(cat1)
                    `ADD_REG: begin
                        result <= r[RA1] + r[RB];
                        A7 <= r[RA1][7];
                        B7 <= r[RB][7];
                        state <= `EXECUTE;                    
                        end
                    
                    `SUB:begin
                        result <= r[RA1] - r[RB];
                        A7 <= r[RA1][7];
                        B7 <= r[RB][7];
                        state <= `EXECUTE;
                        end
                                         
                    `MUL: begin
                       mult <= r[RA1]*r[RB];                      
                       state <= `EXECUTE;
                        end
                                      
                    `CMP_REG:begin
                        result <= r[RA1] - r[RB];
                        A7 <= r[RA1][7];
                        B7 <= r[RB][7];                       
                        state <= `EXECUTE;
                        end                    
                    
                    `MOV:begin
                        r[RA1] <= r[RB];
                        pc <= pc + 1;                    
                        end
                                           
                    `LD:begin
                        r[RA1] <= mem[RB];
                        pc <= pc + 1;
                        end                   
                         
                    `ST:begin
                        mem[RB] <= r[RA1];
                        pc <= pc + 1;                             
                        end                    
                         
                    `NOP:begin
                        pc <= pc + 1;                    
                        end
                 endcase end                 
                 else begin
                    case(cat2)
                       `LD_IMM :begin 
                            pc <= pc + 1;
                            state <= `EXECUTE;
                            end
                       `CMP_IMM:begin 
                            pc <= pc + 1;
                            state <= `EXECUTE;                         
                            end
                       `INC    :begin 
                            r[RA2] <= r[RA2] + 8'd1;
                            A7 <= r[RA2][7];
                            B7 <= 0;
                            pc<=pc+1;
                            state <= `FETCH;
                            end
                       `DEC    :begin 
                            r[RA2] <= r[RA2] - 8'd1;
                            A7 <= r[RA2][7];
                            B7 <= 0;
                            pc<=pc+1;
                            state <= `FETCH;                                                       
                            end
                       `INPUT  :begin 
                            r[RA2] <= in_port[RA2];
                            in_strobe[RA2] <= 1'b1;
                            pc <= pc + 1;
                            state <= `FETCH;
                            end
                       `OUTPUT :begin 
                            out_port[RA2] <= r[RA2];
                            out_strobe[RA2] <= 1'b1;
                            pc <= pc + 1;
                            state <= `FETCH;
                            end
                       `PUSH   :begin 
                            if(sp != 5'b11111) begin
                                stack[sp] <= r[RA2];
                                sp <= sp + 5'b1;
                            end
                            pc <= pc +1;
                            state <= `FETCH;
                            end
                       `POP    :begin 
                            if (sp != 5'b00000)begin
                                r[RA2]  <= stack[sp-5'b1];
                                sp <= sp - 5'b1;
                            end 
                            pc <= pc +1;
                            state <= `FETCH;
                            end
                       `BRA    :begin                      
                            pc <= pc + 1;
                            state <= `EXECUTE;                            
                            end                        
                       `BHI    :begin 
                            pc <= pc + 1;
                            state <= `EXECUTE;
                            end
                       `BEQ    :begin 
                            pc <= pc + 1;
                            state <= `EXECUTE;
                            end            
                    endcase          
                end
                end
                       
        `EXECUTE: begin
        
        if (instruction[7] == 0) begin
                case(instruction[7:4])
                    `ADD_REG: begin
                        r[instruction[3:2]] <= result;
                        V <= (A7&B7&~result[7])|(~A7&~B7&result[7]);
                        N <= result[7];
                        Z <= (result==8'd0)?1'b1:1'b0;
                        C <= (A7&B7)|(B7&~result[7])|(~result[7]&A7);
                                       
                        pc <= pc + 1;
                        state <= `FETCH;                   
                        end
                    
                    `SUB:begin
                        r[instruction[3:2]] <= result;
                        N <= result[7];
                        Z <= (result == 8'b0);
                        C <= (A7&B7)|(B7&~result[7])|(~result[7]&A7);
                        V <= (A7&B7&~result[7])|(~A7&~B7&result[7]);
                        
                        pc <= pc + 1;   
                        state <= `FETCH;
                        end
                 
                    `CMP_REG:begin
                        N <= result[7];
                        Z <= (result == 8'b0);
                        C <= (A7&B7)|(B7&~result[7])|(~result[7]&A7);
                        V <= (A7&B7&~result[7])|(~A7&~B7&result[7]);
                        
                        pc <= pc + 1;
                        state <= `FETCH;
                        end  
                        
                      `MUL: begin
                        r[instruction[3:2]] <= mult[7:0];
                        pc <= pc + 1;
                        state <= `FETCH;
                        end                             
                 endcase
                 end
                 else begin
                    case(instruction[7:2])
                       `LD_IMM :begin 
                            r[instruction[1:0]] <= program_bus;
                            pc <= pc + 1;
                            state <= `FETCH;
                            end
                       `CMP_IMM:begin 
                            result <= r[instruction[1:0]] - program_bus;
                            A7 <= r[instruction[1:0]][7];
                            B7 <= program_bus[7];
                            state <= `WRITE_BACK;
                            end
                       `INC    :begin 
                            N <= result[7];
                            Z <= (result == 8'b0);
                            C <= (A7&B7)|(B7&~result[7])|(~result[7]&A7);
                            V <= (A7&B7&~result[7])|(~A7&~B7&result[7]);
                            r[instruction[1:0]] <= result;
                            pc <= pc + 1;
                            state <= `FETCH;
                            end
                       `DEC    :begin 
                            N <= result[7];
                            Z <= (result == 8'b0);
                            C <= (A7&B7)|(B7&~result[7])|(~result[7]&A7);
                            V <= (A7&B7&~result[7])|(~A7&~B7&result[7]);
                            r[instruction[1:0]] <= result;
                            pc <= pc + 1;
                            state <= `FETCH;                       
                            end

                       `BRA    :begin 
                            pc <= program_bus;
                            state <= `FETCH;                            
                            end
                        
                       `BHI    :begin 
                            if(C==0 && Z==0) begin
                                pc <= program_bus;
                            end else begin
                                pc <= pc + 1;
                            end
                            state <= `FETCH;   
                            end
                        
                       `BEQ    :begin 
                            if(Z==1) begin
                                pc <= program_bus;
                            end else begin
                                pc <= pc + 1;
                            end
                            state <= `FETCH;  
                            end       
                    endcase
                end
                end
            
        `WRITE_BACK: begin
           case(instruction[7:2])
         `CMP_IMM:begin 

           N <= result[7];
           Z <= (result == 8'b0);
           C <= (A7&B7)|(B7&~result[7])|(~result[7]&A7);
           V <= (A7&B7&~result[7])|(~A7&~B7&result[7]);
           
           pc <= pc + 1;
           state <= `FETCH;
            end 
          
            endcase end
    endcase
    end
    end
endmodule
