###

Write an async function locateScalpel that does this, starting at the nest on
which it runs. You can use the anyStorage function defined earlier to access
storage in arbitrary nests. The scalpel has been going around long enough that
you may assume that every nest has a "scalpel" entry in its data storage.

Next, write the same function again without using async and await.

###

locateScalpel = (nest) ->
  next = await anyStorage(nest, "scalpel")
  return next if next == nest

  locateScalpel next

locateScalpel2 = (nest) ->
  new Promise (resolve, reject) ->
    anyStorage(nest, "scalpel").then (next) ->
      return resolve(next) if next == nest

      return locateScalpel2(next)
