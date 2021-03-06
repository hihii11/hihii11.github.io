# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CLK_DIV" -parent ${Page_0}
  set C_S0_AXI_DATA_WIDTH [ipgui::add_param $IPINST -name "C_S0_AXI_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_S0_AXI_DATA_WIDTH}
  set C_S0_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_S0_AXI_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of S_AXI address bus} ${C_S0_AXI_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_S0_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S0_AXI_HIGHADDR" -parent ${Page_0}


}

proc update_PARAM_VALUE.CLK_DIV { PARAM_VALUE.CLK_DIV } {
	# Procedure called to update CLK_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_DIV { PARAM_VALUE.CLK_DIV } {
	# Procedure called to validate CLK_DIV
	return true
}

proc update_PARAM_VALUE.C_S0_AXI_DATA_WIDTH { PARAM_VALUE.C_S0_AXI_DATA_WIDTH } {
	# Procedure called to update C_S0_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S0_AXI_DATA_WIDTH { PARAM_VALUE.C_S0_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S0_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S0_AXI_ADDR_WIDTH { PARAM_VALUE.C_S0_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S0_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S0_AXI_ADDR_WIDTH { PARAM_VALUE.C_S0_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S0_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S0_AXI_BASEADDR { PARAM_VALUE.C_S0_AXI_BASEADDR } {
	# Procedure called to update C_S0_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S0_AXI_BASEADDR { PARAM_VALUE.C_S0_AXI_BASEADDR } {
	# Procedure called to validate C_S0_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S0_AXI_HIGHADDR { PARAM_VALUE.C_S0_AXI_HIGHADDR } {
	# Procedure called to update C_S0_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S0_AXI_HIGHADDR { PARAM_VALUE.C_S0_AXI_HIGHADDR } {
	# Procedure called to validate C_S0_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S0_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S0_AXI_DATA_WIDTH PARAM_VALUE.C_S0_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S0_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S0_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S0_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S0_AXI_ADDR_WIDTH PARAM_VALUE.C_S0_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S0_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S0_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.CLK_DIV { MODELPARAM_VALUE.CLK_DIV PARAM_VALUE.CLK_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_DIV}] ${MODELPARAM_VALUE.CLK_DIV}
}

