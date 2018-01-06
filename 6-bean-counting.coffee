###

Write a function countBs that takes a string as its only argument and returns a number
that indicates how many uppercase “B” characters there are in the string.
Next, write a function called countChar that behaves like countBs, except it takes
a second argument that indicates the character that is to be counted (rather than
counting only uppercase “B” characters). Rewrite countBs to make use of this new function.

###

countChars = (input = '', char) ->
  count = 0
  for i in [1..input.length]
    count += 1 if input[i - 1] == char
  count

countBs = (input = '') ->
  countChars input, 'B'

console.log countBs('Bob')
# > 1
console.log countBs('BoBBy')
# > 3
console.log countBs('Sam')
# > 0
