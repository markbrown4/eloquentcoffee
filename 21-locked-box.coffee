###

Write a function called withBoxUnlocked that takes a function value as argument,
unlocks the box, runs the function, and then ensures that the box is locked again
before returning, regardless of whether the argument function returned normally
or threw an exception.

###

`
let box = {
  locked: true,
  unlock() { this.locked = false; },
  lock() { this.locked = true;  },
  _content: [],
  get content() {
    if (this.locked) throw new Error("Locked!");
    return this._content;
  }
};
`

withBoxUnlocked = (body) ->
  box.unlock()
  try
    body()
  catch e
  box.lock()

withBoxUnlocked ->
  box.content.push "gold piece"

try
  withBoxUnlocked ->
    throw new Error("Pirates on the horizon! Abort!")
catch err
  console.log "Error raised:", err

console.log box.locked
# true
withBoxUnlocked ->
  console.log box.content
# [ 'gold piece' ]
