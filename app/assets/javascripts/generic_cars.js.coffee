$ ->
  # Masks
  $.mask.definitions['0']='[12]';
  $("#generic_car_years").mask("0999-0999")
  $("#generic_car_year").mask("0999");


  # Function that togles the class after gen_continues checkbox is selected, when loading the view for the first time
  $("#generic_car_last_generation_year").toggleClass 'check' if $("#generic_car_gen_continues").is(":checked")


  # Variable for maintaining the value before selection gen_continues checkbox

  $("#generic_car_gen_continues").click ->
    if $("#generic_car_gen_continues").is(":checked")
      $("#generic_car_years").mask("0999")
      $(".continua").html("*La Generación Continua <br> Ejemplo: 2001")
      $(".title-change").html("Primer Año")
    else
      $("#generic_car_years").mask("0999-0999")
      $(".continua").html("Ejemplo: 2001-2004")
      $(".title-change").html("Años")


  # Start DataTables
  $('#genericCars').dataTable()

  #Coocon
  $("#generic_images a.add_fields").
    data("association-insertion-method", 'append').
    data("association-insertion-node", '#image_fields');
