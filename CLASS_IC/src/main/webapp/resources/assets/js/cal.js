$( ".open" ).click(function() {
	$(".modal").removeClass("out");
	$(".modal").addClass("in");
	setTimeout(function() {
    $(".modal").css("z-index", "1000");
		$(".modal").css("height", "250px");
		$(".modal").css("width", "550px");
		$(".modal").css("padding", "20px");
	}, 700);
	setTimeout(function() {
		$(".modal-container").fadeIn("slow");
	}, 900);
	$(".circle").addClass("circle-active");
	setTimeout(function() {
		$(".circle").removeClass("circle-active");
		$(".circle").addClass("circle-hide");
	}, 800);
});

$( ".close" ).click(function() {
	$(".modal-container").fadeOut("fast");
	$(".circle").removeClass("circle-hide");
	setTimeout(function() {
		$(".modal").removeClass("in");
		$(".modal").addClass("out");
	}, 150);
	setTimeout(function() {
    $(".modal").css("z-index", "0");
		$(".modal").css("height", "0");
		$(".modal").css("width", "0");
		$(".modal").css("padding", "0");
	}, 150);
});


