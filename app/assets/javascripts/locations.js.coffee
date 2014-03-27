# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pathname = window.location.href
index = pathname.indexOf("#")
end = pathname.length
if index > 0 and index != end
  slug = pathname.substring(index, end)
  $(slug).collapse()
