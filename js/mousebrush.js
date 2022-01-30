	var linex = new Array("4");//记录轨迹x坐标
	var liney = new Array("4");//记录轨迹y坐标
	var line_xx= new Array();
	var line_yy=new Array();
	var line_drawx=new Array();
	var line_drawy=new Array();
	var line_break=new Array();
	var pre_x=0;
	var pre_y=0;
	var del_x0 = 0;
	var del_y0 = 0;
	var del_x1 = 0;
	var del_y1 = 0;
	var x_corr=0;
	var y_corr=0;
	var line_len = 45;
	var init_flag = 0;
	function draw_init()
	{
		if(init_flag==0)
		{
			init_flag=1;
			var canvas = document.getElementById('tutorial2');
			canvas.width=document.body.offsetWidth;
			canvas.height=document.body.offsetHeight;
		}
	}
	function move_to_list(x,y)//将轨迹移入数组
	{
		var lenx =linex.push(x);
		var leny =liney.push(y);
		if(lenx >= line_len || leny >=line_len)
		{
			del_x0=linex[0];
			del_y0=liney[0];
			del_x1=linex[1];
			del_y1=liney[1];
			linex.splice(0, 1);
			liney.splice(0, 1);
		}
		
	}
	
		var pre_break_point=0;
	function draw_line(x0,y0,x1,y1)
	{
		
		var canvas = document.getElementById('tutorial');
	    var ctx = canvas.getContext("2d");
		var index=0;
		var color0=ctx.createLinearGradient(0,0,document.body.offsetWidth,document.body.offsetHeight);
		color0.addColorStop(0,"black");
		color0.addColorStop("0.1","magenta");
		color0.addColorStop("0.25","blue");
		color0.addColorStop("0.35","green");
		color0.addColorStop("0.5","yellow");
		color0.addColorStop("0.67","blue");
		color0.addColorStop("0.82","green");
		color0.addColorStop("0.92","magenta");
		color0.addColorStop(1,"red");
		ctx.strokeStyle=color0;
		ctx.lineWidth=10;
		ctx.beginPath();
		ctx.moveTo(x0-7,y0-7);
		ctx.lineTo(x0-19,y0-19);
		ctx.stroke();
		ctx.closePath();
		
		ctx.beginPath();
		ctx.arc(x0-2,y0-2,1,0,2*Math.PI);
		ctx.stroke();
		ctx.closePath();
		
		
		
		ctx.beginPath();
		ctx.lineWidth=3;
		for(index=0;index<line_len-1;index++)
		{
			ctx.moveTo(linex[index],liney[index]-Math.sin((linex[index])*Math.PI/10)*5);
			ctx.lineTo(linex[index+1],liney[index+1]-Math.sin((linex[index+1])*Math.PI/10)*5);    
			ctx.stroke();
		}
		ctx.closePath();
		
		var color1=ctx.createLinearGradient(0,0,document.body.offsetWidth,document.body.offsetHeight);
		color1.addColorStop(0,"blue");
		color1.addColorStop("0.1","green");
		color1.addColorStop("0.25","black");
		color1.addColorStop("0.35","magenta");
		color1.addColorStop("0.5","yellow");
		color1.addColorStop("0.65","red");
		color1.addColorStop("0.78","green");
		color1.addColorStop("0.83","black");
		color1.addColorStop("0.90","magenta");
		color1.addColorStop("0.95","yellow");
		color1.addColorStop(1,"red");
		ctx.strokeStyle=color1;
		ctx.lineWidth=3;
		ctx.beginPath();
		for(index=0;index<line_len-1;index++)
		{
			
			ctx.moveTo(linex[index],liney[index]+Math.sin((linex[index])*Math.PI/10)*5);
			ctx.lineTo(linex[index+1],liney[index+1]+Math.sin((linex[index+1])*Math.PI/10)*5);    
			ctx.stroke();
		}
	    ctx.closePath();
		ctx.beginPath();
		for(index=0;index<line_len-1;index++)
		{
			if(linex[index]!=x0)
			{
			ctx.moveTo(linex[index],liney[index]+Math.sin((linex[index])*Math.PI/10)*5+3*(line_len-index));
			ctx.lineTo(linex[index]+2,liney[index]+Math.sin((linex[index]+2)*Math.PI/10)*5+3*(line_len-index));    
			ctx.stroke();
			}	
		}
		ctx.closePath();
		ctx.beginPath();
		for(index=0;index<line_len-1;index++)
		{
			if(linex[index]!=x0)
			{
			ctx.moveTo(linex[index],liney[index]+Math.sin((linex[index])*Math.PI/10)*5+7*(line_len-index));
			ctx.lineTo(linex[index]+2,liney[index]+Math.sin((linex[index]+2)*Math.PI/10)*5+7*(line_len-index));    
			ctx.stroke();
			}
		}
		ctx.closePath();
		
		if(get_mousedown())
		{   var canvas = document.getElementById('tutorial2');
			if(!canvas.getContext) return;
			var ctx = canvas.getContext("2d");
			ctx.strokeStyle=color1;
			ctx.lineWidth=15;
			ctx.beginPath();
			ctx.moveTo(x0,y0);
			ctx.lineTo(x1,y1);    
			ctx.stroke();
			ctx.closePath();
			
			var color3=ctx.createLinearGradient(0,0,document.body.offsetWidth,document.body.offsetHeight);
		color3.addColorStop(0,"green");
		color3.addColorStop("0.42","black");
		color3.addColorStop("0.56","red");
		color3.addColorStop("0.70","magenta");
		color3.addColorStop("0.84","yellow");
		color3.addColorStop(1,"blue");
			ctx.strokeStyle=color3;
			ctx.lineWidth=3;
			ctx.beginPath();
			ctx.moveTo(x0,y0+Math.sin((x0)*Math.PI/10)*3+5);
			ctx.lineTo(x1,y1+Math.sin((x1)*Math.PI/10)*3+5);    
			ctx.stroke();
			ctx.closePath();	
		}
		
	}
	function draw_triangle(x0,y0)
	{
		var canvas = document.getElementById('tutorial');
	    var ctx = canvas.getContext("2d");
		var color1=ctx.createLinearGradient(0,0,document.body.offsetWidth,document.body.offsetHeight);
		color1.addColorStop(0,"blue");
		color1.addColorStop("0.1","green");
		color1.addColorStop("0.25","black");
		color1.addColorStop("0.35","magenta");
		color1.addColorStop("0.5","yellow");
		color1.addColorStop("0.65","red");
		color1.addColorStop("0.78","green");
		color1.addColorStop("0.83","black");
		color1.addColorStop("0.90","magenta");
		color1.addColorStop("0.95","yellow");
		color1.addColorStop(1,"red");
		ctx.strokeStyle=color1;
		ctx.lineWidth=3;
		
		ctx.closePath();
	}
	function delete_line()
	{
		var canvas = document.getElementById('tutorial');
		if(!canvas.getContext) return;
		var ctx = canvas.getContext("2d");
		ctx.beginPath();
		ctx.clearRect(0,0,canvas.width,canvas.height);//清空画布
		ctx.closePath();
		canvas.width=document.body.offsetWidth;
		canvas.height=document.body.offsetHeight;
	}
	var mouse_flag=0;
	function draw(){
		//document.getElementById ('div').innerHTML=get_mouseX()+","+get_mouseY();
		draw_init();
		var x = get_mouseX();
		var y = get_mouseY();
		
		delete_line();
		draw_line(x,y,pre_x,pre_y);
		move_to_list(x,y);
		
		pre_x = x;
		pre_y = y;
		
	}
	
	
	setInterval(function() {draw()},2);
	