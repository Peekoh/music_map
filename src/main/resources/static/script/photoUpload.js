$(function(){
	$("#photo-upload-container-open").hide();
})
$("#change-photo").on("click", function(){
	$("#photo-upload-container-closed").hide();
	$("#photo-upload-container-open").show();
});
