module mux4to1(
    input A,
    input B,
    input C,
    input D,
    input [1:0] sel, // sel[1] and sel[0]
    output Y
    );
    
    wire net1;
    wire net2;
    
    // Instantiates 3 of 2-to-1 multiplexors and connect them together
    mux2to1 L1(
        .A(A),
        .B(B),
        .sel(sel[0]),
        .Y(net1)
    );
    
    mux2to1 L2(
            .A(C),
            .B(D),
            .sel(sel[0]),
            .Y(net2)
    );
    
    mux2to1 L3(
                .A(net1),
                .B(net2),
                .sel(sel[1]),
                .Y(Y)
    );
    
endmodule