
B
Command: %s
53*	vivadotcl2
phys_opt_designZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2

xc7a100tZ17-347h px� 
p
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2

xc7a100tZ17-349h px� 
R

Starting %s Task
103*constraints2
Initial Update TimingZ18-103h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.135 . Memory (MB): peak = 1998.789 ; gain = 5.875h px� 
�
^PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: %ss |  WALL: %ss
566*	vivadotcl2
0.002
0.16Z4-1435h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1998.7892
0.000Z17-268h px� 
O

Starting %s Task
103*constraints2
Physical SynthesisZ18-103h px� 
^

Phase %s%s
101*constraints2
1 2#
!Physical Synthesis InitializationZ18-101h px� 
n
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
2Z32-721h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.1342	
-14.487Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 13b41154e
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.135 . Memory (MB): peak = 1998.824 ; gain = 0.035h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.1342	
-14.487Z32-619h px� 
V

Phase %s%s
101*constraints2
2 2
DSP Register OptimizationZ18-101h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
S
%s*common2:
8Phase 2 DSP Register Optimization | Checksum: 13b41154e
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.138 . Memory (MB): peak = 1998.824 ; gain = 0.035h px� 
W

Phase %s%s
101*constraints2
3 2
Critical Path OptimizationZ18-101h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.1342	
-14.487Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2B
vga_instance/text_reg[20]_6[2]vga_instance/text_reg[20]_6[2]8Z32-702h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2B
vga_instance/centerDistance[0]vga_instance/centerDistance[0]2
18Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2B
vga_instance/centerDistance[0]vga_instance/centerDistance[0]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.1012	
-14.388Z32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2B
vga_instance/centerDistance[1]vga_instance/centerDistance[1]2
28Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2B
vga_instance/centerDistance[1]vga_instance/centerDistance[1]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.0802	
-14.325Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
#vga_instance/centerDistance[1]_repN#vga_instance/centerDistance[1]_repN8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[20][3]_i_6_n_0 vga_instance/text[20][3]_i_6_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[20][3]_i_8_n_0 vga_instance/text[20][3]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[20][3]_i_15_n_0!vga_instance/text[20][3]_i_15_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[20][3]_i_15_n_0!vga_instance/text[20][3]_i_15_n_02J
"vga_instance/text[20][3]_i_15_comp	"vga_instance/text[20][3]_i_15_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_19_n_0!vga_instance/text[20][3]_i_19_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.9642	
-13.977Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[20][3]_i_11_n_0!vga_instance/text[20][3]_i_11_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[20][3]_i_11_n_0!vga_instance/text[20][3]_i_11_n_02J
"vga_instance/text[20][3]_i_11_comp	"vga_instance/text[20][3]_i_11_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_19_n_0!vga_instance/text[20][3]_i_19_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.9042	
-13.797Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[20][3]_i_9_n_0 vga_instance/text[20][3]_i_9_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[20][3]_i_19_n_0!vga_instance/text[20][3]_i_19_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_02@
vga_instance/text[20][3]_i_13	vga_instance/text[20][3]_i_138Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.8732	
-13.704Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[20][3]_i_19_n_0!vga_instance/text[20][3]_i_19_n_02N
$vga_instance/text[20][3]_i_19_comp_2	$vga_instance/text[20][3]_i_19_comp_28Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.8052	
-13.500Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[20][3]_i_10_n_0!vga_instance/text[20][3]_i_10_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_02@
vga_instance/text[20][3]_i_13	vga_instance/text[20][3]_i_138Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.7952	
-13.481Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[20][3]_i_10_n_0!vga_instance/text[20][3]_i_10_n_02J
"vga_instance/text[20][3]_i_10_comp	"vga_instance/text[20][3]_i_10_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.7502	
-13.369Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2B
vga_instance/text_reg[33]_2[1]vga_instance/text_reg[33]_2[1]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth26
vga_instance/Distance[5]vga_instance/Distance[5]2>
vga_instance/Distance_reg[5]	vga_instance/Distance_reg[5]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth26
vga_instance/Distance[5]vga_instance/Distance[5]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.7402	
-13.048Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_02@
vga_instance/text[20][3]_i_13	vga_instance/text[20][3]_i_138Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.6432	
-12.756Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth26
vga_instance/Distance[0]vga_instance/Distance[0]2>
vga_instance/Distance_reg[0]	vga_instance/Distance_reg[0]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth26
vga_instance/Distance[0]vga_instance/Distance[0]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.6302	
-12.717Z32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth26
vga_instance/Distance[6]vga_instance/Distance[6]2
18Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth26
vga_instance/Distance[6]vga_instance/Distance[6]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.6282	
-12.711Z32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth26
vga_instance/Distance[4]vga_instance/Distance[4]2
18Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth26
vga_instance/Distance[4]vga_instance/Distance[4]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.6202	
-12.687Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth26
vga_instance/Distance[6]vga_instance/Distance[6]2>
vga_instance/Distance_reg[6]	vga_instance/Distance_reg[6]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth26
vga_instance/Distance[6]vga_instance/Distance[6]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.6032	
-12.618Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
172
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2F
 vga_instance/text[20][3]_i_2_n_0 vga_instance/text[20][3]_i_2_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5972	
