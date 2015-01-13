root = exports ? this
$ ->

  $("#generic_spare_name").change ->
    $("#name_code").html $("#generic_spare_name").val().substring 0,2

  $("#generic_spare_brand").change ->
    $("#brand_code").html $("#generic_spare_brand").val().substring 0,2



  $(document).on "change",'input.child_brand_field', ->
    console.log "woot"
    child = $(this).attr('class').split(' ')[1]
    $("#child_brand_code_"+child).html $(this).val().substring 0,2

  $(document).on "change",'input.child_name_field', ->
    console.log "woot"
    child = $(this).attr('class').split(' ')[1]
    $("#child_name_code_"+child).html $(this).val().substring 0,2
