App.global_chat = App.cable.subscriptions.create {
    channel: "ChatRoomsChannel"
    chat_room_id: messages.data('chat_room_id')
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Data received
    messages.append data['message']

  send_message: (message, chat_room_id) ->
    @perform 'send_message', message: message, chat_room_id: chat_room_id


jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # Data received
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id


    $('#new_message').submit (e) -> #When the form is submitted
      $this = $(this)
      textarea = $this.find('#message_body') # take the message’s body
      if $.trim(textarea.val()).length > 1   # check that its length is at least two

        # call the send_message function to broadcast the new message to all visitors of the chat room
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')

        # clear the textarea and prevent form submission.
        textarea.val('')
        e.preventDefault()
      return false



,,  and then call the send_message function to broadcast the new message to all visitors of the chat room. Next, clear the textarea and prevent form submission.
