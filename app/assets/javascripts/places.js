'use strict'

$(() => {
  let path = $(location).attr('href')
  $.getJSON(path, function (data) {
    if (data.items.length > 0) {
      let itemList = $()
      data.items.forEach(function (item) {
        itemList = itemList.add(`<li><strong><a href='/items/${item['id']}'>${item['name']}</a></strong>
            <ul>
                <li>Rating: ${item['rating']}</li>
                <li>Notes: ${item['notes']}</li>
            </ul>`)
      })
      $('#items').html(itemList)
    } else {
      $('#items').html('<div><h3>You have not added any items yet.</h3></div>')
    }
  })
})