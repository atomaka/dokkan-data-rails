# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('a.img-preview').hover ((e) ->
    $('body').append '<p id="preview"><img src="' + @href + '" />'
    $('#preview')
      .css('top', e.pageY - 200 + 'px')
      .css('left', e.pageX + 30 + 'px')
      .fadeIn 'fast'
  ), ->
    $('#preview').remove()
  $('a.img-preview').mousemove (e) ->
    $('#preview')
      .css('top', e.pageY - 200 + 'px')
      .css 'left', e.pageX + 30 + 'px'
