###

Write a new class PMap, which stores a mapping from keys to other values, and,
like Map, has a get method to retrieve a value and a has method to check if a
value is present.

Its set method, however, should return a new PMap instance with the given key
added, and leave the old one unchanged. Similarly, delete creates a new instance
without a key.

The class should work for keys of any type, not just strings. It does not have
to be efficient when used with large amounts of keys.

The constructor shouldn’t be part of the class’ interface (though you’ll
definitely want to use it internally). Instead, there is an empty instance,
PMap.empty, that can be used as a starting value.

Why do you only need one PMap.empty value, rather than having a function that
creates a new, empty map every time?

###

class PMap
  constructor: (@map) ->

  get: (key) ->
    @map.get key

  set: (key, value) ->
    newMap = new PMap(@map)
    newMap.map.set key, value

    newMap

  delete: (key) ->
    newMap = new PMap(@map)
    newMap.map.delete key

    newMap

  has: (key) ->
    key of @map

PMap.empty = new PMap(new Map())

PMap::inspect = -> @map

a = PMap.empty.set('a', 1)
ab = a.set('b', 2)
b = ab.delete('a')

console.log b.get('b')
# 2
console.log a.has('b')
# false
console.log b.has('a')
# false
