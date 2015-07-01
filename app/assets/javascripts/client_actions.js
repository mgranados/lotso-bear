var ready;
ready = function() {
  
        $( ".search" ).click( function( ) {
          $(".show-car").html("<%= asset_path('loading.gif') %>").show();
          var code = $("#userInput").val();
          $.ajax( {
            type: "POST",
    	       url: "/get_client_car",
    	       data: {code:code}
           });
        } );

        $(document).keypress(function(e) {
          if(e.which == 13) {
          	$(".show-car").html("<%= asset_path('loading.gif') %>").show();
	          var code = $("#userInput").val();
	          $.ajax( {
	            type: "POST",
	    	       url: "/get_client_car",
	    	       data: {code:code}
	           });
	        } 
	    });


}

$( document ).ready( ready );
$( document ).on( "page:load", ready );
