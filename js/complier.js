
var CODE_txt = "";
var func_txt = "";
var define_txt="";
var var_txt="";
var device_num = 0;
function get_select_txt(id)
{
	var index=document.getElementById(id).selectedIndex ;
	val=document.getElementById(id).options[index].innerHTML;
	return val;
}

function display_pro()
{
	document.getElementById("line0").style.display ='none';
	document.getElementById("line1").style.display ='none';	
	document.getElementById("OLED_menu").style.display ='none';
	document.getElementById("GPIO_menu").style.display ='none';
	document.getElementById("GPIO_INT_menu").style.display ='none';
	document.getElementById("GPIO_TimerINT_menu").style.display ='none';
	document.getElementById("UART_menu").style.display ='none';
	document.getElementById("IIC_menu").style.display ='none';
	document.getElementById("ADC14_menu").style.display ='none';
	document.getElementById("ADC0832_menu").style.display ='none';
	document.getElementById("PWM_menu").style.display ='none';
	document.getElementById("steer_menu").style.display ='none';
	document.getElementById("motor_menu").style.display ='none';
	document.getElementById("encoder_menu").style.display ='none';
	document.getElementById("eeprom_menu").style.display ='none';
	document.getElementById("PID_menu").style.display ='none';
	document.getElementById("mpu6050_menu").style.display ='none';
	document.getElementById("dis_menu").style.display ='none';
	document.getElementById("option0").innerHTML =' ';
	document.getElementById("option1").innerHTML =' ';
	document.getElementById("option2").innerHTML =' ';
	document.getElementById("option3").innerHTML =' ';
	document.getElementById("option4").innerHTML =' ';
	document.getElementById("pro_sel0").innerHTML=' ';
	document.getElementById("pro_sel1").innerHTML =' ';
	document.getElementById("pro_sel2").innerHTML =' ';
	document.getElementById("pro_sel3").innerHTML =' ';
	document.getElementById("pro_sel4").innerHTML=' ';
}
function click_button0()
{
	display_pro();
	document.getElementById("line0").style.display ='block';		            
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:独立按键"+"</b>";
	document.getElementById("option0").innerHTML ='KEY1';
	document.getElementById("option1").innerHTML ='KEY2';
	document.getElementById("option2").innerHTML ='KEY3';
	document.getElementById("option3").innerHTML ='KEY4';
	document.getElementById("option4").style.display ='none';
	
}
function click_button1()
{
	display_pro();
	document.getElementById("line0").style.display ='block';		            
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:旋转编码开关"+"</b>";
	document.getElementById("option0").innerHTML ='adjust0';
}
function click_button2()
{
	display_pro();
	document.getElementById("line0").style.display ='block';		
	document.getElementById("line1").style.display ='block';         
	document.getElementById("por2").style.display ='none';    
	document.getElementById("line1_pro_sel").style.display ='block'; 
	document.getElementById("option0").innerHTML ='LED1';
	document.getElementById("option1").innerHTML ='RGBLED';
	
	document.getElementById("pro_sel0").innerHTML='灭';
	document.getElementById("pro_sel1").innerHTML ='亮';
	
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:LED"+"</b>";
	document.getElementById("line1_name").innerHTML ="<b>"+"初始电平"+"</b>";
}
function click_button3()
{
	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("OLED_menu").style.display ='block';         
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:OLED"+"</b>";
}
function click_button4()
{
	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("GPIO_menu").style.display ='block';         
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:GPIO"+"</b>";
}
function click_button5()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("GPIO_INT_menu").style.display ='block';        
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:GPIO中断"+"</b>";
}
function click_button6()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("GPIO_TimerINT_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:定时器中断"+"</b>";
}
function click_button7()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("UART_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:UART串口"+"</b>";
}
function click_button8()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("IIC_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:IIC接口"+"</b>";
}
function click_button9()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("ADC14_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:ADC14"+"</b>";
}
function click_button10()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("ADC0832_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:ADC0832"+"</b>";
}
function click_button11()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("PWM_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:PWM"+"</b>";
}
function click_button12()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("steer_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:舵机"+"</b>";
}
function click_button13()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("motor_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:电机"+"</b>";
}
function click_button14()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("encoder_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:旋转编码器"+"</b>";
}
function click_button15()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("eeprom_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:EEPROM"+"</b>";
}
function click_button16()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("PID_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:PID"+"</b>";
}
function click_button17()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("mpu6050_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:MPU6050"+"</b>";
}
function click_button18()
{
 	display_pro();		
	document.getElementById("now_device").style.display ='block';	
	document.getElementById("dis_menu").style.display ='block';      
	document.getElementById("now_device").innerHTML ="<b>"+"当前控件:超声波"+"</b>";
}
function get_head()
{
	var text_head= "/*-----------------------------------------------------\r\n"
	+"【作    者】:user_id\r\n"
	+"【单    位】:company\r\n"
	+"【时    间】:"+time_visit()+"\r\n"
	+"【库 支 持】:"+"exinlibs:http://hihii11.github.io/GWJ_BLOG.html"+"\r\n"
	+"【CCS版本 】:"+"推荐10.1.0"+"\r\n"
	+"-------------------------------------------------------*/\r\n"
	+"#include \"exinlibs\\headfile.h\"//exinlibs头文件路径\r\n\r\n\r\n"
	return text_head;
}

