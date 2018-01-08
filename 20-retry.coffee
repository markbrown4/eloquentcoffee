###

Say you have a function primitiveMultiply that, in 20 percent of cases,
multiplies two numbers, and in the other 80 percent, raises an exception of type
MultiplicatorUnitFailure. Write a function that wraps this clunky function and
just keeps trying until a call succeeds, after which it returns the result.

Make sure you handle only the exceptions you are trying to handle.

###

class MultiplicatorUnitFailure extends Error

primitiveMultiply = (a, b) ->
  if Math.random() < 0.2
    a * b
  else
    throw new MultiplicatorUnitFailure('Klunk')

reliableMultiply = (a, b) ->
  try
    primitiveMultiply a, b
  catch err
    throw err if err.constructor.name != 'MultiplicatorUnitFailure'

    reliableMultiply a, b

console.log reliableMultiply(8, 8)
# 64
