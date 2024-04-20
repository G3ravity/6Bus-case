function mpc = case_6bus																								
																								
%% MATPOWER Case Format : Version 2																								
mpc.version = '2';																								
																								
%%-----  Power Flow Data  -----%%																								
%% system MVA base																								
mpc.baseMVA = 100;																								
																								
%% bus data																								
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin											
mpc.bus = [																								
	% Area 1																							
	1	3	0	 0	0	0	1	1.05	0	230	1	1.05	1.05;											
	2	2	0	 0	0	0	1	1.05	0	230	1	1.05	1.05;											
	3	2	50 0	0	0	1	1.07	0	230	1	1.07	1.07;											
	4	1	50 0	0	0	1	1	    0	230	1	1.05	0.95;											
	5	1	50 0	0	0	1	1	    0	230	1	1.05	0.95;											
	6	1	0	 0	0	0	1	1	    0	230	1	1.05	0.95;											
    ];																								
																								
%% generator data																								
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf	min_dn	min_up	
mpc.gen = [																								
	% 																							
	1	0	0	200	-80	  1.05	100	 4	250	50	0	0	0	0	0	0	0.8333333  0	0	0	0	4	4	% G1
  2	0	0	70	-40	  1.05	100	-3	200	10	0	0	0	0	0	0	0.6666667  0	0	0	0	4	4	% G2
  % wind farms
	4	0	0	999	-999	1.05	100	-3	999	0	0	0	0	0	0	0	999 	0	0	0	0	3	2	% W1
	6	0	0	999	-999	1	    100	 0	999	0	0	0	0	0	0	0	999	  0	0	0	0	3	2	% W2
];																								
																								
%% branch data													
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [																								
	1	2	0	0.17	0	250	200	200	0	0	1	-360	360;
	1	4	0	0.258	0	250	100	100	0	0	1	-360	360;
	2	3	0	0.197	0	250	100	100	0	0	1	-360	360;
	2	4	0	0.018	0	250	100	100	0	0	1	-360	360;
	3	6	0	0.037	0	800	100	100	0	0	1	-360	360;
	4	5	0	0.037	0	250	100	100	0	0	1	-360	360;
	5	6	0	0.14	0	250	100	100	0	0	1	-360	360;
];													
																							
								
%% generator cost data										
%	1	startup	shutdown	n	x1	y1	...	xn	yn	
%	2	startup	shutdown	n	c(n-1)	...	c0			
mpc.gencost = [																			
	2	120	0	3	0.00049876	16.83315	220.57661			% G1
 	2	500	0	3	0.0012461	40.62286	161.86839			  % G2
  %
  2	0	0	3	0.006231	21.93312	171.22788		% W1
	2	0	0	3	0.006231	21.93312	171.22788		% W2
];										
																						
%% area data																								
%	area	refbus    reserveUp    reserveDn																						
mpc.areas = [																								
	1	1	50	50;	  															
];																								
