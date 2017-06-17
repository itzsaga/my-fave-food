'use strict'

$(() => {
  $.getJSON('/favorites', function (data) {
    let favorites = $()
    data.forEach(fav => {
      let favorite = new Favorite(fav.id, fav.name, fav.notes)
      favorites = favorites.add(`<li>${favorite.describeFavorite()}</li>`)
    })
    $('#favorites').html(favorites)
  })
})

class Favorite {
  constructor (id, name, notes) {
    this.id = id
    this.name = name
    this.notes = notes
  }

  describeFavorite () {
    return `<a href='/items/${this.id}'>${this.name}</a> 
            is one of my favorites because: ${this.notes}`
  }
}