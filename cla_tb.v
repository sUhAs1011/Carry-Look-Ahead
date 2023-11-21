module Test_CLA_4bit;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [4:0] S;
    wire Cout;
    wire PG;
    wire GG;

    // Instantiate the Unit Under Test (UUT)
    CLA_4bit uut (
    .S(S), 
    .Cout(Cout), 
    .PG(PG), 
    .GG(GG), 
    .A(A), 
    .B(B), 
    .Cin(Cin)
    );

    initial begin
    // Initialize Inputs
    A = 0;  B = 0;  Cin = 0;
    // Wait 100 ns for global reset to finish
    #10;
        
    // Add stimulus here
    A=4'b0001;B=4'b0000;Cin=1'b0;
    #10 A=4'b0100;B=4'b0011;Cin=1'b0;
    #10 A=4'b1111;B=4'b1010;Cin=1'b1;
    #10 A=4'b1000;B=4'b0001;Cin=1'b0;
    #10 A=4'b1111;B=4'b1010;Cin=1'b0;
    end 
 
    initial begin
 $monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b PG=%b GG=%b",A,B,Cin,S,Cout,PG,GG);
    end   
    initial
    begin
    $dumpfile ("CLA_4bit.vcd");
    $dumpvars(0, Test_CLA_4bit);
end   
endmodule