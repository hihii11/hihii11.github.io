
var CODE_txt = "";
var define_txt=""
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
}


function build()
{
	var	CODE = "";
	CODE = CODE+get_head()+"\r\n"+define_txt+"\r\n"+get_main(CODE_txt);
	editor.setValue(CODE);
}


function text_init()
{
	var init_txt = get_head()+"\r\n"+get_main(" ");
	editor.setValue(init_txt);
	editor.setSize("100%", "auto");
}

window.onload=display_pro();
window.onload=text_init();	