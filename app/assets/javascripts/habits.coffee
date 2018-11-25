# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

addNotice = (message) ->
    $('#messages-container').prepend '<div class="notice"><span>' + message + '</span><span class="close">X</span></div>'
    notice = $($('#messages-container').children()[0])
    close = $ notice.children('.close')

    close.click () -> notice.slideUp()

    window.scrollTo 0, 0
addAlert = (message) ->
  $('#messages-container').prepend '<div class="alert"><span>' + message + '</span><span class="close">X</span></div>'
  alert = $($('#messages-container').children()[0])
  close = $ alert.children('.close')
  
  close.click () -> alert.slideUp()
  
  window.scrollTo 0, 0

$('html').ready () ->
  form = $ '#habits-form'
  table = $ '#habits-table'

  form
  .submit (event) ->
    event.preventDefault();
    title = $('input#title').val();
    form.slideUp()

    $.ajax '/habits/new',
      type: 'POST'
      data: { habit: { title: title } }
    .done (data) ->
      addNotice('Successfully added habit')
      table.append('<tr><td>'+title+'</td><td>false</td></tr>')
    .fail (x) ->
      addAlert('Failed to add habit')
    .always () ->
      form.slideDown()
    