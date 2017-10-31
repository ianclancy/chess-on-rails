import React from 'react';
import { Link } from 'react-router-dom';

const GameTile = props => {
  return(
    <div className="column">
      <Link to={`/games/${props.game.id}`}>
        <h3>{props.game.start_date}</h3>
      </Link>
    </div>
  )
}

export default GameTile
