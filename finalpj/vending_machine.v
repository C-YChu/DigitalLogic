module vender_machine(costofticket,MoneyTopay,TotalMoney,Howmanyticket,origin,destination,money,clk,reset);

output [6:0] costofticket,MoneyTopay,TotalMoney;
reg [6:0] costofticket,MoneyTopay;

reg[6:0] TotalMoney = 7'd0;

reg [1:0]next_state,state;
input [2:0]origin,destination,Howmanyticket;
input clk,reset;
input [5:0]money;


parameter s0 = 2'd0;
parameter s1 = 2'd1;
parameter s2 = 2'd2;
parameter s3 = 2'd3;

always @(posedge clk or posedge reset)begin
	if (reset) begin
		if(TotalMoney > 0 ) begin
			$display("Charge is : %d",TotalMoney); end
		state <= s0;
		TotalMoney=6'd0;
		
	end else begin
		
		state <= next_state;
		$display("state",state);
	end
end


always @( posedge clk or money) begin

	case(state) 
	s0: begin
	costofticket = (origin < destination)?((destination-origin)+1'b1)*5:((origin-destination)+1'b1)*5;
	$display("origin :%d  destination:%d",origin,destination);
	$display("price :%d",costofticket);
	end
	s1: begin 
	MoneyTopay = costofticket * Howmanyticket;
	$display("s1: money to pay %d",MoneyTopay);
	end
	s2: begin
		TotalMoney = money+TotalMoney;
		$display("s2: TotalMoney : %d Not enough money : %d",TotalMoney,MoneyTopay-TotalMoney);
	end
	s3: 
		begin
	
	$display("s3: last Money: %d ticketamount:%d",TotalMoney-MoneyTopay,Howmanyticket);
	end
	endcase
end

always @(state)begin
	

	case(state)
	s0: next_state = s1;
	s1: next_state = s2;
	s2: begin
  	   if (MoneyTopay > TotalMoney)  next_state = s2;
	   else next_state = s3; 
	end
	s3: next_state = s0;
	default  state = s0;
	endcase


end

endmodule
