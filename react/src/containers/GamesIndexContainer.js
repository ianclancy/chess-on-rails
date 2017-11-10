import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import GameTile from '../components/GameTile';

class GamesIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      closedGamesSelected: false,
      selectedButton: "open"
    }
    this.handleOpenButtonClick = this.handleOpenButtonClick.bind(this)
    this.handleCompletedButtonClick = this.handleCompletedButtonClick.bind(this)
  }

  componentDidMount() {
    this.props.getGames();
  }

  handleOpenButtonClick() {
    this.setState({ selectedButton: "open" })
  }

  handleCompletedButtonClick() {
    this.setState({ selectedButton: "completed" })
  }

  render() {
    let openClass = "clicked-games-button"
    let completedClass = "unclicked-games-button"
    if (this.state.selectedButton == "completed") {
      openClass = "unclicked-games-button"
      completedClass = "clicked-games-button"
    }

    let openGames = this.props.games.filter(game => !game.completed)
    let completedGames = this.props.games.filter(game => game.completed)

    let gamesToDisplay = openGames

    if (this.state.selectedButton == "completed") {
      gamesToDisplay = completedGames
    }

    let games = gamesToDisplay.map(game => {
      return(
        <GameTile
          key={game.id}
          game={game}
        />
      )
    })

    let gameButtons =
      <div className="game-type-buttons">
        <div className={`game-type-button ${openClass}`} onClick={this.handleOpenButtonClick}>
          Open Games
        </div>
        <div className={`game-type-button ${completedClass}`} onClick={this.handleCompletedButtonClick}>
          Completed Games
        </div>
      </div>

    if (this.props.currentUser == null) {
      gameButtons = null
    }

    return(
      <div className="games-index">
        {gameButtons}
        <div className="game-tiles">
          {games}
        </div>
      </div>
    )
  }
}

export default GamesIndexContainer;
