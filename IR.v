/*
    IR主要功能是完成对来自IM的指令的缓冲。
    1	复位	if rst=1, instr0
    2	缓冲	if rst=0, instrim_dout
*/
`timescale 1ns / 1ns
module IR
        (
            input [31:0] im_dout,       //指令输入
            input irwr,                 //写使能信号
            input rst,                  //复位信号
            input clk,                  //时钟信号
            output reg [31:0] instr     //指令输出
        )；


        always@(posedge clk, negedge rst)
        begin
            if(rst==1'b0)   //缓冲
                instr = im_dout;
            else            //复位
                instr = 32'h00000000;
        end



endmodule