function get_main(code)//获取主函数
{
	var text_main ="void main(void)\r\n"
	+"{\r\n"
	+"//-------以下系统初始化程序段务必保留-------//\r\n"
	+"	system_init(1);//关闭看门狗，初始化滴答计时器。\r\n"
	+"	set_DCO_48MH();//初始化系统时钟 MCLK=48Mhz SMCLK=24Mhz\r\n"
	+"//-------以上系统初始化程序段务必保留-------//\r\n\r\n"
	+"	//-------以下为模块初始化程序段-------//\r\n"
	+code
	+"	//-------以上为模块初始化程序段-------//\r\n"
	+"	while(1)\r\n"
	+"	{\r\n"
	+"		//-------以下为应用程序段-------//\r\n"
	+"		//-------以上为应用程序段-------//\r\n"
	+"	}\r\n"
	+"}";
	return text_main;
}
					
function time_visit()
{
	 var dat=new Date();
	 var year = dat.getFullYear(); 
	 var month = dat.getMonth()+1;
	 var date = dat.getDate();
	 var hour= dat.getHours();
	 var mint=dat.getMinutes();
	 var second=dat.getSeconds();
	 var time=hour+mint+second;
	 var txt = year+"年"+month+"月"+date+"日"+hour+":"+mint;
	 return txt;
}


