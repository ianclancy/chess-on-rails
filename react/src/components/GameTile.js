import React from 'react';
import { Link } from 'react-router-dom';
import MiniBoard from './MiniBoard';

const GameTile = props => {
  return(
    <div className="game-tile">
      <Link to={`/games/${props.game.id}`}>
        <div className="game-title">{props.game.start_date}</div>
        <MiniBoard
          pieces={props.game.pieces}
        />
      </Link>
    </div>
  )
}

export default GameTile
