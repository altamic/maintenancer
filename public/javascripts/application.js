// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
	// Datepicker
	$('.date').datepicker();
	
	$('toggle_control').toggle(
	  function() {$('.toggle').show()},
	  function() {$('.toggle').hide()}
	  );
});

function changeLocation(url){
  document.location.href=url;
}