var PID_num=0;
function add_device()
{
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:独立按键</b>")
	{
		CODE_txt = CODE_txt
		+"		key_init("+get_select_txt("device_name")+");"
		+"//初始化按键"+get_select_txt("device_name")+"\r\n"
		+"\r\n"
		document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("device_name")+"、";
		device_num++;
		document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:旋转编码开关</b>")
	{
		if(get_select_txt("device_name")=="adjust0")
		{
			CODE_txt = CODE_txt
			+"		Rotate_INIT();"
			+"//初始化旋转编码开关"+"\r\n"
			+"\r\n";
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("device_name")+"、";
			
			
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
		}
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:LED</b>")
	{
		
		if(get_select_txt("device_name")=="LED1")
		{
			define_txt = define_txt+"//LED1引脚宏定义\r\n"
			define_txt = define_txt+"#define LED1_PORT GPIO_PORT_P1\r\n";
			define_txt = define_txt+"#define LED1_PIN  GPIO_PIN0\r\n";
			CODE_txt = CODE_txt
			+"		 gpio_init("+"LED1_PORT,"+"LED1_PIN,"+"GPO,"+get_select_val("line1_pro_sel")+");"
			+"//初始化LED1引脚(P1.0)\r\n"
			+"\r\n";
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("device_name")+"、";
			
			
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
		}
		if(get_select_txt("device_name")=="RGBLED")
		{
			define_txt = define_txt+"//RGBLED 三色引脚宏定义\r\n"
			define_txt = define_txt+"#define RED_PORT GPIO_PORT_P2\r\n";
			define_txt = define_txt+"#define RED_PIN  GPIO_PIN0\r\n";
			define_txt = define_txt+"#define GREEN_PORT GPIO_PORT_P2\r\n";
			define_txt = define_txt+"#define GREEN_PIN  GPIO_PIN1\r\n";
			define_txt = define_txt+"#define BLUE_PORT GPIO_PORT_P2\r\n";
			define_txt = define_txt+"#define BLUE_PIN  GPIO_PIN2\r\n";
			CODE_txt = CODE_txt
			+"		 gpio_init("+"RED_PORT,"+"RED_PIN,"+"GPO,"+get_select_val("line1_pro_sel")+");"
			+"//初始化RGB红色引脚(P2.0)"
			+"\r\n"
			+"		 gpio_init("+"GREEN_PORT,"+"GREEN_PIN,"+"GPO,"+get_select_val("line1_pro_sel")+");"
			+"//初始化RGB绿色引脚(P2.1)"
			+"\r\n"
			+"		 gpio_init("+"BLUE_PORT,"+"BLUE_PIN,"+"GPO,"+get_select_val("line1_pro_sel")+");"
			+"//初始化RGB蓝色引脚(P2.2)\r\n"
			+"\r\n";
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("device_name")+"、";
			
			
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
		}
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:OLED</b>")
	{
			CODE_txt = CODE_txt
			+"		OLED_Init();\r\n"
			+"		OLED_Clear();"
			+"//初始化OLED显示屏"+"\r\n"
			+"\r\n";
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("OLED_enum")+"、";
			
			
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:GPIO</b>")
	{
			CODE_txt = CODE_txt + "		gpio_init(GPIO_PORT_"+get_select_txt("GPIO_PORT_enum")+","
			+"GPIO_"+get_select_txt("GPIO_PIN_enum")+","+get_select_val("GPIO_dir_enum")+","+get_select_val("GPIO_val_enum")+");";
			
			CODE_txt = CODE_txt + "//初始化引脚P"+get_select_val("GPIO_PORT_enum")+"."+get_select_val("GPIO_PIN_enum")+"\r\n\r\n";
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+"P"+get_select_val("GPIO_PORT_enum")+"."+get_select_val("GPIO_PIN_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:GPIO中断</b>")
	{
			CODE_txt = CODE_txt + "		gpio_interrupt_INIT(GPIO_PORT_"+get_select_txt("GPIO_INTPORT_enum")+","
			+"GPIO_"+get_select_txt("GPIO_INTPIN_enum")+","+get_select_val("GPIO_edg_enum")+");\r\n";
			CODE_txt =CODE_txt+"		Interrupt_setPriority("+get_select_txt("GPIO_INTPORT_enum")+"_IRQn"+","+get_select_val("GPIO_prio_enum")+");" ;
			CODE_txt = CODE_txt + "//初始化引脚P"+get_select_val("GPIO_INTPORT_enum")+"."+get_select_val("GPIO_INTPIN_enum")+"中断"+"设置第"+get_select_txt("GPIO_prio_enum")+"优先级"+"\r\n\r\n";
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+"P"+get_select_val("GPIO_INTPORT_enum")+"."+get_select_val("GPIO_INTPIN_enum")+"中断、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:定时器中断</b>")
	{
			CODE_txt = CODE_txt + "		TimerA_CCR0INT_init("+get_select_val("GPIO_TimerINT_enum")+","
			+document.getElementById("TimerINT_T").value+");\r\n";
			CODE_txt =CODE_txt+"		Interrupt_setPriority("+get_select_txt("GPIO_TimerINT_enum")+"_0_IRQn"+","+get_select_val("TimerINT_prio_enum")+");" ;
			CODE_txt = CODE_txt + "//初始化"+get_select_txt("GPIO_TimerINT_enum")+"定时器中断，周期"+document.getElementById("TimerINT_T").value+"ms  "+"设置第"+get_select_txt("TimerINT_prio_enum")+"优先级"+"\r\n\r\n";
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_val("GPIO_TimerINT_enum")+"中断、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:UART串口</b>")
	{
			CODE_txt = CODE_txt
			+"		UART_init("
			+get_select_val("UART_enum")+","
			+document.getElementById("UART_baunds").value+");";
			
			CODE_txt = CODE_txt + "//初始化串口" + get_select_val("UART_enum")+",波特率为:"+document.getElementById("UART_baunds").value+"\r\n\r\n";
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_val("UART_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:IIC接口</b>")
	{
			CODE_txt = CODE_txt + "		IIC_init();\r\n";
			CODE_txt = CODE_txt + "		IIC_reset();//初始化IIC接口SCL:P6.4 SDA:P6.5\r\n\r\n"
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_val("IIC_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:ADC14</b>")
	{
			var ADC14_fre = parseInt(document.getElementById("ADC14_fre").value);
			var ADC14_pre =parseInt(get_select_val("ADC14_pre_enum")); 
			
			var tconvert = 0;
			if(ADC14_pre==8)
			{tconvert = 9};
			if(ADC14_pre==10)
			{tconvert = 11};
			if(ADC14_pre==12)
			{tconvert = 14};
			if(ADC14_pre==14)
			{tconvert = 16};
			
			var tbase = tconvert+5;
			var clkneed = tbase*ADC14_fre;
			
			var CLK_sel="";
			var CLK_DIV="";
			var real_fre=0;
			if(clkneed<=32768)
			{
				CLK_sel = "ADC_ACLK";
				var div=0;
				div = parseInt((32768)/clkneed);
				if(div > 8)
				{
					div = 8;
				}
				if(div < 1)
				{
					div = 1;
				}
				CLK_DIV = "ADC_DIV"+(div);
				real_fre = 32768/div/tbase/1000;
			}
			if(clkneed<=24000000 && clkneed>32768)
			{
				CLK_sel = "ADC_SMCLK";
				var div=0;
				div = parseInt((24000000)/clkneed);
				if(div > 8)
				{
					div = 8;
				}
				if(div < 1)
				{
					div = 1;
				}
				CLK_DIV = "ADC_DIV"+(div);
				real_fre = 24000000/div/tbase/1000;
			}
		if(clkneed<=48000000 && clkneed>24000000)
			{
				CLK_sel = "ADC_MCLK";
				var div=0;
				div = parseInt((48000000)/clkneed);
				if(div > 8)
				{
					div = 8;
				}
				if(div < 1)
				{
					div = 1;
				}
				CLK_DIV = "ADC_DIV"+(div);
				real_fre = 48000000/div/tbase/1000;
			}
			
			if(get_select_val("ADC14_mod_enum")=="0")
			{
				CODE_txt = CODE_txt + "		ADC14_init("+get_select_val("ADC14_CHA_enum")+","+CLK_sel+","+"ADC_DIV"+div+","
			+"ADC14_BIT"+get_select_val("ADC14_pre_enum")+");"
				CODE_txt = CODE_txt+"//初始化ADC14采样通道"+get_select_val("ADC14_CHA_enum")+"采样频率为"+real_fre.toFixed(2)+"kHz(此采样频率将被后初始化频率覆盖)\r\n\r\n";
			}
			else
			{
				CODE_txt = CODE_txt + "		ADC14_repeatmod_init("+get_select_val("ADC14_CHA_enum")+","+CLK_sel+","+"ADC_DIV"+div+","
			+"ADC14_BIT"+get_select_val("ADC14_pre_enum")+");"
				CODE_txt = CODE_txt+"//初始化ADC14采样通道ADC14_CH0~"+get_select_val("ADC14_CHA_enum")+"采样频率为"+real_fre.toFixed(2)+"kHz(此采样频率将被后初始化频率覆盖)\r\n\r\n";
			}
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("ADC14_CHA_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:ADC0832</b>")
	{
			
				CODE_txt = CODE_txt + "		ADC0832_init("+get_select_val("ADC0832_CHA_enum")+");";
				CODE_txt = CODE_txt+"//初始化ADC0832采样通道"+get_select_val("ADC0832_CHA_enum")+"\r\n\r\n";	
				document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("ADC0832_CHA_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:PWM</b>")
	{
		var duty_range = 0;
		if(get_select_val("PWM_enum")=="pwm_CHE"||get_select_val("PWM_enum")=="pwm_CHF")
		{
			var duty = 3000000/parseInt(document.getElementById("pwm_fre").value);
			duty_range = duty;
			duty = duty * parseInt(document.getElementById("pwm_duty").value)/100;
		}
		else
		{
			var duty = 24000000/parseInt(document.getElementById("pwm_fre").value);
			duty_range = duty;
			duty = duty * parseInt(document.getElementById("pwm_duty").value)/100;
		}
			
				CODE_txt = CODE_txt + "		pwm_init("+get_select_val("PWM_enum")+","+document.getElementById("pwm_fre").value+","+duty+");";
				
				CODE_txt = CODE_txt+"//初始化PWM通道"+get_select_val("PWM_enum")+"频率为:"+document.getElementById("pwm_fre").value+"Hz"+",占空比为:"+parseInt(document.getElementById("pwm_duty").value)+"%"+"占空比可填范围:0~"+duty_range+"\r\n\r\n";	
				document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("PWM_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:舵机</b>")
	{
		define_txt = define_txt +"#define	"+ get_select_val("steer_enum")+"_Midval"+"	0"
		define_txt = define_txt+"//舵机"+get_select_val("steer_enum")+"中值\r\n";
			var duty = 3000000/parseInt(document.getElementById("steer_fre").value);
							CODE_txt = CODE_txt + "		steer_pwm_init("+get_select_txt("steer_enum")+","+document.getElementById("steer_fre").value+","+get_select_val("steer_enum")+"_Midval"+");";
				
				CODE_txt = CODE_txt+"//初始化舵机通道"+get_select_val("steer_enum")+"频率为:"+document.getElementById("steer_fre").value+"Hz，"+"duty范围:0~"+duty+"\r\n\r\n";	
				document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("steer_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
		if(document.getElementById("now_device").innerHTML =="<b>当前控件:电机</b>")
	{
		define_txt = define_txt +"\#define	"+ get_select_val("motor_enum")+"_Dir"+"	1"
		define_txt = define_txt+"//电机"+get_select_val("motor_enum")+"方向参数\r\n";
		
			var duty = 24000000/parseInt(document.getElementById("motor_fre").value);
			
			CODE_txt = CODE_txt + "		Motor_PWM_INIT("+get_select_txt("motor_enum")+","+document.getElementById("motor_fre").value+");";
				
				CODE_txt = CODE_txt+"//初始化电机通道"+get_select_val("motor_enum")+"频率为:"+document.getElementById("motor_fre").value+"Hz，"+"duty范围:0~"+duty+"\r\n\r\n";	
				document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+get_select_txt("motor_enum")+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:EEPROM</b>")
	{	
			
			CODE_txt = CODE_txt + "		EEPROM_init();\r\n";
			CODE_txt = CODE_txt + "		EEPROM_reset();";
			CODE_txt = CODE_txt+"//初始化EEROM\r\n\r\n";	
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+"EEPROM、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:PID</b>")
	{	
			var_txt = var_txt + "PID_IncTypeDef PID_"+PID_num+"\r\n";
			CODE_txt = CODE_txt + "		PID_SET(& PID_"+PID_num+","+document.getElementById("target").value+","+document.getElementById("Kp").value+","+document.getElementById("Ki").value+","+document.getElementById("Kd").value+");";
			CODE_txt = CODE_txt+"//初始化PID_"+PID_num+"目标值:"+document.getElementById("target").value
			+",P:"+document.getElementById("Kp").value
			+",I:"+document.getElementById("Ki").value
			+"\r\n\r\n";	
			
		
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+"PID_"+PID_num+"、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
				PID_num++;
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:MPU6050</b>")
	{	
			define_txt = define_txt + "#define Gyrox_erro          -36    //x轴角速度误差\r\n"
			define_txt = define_txt + "#define Gyroy_erro          -27   //y轴误差\r\n"
			define_txt = define_txt + "#define Gyroz_erro          -37   //z轴误差\r\n"
			var_txt = var_txt + "//MPU6050相关参数定义\r\n"
			var_txt = var_txt + "short gx,gy,gz,ax,ay,az;\r\nfloat roll,yaw,pitch,yaw_mid;\r\n"
			
			
			func_txt = func_txt
			+"void MPU_Low_fillter_Get_Angle()//低通滤波器解算数据;\r\n"
			+"{\r\n"
			+"		float acc_roll,acc_pitch,acc_yaw;\r\n		float a = 0.9;//互补滤波系数\r\n"
			+"		MPU_Get_Gyro(&gx,&gy,&gz);\r\n		MPU_Get_Acc(&ax,&ay,&az);\r\n\r\n"
			+"		MPU_Get_Angel(ax,ay,az,&acc_roll,&acc_pitch,&acc_yaw);\r\n"
			+" 		roll =(a*(roll+(gy-Gyroy_erro)*0.005)+(1-a)*acc_roll);//5ms\r\n		pitch =(a*(pitch+(gx-Gyrox_erro)*0.005)+(1-a)*acc_pitch);//5ms\r\n"
			+"		yaw =((yaw+(gz-Gyroz_erro)*0.005));//5ms\r\n"
			+"}\r\n"
			;
			
			
			
			CODE_txt = CODE_txt + "		MPU_init();";
			CODE_txt = CODE_txt+"//MPU6050寄存器初始化"
			+"\r\n\r\n";	
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+"MPU6050、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
	if(document.getElementById("now_device").innerHTML =="<b>当前控件:超声波</b>")
	{	
			CODE_txt = CODE_txt + "		HC_SR04_init();";
			CODE_txt = CODE_txt+"//超声波测距初始化"
			+"\r\n\r\n";	
			
			document.getElementById("add_name").innerHTML = document.getElementById("add_name").innerHTML+"HC_SR04、";
			device_num++;
			document.getElementById("device_num").innerHTML ="<b>"+"已添加控件数:"+device_num+"</b>";
	}
}


function build()
{
	var	CODE = "";
	CODE = CODE+get_head()+"\r\n"+define_txt+"\r\n"+var_txt+"\r\n\r\n"+func_txt+"\r\n"+get_main(CODE_txt);
	editor.setValue(CODE);
}

function save()
{
	var	CODE = "";
	CODE = CODE+get_head()+"\r\n"+define_txt+"\r\n"+var_txt+"\r\n\r\n"+func_txt+"\r\n"+get_main(CODE_txt);
	download("main.c", editor.getValue());
}

function text_init()
{
	var init_txt = get_head()+"\r\n"+get_main(" ");
	editor.setValue(init_txt);
	editor.setSize("100%", "auto");
}

function download(filename, text) {
  var element = document.createElement('a');
  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
  element.setAttribute('download', filename);
 
  element.style.display = 'none';
  document.body.appendChild(element);
 
  element.click();
 
  document.body.removeChild(element);
}

window.onload=display_pro();
window.onload=text_init();	