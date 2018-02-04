###

For each of the following items, write a regular expression to test whether any
of the given substrings occur in a string. The regular expression should match
only strings containing one of the substrings described. Do not worry about word
boundaries unless explicitly mentioned. When your expression works, see whether
you can make it any smaller.

Fill in the regular expressions

###

verify = (regexp, yep, nah) ->
  # Ignore unfinished exercises
  return if regexp.source == "..."

  for str in yep
    console.log "Failure to match '#{str}'" unless regexp.test(str)
  for str in nah
    console.log "Unexpected match for '#{str}'" if regexp.test(str)

# "car" and "cat"

verify /ca[rt]/,
  ["my car", "bad cats"]
  ["camper", "high art"]

# "pop" and "prop"

verify /pr?op/,
  ["pop culture", "mad props"]
  ["plop"]

# "ferret", "ferry", and "ferrari"

verify /ferr(et|y|ari)/,
  ["ferret", "ferry", "ferrari"]
  ["ferrum", "transfer A"]

# Any word ending in "ious"

verify /\w+ious\b/,
  ["how delicious", "spacious room"]
  ["ruinous", "consciousness"]

# A whitespace character followed by a dot, comma, colon, or semicolon

verify /\s[.,:;]/,
  ["bad punctuation ."]
  ["escape the dot"]

# A word longer than six letters

verify /\w{7}/,
  ["hottentottententen"]
  ["no", "hotten totten tenten"]

# A word without the letter e
verify /\b[^\We]+\b/,
  ["red platypus", "wobbling nest"]
  ["earth bed", "learning ape"]
