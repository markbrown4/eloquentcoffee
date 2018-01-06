###

Arrays have a method reverse, which changes the array by inverting the order in
which its elements appear. For this exercise, write two functions, reverseArray
and reverseArrayInPlace. The first, reverseArray, takes an array as argument and
produces a new array that has the same elements in the inverse order. The second,
reverseArrayInPlace, does what the reverse method does: it modifies the array given
as argument by reversing its elements. Neither may use the standard reverse method.

###

reverseArray = (arr) ->
  result = []
  for i in [arr.length..1]
    result.push arr[i - 1]

  result

reverseArrayInPlace = (arr) ->
  return if arr.length == 0

  copy = arr.slice()
  for i in [1..arr.length]
    arr[i - 1] = copy[arr.length - i]

console.log reverseArray(['A', 'B', 'C'])
# ['C', 'B', 'A'
arrayValue = [1, 2, 3, 4, 5]
reverseArrayInPlace arrayValue
console.log arrayValue
# [5, 4, 3, 2, 1]
