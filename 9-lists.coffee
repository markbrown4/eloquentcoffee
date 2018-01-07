###

Write a function arrayToList that builds up a data structure like the previous one
when given [1, 2, 3] as argument, and write a listToArray function that produces
an array from a list. Also write the helper functions prepend, which takes an element
and a list and creates a new list that adds the element to the front of the input
list, and nth, which takes a list and a number and returns the element at the given
position in the list, or undefined when there is no such element.

If you haven’t already, also write a recursive version of nth.

###

arrayToList = (arr) ->
  value = arr.shift()
  rest = if arr.length > 0 then arrayToList(arr) else null

  { value, rest }

listToArray = (list) ->
  result = []
  result.push list.value
  if list.rest != null
    result = result.concat listToArray(list.rest)

  result

prepend = (value, rest) -> { value, rest }

nth = (list, index) ->
  if index == 0
    list.value
  else
    nth(list.rest, index - 1)

console.log arrayToList([10, 20])
# { value: 10, rest: { value: 20, rest: null } }
console.log listToArray(arrayToList([10, 20, 30]))
# [10, 20, 30]
console.log prepend(10, prepend(20, null))
# { value: 10, rest: { value: 20, rest: null } }
console.log nth(arrayToList([10, 20, 30]), 1)
# 20
