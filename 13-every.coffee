###

Implement every as a function that takes an array and a predicate function as
parameters. Write two versions, one using a loop and one using the some method.

###

every = (arr, test) ->
  for item in arr
    return false unless test(item)

  true

every = (arr, test) ->
  !arr.some (item, index, arr) ->
    !test(item)

lessThan10 = (n) -> n < 10
console.log every([1, 3, 5], lessThan10)
# true
console.log every([2, 4, 16], lessThan10)
# false
console.log every([], lessThan10)
# true
