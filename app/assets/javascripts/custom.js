/* global */


$(document).ready(function() {
	$('.myplan_plus').click(function(){
        var index = $('.myplan_plus').index(this);
        $('.after').eq(index).slideToggle();
    });
});

$(document).ready(function() {
	$(".fa.fa-chevron-down").click(function(){
        var index = $(".fa.fa-chevron-down").index(this);
        $(".myplan_list").eq(index).slideToggle();
    });
});

$(document).ready(function() {
  $('select').material_select();
});

//test
