# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

add_tag = (input) ->
  value = $(input).val()
  token_input.tokenInput("add", {id: value, name: value}) if value != ""

$("#token-input-post_tags").live("blur", ->
  add_tag(this)
).live("keydown", (e) ->
  if e.which == 13
    e.preventDefault();
    add_tag(this)
)

token_input = $("#post_tags").tokenInput("/posts/tags.json", {
  prePopulate:       $("#post_tags").data("pre"),
  preventDuplicates: true,
  noResultsText:     "No results, needs to be created.",
  animateDropdown:   false,
  theme: "facebook"
})
