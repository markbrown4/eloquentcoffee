###

Use the reduce method in combination with the concat method to “flatten” an array
of arrays into a single array that has all the elements of the input arrays.

###

flatten = (arr) ->
  arr.reduce (acc, value) ->
    if value.constructor.name == 'Array'
      acc.concat flatten(value)
    else
      [...acc, value]
  , []

arr = [[1, 2, 3], [4, 5, [6, 7]], [8], 9]
console.log flatten(arr)
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
