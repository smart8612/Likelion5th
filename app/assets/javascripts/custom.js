/* global */

$(document).ready(function() {
	$('.glyphicon.glyphicon-plus').click(function(){
        $('.after').slideToggle();
        
    });
});

$(document).ready(function() {
	$('.glyphicon.glyphicon-chevron-down').click(function(){
        $('.myplan_list').slideToggle();
        
    });
});

$(document).ready(function(){
    $(".fa.fa-bars").click(function(){
        $(".widget_profile_section").slideToggle();
    });
});