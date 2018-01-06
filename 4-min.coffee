###

Write a function min that takes two arguments and returns their minimum.

###

min = (a, b) ->
  if a < b then a else b

console.log min(0, 10)
# 0
console.log min(0, -10)
# -10
