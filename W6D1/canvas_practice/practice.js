document.addEventListener("DOMContentLoaded", function(){
	var canvas = document.getElementById("mycanvas");
	canvas.width = 500;
	canvas.height = 500;

	var ctx = canvas.getContext("2d");

	//rectangle
	ctx.fillStyle = 'red';
	ctx.fillRect(10, 10, 55, 55);

	//circle
	ctx.beginPath();
	ctx.arc(75, 75, 50, 0, 2 * Math.PI);
	ctx.strokeStyle = 'blue';
	ctx.lineWidth = 10;
	ctx.stroke();

	ctx.fillStyle = 'green';
	ctx.fill();

});
