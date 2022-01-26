
var button_ID = 0;
function b0_func()
{
	 button_ID = 0;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_general.html";
	 if(get_select_val("menu")=="MSP432銝餅??)
		window.location.href="MSP432_PCBgeneral.html";
	 if(get_select_val("menu")=="verilog")
		window.location.href="verilog_SPIDC.html";
}
function b1_func()
{
	 button_ID = 1;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_FRE.html";
	 if(get_select_val("menu")=="MSP432銝餅??)
		window.location.href="MSP432_PCB1.html";
	 if(get_select_val("menu")=="verilog")
		window.location.href="verilog_noliner.html";
}
function b2_func()
{
	 button_ID = 2;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_GPIO.html";
	 if(get_select_val("menu")=="MSP432銝餅??)
		window.location.href="MSP432_PCB2.html";
	 if(get_select_val("menu")=="verilog")
		window.location.href="verilog_ADC0832.html";
}
function b3_func()
{
	 button_ID = 3;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_GPIOINT.html";
}
function b4_func()
{
	 button_ID = 4;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_Timer.html";
}
function b5_func()
{
	 button_ID = 5;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_UART.html";
}
function b6_func()
{
	 button_ID = 6;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_IIC.html";
}
function b7_func()
{
	 button_ID = 7;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_ADC14.html";
}
function b8_func()
{
	 button_ID = 8;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_PWM.html";
}
function b9_func()
{
	 button_ID = 9;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_BUZZER.html";
}
function b10_func()
{
	 button_ID = 10;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_roate.html";
}
function b11_func()
{
	 button_ID = 11;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_EEPROM.html";
}
function b12_func()
{
	 button_ID = 12;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_ADC0832.html";
}
function b13_func()
{
	 button_ID = 13;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_Oscil.html";
}
function b14_func()
{
	 button_ID = 14;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_motor.html";
}
function b15_func()
{
	 button_ID = 15;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_steer.html";
}
function b16_func()
{
	 button_ID = 16;
	 if(get_select_val("menu")=="MSP432?箇??賣摨?)
		window.location.href="MSP432_PID.html";
}
function get_select_val(id)
{
	var index=document.getElementById(id).selectedIndex ;
	val=document.getElementById(id).options[index].value;
	return val;
}
function set_button_txt(id,txt)
{
	document.getElementById(id).innerHTML = txt;
}
function set_button_display(id,status)
{
	if(status==1)
		document.getElementById(id).style.display = "";
	else
		document.getElementById(id).style.display ="none";
}
function slect_0_button_txt()
{
	if(get_select_val("menu")=="1")
	{
		set_button_display("b0",1);
		set_button_display("b1",1);
		set_button_display("b2",1);
		set_button_display("b3",1);
		set_button_display("b4",1);
		set_button_display("b5",1);
		set_button_display("b6",1);
		set_button_display("b7",1);
		set_button_display("b8",1);
		set_button_display("b9",1);
		set_button_display("b10",1);
		set_button_display("b11",1);
		set_button_display("b12",1);
		set_button_display("b13",1);
		set_button_display("b14",1);
		set_button_display("b15",1);
		set_button_display("b16",1);
		set_button_txt("b0","?餉?");
		set_button_txt("b1","銝駁?霈曄蔭");
		set_button_txt("b2","GPIO");
		set_button_txt("b3","GPIO銝剜");
		set_button_txt("b4","摰?其葉??);
		set_button_txt("b5","UART銝脣");
		set_button_txt("b6","璅⊥?IIC");
		set_button_txt("b7","ADC14");
		set_button_txt("b8","PWM瘜?);
		set_button_txt("b9","?腦??);
		set_button_txt("b10","?蓮蝻?撘??);
		set_button_txt("b11","EEPROM");
		set_button_txt("b12","ADC0832");
		set_button_txt("b13","??蝷箸郭??);
		set_button_txt("b14","?菜");
		set_button_txt("b15","?菜");
		set_button_txt("b16","PID?批");
	}
	else if(get_select_val("menu")=="2")
	{
		set_button_display("b0",1);
		set_button_display("b1",1);
		set_button_display("b2",1);
		set_button_display("b3",0);
		set_button_display("b4",0);
		set_button_display("b5",0);
		set_button_display("b6",0);
		set_button_display("b7",0);
		set_button_display("b8",0);
		set_button_display("b9",0);
		set_button_display("b10",0);
		set_button_display("b11",0);
		set_button_display("b12",0);
		set_button_display("b13",0);
		set_button_display("b14",0);
		set_button_display("b15",0);
		set_button_display("b16",0);
		set_button_txt("b0","?餉?");
		set_button_txt("b1","1?");
		set_button_txt("b2","2?");
	}
	else if(get_select_val("menu")=="3")
	{
		set_button_display("b0",1);
		set_button_display("b1",1);
		set_button_display("b2",1);
		set_button_display("b3",0);
		set_button_display("b4",0);
		set_button_display("b5",0);
		set_button_display("b6",0);
		set_button_display("b7",0);
		set_button_display("b8",0);
		set_button_display("b9",0);
		set_button_display("b10",0);
		set_button_display("b11",0);
		set_button_display("b12",0);
		set_button_display("b13",0);
		set_button_display("b14",0);
		set_button_display("b15",0);
		set_button_display("b16",0);
		set_button_txt("b0","?箔?瘙?蝻?????..");
		set_button_txt("b1","?瑪?批?啣?餈???);
		set_button_txt("b2","ADC0832擃????);
	}
	else if(get_select_val("menu")=="4")
	{
		set_button_display("b0",1);
		set_button_display("b1",1);
		set_button_display("b2",1);
		set_button_display("b3",0);
		set_button_display("b4",0);
		set_button_display("b5",0);
		set_button_display("b6",0);
		set_button_display("b7",0);
		set_button_display("b8",0);
		set_button_display("b9",0);
		set_button_display("b10",0);
		set_button_display("b11",0);
		set_button_display("b12",0);
		set_button_display("b13",0);
		set_button_display("b14",0);
		set_button_display("b15",0);
		set_button_display("b16",0);
		set_button_txt("b0","?餉?");
		set_button_txt("b1","??銝脣?拇?");
		set_button_txt("b2","AI霈剔??航???雿");
		set_button_txt("b2","AI霈剔??唳??銝???);
	}
	else if(get_select_val("menu")=="5")
	{
		set_button_display("b0",1);
		set_button_display("b1",1);
		set_button_display("b2",0);
		set_button_display("b3",0);
		set_button_display("b4",0);
		set_button_display("b5",0);
		set_button_display("b6",0);
		set_button_display("b7",0);
		set_button_display("b8",0);
		set_button_display("b9",0);
		set_button_display("b10",0);
		set_button_display("b11",0);
		set_button_display("b12",0);
		set_button_display("b13",0);
		set_button_display("b14",0);
		set_button_display("b15",0);
		set_button_display("b16",0);
		set_button_txt("b0","?餉?");
		set_button_txt("b1","??舀??);
	}
}
function menu_refresh()
{
	document.getElementById("test").innerText = document.getElementById("menu").value;
	 	slect_0_button_txt();
}
