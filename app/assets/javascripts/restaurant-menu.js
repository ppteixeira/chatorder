$(document).ready(function() {
  // Select menu
  $('#restaurant-menu').click(function () {
    $('#house-menu').show();

    event.preventDefault();  // Prevent the button to send the form

    var options = { // Details to connect to the server
      url: '/get_menu',
      method: 'get',
    }

    var show_items = function(response) { // Show menu items

     $('#'+id).find('.pin').text(response)
    }

    $.ajax(options).done(show_items);

  });

  //
  $("#close-house-menu").click(function () {
    $('#house-menu').hide();
  })

});
