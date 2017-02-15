/*
	Module written by Debanjan Ghatak
	CS16S033

	Execution unit test bench
*/

`include "/home/debanjan/Desktop/DDV_pro/3-Stage-Pipeline/Code/execute.v"

module execute_TestBench(
		output clk,
		output rst,

		output[ 3:0] opcode,
		output[ 3:0] destReg,
		output[15:0] srcVal1,
		output[15:0] srcVal2,
		output[ 7:0] memAddr, 
		output used1,
		output used2,

		input[ 3:0] destRegStore,
		input[15:0] destVal,
		input storeNow,
		output storeDone,

		input[ 7:0] memAddrLoadStore,
		input[15:0] memValueStore,

		output[15:0] memValueLoad,
		output valueReady,
		input readReq,

		input[15:0] ProcessorStatusWord,
	
		input powerdown
	);

	reg clk, rst;
	reg[ 3:0] opcode;
 	reg[ 3:0] destReg;
	reg[15:0] srcVal1;
	reg[15:0] srcVal2;
	reg[ 7:0] memAddr;
	reg used1;
	reg used2, storeDone, valueReady;
	reg[15:0] memValueLoad;

	executeAndStoreBack E(clk, rst, opcode, destReg, srcVal1, srcVal2, memAddr, used1, used2, destRegStore, destVal, storeNow, storeDone, memAddrLoadStore, memValueStore, memValueLoad, valueReady, readReq, ProcessorStatusWord, powerdown);

	always begin
		#1 clk = ~clk;
	end

	initial begin
		$dumpfile("execute.vcd");
    	$dumpvars(0,execute_TestBench);

	clk=0;
	rst=0;

	$monitor($time,, "clk: %b, opcode: %b, destReg: %b, srcVal1: %b ,srcVal2: %b,memAddr: %b,used1: %b,used2:,destRegStore: %b,destVal: %b,storeNow: %b,storeDone: %b,memAddrLoadStore: %b,memValueStore: %b,memValueLoad: %b,valueReady: %b,readReq: %b,ProcessorStatusWord: %b,powerdown: %b", clk, opcode, destReg, srcVal1, srcVal2, memAddr, used1, used2, destRegStore, destVal, storeNow, storeDone, memAddrLoadStore, memValueStore, memValueLoad, valueReady, readReq, ProcessorStatusWord, powerdown);

        #5
	opcode=2;
	srcVal1=24;
	srcVal2=30;
	destReg=12;
	used1=0;
	used2=0;
	
	#6
	opcode=3;
	srcVal1=25;
	srcVal2=9;
	destReg=13;
	used1=0;
	used2=0;

	#6
	opcode=5;
	srcVal1=24;
	srcVal2=5;
	destReg=11;
	used1=0;
	used2=0;

	#6
	opcode=7;
	srcVal1=56;
	srcVal2=32;
	destReg=5;
	used1=0;
	used2=0;

	#6
	opcode=9;
	srcVal1=11;
	destReg=14;
	used1=0;
	used2=0;

	#6
	opcode=15;
	memAddr=180;
	srcVal1=45;
	used1=0;
	used2=0;

	#6
	opcode=2;
	srcVal1=15;
	srcVal2=14;
	destReg=2;
	used1=1;
	used2=1;

	#550 $finish;
       end
		
endmodule