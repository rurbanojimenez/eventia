$(function(){
	//paso los elementos a variables
	var botonFollow = $("#botonFollow");
	var botonUnfollow = $("#botonUnfollow");
	var siguiendo = $("#invisible").text();
	
	//si sigo el evento, muestro unfollow, en caso contrario, muestro follow
	if(siguiendo == "false"){
		visibilidad(botonFollow,botonUnfollow);
	}else{
		visibilidad(botonUnfollow,botonFollow);
	}
	//el primer elemento se hará visible y el segundo invisible
	function visibilidad(elemVisible, elemInvisible){
		elemVisible.removeClass("oculto");
		elemInvisible.removeClass("visible-inline-block");
		elemVisible.addClass("visible-inline-block");
		elemInvisible.addClass("oculto");
	}

	//evento click en cada boton
	botonFollow.click(function(){
		var event_id = $(this).attr("rel");
		$.ajax({
			url: "/events/" + event_id,
			data: {
				event: {
					follower_id: $(this).attr("asdf")
				}
			},
			type: "PUT",
			success: function(){
				visibilidad(botonUnfollow,botonFollow);
			},
			error: function(){
				alert("error");
			}
		});
	});
	botonUnfollow.click(function(){
		var event_id = $(this).attr("rel");
		$.ajax({
			url:("/events/" + event_id),
			data: {
				event: {
					unfollower_id: $(this).attr("asdf")
				}
			},
			type: "PUT",
			success: function(){
				visibilidad(botonFollow,botonUnfollow);
			},
			error: function(){
				alert("error");
			}
		});
	});

});