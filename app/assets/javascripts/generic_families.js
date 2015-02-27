
$( document ).ready(function() {

	//add a function to jQuery so we can call it on our jQuery collections
	$.fn.capitalize = function () {

	    //iterate through each of the elements passed in, `$.each()` is faster than `.each()
	    $.each(this, function () {

	        //split the value of this input by the spaces
	        var split = this.value.split(' ');

	        //iterate through each of the "words" and capitalize them
	        for (var i = 0, len = split.length; i < len; i++) {
	            split[i] = split[i].charAt(0).toUpperCase() + split[i].slice(1);
	        }

	        //re-join the string and set the value of the element
	        this.value = split.join(' ');
	    });
	    return this;
	};



	$('#assignation_table').DataTable({
	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType"
	  // "language": {
   //              "url": "dataTables.spanish.lang.js"
   //          }

	});

	var contador=0;
	$("#creator").click(function() {
    var val =     $("#number_spares").val();
    for (i=0;i < $("#number_spares").val(); i++) {
        $("#family_members").append('<div class="form-group"><div class="col-md-6"><label>Nombre</label><input class="form-control input-capitalize" id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_name" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][name]" type="text"></div><div class="col-md-3"><label>Código</label><input class="form-control hidden" id="generic_family_spare_likelihoods_attributes_'+contador+'_generic_spare_attributes_code" name="generic_family[spare_likelihoods_attributes]['+contador+'][generic_spare_attributes][code]" type="text" value="'+$("#generic_family_code").val()+contador+'"><p>'+$("#generic_family_code").val()+contador+'</p></div></div>');


        contador++;
    }


    });


});