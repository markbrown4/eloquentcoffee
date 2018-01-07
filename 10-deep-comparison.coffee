###

Write a function, deepEqual, that takes two values and returns true only if they
are the same value or are objects with the same properties whose values are also
equal when compared with a recursive call to deepEqual.

###

isObject = (value) ->
  value != null && typeof value == 'object'

deepEqual = (a, b)->
  unless isObject(a) && isObject(b)
    return a == b

  unless Object.keys(a).length == Object.keys(b).length
    return false

  for key, value of a
    if isObject value
      return deepEqual(a[key], b[key])
    else if a[key] != b[key]
      return false

  true

obj = { here: { is: "an" }, object: 2 }
console.log deepEqual(obj, obj)
# true
console.log deepEqual(obj, { here: 1, object: 2 })
# false
console.log deepEqual(obj, { here: { is: "an" }, object: 2 })
# true
console.log deepEqual(obj, { here: { is: "an" }, object: 2, extra: true })
# false
console.log deepEqual(obj, false)
# false
console.log deepEqual(false, null)
