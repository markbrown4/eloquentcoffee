###

Write a program that uses console.log to print all the numbers from 1 to 100,
with two exceptions. For numbers divisible by 3, print "Fizz" instead of the number,
and for numbers divisible by 5 (and not 3), print "Buzz" instead.

When you have that working, modify your program to print "FizzBuzz", for numbers
that are divisible by both 3 and 5 (and still print "Fizz" or "Buzz" for numbers
divisible by only one of those).

###

for i in [1..100]
  fizz = i % 3 == 0
  buzz = i % 5 == 0

  console.log if fizz and buzz
    'FizzBuzz'
  else if fizz
    'Fizz'
  else if buzz
    'Buzz'
  else
    i

###

1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...

###
