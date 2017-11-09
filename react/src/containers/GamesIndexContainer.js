import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import GameTile from '../components/GameTile';

class GamesIndexContainer extends Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.getGames();
  }

  render() {
    let games = this.props.games.map(game => {
      return(
        <GameTile
          key={game.id}
          game={game}
        />
      )
    })

    return(
      <div className="games-index">
        <div className="game-tiles">
          {games}
        </div>
      </div>
    )
  }
}

export default GamesIndexContainer;
