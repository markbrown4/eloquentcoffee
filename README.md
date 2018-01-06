# Eloquent CoffeeScript

Marijn Haverbeke's [Eloquent JS](https://eloquentjavascript.net/) is an excellent
book, here's my solutions to the exercises written in CoffeeScript.

## Run the examples

```bash
npm install coffeescript -g
coffee 1-triangle.coffee
```

## Why CoffeeScript?

> The golden rule of CoffeeScript is: “It’s just JavaScript.”

As the ES6 train gained a lot of momentum `coffee` lost steam. However,
[the trends](https://npm-stat.com/charts.html?package=coffee-script&package=coffeescript&from=2014-01-05)
still show download growth over the past few years and there's still a lot of big
projects using it.

Version 2 changed the compilation target from ES3 to ES2015 and aligned with new
language features like ES2015 Modules, classes, template literals, async / await
and destructuring.  Now that both languages are close to feature parity, the only
compelling reason to write CoffeeScript is the clean expressive syntax.

I wrote CoffeeScript every day for fours years and then ES6+ for the last two,
I've just been reacquainted and it's still a pleasure to program in. Keep an open
mind and give it a try, you may enjoy it.

## Things I like about ☕️

- Clarity of the program shines through with less syntax and significant whitespace
- Everything is an expression, statements like `for`, `if` and `switch` produce a value
- Implicit `return` of last statement
- Aliases, operators & shorthands allow for more expressive code
