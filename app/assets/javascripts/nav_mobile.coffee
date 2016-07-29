$ ->

  navMobile = $('nav#nav-mobile')
  navMobile.mmenu
    extensions: [ 'border-full','fullscreen' ]
    navbar:
      add: true
      title: null
    navbars: [
      {
        position: 'top',
        content: '<p class="mmenu-header"><i class="btl bt-times mm-close-button"></i></p>',
        height: 1
      }
    ]

  # set api var
  api = navMobile.data( 'mmenu' );

  # create close button
  $('.mm-close-button').click ->
    api.close();


  # Close menu if window is resized over 768 width
  # resizeTimer

  # $(window).on('resize', function(e) {

  #   clearTimeout(resizeTimer);
  #   resizeTimer = setTimeout(function() {
  #     if ($(window).width() > 768) {
  #       api.close();
  #     }
  #   }, 250);

  # });  # Close resize function