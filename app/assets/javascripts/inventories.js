$(function() {
	console.log($('.show_childs'));
	$('.show_childs').click(function () {
		console.log($('.show_childs').attr("id"));
  	});

  	$('.generic_family_spare_childs').remove();
});
