# 9. Side FX

## Sources

- [Effects](https://guide.elm-lang.org/effects/)
- [Elm Tutorial - Random](https://github.com/evancz/elm-architecture-tutorial/blob/master/examples/07-random.elm)

## DIY

In this chapter we're going to add the logic to remove/reset the cards after a user has made an attempt.
We will not close the cards directly once the user has turned these, since he/she cant see what the second was.
Instead, we're going to schedule a `Msg` after a delay (see: `src/Util.elm`).

To achieve this, we are going to need:

- to introduce a new Msg that will be handled after the delay;
- schedule this message once the user has picked his/her second card;
- actually update the model based on the rules of memory.

Do this by resolving the `TODO`s in `src/Memory.elm`.

## What you should know afterwards

- What `Cmd`s are;
- What role `Cmd`s play in the Elm architecture;
- That in Elm you cannot perform side effects yourself.
