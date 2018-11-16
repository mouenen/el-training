$(document).on 'turbolinks:load', ->
  $("#datetimepicker").datetimepicker({
    format: 'YYYY-MM-DD hh:mm:ss',
    todayBtn: true,
    locale: 'ru'
  })