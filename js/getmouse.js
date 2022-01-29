var x=0;
var y=0;
var mouseDown = 0;
onload = function ()
{
   // var div = document.getElementById ('div')
	document.onmousemove = function (e)
	{
		e = e || window.event;
		//div.innerHTML = (e.clientX + ',' + e.clientY);
		x = e.pageX - document.body.offsetLeft;
		y =e.pageY - document.body.offsetTop;
	}
}

function onmousedown1(){ 
    mouseDown = 1;
}
function tiononmouseup1 () {
    mouseDown = 0;
}
function get_mousedown()
{
	return mouseDown;
}
function get_mouseX()
{
	return x;
}
function get_mouseY()
{
	return y;
}

