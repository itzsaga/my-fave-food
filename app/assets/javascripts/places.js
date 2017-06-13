'use strict'

$(() => {
  let path = $(location).attr('href')
  $.getJSON(path, function (data) {
    if (data.items.length > 0) {
      console.log('more than zero')
    } else {
      $('#items').html('<div><h3>You have not added any items yet.</h3></div>')
    }
  })
})