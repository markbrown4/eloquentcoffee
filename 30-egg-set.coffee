
{ specialForms, run, evaluate } = require './lib/egg'

specialForms.set = (args, scope) ->
  name = args[0].name
  value = evaluate args[1], scope

  set = (name, scope) ->
    if Object.prototype.hasOwnProperty.call(scope, name)
      scope[name] = value
    else
      parent = Object.getPrototypeOf(scope)
      if parent != null
        set name, parent
      else
        throw new Error 'ReferenceError'

  set name, scope

run """
do(
  define(x, 4),
  define(setx, fun(val, set(x, val))),
  setx(50),
  print(x)
)
"""
# 50

run "set(quux, true)"
# Error: ReferenceError
