# select simulation target:
#TOP = component_tb
TOP = MH7442_tb


simulation: ../rtl/*.vhd ../rtl_tb/*.vhd
	ghdl -a --std=08 $^
	ghdl -e --std=08 $(TOP)
	ghdl -r --std=08 $(TOP)  --vcd=wave.vcd


view: wave.vcd
	gtkwave  wave.vcd  --save=wavee.gtkw


clean:
	rm -f $(TOP)
	rm -f wave.vcd
	rm -f *.o
	rm -f *.cf
