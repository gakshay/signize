// common js functions
$(function() {
	$( "button, input:submit").button();
	
	$( ".resizable" ).resizable({containment: "parent", stop: function(event,ui){
		element = ui.helper;
		element.data("size", {"width" : ui.size.width, "height" : ui.size.height});
		element.data("position", {"top" : ui.position.top, "left": ui.position.left});
		console.log(element.data());
		}
	});

	$( ".draggable" ).draggable({containment: "parent"});
	$( ".draggable" ).bind( "dragstop", function(event, ui) {
		element = ui.helper;
		element.data("position", {"top" : ui.position.top, "left": ui.position.left});
		console.log(element.data());
	});

});
