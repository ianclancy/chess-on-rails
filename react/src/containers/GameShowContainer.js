import React, { Component } from 'react';
import Board from '../components/Board';
import CapturedBox from '../components/CapturedBox';

class GameShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      gameData: {},
      gameId: this.props.match.params.id,
      pieces: [],
      selectedPieceId: null,
      recentMoveData: {}
    };
    this.getGameData = this.getGameData.bind(this);
    this.squareClick = this.squareClick.bind(this);
    this.addNewMove = this.addNewMove.bind(this);
    this.capitalizeFirstLetter = this.capitalizeFirstLetter.bind(this);
  }

  componentDidMount() {
    this.getGameData();
  }

  getGameData() {
    fetch(`/api/v1/games/${this.state.gameId}`)
      .then(response => response.json())
      .then(json => {
        if (this.state.gameData != json) {
          this.setState({
            gameData: json,
            pieces: json.pieces
          });
        }
      });
  }

  addNewMove(movePayload) {
    fetch('/api/v1/moves', {
      method: 'POST',
      body: JSON.stringify(movePayload),
      headers: { 'Content-Type': 'application/json' },
      credentials: 'same-origin'
    })
      .then(response => response.json())
      .then(json => {
        this.setState({
          recentMoveData: json,
        })
      })
      .then(() => {
        this.getGameData()
      })
  }

  capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
  }

  squareClick(event) {
    event.preventDefault();
    let clickedPiece = null;
    if (!this.state.gameData.checkmate) {
      this.state.pieces.forEach(piece => {
        if (`${piece.row}${piece.column}` == event.target.id && piece.side == this.state.gameData.turn) {
          clickedPiece = piece;
        }
      });

      if (this.state.selectedPieceId != null) {
        this.addNewMove({
          game_id: this.state.gameId,
          piece_id: this.state.selectedPieceId,
          to_row: parseInt(event.target.id[0]),
          to_column: parseInt(event.target.id[1])
        });
        this.setState({ selectedPieceId: null });
      } else if (clickedPiece) {
        this.setState({ selectedPieceId: clickedPiece.id });
      }
    }
  }

  render() {
    let capturedPieces = this.state.pieces.filter(piece => piece.row == null);

    let message;
    let capitalizedTurn;
    let capitalizedNotTurn;

    if (this.state.gameData.turn && this.state.gameData.turn == "white") {
      capitalizedTurn = "White";
      capitalizedNotTurn = "Black";
    } else {
      capitalizedTurn = "Black";
      capitalizedNotTurn = "White";
    }

    if (this.state.gameData.checkmate) {
      message = `Checkmate! ${capitalizedNotTurn} wins.`
    } else if (this.state.gameData.check) {
      message = `Check! ${capitalizedTurn} to move.`;
    } else {
      message = `${capitalizedTurn} to move.`
    }

    return(
      <div className="game-display">
        <div className="board-with-labels">
          <Board
            pieces={this.state.pieces}
            recentMoveData={this.state.recentMoveData}
            selectedPieceId={this.state.selectedPieceId}
            handleClick={this.squareClick}
          />
          <div className="row">
            <div className="label-square"></div>
            <div className="label-square">a</div>
            <div className="label-square">b</div>
            <div className="label-square">c</div>
            <div className="label-square">d</div>
            <div className="label-square">e</div>
            <div className="label-square">f</div>
            <div className="label-square">g</div>
            <div className="label-square">h</div>
          </div>
          <div className="move-message">
            {message}
          </div>
        </div>
        <div className="captured-box">
          <CapturedBox capturedPieces={capturedPieces}/>
        </div>
      </div>
    )
  }
}

export default GameShowContainer;
