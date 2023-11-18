`timescale 1ns / 1ps


`define ADD_REG_R1_R2  8'b00000001
`define ADD_REG_R1_R3  8'b00000010
`define ADD_REG_R1_R4  8'b00000011
`define ADD_REG_R2_R1  8'b00000100
`define ADD_REG_R2_R3  8'b00000110
`define ADD_REG_R2_R4  8'b00000111
`define ADD_REG_R3_R1  8'b00001000
`define ADD_REG_R3_R2  8'b00001001
`define ADD_REG_R3_R4  8'b00001011
`define ADD_REG_R4_R1  8'b00001100
`define ADD_REG_R4_R2  8'b00001101
`define ADD_REG_R4_R3  8'b00001110

`define SUB_R1_R2  8'b00010001
`define SUB_R1_R3  8'b00010010
`define SUB_R1_R4  8'b00010011
`define SUB_R2_R1  8'b00010100
`define SUB_R2_R3  8'b00010110
`define SUB_R2_R4  8'b00010111
`define SUB_R3_R1  8'b00011000
`define SUB_R3_R2  8'b00011001
`define SUB_R3_R4  8'b00011011
`define SUB_R4_R1  8'b00011100
`define SUB_R4_R2  8'b00011101
`define SUB_R4_R3  8'b00011110

`define MUL_R1_R2  8'b00100001
`define MUL_R1_R3  8'b00100010
`define MUL_R1_R4  8'b00100011
`define MUL_R2_R1  8'b00100100
`define MUL_R2_R3  8'b00100110
`define MUL_R2_R4  8'b00100111
`define MUL_R3_R1  8'b00101000
`define MUL_R3_R2  8'b00101001
`define MUL_R3_R4  8'b00101011
`define MUL_R4_R1  8'b00101100
`define MUL_R4_R2  8'b00101101
`define MUL_R4_R3  8'b00101110

`define CMP_REG_R1_R2  8'b00110001
`define CMP_REG_R1_R3  8'b00110010
`define CMP_REG_R1_R4  8'b00110011
`define CMP_REG_R2_R1  8'b00110100
`define CMP_REG_R2_R3  8'b00110110
`define CMP_REG_R2_R4  8'b00110111
`define CMP_REG_R3_R1  8'b00111000
`define CMP_REG_R3_R2  8'b00111001
`define CMP_REG_R3_R4  8'b00111011
`define CMP_REG_R4_R1  8'b00111100
`define CMP_REG_R4_R2  8'b00111101
`define CMP_REG_R4_R3  8'b00111110

`define MOV_R1_R2  8'b01000001
`define MOV_R1_R3  8'b01000010
`define MOV_R1_R4  8'b01000011
`define MOV_R2_R1  8'b01000100
`define MOV_R2_R3  8'b01000110
`define MOV_R2_R4  8'b01000111
`define MOV_R3_R1  8'b01001000
`define MOV_R3_R2  8'b01001001
`define MOV_R3_R4  8'b01001011
`define MOV_R4_R1  8'b01001100
`define MOV_R4_R2  8'b01001101
`define MOV_R4_R3  8'b01001110

`define LD_R1_R2  8'b01010001
`define LD_R1_R3  8'b01010010
`define LD_R1_R4  8'b01010011
`define LD_R2_R1  8'b01010100
`define LD_R2_R3  8'b01010110
`define LD_R2_R4  8'b01010111
`define LD_R3_R1  8'b01011000
`define LD_R3_R2  8'b01011001
`define LD_R3_R4  8'b01011011
`define LD_R4_R1  8'b01011100
`define LD_R4_R2  8'b01011101
`define LD_R4_R3  8'b01011110

`define ST_R1_R2  8'b01100001
`define ST_R1_R3  8'b01100010
`define ST_R1_R4  8'b01100011
`define ST_R2_R1  8'b01100100
`define ST_R2_R3  8'b01100110
`define ST_R2_R4  8'b01100111
`define ST_R3_R1  8'b01101000
`define ST_R3_R2  8'b01101001
`define ST_R3_R4  8'b01101011
`define ST_R4_R1  8'b01101100
`define ST_R4_R2  8'b01101101
`define ST_R4_R3  8'b01101110

`define NOPE      8'b01110000

`define LD_IMM_R1  8'b10000000
`define LD_IMM_R2  8'b10000001
`define LD_IMM_R3  8'b10000010
`define LD_IMM_R4  8'b10000011

`define CMP_IMM_R1  8'b10001100
`define CMP_IMM_R2  8'b10001101
`define CMP_IMM_R3  8'b10001110
`define CMP_IMM_R4  8'b10001111

`define INC_R1  8'b10010000
`define INC_R2  8'b10010001
`define INC_R3  8'b10010010
`define INC_R4  8'b10010011

`define DEC_R1  8'b10010100
`define DEC_R2  8'b10010101
`define DEC_R3  8'b10010110
`define DEC_R4  8'b10010111

