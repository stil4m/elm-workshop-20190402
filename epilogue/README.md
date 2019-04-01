# Epilogue

## Moving forward

The `src` folder contains a working implementation for a basic 1-player memory game.
There are many areas where this program could be improved:

- written differently (with different types);
- separated in more/less modules;
- ect.

If you want, you can experiment with this.

There are also other ways to go forward with this game. For example:

- Add a two player mode, where each can score points;
- Make the game animated;
- Allow the user to select the grid size before starting a game;
- Store the results on a server (`HTTP`) or in the browser (`localStorage` via JavaScript interop);
- Or something else you want to do with the application.

## Main take aways

### Start small

We started small, only rendering static memory cards and build to a bigger application.
This is most often the way to start your Elm applications.

### Refactoring is easy

Don't be afraid to model your Elm code wrong in the beginning.
Doing it right at once will only come with practice.
Besides this, if you made a mistake, the Elm compiler will help you through the process.

### No exceptions

During this workshop you were not smacked in your face with an unwanted unhandled exception.
This is kind of nice, since you are very often sure you've implemented everything correctly when it compiles.
