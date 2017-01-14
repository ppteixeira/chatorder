
$(document).ready(function() {

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
});
