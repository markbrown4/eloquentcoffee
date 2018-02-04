# Modify these definitions...

{ topScope, run } = require './lib/egg'

topScope.array = (...args) -> args

topScope.length = (a) -> a.length

topScope.element = (arr, index) -> arr[index]

run """
do(
  define(sum, fun(array, do(
    define(i, 0),
    define(sum, 0),
    while(<(i, length(array)), do(
      define(sum, +(sum, element(array, i))),
      define(i, +(i, 1))
    )),
    sum
  ))),
  print(sum(array(1, 2, 3)))
)
"""
# 6
