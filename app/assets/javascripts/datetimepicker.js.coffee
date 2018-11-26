$(document).on 'turbolinks:load', ->
  $("#datetimepicker").datetimepicker({
    format: 'YYYY-MM-DD HH:mm:ss'
  })