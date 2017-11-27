module mux8to1(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    input H,
    input [2:0] sel,
    output Y
    );
    
    wire net1;
    wire net2;
    

    mux4to1 L1(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(sel[1:0]),
        .Y(net1)
    );
    
    mux4to1 L2(
            .A(E),
            .B(F),
            .C(G),
            .D(H),
            .sel(sel[1:0]),
            .Y(net2)
    );
    
    mux2to1 L3(
                .A(net1),
                .B(net2),
                .sel(sel[2]),
                .Y(Y)
    );
    
endmodule