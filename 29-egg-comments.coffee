###

It would be nice if we could write comments in Egg. For example, whenever we
find a hash sign (#), we could treat the rest of the line as a comment and
ignore it, similar to // in JavaScript.

###

{ parse, replaceSkipSpaceWith } = require './lib/egg'

replaceSkipSpaceWith (string) ->
  matches = string.match(/^(\s|#.*)*/)
  string.slice matches[0].length

console.log parse("# hello\nx")
#  { type: "word", name: "x" }

console.log parse("a # one\n   # two\n()")
#  {
#    type: "apply",
#    operator: {type: "word", name: "a"},
#    args: []
#  }