-12.525Z32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth26
vga_instance/Distance[1]vga_instance/Distance[1]2
28Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth26
vga_instance/Distance[1]vga_instance/Distance[1]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5872	
-12.489Z32-619h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[20][3]_i_15_n_0!vga_instance/text[20][3]_i_15_n_02N
$vga_instance/text[20][3]_i_15_comp_1	$vga_instance/text[20][3]_i_15_comp_18Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][3]_i_13_n_0!vga_instance/text[20][3]_i_13_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5852	
-12.385Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
vga_instance/Distance[1]_repNvga_instance/Distance[1]_repN8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_3_n_0 vga_instance/text[33][3]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_8_n_0 vga_instance/text[33][3]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][3]_i_16_n_0!vga_instance/text[33][3]_i_16_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[33][3]_i_16_n_0!vga_instance/text[33][3]_i_16_n_02J
"vga_instance/text[33][3]_i_16_comp	"vga_instance/text[33][3]_i_16_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][3]_i_14_n_0!vga_instance/text[33][3]_i_14_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5712	
-12.243Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_6_n_0 vga_instance/text[33][3]_i_6_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2F
 vga_instance/text[33][3]_i_6_n_0 vga_instance/text[33][3]_i_6_n_02H
!vga_instance/text[33][3]_i_6_comp	!vga_instance/text[33][3]_i_6_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][3]_i_14_n_0!vga_instance/text[33][3]_i_14_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5452	
-12.195Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][3]_i_10_n_0!vga_instance/text[33][3]_i_10_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[33][3]_i_10_n_0!vga_instance/text[33][3]_i_10_n_02J
"vga_instance/text[33][3]_i_10_comp	"vga_instance/text[33][3]_i_10_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][3]_i_14_n_0!vga_instance/text[33][3]_i_14_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5372	
-12.055Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2B
vga_instance/text_reg[20]_6[1]vga_instance/text_reg[20]_6[1]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
212
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2F
 vga_instance/text[20][3]_i_4_n_0 vga_instance/text[20][3]_i_4_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.5022	
