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
  let nextIndex
  let dataIdIndex = itemsValues.indexOf(parseInt($('.js-next').attr('data-id')))
  if (dataIdIndex === itemsValues.length - 1)
    nextIndex = 0
  else
    nextIndex = dataIdIndex + 1
  $.getJSON('/items/' + itemsValues[nextIndex], function(data) {
    $('#name').html(`${data['name']} - 
        <a href="/items/${data['id']}/edit">Edit</a> - 
        <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/items/${data['id']}">Delete</a>`)
    $('#rating').html(`Rating: ${data['rating']}`)
    $('#notes').html(`Notes: ${data['notes']}`)
    $('.js-next').attr('data-id', data['id'])
  })
})
