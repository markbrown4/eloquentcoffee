Promise_all = (promises) ->
  return Promise.resolve([]) if promises.length == 0

  new Promise (resolve, reject) ->
    results = []
    complete = 0

    promises.forEach (promise, index)->
      promise.then (result) ->
        complete++
        results[index] = result
        resolve(results) if complete == promises.length
      .catch reject

# Test code.

Promise_all([])
  .then (array) ->
    console.log "This should be []:", array

soon = (val) ->
  new Promise (resolve) ->
    setTimeout ->
      resolve(val)
    , Math.random() * 500

Promise_all [soon(1), soon(2), soon(3)]
  .then (array) ->
    console.log "This should be [1, 2, 3]:", array

Promise_all [soon(1), Promise.reject("X"), soon(3)]
  .then (arr) ->
    console.log "We should not get here"
  .catch (err) ->
    console.log("Unexpected failure:", error) if err != "X"
