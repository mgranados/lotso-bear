$( document ).ready(function() {
var contador=0;
$("#creator").click(function() {
	var val = 	$("#number_spares").val();
	for (i=0;i < $("#number_spares").val(); i++) {
		$("#family_members").append('<input id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_name" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][name]" type="text">');
		$("#family_members").append('<input id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_code" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][code]" type="text">');
		contador++;
	}


	})
});
