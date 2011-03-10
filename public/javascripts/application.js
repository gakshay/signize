// common js functions
$(function() {
	$( "button, input:submit").button();
	
	$( ".resizable" ).resizable({containment: "parent", 
		stop: function(event,ui){
			setDataSize(ui.helper, ui.position);
			setDataPosition(ui.helper, ui.position);
		},
		create: function(event,ui){
			//console.log(element.data());
			
		}
	});

	$( ".draggable" ).draggable({containment: "parent", 
		stop: function(event, ui) {
			setDataPosition(ui.helper, ui.position);
			//console.log(ui.helper.data());
		},
		create: function(event, ui){
			var content = $(".vsign_content");
			var content_settings = jQuery.parseJSON($("#settings_stamp_content").val());
			if (content && content_settings){
				placeElement(content, content_settings)
			}
			
			var email = $(".vsign_email");
			var email_settings = jQuery.parseJSON($("#settings_stamp_email").val());
			if (email && email_settings){
				placeElement(email, email_settings)
			}
			
			var name = $("#vsign_name");
			var name_settings = jQuery.parseJSON($("#settings_stamp_name").val());
			if (name && name_settings){
				placeElement(name, name_settings)
			}
			
			var mobile = $("#vsign_mobile");
			var mobile_settings = jQuery.parseJSON($("#settings_stamp_mobile").val());
			if (mobile && mobile_settings){
				placeElement(mobile, mobile_settings)
			}
			
		}
	});
	
	$('.editable').editable(function(value, settings) { 
			 $(this).text(value);
			 $("#stamp_name").val(value);
	     console.log(settings);
	     return(value);
	  }, { 
	     type    : 'text',
			 onblur  : 'submit',
			 width	 : "100"
	 });
	
	
	$('#stamp_submit').click(function(e) {
		$("#settings_stamp_email").val($.toJSON($("#vsign_email").data("css")));
		$("#settings_stamp_content").val($.toJSON($("#vsign_content").data("css")));
		$("#settings_stamp_name").val($.toJSON($("#vsign_name").data("css")));
		$("#settings_stamp_mobile").val($.toJSON($("#vsign_mobile").data("css")));
	  //e.preventDefault();
	});

});

function setDataPosition(element, position){
	element.data({"css" : {'position' : {'top' : position.top, 'left': position.left}, 
													'size' : {'width' : element.width(), 'height' : element.height()},
													'class' : element.attr("id")
												}
							});
}

function setDataSize(element, size){
	element.data({"css" : {'position' : {'top' : element.position().top, 'left': element.position().left}, 
													'size' : {'width' : size.width, 'height' : size.height},
													'class' : element.attr("id")
												}
							});
}

function setCssPosition(element){
	element.css({"top" : element.data("css").position.top + "px", "left" : element.data("css").position.left + "px"});
}

function setCssSize(element){
	element.css({"width" : element.data("css").size.width + "px", "height" : element.data("css").size.height + "px"});
}

function placeElement(element, settings){
	element.css(settings.position);
	element.css(settings.size);
	setDataPosition(element, settings.position);
	setDataSize(element, settings.size);
	setCssPosition(element);
	setCssSize(element);
}

