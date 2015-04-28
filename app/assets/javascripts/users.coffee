# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.plus-minus').click ->
		unless $('.collapsing').length > 0
			glyph = $(this).children('span')
			$('.glyphicon-minus').removeClass('glyphicon-minus').addClass('glyphicon-plus') unless glyph.hasClass('glyphicon-minus')
			glyph.toggleClass('glyphicon-plus').toggleClass('glyphicon-minus')

	$('#new-task-btn').click ->
		unless $('#new-task').hasClass('collapsing')
			$(this).children('span').toggleClass('glyphicon-minus-sign').toggleClass('glyphicon-plus-sign')