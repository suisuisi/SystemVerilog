module top_module(
    input logic clk,
    input logic reset,
    input logic ena,
    output logic pm,
    output logic [7:0] hh,
    output logic [7:0] mm,
    output logic [7:0] ss); 
    
    //ss var
    var logic [3:0] ss_one , ss_ten ;
    var logic ena_ss_one , ena_ss_ten ;
    var logic rst_ss_one , rst_ss_ten ;
    
    //mm var
    var logic [3:0] mm_one , mm_ten ;
    var logic ena_mm_one , ena_mm_ten ;
    var logic rst_mm_one , rst_mm_ten ;
    
    //hh var
    var logic [3:0] hh_one , hh_ten ;
    var logic ena_hh_one , ena_hh_ten ;
    var logic rst_hh_one_0 , rst_hh_one_1 , rst_hh_ten_0 , rst_hh_ten_1 ;
    
    //pm var
    var logic rev_pm ;
    
    
    //ss cout part
    assign ena_ss_one = ena ;
    assign rst_ss_one = ena_ss_one && (ss_one == 4'd9) ;
    
    always_ff@(posedge clk) begin
        if(reset)           ss_one <= '0 ;
        else if(ena_ss_one) begin
            if(rst_ss_one)  ss_one <= '0 ;
            else            ss_one <= ss_one + 4'd1 ;
        end
    end
    
    assign ena_ss_ten = rst_ss_one ;
    assign rst_ss_ten = ena_ss_ten && (ss_ten == 4'd5) ;
    
    always_ff@(posedge clk) begin
        if(reset)           ss_ten <= '0 ;
        else if(ena_ss_ten) begin
            if(rst_ss_ten)  ss_ten <= '0 ;
            else            ss_ten <= ss_ten + 4'd1 ;
        end
    end
   
    
    //mm cout part
    
    assign ena_mm_one = rst_ss_ten ;
    assign rst_mm_one = ena_mm_one && (mm_one == 4'd9) ;
       
    always_ff@(posedge clk) begin
        if(reset)           mm_one <= '0 ;
        else if(ena_mm_one) begin
            if(rst_mm_one)  mm_one <= '0 ;
            else            mm_one <= mm_one + 4'd1 ;
        end
    end 
    
    
    assign ena_mm_ten = rst_mm_one ;
    assign rst_mm_ten = ena_mm_ten && (mm_ten == 4'd5) ;
    
    always_ff@(posedge clk) begin
        if(reset)           mm_ten <= '0 ;
        else if(ena_mm_ten) begin
            if(rst_mm_ten)  mm_ten <= '0 ;
            else            mm_ten <= mm_ten + 4'd1 ;
        end
    end
    
    //hh cout part
    
    assign ena_hh_one = rst_mm_ten ;
    assign rst_hh_one_0 = ena_hh_one && (hh_one == 4'd9) ;
    assign rst_hh_one_1 = ena_hh_one && (hh_one == 4'd2 && hh_ten == 4'd1) ;
    
    always_ff@(posedge clk) begin
        if(reset)             hh_one <= 4'd2 ;
        else if(ena_hh_one) begin
            if(rst_hh_one_0)  hh_one <= 4'd0 ;
            else if(rst_hh_one_1)           
                              hh_one <= 4'd1 ;
            else              hh_one <= hh_one + 4'd1 ;
        end
    end 
    
    
    assign ena_hh_ten = ena_hh_one ;
    assign rst_hh_ten_0 = ena_hh_ten && (hh_one == 4'd2 && hh_ten == 4'd1) ;
    assign rst_hh_ten_1 = ena_hh_ten && (hh_one == 4'd9) ;
    
    always_ff@(posedge clk) begin
        if(reset)             hh_ten <= 4'd1 ;
        else if(ena_hh_ten) begin
            if(rst_hh_ten_0)  hh_ten <= 4'd0 ;
            else if(rst_hh_ten_1)            
                              hh_ten <= 4'd1 ;
        end
    end
    
    
    //pm display part
    
    assign rev_pm = (hh_ten == 4'd1) && (hh_one == 4'd1) && ena_hh_one ;
    
    always_ff@(posedge clk) begin
        if(reset)       pm <= '0  ;
        else if(rev_pm) pm <= ~pm ;
    end
    

    //assign time output
    
    assign ss = {ss_ten,ss_one} ;
    assign mm = {mm_ten,mm_one} ;
    assign hh = {hh_ten,hh_one} ;
endmodule
