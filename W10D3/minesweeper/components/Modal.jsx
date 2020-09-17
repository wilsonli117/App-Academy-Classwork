import React from 'react';
import Game from './Game';

const Modal = (props) => {
  return (
    <div
      className="modal-screen"
      style={{ display: props.won || props.lost ? "block" : "none" }}
    >
      <div className="modal-content">
        <p>You {props.won || props.lost}</p>
        <button onClick={props.restart} >
          Play Again
        </button>
      </div>
    </div>
  );
}

export default Modal;