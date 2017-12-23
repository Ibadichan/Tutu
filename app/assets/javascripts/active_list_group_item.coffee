$ ->
  $('a.list-group-item').on 'click', (e) ->
    $('a.list-group-item').removeClass('active')
    $(this).addClass('active')
