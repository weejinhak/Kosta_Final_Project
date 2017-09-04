
$(function() {
    $('.product').draggable();
    $('#studentlist').draggable();
    $('.product').droppable();
/*    $('.favourites').droppable({
    	activeClass: "highlight",
    	appendTo: "body",
      	drop: function(event, ui) {

        $(this).addClass('highlight');

        var favourite 	=	ui.draggable.css('background-image');
        	miniFav		=	'<span style="background-image:'+favourite+';"></span>';

		$(miniFav).appendTo('.favourites-container');
		ui.draggable.fadeOut();
  		}
	});*/
});

$(function() {
   // $('.product').sortable();
    //$(".product").disableSelection();
	
	$(".save").click(function() {
		$('.product').each(function(index) {
			var email = $(this).text(),
				position = index;
			
			console.log("ID: " + email + " | " + "position: " + position);
		});
		//ajax
		$.ajax({
			url: "stable.htm",
			type: "post",
			data : {"email":email, "position":position},
			success : function(data){
				//console.log(data);
				alert('자리값 넘김 성공');
			},
			error:function(request, status, error){
				//console.log(error);
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
			}
		});
		
	});
});
