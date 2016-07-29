initNav = ->
  navMobile = $('nav#nav-mobile')
  navMobile.mmenu
    extensions: [ 'border-full' ]
    offCanvas: zposition: 'front'
    navbar:
      add: true
      title: null
    navbars: [
      {
        position: 'top',
        content: '<p class="mmenu-header">x</p>',
        height: 1
      }
    ]
  navMobile.css
    "opacity": 1

  console.log('lel');

  return

$ ->
  initNav()

$(document).on "page:load", ->
  initNav()