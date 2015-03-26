$( document ).ready(function() {
var contID = 1000;
  $("[name='helper']").click(function (){
    var id = $(this).attr('id')
    var name =  $("#nameHelper"+id).val();
    var code = $("#codeHelper"+id).val();
    $('#familyTable > tbody:last').append('<tr><td><input value="'+name+'" id="car_type_type_likelihoods_attributes_'+contID+'_generic_family_attributes_name" name="car_type[type_likelihoods_attributes]['+contID+'][generic_family_attributes][name]" type="text" value="Puerta Derecha"></td><td><input value="'+code+'" id="car_type_type_likelihoods_attributes_'+contID+'_generic_family_attributes_code" name="car_type[type_likelihoods_attributes]['+contID+'][generic_family_attributes][code]" type="text" value="FA"></td><td><input id="car_type_type_likelihoods_attributes_'+contID+'_years" name="car_type[type_likelihoods_attributes]['+contID+'][years]" placeholder="2001-2003" type="text"></td><td></td><td></td></tr>');
    contID++;
  });

  $(".hide_spares").click(function (){
  	var spares = $(this).attr("id"); 
  	if ($("." + spares).hasClass("hidden"))
  		$("." + spares).removeClass("hidden");
  	else
  		$("." + spares).addClass("hidden");

  });


});
