{
  SCRIPTS
  countBy
  characterScript
} = require('./lib/language')

###

Write a function that computes the dominant writing direction in a string of text.
Remember that each script object has a direction property that can be "ltr" (left-to-right),
"rtl" (right-to-left), or "ttb" (top-to-bottom).

The dominant direction is the direction of a majority of the characters which have
a script associated with them. The characterScript and countBy functions defined
earlier in the chapter are probably useful here.

###

dominantDirection = (text) ->
  directions = countBy text, (char) ->
    script = characterScript char.codePointAt(0)
    if script then script.direction else null
  .filter (script) ->
    script.name != null

  max = directions.reduce (max, current) ->
    if current.count > max.count then current else max

  max.name

console.log dominantDirection("Hello!")
# ltr
console.log dominantDirection("Hey, مساء الخير")
# rtl
