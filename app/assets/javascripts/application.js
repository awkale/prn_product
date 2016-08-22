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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require cocoon
//= require chosen-jquery
//= require scaffold
//= require jquery.ui.nestedSortable
//= require sortable_tree/initializer
//= require jquery.mmenu.min
//= require jquery.mmenu.navbars
//= require_tree .

$(function(){
  var $table = $('table'),
      $container = $('main .container'),
      $spinner = $('.spinner'),
      $limit = $('#limit'),
      $limit_form = $('#limit_form');

  // pagination - per page select and spinner
  $limit.change(function() {
    $limit_form.submit();
    setTimeout(function() {
      loadAnimation('loading');
      }, 0
    );
  });

  $('.collapse').on('show.bs.collapse', function(e) {
    if ($(this).is(e.target)) {
      var icon = $('a[href="#'+ $(this).attr('id') + '"] i');
      if (icon.hasClass('bt-angle-right')) {
        icon.removeClass('bt-angle-right').addClass('bt-angle-down');
      }
    }
  });

  $('.collapse').on('hide.bs.collapse', function(e) {
    if ($(this).is(e.target)) {
      var icon = $('a[href="#'+ $(this).attr('id') + '"] i');
      if (icon.hasClass('bt-angle-down')) {
        icon.removeClass('bt-angle-down').addClass('bt-angle-right');
      }
    }
  });

});