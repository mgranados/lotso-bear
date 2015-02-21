$( document ).ready(function() {
var contador=0;
$("#creator").click(function() {
	var val = 	$("#number_spares").val();
	for (i=0;i < $("#number_spares").val(); i++) {
		$("#family_members").append('<div class="form-group"><div class="col-md-6"><label>Nombre</label><input class="form-control" id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_name" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][name]" type="text"></div><div class="col-md-3"><label>Codigo</label><input class="form-control" id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_code" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][code]" type="text" value="'+$("#generic_family_code").val()+contador+'"></div></div>');


		contador++;
	}


	})
});
