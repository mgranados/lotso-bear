$ ->
  $("#generic_spare_name").change ->
    $("#name_code").html $("#generic_spare_name").val().substring 0,2

  $("#generic_spare_brand").change ->
    $("#brand_code").html $("#generic_spare_brand").val().substring 0,2
