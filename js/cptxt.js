function copyText(element,area) {
		var fstline = area.firstLine();
		var lstline = area.lastLine();
		var value ="";
		var i = fstline;
		while(i<=lstline)
		{
			value = value + area.getLine(i)+"\r\n";
			i=i+1;
		}
		document.getElementById("copy_textarea").innerText = value;
		
		 var text = document.getElementById(element);
		if (document.body.createTextRange) {
			var range = document.body.createTextRange();
			range.moveToElementText(text);
			range.select();
		} else if (window.getSelection) {
			var selection = window.getSelection();
			var range = document.createRange();
			range.selectNodeContents(text);
			selection.removeAllRanges();
			selection.addRange(range);
		} else {
			console.log('none');
		}
}

	function cp_code(area)
	{
		
		document.getElementById("copy_textarea").style.display="block";
		copyText("copy_textarea",area);document.execCommand("Copy");
		document.getElementById("copy_textarea").style.display="none";
	}
    