import React from 'react';
import Tile from './Tile';

class Board extends React.Component {
    constructor(props) {
        super(props);
        // debugger
    }

    render () {
        return (
          <div className="board">
            {/* {this.props.board.won() ? <h1>You Won!</h1> : null}
            {this.props.board.lost() ? <h1>You Lost!</h1> : null} */}
            {this.props.board.grid.map((row, row_i) => {
              return (
                <div className="row" key={row_i}>
                  {row.map((tile, tile_i) => {
                    return (
                      <Tile
                        tile={tile}
                        updateGame={this.props.updateGame}
                        key={[tile_i]}
                        idx={tile_i}
                      />
                    );
                  })}
                </div>
              );
            })}
          </div>
        );
    }
}

export default Board;