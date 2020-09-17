const HanoiGame = require("./game");
const HanoiView = require("./hanoi-view");

  $(() => {
  const rootEl = $('body');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});

console.log("do you hear me?");