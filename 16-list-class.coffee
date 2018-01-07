###

Rewrite the list data structure from the exercises in Chapter 4 as a class. Give
List objects their old value and rest properties, but also a toArray method and
a length getter that returns the length of the list. Make fromArray a static
method on the List constructor.

In order for lists to work as a class with methods, we can no longer represent
the empty list as null, but have to create a special instance of our class that
acts as the empty list placeholder, and compare with that instance, instead of
null, when checking if we’ve reached the end of a list. Store this instance in
List.empty (a static property).

###

EMPTY = Symbol('EMPTY')

class List
  constructor: (@value = EMPTY, rest) ->
    @rest = rest || List.empty

  toArray: ->
    result = []
    result.push @value
    if @rest != List.empty
      result = result.concat new List(@rest.value, @rest.rest).toArray()

    result

  @fromArray: (arr)->
    value = arr.shift()
    rest = if arr.length > 0
      List.fromArray(arr)
    else
      List.empty

    new List(value, rest)

  length: ->
    return 0 if @value == EMPTY
    return 1 if @rest == List.empty

    count = (list, length = 1) ->
      if list.rest == List.empty
        length + 1
      else
        count list.rest, length + 1

    count @rest

List.empty = new List()

# improve console.log output

List::inspect = ->
  if @value == EMPTY
    null
  else
    @

module.exports = { List, EMPTY }

# prevent logging when imported in 17-list-iterator
return unless process.argv[1].includes('16-list-class')

console.log List.fromArray([10, 20])
# List { value: 10, rest: List { value: 20, rest: null } }
console.log List.fromArray([10, 20, 30]).toArray()
# [ 10, 20, 30 ]
console.log new List().length()
# 0
console.log new List('2').length()
# 1
console.log new List('2', new List(3)).length()
# 2

###

Note: As explained in 15-vector.coffee, I've chosen to avoid getters for length
and make it a standard method on the prototype that has to be called. e.g.

myList.length()

###
