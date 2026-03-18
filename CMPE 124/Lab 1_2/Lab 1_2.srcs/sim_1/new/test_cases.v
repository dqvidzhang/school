`timescale 1ns / 1ps                                                                                                         
module part2;
    reg A, B, C, sel1, sel2;                                     
    wire Y;                                      
                                      
    main mux_inst (                                      
        .A(A),                                      
        .B(B),                                      
        .C(C),                                      
        .sel1(sel1),                                      
        .sel2(sel2),                                      
        .Y(Y)                                      
    );                                      
                                      
    // Test cases
        initial begin
            A = 0; B = 0; C = 0; sel1 = 0; sel2 = 0; #10;
            A = 0; B = 0; C = 0; sel1 = 0; sel2 = 1; #10;
            A = 0; B = 0; C = 1; sel1 = 0; sel2 = 0; #10;
            A = 0; B = 1; C = 0; sel1 = 0; sel2 = 1; #10;
            A = 1; B = 0; C = 0; sel1 = 0; sel2 = 0; #10;
            A = 1; B = 1; C = 0; sel1 = 0; sel2 = 1; #10;
            A = 0; B = 0; C = 1; sel1 = 1; sel2 = 0; #10;
            A = 1; B = 0; C = 1; sel1 = 1; sel2 = 1; #10;
            $finish;
        end
    
    
    initial begin                    
        $monitor("At time = %t | A = %b | B = %b | C = %b | sel1 = %b | sel2 = %b | Y = %b", 
                 $time, A, B, C, sel1, sel2, Y);                                        
    end                                      

endmodule


