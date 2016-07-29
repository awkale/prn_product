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
  // pagination - per page select and spinner
  $('#limit').change(function() {
    $('#limit_form').submit();
    $(".spinner").delay(1000).show(0);
  });

  // hide spinner
  $(".spinner").hide();

  $(document).on("page:fetch", function(){
    $(".spinner").delay(1000).show(0);
  });

  $(document).on("page:receive", function(){
    $(".spinner").delay(800).hide(0);
  });

});