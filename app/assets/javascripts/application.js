// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tether
//= require cable
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function () {
  // Closes the sidebar menu
  $("#menu-close").click(function(e) {
      e.preventDefault();
      $("#sidebar-wrapper").toggleClass("active");
  });
  // Opens the sidebar menu
  $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#sidebar-wrapper").toggleClass("active");
  });
  // Scrolls to the selected menu item on the page
  $(function() {
      $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
          if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
              var target = $(this.hash);
              target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
              if (target.length) {
                  $('html,body').animate({
                      scrollTop: target.offset().top
                  }, 1000);
                  return false;
              }
          }
      });
  });
  //#to-top button appears after scrolling
  var fixed = false;
  $(document).scroll(function() {
      if ($(this).scrollTop() > 250) {
          if (!fixed) {
              fixed = true;
              // $('#to-top').css({position:'fixed', display:'block'});
              $('#to-top').show("slow", function() {
                  $('#to-top').css({
                      position: 'fixed',
                      display: 'block'
                  });
              });
          }
      } else {
          if (fixed) {
              fixed = false;
              $('#to-top').hide("slow", function() {
                  $('#to-top').css({
                      display: 'none'
                  });
              });
          }
      }
  });
  // Disable Google Maps scrolling
  // See http://stackoverflow.com/a/25904582/1607849
  // Disable scroll zooming and bind back the click event
  var onMapMouseleaveHandler = function(event) {
      var that = $(this);
      that.on('click', onMapClickHandler);
      that.off('mouseleave', onMapMouseleaveHandler);
      that.find('iframe').css("pointer-events", "none");
  }
  var onMapClickHandler = function(event) {
          var that = $(this);
          // Disable the click handler until the user leaves the map area
          that.off('click', onMapClickHandler);
          // Enable scrolling zoom
          that.find('iframe').css("pointer-events", "auto");
          // Handle the mouse leave event
          that.on('mouseleave', onMapMouseleaveHandler);
      }
      // Enable map zooming with mouse scroll when the user clicks the map
  $('.map').on('click', onMapClickHandler);


  // Button to generate new key (pin) to a chat room.
  $( '.btn-key' ).click(function(event) {
    event.preventDefault();  // Prevent the button to send the form

    var id = $(this).closest('li').attr('id');
    var options = { // Details to connect to the server
      url: '/change_pin',
      method: 'post',
      data: { table_id: $(this).closest('li').attr('id') }
    }

    var show_pin = function(response) { // function that
      //look up for right id and write response
      $('#'+id).find('.pin').text(response)
    }
    $.ajax(options).done(show_pin);
  });

  
})
