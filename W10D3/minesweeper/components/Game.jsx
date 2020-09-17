import React from 'react';
import Board from './Board';
import * as Minesweeper from '../minesweeper';
import Modal from './Modal';

class Game extends React.Component {
    constructor(props) {
        // debugger
        super(props);
        this.state = {
          board: new Minesweeper.Board(9, 10),
        };
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
        console.log(this.state.board)

    }

    restartGame() {
        this.setState({board: new Minesweeper.Board(9,10)})
    }

    updateGame (tile, isFlagging) {
        if (isFlagging) tile.toggleFlag(); 
        else tile.explore();

        this.setState({ board: this.state.board });
    }

    render () {
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
                <Modal 
                    won={this.state.board.won() ? 'Won!' : null} 
                    lost={this.state.board.lost() ? 'Lost!' : null} 
                    restart={this.restartGame}
                /> 
            </div>
        );
    }
    
}

export default Game;