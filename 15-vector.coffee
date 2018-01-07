###

Write a class Vec that represents a vector in two-dimensional space. It takes x
and y parameters (numbers), which it should save to properties of the same name.

Give the Vec prototype two methods, plus and minus, that take another vector as
a parameter and return a new vector that has the sum or difference of the two
vectors’ (the one in this and the parameter) x and y values.

Add a getter property length to the prototype that computes the length of the
vector—that is, the distance of the point (x, y) from the origin (0, 0).

###

class Vec
  constructor: (@x, @y) ->

  plus: (vector) ->
    new Vec(@x + vector.x, @y + vector.y)

  minus: (vector) ->
    new Vec(@x - vector.x, @y - vector.y)

Object.defineProperty Vec.prototype, 'length',
  get: ->
    Math.sqrt Math.pow(@x, 2) + Math.pow(@y, 2)

console.log new Vec(1, 2).plus(new Vec(2, 3))
# Vec{x: 3, y: 5}
console.log new Vec(1, 2).minus(new Vec(2, 3))
# Vec{x: -1, y: -1}
console.log new Vec(3, 4).length
# 5


###

Note: CoffeeScript 2 purposefully omits getters & setters as it's considered as
one of the _bad parts_ of JS that CoffeeScript tries to remove.

  "As you write ES3, you know what's a function call and what's a property access.
  When you use getters and setters, it's suddenly opaque to you which is which, with
  the possibilities of serious performance considerations and also side effects in
  places where you might not expect them.

  This uncertainty brings with it a little bit of syntax sugar — to make a method
  call look like a property access. Why not just let a method call be a method call?"
  - @jashkenas

See https://github.com/coffeescript6/discuss/issues/17

So, instead of length being a magical getter it's clearer as a standard method.

###

class Vector
  constructor: (@x, @y) ->

  plus: (vector) ->
    new Vector(@x + vector.x, @y + vector.y)

  minus: (vector) ->
    new Vector(@x - vector.x, @y - vector.y)

  length: ->
    Math.sqrt Math.pow(@x, 2) + Math.pow(@y, 2)

console.log new Vector(1, 2).plus(new Vector(2, 3))
# Vec{x: 3, y: 5}
console.log new Vector(1, 2).minus(new Vector(2, 3))
# Vec{x: -1, y: -1}
console.log new Vector(3, 4).length()
# 5
