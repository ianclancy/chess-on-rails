import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import GameTile from '../components/GameTile';

class GamesIndexContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      games: []
    }
    this.getGames = this.getGames.bind(this)
    this.addNewGame = this.addNewGame.bind(this)
  }

  componentDidMount() {
    this.getGames()
  }

  getGames() {
    fetch('/api/v1/games')
      .then(response => response.json())
      .then(json => {
        this.setState({ games: json })
      })
  }

  addNewGame() {
    let gamePayload = { turn: "white" }
    fetch('/api/v1/games', {
      method: 'POST',
      body: JSON.stringify(gamePayload),
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
  }

  render() {
    let games = this.state.games.map(game => {
      return(
        <GameTile
          key={game.id}
          game={game}
        />
      )
    })

    return(
      <div className="games-index">
        <h1>Games</h1>
        <Link to="/games">
          <button onClick={this.addNewGame}>
            New Game
          </button>
        </Link>
        <div className="game-tiles">
          {games}
        </div>
      </div>
    )
  }
}

export default GamesIndexContainer;
