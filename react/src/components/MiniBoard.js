import React from 'react';
import MiniRow from './MiniRow';

const MiniBoard = props => {
  let sharedProps = {
    pieces: props.pieces
  }

  return (
    <div className="mini-board">
      <MiniRow className="even-row" row={8} {...sharedProps} />
      <MiniRow className="odd-row" row={7} {...sharedProps} />
      <MiniRow className="even-row" row={6} {...sharedProps} />
      <MiniRow className="odd-row" row={5} {...sharedProps} />
      <MiniRow className="even-row" row={4} {...sharedProps} />
      <MiniRow className="odd-row" row={3} {...sharedProps} />
      <MiniRow className="even-row" row={2} {...sharedProps} />
      <MiniRow className="odd-row" row={1} {...sharedProps} />
    </div>
  )
}

export default MiniBoard
