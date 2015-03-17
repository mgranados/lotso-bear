
$( document ).ready(function() {
	var contador=0;

	$('#assignation_table').DataTable({
	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType"
	  // "language": {
   //              "url": "dataTables.spanish.lang.js"
   //          }
	});


	$.ajax({
		url: "/generic_families/"+$("#generic_family_id").val()+"/count_spares",
	}).done(function(number_of_spares) {
		console.log(number_of_spares.count);


		contador = number_of_spares.count;

	});

	$("#creator").click(function() {
    var val =     $("#number_spares").val();
		var code = $("#generic_family_code").val()
		if (!code){
			alert("Codigo no puede estar Vacio");
		}
		else{
	    for (i=0;i < $("#number_spares").val(); i++) {
	        $("#family_members").append('<div class="form-group"><div class="col-md-6"><label>Nombre</label><input class="form-control input-capitalize" id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_name" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][name]" type="text"></div><div class="col-md-3"><label>Código</label><input class="form-control hidden" id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_code" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][code]" type="text" value="'+$("#generic_family_code").val()+contador+'"><p>'+code+contador+'</p></div></div>');
	        contador++;
	    }
		}
    });


});