-11.766Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[20][0]_i_2_n_3$vga_instance/text_reg[20][0]_i_2_n_38Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[20][0]_i_5_n_0$vga_instance/text_reg[20][0]_i_5_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
262
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][0]_i_31_n_0!vga_instance/text[20][0]_i_31_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.4752	
-11.322Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_2_n_3$vga_instance/text_reg[33][0]_i_2_n_38Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_5_n_0$vga_instance/text_reg[33][0]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_31_n_0!vga_instance/text[33][0]_i_31_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_8_n_6$vga_instance/text_reg[33][0]_i_8_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_32_n_0%vga_instance/text_reg[33][0]_i_32_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
252
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_74_n_0!vga_instance/text[33][0]_i_74_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.4472	
-11.238Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_28_n_0!vga_instance/text[33][0]_i_28_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_3_n_7$vga_instance/text_reg[33][0]_i_3_n_78Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_8_n_0$vga_instance/text_reg[33][0]_i_8_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[33][0]_i_36_n_0!vga_instance/text[33][0]_i_36_n_02@
vga_instance/text[33][0]_i_36	vga_instance/text[33][0]_i_368Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_36_n_0!vga_instance/text[33][0]_i_36_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.4372	
-11.208Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[33][0]_i_35_n_0!vga_instance/text[33][0]_i_35_n_02@
vga_instance/text[33][0]_i_35	vga_instance/text[33][0]_i_358Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_35_n_0!vga_instance/text[33][0]_i_35_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.4242	
-11.169Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[33][0]_i_34_n_0!vga_instance/text[33][0]_i_34_n_02@
vga_instance/text[33][0]_i_34	vga_instance/text[33][0]_i_348Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_34_n_0!vga_instance/text[33][0]_i_34_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3972	
-11.088Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
252
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_75_n_0!vga_instance/text[33][0]_i_75_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3732	
-11.016Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_69_n_0!vga_instance/text[33][0]_i_69_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][3]_i_13_n_7%vga_instance/text_reg[33][3]_i_13_n_78Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_4_n_0$vga_instance/text_reg[33][0]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_21_n_0!vga_instance/text[33][0]_i_21_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[33][0]_i_17_n_0!vga_instance/text[33][0]_i_17_n_02@
vga_instance/text[33][0]_i_17	vga_instance/text[33][0]_i_178Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_17_n_0!vga_instance/text[33][0]_i_17_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3672	
-10.998Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_4_n_5$vga_instance/text_reg[33][0]_i_4_n_58Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_14_n_0%vga_instance/text_reg[33][0]_i_14_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!vga_instance/text[33][0]_i_45_n_0!vga_instance/text[33][0]_i_45_n_02@
vga_instance/text[33][0]_i_45	vga_instance/text[33][0]_i_458Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_45_n_0!vga_instance/text[33][0]_i_45_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3652	
-10.992Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth28
vga_instance/Distance[10]vga_instance/Distance[10]2@
vga_instance/Distance_reg[10]	vga_instance/Distance_reg[10]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth28
vga_instance/Distance[10]vga_instance/Distance[10]8Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3542	
-10.827Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[20][0]_i_28_n_0!vga_instance/text[20][0]_i_28_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[20][0]_i_3_n_7$vga_instance/text_reg[20][0]_i_3_n_78Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[20][0]_i_8_n_0$vga_instance/text_reg[20][0]_i_8_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
282
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[20][0]_i_40_n_0!vga_instance/text[20][0]_i_40_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3452	
-10.737Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_19_n_0!vga_instance/text[33][0]_i_19_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2H
!vga_instance/text[33][0]_i_19_n_0!vga_instance/text[33][0]_i_19_n_02J
"vga_instance/text[33][0]_i_19_comp	"vga_instance/text[33][0]_i_19_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!vga_instance/text[33][0]_i_15_n_0!vga_instance/text[33][0]_i_15_n_08Z32-735h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3382	
-10.716Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_48_n_0!vga_instance/text[33][0]_i_48_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_44_n_0!vga_instance/text[33][0]_i_44_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_83_n_6%vga_instance/text_reg[33][0]_i_83_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2R
&vga_instance/text_reg[33][0]_i_109_n_0&vga_instance/text_reg[33][0]_i_109_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
"vga_instance/text[33][0]_i_120_n_0"vga_instance/text[33][0]_i_120_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
vga_instance/p_5_in[1]vga_instance/p_5_in[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLK_IBUFCLK_IBUF8Z32-702h px� 
v
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLKCLK8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2B
vga_instance/text_reg[33]_2[1]vga_instance/text_reg[33]_2[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
vga_instance/Distance[1]_repNvga_instance/Distance[1]_repN8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_3_n_0 vga_instance/text[33][3]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_8_n_0 vga_instance/text[33][3]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][3]_i_16_n_0!vga_instance/text[33][3]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_2_n_3$vga_instance/text_reg[33][0]_i_2_n_38Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_31_n_0!vga_instance/text[33][0]_i_31_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_8_n_6$vga_instance/text_reg[33][0]_i_8_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_69_n_0!vga_instance/text[33][0]_i_69_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_4_n_5$vga_instance/text_reg[33][0]_i_4_n_58Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_48_n_0!vga_instance/text[33][0]_i_48_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_44_n_0!vga_instance/text[33][0]_i_44_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_83_n_6%vga_instance/text_reg[33][0]_i_83_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
"vga_instance/text[33][0]_i_120_n_0"vga_instance/text[33][0]_i_120_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
vga_instance/p_5_in[1]vga_instance/p_5_in[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLK_IBUFCLK_IBUF8Z32-702h px� 
v
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLKCLK8Z32-702h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3382	
-10.716Z32-619h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0042

2007.8752
0.000Z17-268h px� 
T
%s*common2;
9Phase 3 Critical Path Optimization | Checksum: 13b41154e
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 2007.875 ; gain = 9.086h px� 
W

Phase %s%s
101*constraints2
4 2
Critical Path OptimizationZ18-101h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3382	
-10.716Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2B
vga_instance/text_reg[33]_2[1]vga_instance/text_reg[33]_2[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
vga_instance/Distance[1]_repNvga_instance/Distance[1]_repN8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_3_n_0 vga_instance/text[33][3]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_8_n_0 vga_instance/text[33][3]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][3]_i_16_n_0!vga_instance/text[33][3]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_2_n_3$vga_instance/text_reg[33][0]_i_2_n_38Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_5_n_0$vga_instance/text_reg[33][0]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_31_n_0!vga_instance/text[33][0]_i_31_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_8_n_6$vga_instance/text_reg[33][0]_i_8_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_32_n_0%vga_instance/text_reg[33][0]_i_32_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_69_n_0!vga_instance/text[33][0]_i_69_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_4_n_5$vga_instance/text_reg[33][0]_i_4_n_58Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_14_n_0%vga_instance/text_reg[33][0]_i_14_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_48_n_0!vga_instance/text[33][0]_i_48_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_44_n_0!vga_instance/text[33][0]_i_44_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_83_n_6%vga_instance/text_reg[33][0]_i_83_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2R
&vga_instance/text_reg[33][0]_i_109_n_0&vga_instance/text_reg[33][0]_i_109_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
"vga_instance/text[33][0]_i_120_n_0"vga_instance/text[33][0]_i_120_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
vga_instance/p_5_in[1]vga_instance/p_5_in[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLK_IBUFCLK_IBUF8Z32-702h px� 
v
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLKCLK8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2B
vga_instance/text_reg[33]_2[1]vga_instance/text_reg[33]_2[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
vga_instance/Distance[1]_repNvga_instance/Distance[1]_repN8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_3_n_0 vga_instance/text[33][3]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2F
 vga_instance/text[33][3]_i_8_n_0 vga_instance/text[33][3]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][3]_i_16_n_0!vga_instance/text[33][3]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_2_n_3$vga_instance/text_reg[33][0]_i_2_n_38Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_31_n_0!vga_instance/text[33][0]_i_31_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_8_n_6$vga_instance/text_reg[33][0]_i_8_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_69_n_0!vga_instance/text[33][0]_i_69_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
$vga_instance/text_reg[33][0]_i_4_n_5$vga_instance/text_reg[33][0]_i_4_n_58Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_48_n_0!vga_instance/text[33][0]_i_48_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2H
!vga_instance/text[33][0]_i_44_n_0!vga_instance/text[33][0]_i_44_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
%vga_instance/text_reg[33][0]_i_83_n_6%vga_instance/text_reg[33][0]_i_83_n_68Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
"vga_instance/text[33][0]_i_120_n_0"vga_instance/text[33][0]_i_120_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
vga_instance/p_5_in[1]vga_instance/p_5_in[1]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLK_IBUFCLK_IBUF8Z32-702h px� 
v
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2
CLKCLK8Z32-702h px� 
r
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-1.3382	
-10.716Z32-619h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

2007.8752
0.000Z17-268h px� 
T
%s*common2;
9Phase 4 Critical Path Optimization | Checksum: 13b41154e
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 2007.875 ; gain = 9.086h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2007.8752
0.000Z17-268h px� 
w
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-1.3382	
-10.716Z32-603h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  DSP Register   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path  |          0.796  |          3.771  |            7  |              0  |                    32  |           0  |           2  |  00:00:04  |
|  Total          |          0.796  |          3.771  |            7  |              0  |                    32  |           0  |           3  |  00:00:04  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2007.8752
0.000Z17-268h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 1d4fe0cd2
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 2007.875 ; gain = 9.086h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2882
22
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
phys_opt_designZ4-42h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

2016.7032
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:002
00:00:00.0752

2016.7032
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

2016.7032
0.000Z17-268h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote RouteStorage: 2

00:00:002
00:00:00.0142

2016.7032
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.0022

2016.7032
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0052

2016.7032
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:002
00:00:00.1032

2016.7032
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2_
]C:/Users/quick/Desktop/UTSAfall2024/DSD/projects/lab3/lab3.runs/impl_1/final_proj_physopt.dcpZ17-1381h px� 


End Record