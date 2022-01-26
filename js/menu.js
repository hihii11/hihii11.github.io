var button_ID = 0;
	function b0_func()
	{
		 button_ID = 0;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_general.html";
	     if(get_select_val("menu")=="MSP432主控板")
		 	window.location.href="MSP432_PCBgeneral.html";
		 if(get_select_val("menu")=="verilog")
		 	window.location.href="verilog_general.html";
	}
	function b1_func()
	{
		 button_ID = 1;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_FRE.html";
		 if(get_select_val("menu")=="MSP432主控板")
		 	window.location.href="MSP432_PCB1.html";
		 if(get_select_val("menu")=="verilog")
		 	window.location.href="verilog_SPIDC.html";
		 
	}
	function b2_func()
	{
		 button_ID = 2;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_GPIO.html";
		 if(get_select_val("menu")=="MSP432主控板")
		 	window.location.href="MSP432_PCB2.html";
		 if(get_select_val("menu")=="verilog")
		 	window.location.href="verilog_noliner.html";
		 
	}
	function b3_func()
	{
		 button_ID = 3;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_GPIOINT.html";
		 if(get_select_val("menu")=="verilog")
		 	window.location.href="verilog_ADC0832.html";
	}
	function b4_func()
	{
		 button_ID = 4;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_Timer.html";
	}
	function b5_func()
	{
		 button_ID = 5;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_UART.html";
	}
	function b6_func()
	{
		 button_ID = 6;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_IIC.html";
	}
	function b7_func()
	{
		 button_ID = 7;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_ADC14.html";
	}
	function b8_func()
	{
		 button_ID = 8;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_PWM.html";
	}
	function b9_func()
	{
		 button_ID = 9;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_BUZZER.html";
	}
	function b10_func()
	{
		 button_ID = 10;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_roate.html";
	}
	function b11_func()
	{
		 button_ID = 11;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_EEPROM.html";
	}
	function b12_func()
	{
		 button_ID = 12;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_ADC0832.html";
	}
	function b13_func()
	{
		 button_ID = 13;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_Oscil.html";
	}
	function b14_func()
	{
		 button_ID = 14;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_motor.html";
	}
	function b15_func()
	{
		 button_ID = 15;
		 if(get_select_val("menu")=="MSP432基础函数库")
		 	window.location.href="MSP432_steer.html";
	}
	function b16_func()
	{
		 button_ID = 16;
		 if(get_select_val("menu")=="MSP432基础函数库")
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
		if(get_select_val("menu")=="MSP432基础函数库")
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
			set_button_txt("b0","总览");
			set_button_txt("b1","主频设置");
			set_button_txt("b2","GPIO");
			set_button_txt("b3","GPIO中断");
			set_button_txt("b4","定时器中断");
			set_button_txt("b5","UART串口");
			set_button_txt("b6","模拟IIC");
			set_button_txt("b7","ADC14");
			set_button_txt("b8","PWM波");
			set_button_txt("b9","蜂鸣器");
			set_button_txt("b10","旋转编码开关");
			set_button_txt("b11","EEPROM");
			set_button_txt("b12","ADC0832");
			set_button_txt("b13","虚拟示波器");
			set_button_txt("b14","电机");
			set_button_txt("b15","舵机");
			set_button_txt("b16","PID控制");
		}
		else if(get_select_val("menu")=="MSP432主控板")
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
			set_button_txt("b0","总览");
			set_button_txt("b1","1型板");
			set_button_txt("b2","2型板");
		}
		else if(get_select_val("menu")=="verilog")
		{
			set_button_display("b0",1);
			set_button_display("b1",1);
			set_button_display("b2",1);
			set_button_display("b3",1);
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
			set_button_txt("b0","总览");
			set_button_txt("b1","基于汉明编码的高速...");
			set_button_txt("b2","非线性函数协运算器");
			set_button_txt("b3","ADC0832高速采集接口");
		}
		else if(get_select_val("menu")=="上位机")
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
			set_button_txt("b0","总览");
			set_button_txt("b1","虚拟串口助手");
			set_button_txt("b2","AI训练可视化上位机");
			set_button_txt("b2","AI训练数据采集上位机");
		}
		else if(get_select_val("menu")=="智能车竞赛")
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
			set_button_txt("b0","总览");
			set_button_txt("b1","技术报告");
		}
	}
	
	function menu_refresh()
	{
		 slect_0_button_txt();
	}