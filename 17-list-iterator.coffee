###

Make the List class from the previous exercise iterable.

###

{List, EMPTY} = require('./16-list-class')

List.prototype[Symbol.iterator] = ->
  list = @
  while list.value != EMPTY
    yield list.value
    list = list.rest

iterable = List.fromArray(['a', 'b', 'c'])
for value from iterable
  console.log value

# a
# b
# c
