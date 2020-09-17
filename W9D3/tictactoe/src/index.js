const View = require("./ttt-view.js");// require appropriate file
const Game = require("./game.js");// require appropriate file

  $(() => {
    // Your code here

    let game = new Game();
    let $el = $('.ttt');
    let view = new View(game, $el);
  });
