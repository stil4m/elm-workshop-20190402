# 2. Control structures, functions & testing

## Sources

- [Defining functions](https://guide.elm-lang.org/core_language.html#functions), and [Function Types](https://guide.elm-lang.org/appendix/function_types.html)
- [If Expressions](https://guide.elm-lang.org/core_language.html#if-expressions)
- [Case Expressions / Pattern Matching](https://guide.elm-lang.org/types/pattern_matching.html)
- [Elm test](https://www.npmjs.com/package/elm-test)

# DIY

Your goal is to implement [FizzBuzz](https://en.wikipedia.org/wiki/Fizz_buzz).
The project provides an `elm-test` setup, which allows you to build it in a [TDD](https://en.wikipedia.org/wiki/Test-driven_development)-like fashion.
You can also ignore tests, and first implement everything, then run the tests. This is up to you.
Likely you need to use something as [modBy](https://package.elm-lang.org/packages/elm/core/1.0.2/Basics#modBy) or [remainderBy](https://package.elm-lang.org/packages/elm/core/1.0.2/Basics#remainderBy)

> Note that you have to install `elm-test`. Preferably with `npm install -g elm-test`

You'll find the tests in `tests/FizzBuzzTest`, and the source file in `src/FizzBuzz`.
For intermediate testing you may use the REPL as you have learned previously.
A tip for this to use `import FizzBuzz` to interact with your code.

## What you should know afterwards

- How to read function signatures;
- How to use `elm-test`
- How to import/interact with your module from the Elm REPL;
- What different control structures are available.
