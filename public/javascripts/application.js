// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

(function($) { 

  var show_filter_panel = function () {
    $('fieldset.toggle').slideDown();
  }
  
  var hide_filter_panel = function () {
    $('fieldset.toggle').slideUp();
  }
  
  $(function(){
  	// Datepicker
  	$('.date').datepicker();
    $('fieldset.toggle').hide();
    // Filter panel toggle commandd
  	$('#filter_panel_link').toggle(show_filter_panel, hide_filter_panel);
  });

})(jQuery); 

function changeLocation(url){
  document.location.href=url;
}