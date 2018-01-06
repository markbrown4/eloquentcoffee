###

Write a program that creates a string that represents an 8×8 grid, using newline
characters to separate lines. At each position of the grid there is either a space
or a “#” character. The characters should form a chess board.

###

SIZE = 8

board = ''
for i in [1..SIZE]
  for j in [1..SIZE]
    even = (i + j) % 2 == 0
    board += if even then ' ' else '#'
  board += '\n'

console.log board

###

 # # # #
# # # #
 # # # #
# # # #
 # # # #
# # # #
 # # # #
# # # #

###
