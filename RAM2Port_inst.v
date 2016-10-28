RAM2Port	RAM2Port_inst (
	.data ( data_sig ), //Length 18
	.rdaddress ( rdaddress_sig ), //Length 8
	.rdclock ( rdclock_sig ),
	.rden ( rden_sig ),
	.wraddress ( wraddress_sig ), //Length 8
	.wrclock ( wrclock_sig ),
	.wren ( wren_sig ),
	.q ( q_sig ) //Length 18
	);
