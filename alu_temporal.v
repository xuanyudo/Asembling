module project2(a,b,opcode,beqout,flow,out);
	wire [31:0] cout;
	wire set,fout;
	input[31:0] a,b;
	input[2:0] opcode;
	output[31:0] out;
	output flow,beqout;
	alu_1 alu0(a[0],b[0],opcode[2],set,opcode,out[0],cout[0]);
	alu_1 alu1(a[1],b[1],cout[0],0,opcode,out[1],cout[1]);
	alu_1 alu2(a[2],b[2],cout[1],0,opcode,out[2],cout[2]);
	alu_1 alu3(a[3],b[3],cout[2],0,opcode,out[3],cout[3]);
	alu_1 alu4(a[4],b[4],cout[3],0,opcode,out[4],cout[4]);
	alu_1 alu5(a[5],b[5],cout[4],0,opcode,out[5],cout[5]);
	alu_1 alu6(a[6],b[6],cout[5],0,opcode,out[6],cout[6]);
	alu_1 alu7(a[7],b[7],cout[6],0,opcode,out[7],cout[7]);
	alu_1 alu8(a[8],b[8],cout[7],0,opcode,out[8],cout[8]);
	alu_1 alu9(a[9],b[9],cout[8],0,opcode,out[9],cout[9]);
	alu_1 alu10(a[10],b[10],cout[9],0,opcode,out[10],cout[10]);
	alu_1 alu11(a[11],b[11],cout[10],0,opcode,out[11],cout[11]);
	alu_1 alu12(a[12],b[12],cout[11],0,opcode,out[12],cout[12]);
	alu_1 alu13(a[13],b[13],cout[12],0,opcode,out[13],cout[13]);
	alu_1 alu14(a[14],b[14],cout[13],0,opcode,out[14],cout[14]);
	alu_1 alu15(a[15],b[15],cout[14],0,opcode,out[15],cout[15]);
	alu_1 alu16(a[16],b[16],cout[15],0,opcode,out[16],cout[16]);
	alu_1 alu17(a[17],b[17],cout[16],0,opcode,out[17],cout[17]);
	alu_1 alu18(a[18],b[18],cout[17],0,opcode,out[18],cout[18]);
	alu_1 alu19(a[19],b[19],cout[18],0,opcode,out[19],cout[19]);
	alu_1 alu20(a[20],b[20],cout[19],0,opcode,out[20],cout[20]);
	alu_1 alu21(a[21],b[21],cout[20],0,opcode,out[21],cout[21]);
	alu_1 alu22(a[22],b[22],cout[21],0,opcode,out[22],cout[22]);
	alu_1 alu23(a[23],b[23],cout[22],0,opcode,out[23],cout[23]);
	alu_1 alu24(a[24],b[24],cout[23],0,opcode,out[24],cout[24]);
	alu_1 alu25(a[25],b[25],cout[24],0,opcode,out[25],cout[25]);
	alu_1 alu26(a[26],b[26],cout[25],0,opcode,out[26],cout[26]);
	alu_1 alu27(a[27],b[27],cout[26],0,opcode,out[27],cout[27]);
	alu_1 alu28(a[28],b[28],cout[27],0,opcode,out[28],cout[28]);
	alu_1 alu29(a[29],b[29],cout[28],0,opcode,out[29],cout[29]);
	alu_1 alu30(a[30],b[30],cout[29],0,opcode,out[30],cout[30]);
	alu_2 alu(a[31],b[31],cout[30],0,opcode,out[31],flow,set);
	or #1
		o(fout,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15],out[16],out[17],out[18],out[19],out[20],out[21],out[22],out[23],out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31]);
	not #1
		no(beqout,fout);
	

endmodule
module alu_1(a,b,cin,less,opcode,out,cout);
	input[2:0] opcode;
	input a,b,cin,less;
	output out,cout;
	wire w1,w2,w3,w4,w5;
	wire[2:0] newOP;
	and #1
		a1(w1,a,b);
	or #1
		o1(w2,a,b);
	not #1
		no(w3,b);
	convertBeq convert(newOP,opcode);
	Smallmux submux(w4,newOP[2],b,w3);
	adder add(a,w4,w5,cout,cin);
	Bigmux bm(out,newOP[1:0],w1,w2,w5,less);
		
endmodule
module alu_2(a,b,cin,less,opcode,out,flow,set);
	input[2:0] opcode;
	input a,b,cin,less;
	output out,flow,set;
	wire w1,w2,w3,w4,w5,cout,binvert;
	wire[2:0] newOP;
	and #1
		a1(w1,a,b);
	or #1
		o1(w2,a,b);
	not #1
		no(w3,b);
	convertBeq convert(newOP,opcode);
	Smallmux submux(w4,newOP[2],b,w3);
	adder add(a,w4,w5,cout,cin);
	Bigmux bm(out,newOP[1:0],w1,w2,w5,less);
	xor #1
		xo(flow,cout,cin),
		xo2(set,w5,flow);
endmodule
module adder(a,b,s,cout,cin);
	input a,b,cin;
	output s,cout;
	wire w1,w2,w3,w4; 
	xor #1
		g1(w1,a,b),
		g2(s,w1,cin);
	and #1
		g3(w2,cin,b),
		g4(w3,cin,a),
		g5(w4,a,b);
	or #1
		g6(cout, w2,w3,w4);
endmodule
module Smallmux(cout,opcode,a,b);
	output cout;
	input opcode,a,b;
	wire w1,w2,w3;
	not #1 n1(w1,opcode);
	and #1
		a1(w2,w1,a),
		a2(w3,opcode,b);
	or #1
		o1(cout,w2,w3);
		
endmodule
module Bigmux(cout,opcode,a,b,c,d);
	input[1:0] opcode;
	input a,b,c,d;
	output cout;
	wire w1,w2,w3,w4,w5,w6;
	not #1
		n1(w1,opcode[0]),
		n2(w2,opcode[1]);
	and #1
		a1(w3,w1,w2,a),
		a2(w4,opcode[0],w2,b),
		a3(w5,w1,opcode[1],c),
		a4(w6,opcode[0],opcode[1],d);
	or #1
		o1(cout,w3,w4,w5,w6);
endmodule
module convertBeq(cout,opcode);
	input[2:0] opcode;
	output[2:0] cout;
	or #1 o1(cout[1],opcode[1],opcode[2]);
	and #1
		a1(cout[0],opcode[0],1'b1),
		a2(cout[2],opcode[2],1'b1);
endmodule
	
module test(a,b,opcode,beqout,flow,out); 
	input signed[31:0] out;
	input flow,beqout;
	output [31:0] a,b;
	output[2:0] opcode;
	reg[2:0] opcode;
	reg signed[31:0] a,b;
	project2 alu_32(a,b,opcode,beqout,flow,out);
		
	initial begin
		$monitor($time,,"a=%d b=%d opcode=%b out=%d flow=%d beqout=%d",a,b,opcode,out,flow,beqout);
			#100	a=335;b=-13;opcode=010;
			#100	a=-185;b=-918;opcode=110;
			#100	a=879;b=-842;opcode=010;
			#100	a=220;b=56;opcode=110;
			#100	a=61;b=800;opcode=111;
			#100	a=-168;b=334;opcode=001;
			#100	a=348;b=280;opcode=111;
			#100	a=-204;b=-491;opcode=100;
			#100	a=663;b=-904;opcode=000;
			#100	a=-826;b=-838;opcode=100;
			#100	a=385;b=-335;opcode=000;
			
			



		end
endmodule

