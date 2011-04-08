$(function() {
	$("#text-editor-close-button").click(function(){
		$("design_area_editor").ckeditorGet().destroy();
	});
});
