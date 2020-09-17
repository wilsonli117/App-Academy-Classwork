
class View {
  constructor(game, $el) {
    this.fig = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $('.ttt').on('click', 'li', e => {
      let $li = $(e.target);
      this.makeMove($li);
    });
  }
  
  makeMove($square) {
    let pos = $square.data().pos;
    if (!this.game.board.isEmptyPos(pos)) {
      alert("Bad Move");
    } else {
      let mark = this.game.currentPlayer; //'x' or 'o'
      $square.addClass(mark);
      $square.append(mark);
      this.game.playMove(pos);  //get position to call this function ex [1, 1]


      if (this.game.isOver()){
        this.fig.addClass("game-over");
        let winner = this.game.winner();
        let $message = $('<figcaption>');
        if (winner) {
          winner === "x" ? this.fig.addClass("winner-x") : this.fig.addClass("winner-o");
          $message.append(`You win, ${winner}!`);
        } else {
          $message.append('It is a draw!');
        }

        this.fig.append($message);
        $('.ttt').off();
      }
    }
  }

  setupBoard() {
    let $ul = $('<ul>');
    this.fig.append($ul);
    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        let $li = $('<li>');
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
    }
  }
}

module.exports = View;