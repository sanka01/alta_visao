# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('#content').html("<%= j render(:partial => 'usuario/veiculos') %>")
#$('#')
#function getMonth(data, callback) {
#  $.ajax({
#  url: '<%= new_veiculo_path %>',
#  type: 'GET',
#  data: data,
#  success: callback
#});
#}