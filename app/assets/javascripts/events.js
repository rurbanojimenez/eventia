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

	function visibilidad(elemVisible, elemInvisible){
		elemVisible.removeClass("oculto");
		elemInvisible.removeClass("visible-inline-block");
		elemVisible.addClass("visible-inline-block");
		elemInvisible.addClass("oculto");
	}

	//evento click en cada boton
	botonFollow.click(function(){
		visibilidad(botonUnfollow,botonFollow);
	});
	botonUnfollow.click(function(){
		visibilidad(botonFollow,botonUnfollow);
	});

});