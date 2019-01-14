App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    document.getElementById('messages').insertAdjacentHTML 'beforeend', data['message']

  speak: (message) ->
    @perform 'speak', message: message

document.addEventListener 'DOMContentLoaded', (event) ->
  document.getElementById('speaker').addEventListener 'keydown', (event) ->
    if event.keyCode is 13
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
