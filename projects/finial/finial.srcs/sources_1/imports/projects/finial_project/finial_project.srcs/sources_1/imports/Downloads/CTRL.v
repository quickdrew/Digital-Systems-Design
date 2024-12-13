 module CTRL(CLK, seg_tmr, DIST, pulse_width);
input CLK;
input seg_tmr;
input [15:0] DIST;

output [12:0] pulse_width;

reg [12:0] controlled_pulse_width = 1100;
reg [15:0] Distance = 0;


assign pulse_width = controlled_pulse_width;

always @(posedge seg_tmr)
begin
	Distance = DIST;
        
    if(Distance <= 600)
    begin
        controlled_pulse_width <= 1595; // Less extreme
    end
    else if((Distance > 600) & (Distance <=  700))
    begin
        controlled_pulse_width <= 1575; // Gradual decrease
    end
    else if((Distance > 700) & (Distance <=  800))
    begin
        controlled_pulse_width <= 1560; // Gradual decrease
    end
    else if((Distance > 800) & (Distance <=  900))
    begin
        controlled_pulse_width <= 1545; // Gradual decrease
    end
    else if((Distance > 900) & (Distance <=  1000))
    begin
        controlled_pulse_width <= 1530; // Gradual decrease
    end
    else if((Distance > 1000) & (Distance <=  1100))
    begin
        controlled_pulse_width <= 1515; // Gradual decrease
    end
    else if((Distance > 1100) & (Distance <=  1200))
    begin
        controlled_pulse_width <= 1500; // Gradual decrease
    end
    else if((Distance > 1200) & (Distance <=  1300))
    begin
        controlled_pulse_width <= 1490; // Gradual decrease
    end
    else if((Distance > 1300) & (Distance <=  1400))
    begin
        controlled_pulse_width <= 1480; // Gradual decrease
    end
    else if((Distance > 1400) & (Distance <=  1500))
    begin
        controlled_pulse_width <= 1475; // Gradual decrease
    end
    else if((Distance > 1500) & (Distance <= 1550))
    begin
        controlled_pulse_width <= 1470; // Gradual decrease
    end
    else if((Distance > 1550) & (Distance <= 1600))
    begin
        controlled_pulse_width <= 1465; // CENTER: Fine-tuned center value
    end
    else if((Distance > 1600) & (Distance <= 1800))
    begin
        controlled_pulse_width <= 1463; // Gradual decrease outward
    end
    else if((Distance > 1650) & (Distance <= 1700))
    begin
        controlled_pulse_width <= 1460; // Gradual decrease outward
    end
    else if((Distance > 1700) & (Distance <= 1750))
    begin
        controlled_pulse_width <= 1458; // Gradual decrease outward
    end
    else if((Distance > 1750) & (Distance <= 1800))
    begin
        controlled_pulse_width <= 1456; // Gradual decrease outward
    end
    else if((Distance > 1800) & (Distance <= 2100))
    begin
        controlled_pulse_width <= 1445; // Gradual decrease outward
    end
    else if((Distance > 2100) & (Distance <= 2200))
    begin
        controlled_pulse_width <= 1435; // Gradual decrease outward
    end
    else if((Distance > 2200) & (Distance <= 2300))
    begin
        controlled_pulse_width <= 1425; // Gradual decrease outward
    end
    else if((Distance > 2300) & (Distance <= 2400))
    begin
        controlled_pulse_width <= 1415; // Gradual decrease outward
    end
    else if((Distance > 2400) & (Distance <= 2500))
    begin
        controlled_pulse_width <= 1405; // Gradual decrease outward
    end
    else if((Distance > 2500) & (Distance <= 2600))
    begin
        controlled_pulse_width <= 1395; // Gradual decrease outward
    end
    else if((Distance > 2600) & (Distance <= 2700))
    begin
        controlled_pulse_width <= 1385; // Gradual decrease outward
    end
    else if((Distance > 2700) & (Distance <= 2800))
    begin
        controlled_pulse_width <= 1375; // Gradual decrease outward
    end
    else if(Distance > 2800)
    begin
        controlled_pulse_width <= 1370; // Less extreme
    end
    else
    begin
        //Default: 1500 us
        //Nothing.
    end   
    

end


endmodule
