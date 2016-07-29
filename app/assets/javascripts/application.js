// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require cocoon
//= require chosen-jquery
//= require scaffold
//= require turbolinks
//= require jquery.ui.nestedSortable
//= require sortable_tree/initializer


$(function(){
  var $table = $('table'),
      $container = $('main .container'),
      $spinner = $('.spinner'),
      $limit = $('#limit'),
      $limit_form = $('#limit_form');
  // pagination - per page select and spinner
  $limit.change(function() {
    $limit_form.submit();
    loadAnimation('loading');
  });


  // hide spinner
  $spinner.hide();

  var loadAnimation = function(speed) {
    if (speed == 'loading') {
      $container.addClass('faded');
      $spinner.show();
    } else {
      $container.removeClass('faded');
      $spinner.hide();
    }
  }


  $(document).on("page:fetch", function(){
    setTimeout(function() {
      loadAnimation('loading');
      }, 1000
    );
  });

  $(document).on("page:receive", function(){
    setTimeout(function() {
      loadAnimation('');
      }, 1000
    );
  });
});