module ripple_adder (a,b,s,cout,cin);
	input [31:0] a, b;
	output [31:0] s;
	input cin;
	output cout;
	wire [30:0] c;
	adder a0(a[0],b[0],s[0],c[0],cin);
	adder a1(a[1],b[1],s[1],c[1],c[0]);
	adder a2(a[2],b[2],s[2],c[2],c[1]);
	adder a3(a[3],b[3],s[3],c[3],c[2]);
	adder a4(a[4],b[4],s[4],c[4],c[3]);
	adder a5(a[5],b[5],s[5],c[5],c[4]);
	adder a6(a[6],b[6],s[6],c[6],c[5]);
	adder a7(a[7],b[7],s[7],c[7],c[6]);
	adder a8(a[8],b[8],s[8],c[8],c[7]);
	adder a9(a[9],b[9],s[9],c[9],c[8]);
	adder a10(a[10],b[10],s[10],c[10],c[9]);
	adder a11(a[11],b[11],s[11],c[11],c[10]);
	adder a12(a[12],b[12],s[12],c[12],c[11]);
	adder a13(a[13],b[13],s[13],c[13],c[12]);
	adder a14(a[14],b[14],s[14],c[14],c[13]);
	adder a15(a[15],b[15],s[15],c[15],c[14]);
	adder a16(a[16],b[16],s[16],c[16],c[15]);
	adder a17(a[17],b[17],s[17],c[17],c[16]);
	adder a18(a[18],b[18],s[18],c[18],c[17]);
	adder a19(a[19],b[19],s[19],c[19],c[18]);
	adder a20(a[20],b[20],s[20],c[20],c[19]);
	adder a21(a[21],b[21],s[21],c[21],c[20]);
	adder a22(a[22],b[22],s[22],c[22],c[21]);
	adder a23(a[23],b[23],s[23],c[23],c[22]);
	adder a24(a[24],b[24],s[24],c[24],c[23]);
	adder a25(a[25],b[25],s[25],c[25],c[24]);
	adder a26(a[26],b[26],s[26],c[26],c[25]);
	adder a27(a[27],b[27],s[27],c[27],c[26]);
	adder a28(a[28],b[28],s[28],c[28],c[27]);
	adder a29(a[29],b[29],s[29],c[29],c[28]);
	adder a30(a[30],b[30],s[30],c[30],c[29]);
	adder a31(a[31],b[31],s[31],cout,c[30]);
endmodule
module adder(a,b,s,cout,cin);
	input a,b,cin;
	output s,cout;
	wire w1,w2,w3,w4; 
	xor
		g1(w1,a,b),
		g2(s,w1,cin);
	and
		g3(w2,cin,b),
		g4(w3,cin,a),
		g5(w4,a,b);
	or
		g6(cout, w2,w3,w4);
endmodule

module And(x,y,out);
	input[31:0] x,y;
	output[31:0] out;
	and g0(out[0],x[0],y[0]);
	and g1(out[1],x[1],y[1]);
	and g2(out[2],x[2],y[2]);
	and g3(out[3],x[3],y[3]);
	and g4(out[4],x[4],y[4]);
	and g5(out[5],x[5],y[5]);
	and g6(out[6],x[6],y[6]);
	and g7(out[7],x[7],y[7]);
	and g8(out[8],x[8],y[8]);
	and g9(out[9],x[9],y[9]);
	and g10(out[10],x[10],y[10]);
	and g11(out[11],x[11],y[11]);
	and g12(out[12],x[12],y[12]);
	and g13(out[13],x[13],y[13]);
	and g14(out[14],x[14],y[14]);
	and g15(out[15],x[15],y[15]);
	and g16(out[16],x[16],y[16]);
	and g17(out[17],x[17],y[17]);
	and g18(out[18],x[18],y[18]);
	and g19(out[19],x[19],y[19]);
	and g20(out[20],x[20],y[20]);
	and g21(out[21],x[21],y[21]);
	and g22(out[22],x[22],y[22]);
	and g23(out[23],x[23],y[23]);
	and g24(out[24],x[24],y[24]);
	and g25(out[25],x[25],y[25]);
	and g26(out[26],x[26],y[26]);
	and g27(out[27],x[27],y[27]);
	and g28(out[28],x[28],y[28]);
	and g29(out[29],x[29],y[29]);
	and g30(out[30],x[30],y[30]);
	and g31(out[31],x[31],y[31]);

