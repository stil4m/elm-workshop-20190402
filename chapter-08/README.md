# 8. Modelling the problem

## Sources

- [Custom Types](https://guide.elm-lang.org/types/custom_types.html)

## DIY

### Part 1

Your goal is to implement the logic behind the concept of an `Attempt`.
Resolve the `TODO` for `part 1` in `src/Memory.elm` to finish this task.
Once users has opened 2 cards, they should not be able to open more cards.
Removing the cards after a valid pair is found will be part of the next chapter.

Hint: You will have to use a `case`-expression in your update.

### Part 2

To prepare ourself for removing cards from the game. We will introduce a new type `State` for each spot.
Resolve the `TODO` for `part 2` in `src/Memory.elm` to finish this task.

Hint:

- There is no need to 'toggle' a card that is removed.

## What you should know afterwards

- What the power of custom types is;
- When custom types come in handy;
- When you start using multiple booleans, you probably have an issue (holds outside of Elm as well).
