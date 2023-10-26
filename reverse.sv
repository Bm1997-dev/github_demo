`define No_of_DATA    16
`define DATA_WIDTH    8

module reverse_array();
  
  bit[(`DATA_WIDTH-1):0] in_data [`No_of_DATA];       //data input
  
  bit[(`DATA_WIDTH-1):0] temp_data;                   //use for temporary
  
  initial begin
    
    //data generating
    foreach(in_data[i]) begin
      in_data[i] = {$random};
      #5;                                               //dealy for testing purpose
    end
    $display($time, " : -------------------- in_data %p " , in_data);

    //reverse
    /*
    //apporch : 1 using for loop
    for(int i=0; i<`No_of_DATA/2; i++) begin
      temp_data = in_data[i];
      in_data[i] = in_data[`No_of_DATA-i-1];
      in_data[`No_of_DATA-i-1] = temp_data;  
    end */
    
    //apporch : 2 using streming operator
    in_data = { << (`No_of_DATA/2) {in_data}};
    $display($time, " : -------------------- in_data %p " , in_data);
  
  end 
    
endmodule