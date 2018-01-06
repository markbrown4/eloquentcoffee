###

We’ve seen that % (the remainder operator) can be used to test whether a number
is even or odd by using % 2 to check whether it’s divisible by two. Here’s another
way to define whether a positive whole number is even or odd:

    Zero is even.
    One is odd.
    For any other number N, its evenness is the same as N - 2.

Define a recursive function isEven corresponding to this description. The function
should accept a single parameter (a positive, whole number) and return a Boolean.

###

isEven = (input) ->
  find = (value) ->
    if value == 0 then true
    else if value == 1 then false
    else find(value - 2)
  find Math.abs(input)

console.log isEven(50)
# true
console.log isEven(75)
# false
console.log isEven(-1)
# false
