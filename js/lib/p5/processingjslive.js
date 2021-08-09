$(function() {
	
	
	// do all the processingjs live stuff
	_.each($(".processingjslive"), function(liveelement) {
		
		var textarea = $(liveelement).find("textarea")[0];
		var canvas = $(liveelement).find("canvas")[0];
		var processing = new Processing(canvas, $(textarea).val());
	
		$(textarea).before("<div class='processing-header'><h3 class='title'>Processing Console</h3><a href='#' class='processing-runit'>Run</a></div>");
		
		$(liveelement).find("a.processing-runit").click(function() {
			var processing = new Processing(canvas, $(textarea).val());
			return false;
		});
		
	});
	
	// hide the legalnotices
	$(".titlepage .copyright").click(function() {
		$(".titlepage .legalnotice").toggle();
	}); 
	
	
});