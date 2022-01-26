function clock_set(num)
		{
			if(num < 10)
			{
				return "0"+num;
			}
			else
			{
				return num;
			}
		}
		function gettime()
		{
			 var dat=new Date();
			 var hour= clock_set(dat.getHours());
			 var mint=clock_set(dat.getMinutes());
			 var second=clock_set(dat.getSeconds());
			 var time=hour+mint+second;
			 var txt = "";
			
			 if(hour>=9 && hour<12)
			 {
				txt = "上午"
			 }
			 else if(hour>=6 && hour<9)
			 {
				 txt = "早上"
			 }
			  else if(hour>=12 && hour<18)
			 {
				 txt = "下午"
			 }
			 else if(hour>=18 && hour<24)
			 {
				 txt = "晚上"
			 }
			 else
			 {
				 txt = "凌晨"
			 }
			 document.getElementById("showtime").innerHTML ="当前时间: "+txt+
			  hour+":"+mint+":"+second;
			 
		}
		