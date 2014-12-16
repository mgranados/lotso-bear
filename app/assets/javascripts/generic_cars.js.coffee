$ ->
  $("#generic_car_gen_continues").click ->
    $("#generic_car_last_generation_year").toggleClass 'check'
    if $('#generic_car_last_generation_year').hasClass 'check'
      d = new Date
      $('#generic_car_last_generation_year').val -> d.getFullYear()
    else
      $('#generic_car_last_generation_year').val -> ""
