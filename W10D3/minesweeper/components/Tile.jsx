import React from "react";

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    // this.testingAlt = this.testingAlt.bind(this);
  }

  handleClick() {
    // debugger;
    this.props.updateGame(this.props.tile, event.altKey);
  }

  // testingAlt(arg) {debugger;console.log(arg)}

  render() {
    const bombCount = this.props.tile.adjacentBombCount();
    let explored = this.props.tile.explored;

    return (
      <div
        // onKeyDown={console.log(event.altKey)}
        onClick={this.handleClick}
        // onClick={e => {this.testingAlt.bind(this, e.altKey)}}
        className={this.props.tile.explored ? "explored tile" : "tile"}
      >
        {this.props.tile.flagged ? '🎌' : ''}
        {this.props.tile.bombed && explored ? "💣" : bombCount > 0 && explored ? bombCount : ''}
      </div>
    );
  }
}

export default Tile;
