###

Write a higher-order function looop that provides a way to something like a for
loop statement. It takes a value, a test function, an update function, and a body
function. Each iteration, it first runs the test function on the current loop value,
and stops if that returns false. Then, it calls the body function, giving it the
current value. And finally, it calls the update function to create a new value,
and starts from the beginning.

###

looop = (value, test, update, body) ->
  while test(value)
    body value
    value = update(value)

test   = (n) -> n > 0
update = (n) -> n - 1
looop 3, test, update, console.log

###

3
2
1

###
