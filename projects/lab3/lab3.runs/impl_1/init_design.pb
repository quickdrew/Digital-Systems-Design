
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:052

00:00:062	
471.7542	
184.512Z17-268h px� 
e
Command: %s
53*	vivadotcl24
2link_design -top final_proj -part xc7a100tcsg324-1Z4-113h px� 
U
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_1Z12-437h px� 
X
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_1Z12-434h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2e
cc:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp2
vga_instance/v1/clk_instZ1-454h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0102	
909.5352
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
141Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
T
Netlist was created with %s %s291*project2
Vivado2
2023.2Z1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
LRemoving redundant IBUF, %s, from the path connected to top-level port: %s 
35*opt2,
*vga_instance/v1/clk_inst/inst/clkin1_ibufg2
CLKZ31-35h px� 
�
�Could not create '%s' constraint because net '%s' is not directly connected to top level port. '%s' is ignored for synthesis but preserved for implementation.
528*constraints2
IBUF_LOW_PWR2$
 vga_instance/v1/clk_inst/clk_in12
IBUF_LOW_PWR8Z18-550h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2m
ic:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2!
vga_instance/v1/clk_inst/inst	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2m
ic:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2!
vga_instance/v1/clk_inst/inst	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2g
cc:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2!
vga_instance/v1/clk_inst/inst	8Z20-848h px� 
�
%Done setting XDC timing constraints.
35*timing2g
cc:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2
548@Z38-35h px� 
�
Deriving generated clocks
2*timing2g
cc:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2
548@Z38-2h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
get_clocks: 2

00:00:062

00:00:062

1612.2152	
582.672Z17-268h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2g
cc:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2!
vga_instance/v1/clk_inst/inst	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2n
jC:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.srcs/constrs_1/imports/Downloads/final_proj.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2n
jC:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.srcs/constrs_1/imports/Downloads/final_proj.xdc8Z20-178h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1612.2152
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
102
22
02
0Z4-41h px� 
K
%s completed successfully
29*	vivadotcl2
link_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
link_design: 2

00:00:102

00:00:112

1612.2152

1126.148Z17-268h px� 


End Record