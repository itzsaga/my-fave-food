'use strict'

let itemsValues

$(() => {
  let path = $(location).attr('href')
  $.getJSON(path, function (data) {
    console.log(data)
  })
  $.getJSON('/items.json', function (data) {
    itemsValues = $.map(data, function (e) {
      return e.id
    })
  })
})

$('.js-next').on('click', function() {
  let nextIndex = itemsValues.indexOf(parseInt($('.js-next').attr('data-id'))) + 1
  $.getJSON('/items/' + itemsValues[nextIndex], function(data) {
    $('#name').html(data['name'])
    $('#rating').html(data['rating'])
    $('#notes').html(data['notes'])
    if (nextIndex === itemsValues.length)
      $('.js-next').attr('data-id', itemsValues[0])
    else
      $('.js-next').attr('data-id', data['id'])
  })
})