endmodule


module Or(x,y,out);
	input[31:0] x,y;
	output[31:0] out;
	or g0(out[0],x[0],y[0]);
	or g1(out[1],x[1],y[1]);
	or g2(out[2],x[2],y[2]);
	or g3(out[3],x[3],y[3]);
	or g4(out[4],x[4],y[4]);
	or g5(out[5],x[5],y[5]);
	or g6(out[6],x[6],y[6]);
	or g7(out[7],x[7],y[7]);
	or g8(out[8],x[8],y[8]);
	or g9(out[9],x[9],y[9]);
	or g10(out[10],x[10],y[10]);
	or g11(out[11],x[11],y[11]);
	or g12(out[12],x[12],y[12]);
	or g13(out[13],x[13],y[13]);
	or g14(out[14],x[14],y[14]);
	or g15(out[15],x[15],y[15]);
	or g16(out[16],x[16],y[16]);
	or g17(out[17],x[17],y[17]);
	or g18(out[18],x[18],y[18]);
	or g19(out[19],x[19],y[19]);
	or g20(out[20],x[20],y[20]);
	or g21(out[21],x[21],y[21]);
	or g22(out[22],x[22],y[22]);
	or g23(out[23],x[23],y[23]);
	or g24(out[24],x[24],y[24]);
	or g25(out[25],x[25],y[25]);
	or g26(out[26],x[26],y[26]);
	or g27(out[27],x[27],y[27]);
	or g28(out[28],x[28],y[28]);
	or g29(out[29],x[29],y[29]);
	or g30(out[30],x[30],y[30]);
	or g31(out[31],x[31],y[31]);

endmodule
module Not(x,cout);
	input[31:0] x;
	input[31:0] out;
	output[31:0] cout;
	wire w1;
	not g0(out[0],x[0]);
	not g1(out[1],x[1]);
	not g2(out[2],x[2]);
	not g3(out[3],x[3]);
	not g4(out[4],x[4]);
	not g5(out[5],x[5]);
	not g6(out[6],x[6]);
	not g7(out[7],x[7]);
	not g8(out[8],x[8]);
	not g9(out[9],x[9]);
	not g10(out[10],x[10]);
	not g11(out[11],x[11]);
	not g12(out[12],x[12]);
	not g13(out[13],x[13]);
	not g14(out[14],x[14]);
	not g15(out[15],x[15]);
	not g16(out[16],x[16]);
	not g17(out[17],x[17]);
	not g18(out[18],x[18]);
	not g19(out[19],x[19]);
	not g20(out[20],x[20]);
	not g21(out[21],x[21]);
	not g22(out[22],x[22]);
	not g23(out[23],x[23]);
	not g24(out[24],x[24]);
	not g25(out[25],x[25]);
	not g26(out[26],x[26]);
	not g27(out[27],x[27]);
	not g28(out[28],x[28]);
	not g29(out[29],x[29]);
	not g30(out[30],x[30]);
	not g31(out[31],x[31]);
	ripple_adder add (32'b1,out,cout,w1,1'b0);
endmodule	

module testbench(); 
	wire [31:0] a,b,s; 
	wire cin,cout;             
	testAdder test (a,b,s,cout,cin); 
	// ripple_adder adder (a,b,s,cout,cin); 
	Not an (a,s);
endmodule

module testAdder(a,b,s,cout,cin); 
	input signed[31:0] s; 
	input cout; 
	output signed[31:0] a,b; 
	output cin; 
	reg [31:0] a,b; 
	reg cin; 
	initial
	begin
	$monitor($time,,"a=%d, b=%d, c=%b, s=%d, cout=%b",a,b,cin,s,cout); 
	#5 a =1;b=1;cin=0;
	// while (a<1024)
	// begin
		// #20 a=a*2;b=b*10;cin=0;
	// end
	#5 a=9; b=10; cin=0;
	#5 a=43; b=20; cin=0;
	#5 a=123; b=120; cin=0;

	#5 a=a-1;
	end
endmodule

