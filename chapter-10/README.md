# 10. Time and Random

## Sources

- [Time](https://package.elm-lang.org/packages/elm/time/latest/Time)
- [Time as subscriptions](https://guide.elm-lang.org/effects/time.html)
- [Random](https://package.elm-lang.org/packages/elm/random/latest/Random)

## DIY

In this chapter we're going to add differentiate between the game being started or not.
Once the game is started, we can shuffle the cards based on the current time, which will result in pseudo randomness.

We're going to introduce a `started` property which will be filled if the game is started, and empty if it isnt.
Based on this we will render the game, or a button which allows us to start the game.
When we start the game, we will randomly generate the grid.

The `TODO`s in `src/Memory.elm` will point you in the right direction.

## What you should know afterwards

- What `Sub`s (subscriptions) are;
- What role subscriptions play in the Elm architecture;
- Have a bit of understanding how `Random` works.
