import React from 'react';
import { Link } from 'react-router-dom';
import MiniBoard from './MiniBoard';

const GameTile = props => {
  return(
    <div className="game-tile">
      <Link to={`/games/${props.game.id}`}>
        <h3>{props.game.start_date}</h3>
        <MiniBoard
          pieces={props.game.pieces}
        />
      </Link>
    </div>
  )
}

export default GameTile