`define INPUT_R1  8'b10011000
`define INPUT_R2  8'b10011001
`define INPUT_R3  8'b10011010
`define INPUT_R4  8'b10011011

`define OUTPUT_R1  8'b10011100
`define OUTPUT_R2  8'b10011101
`define OUTPUT_R3  8'b10011110
`define OUTPUT_R4  8'b10011111

`define PUSH_R1  8'b10100000
`define PUSH_R2  8'b10100001
`define PUSH_R3  8'b10100010
`define PUSH_R4  8'b10100011

`define POP_R1  8'b10100100
`define POP_R2  8'b10100101
`define POP_R3  8'b10100110
`define POP_R4  8'b10100111

`define BRAL      8'b10101000
`define BHIG      8'b10110000
`define BEQU      8'b10110100




module program_mem(
output [7:0]program_bus,
input rst,
input [7:0]program_adress
    );

reg [7:0]prog_mem[255:0];

assign program_bus = prog_mem[program_adress];


//always@(rst) begin
//if(!rst)
//begin
//prog_mem[0] = `LD_IMM_R4;
//prog_mem[1] = 8'd5;
//prog_mem[2] = `LD_IMM_R2;
//prog_mem[3] = 8'd1;
//prog_mem[4] = `DEC_R4;
//prog_mem[5] = `CMP_REG_R4_R2;
//prog_mem[6] = `BHIG;
//prog_mem[7] = 8'd4;
//prog_mem[8] = `BRAL;
//prog_mem[9] = 8'd0;
//end end



always@(rst) begin
if(!rst)
begin
prog_mem[0] = `LD_IMM_R3;
prog_mem[1] = 8'd1;
prog_mem[2] = `LD_IMM_R4;
prog_mem[3] = 8'd4;
prog_mem[4] = `LD_IMM_R2;
prog_mem[5] = 8'd1;
prog_mem[6] = `CMP_REG_R4_R2;
prog_mem[7] = `BHIG;
prog_mem[8] = 8'd12;
prog_mem[9] = `OUTPUT_R3;
prog_mem[10] = `BRAL;
prog_mem[11] = 8'd0;
//loop_start
prog_mem[12] = `MUL_R3_R4;
prog_mem[13] = `DEC_R4;
prog_mem[14] = `CMP_REG_R4_R2;
prog_mem[15] = `BHIG;
prog_mem[16] = 8'd12;
prog_mem[17] = `BRAL;
prog_mem[18] = 8'd9;
end end














//always@(rst) begin
//if(!rst)
//begin
// prog_mem[0] = `LD_IMM_R1;
// prog_mem[1] = 8'd5;
// prog_mem[2] = `LD_IMM_R2;
// prog_mem[3] = 8'd10;
// prog_mem[4] = `ADD_REG_R1_R2;
// prog_mem[5] = `OUTPUT_R1;
// prog_mem[6] = `MOV_R2_R1;
// prog_mem[7] = `INPUT_R1;
// prog_mem[8] = `NOPE;
// prog_mem[9] = `ADD_REG_R1_R2;
// prog_mem[10] = `MOV_R2_R1;
// prog_mem[11] = `OUTPUT_R2;
// prog_mem[12] = `BRAL;
// prog_mem[13] = 8'b0;

//end end



//always@(rst) begin
//if(!rst)
//begin
//    prog_mem[0]   = 8'b011100;
//    prog_mem[1]   = 8'b011100;
//    prog_mem[2]   = 8'b011100;
//    prog_mem[3]   = 8'b011100;
//    prog_mem[4]   = 8'b011100;
//    prog_mem[5]   = 8'b011100;
//    prog_mem[6]   = 8'b011100;
//    prog_mem[7]   = 8'b011100;
//    prog_mem[8]   = 8'b011100;
//    prog_mem[9]   = 8'b011100;
//    prog_mem[10]  = 8'b011100;
//    prog_mem[11]  = 8'b011100;
//    prog_mem[12]  = 8'b011100;
//    prog_mem[13]  = 8'b011100;
//    prog_mem[14]  = 8'b011100;
//    prog_mem[15]  = 8'b011100;
//    prog_mem[16]  = 8'b011100;
//    prog_mem[17]  = 8'b011100;
//    prog_mem[18]  = 8'b011100;
//    prog_mem[19]  = 8'b011100;
//    prog_mem[20]  = 8'b011100;
//    prog_mem[21]  = 8'b011100;
//    prog_mem[22]  = 8'b011100;
//    prog_mem[23]  = 8'b011100;
//    prog_mem[24]  = 8'b011100;
//    prog_mem[25]  = 8'b011100;
//    prog_mem[26]  = 8'b011100;
//    prog_mem[27]  = 8'b011100;
//    prog_mem[28]  = 8'b011100;
//    prog_mem[29]  = 8'b011100;
//    prog_mem[30]  = 8'b011100;
//    prog_mem[31]  = 8'b011100;
//    prog_mem[32]  = 8'b011100;

//end end
endmodule
