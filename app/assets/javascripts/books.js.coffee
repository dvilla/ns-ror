# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  button_book = $('.search_gbook')
  label = $('#book_isbn')
  button_book.click -> $.post '/admin/books/search', isbn: label.val()
