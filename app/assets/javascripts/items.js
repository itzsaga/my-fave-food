'use strict'

$(() => {
  let path = $(location).attr('href')
  $.getJSON(path, function (data) {
    console.log(data)
  })
})