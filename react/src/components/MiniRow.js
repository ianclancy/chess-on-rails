import React from 'react';
import MiniSquare from './MiniSquare';

const MiniRow = props => {
  let sharedProps = {
    pieces: props.pieces
  }
  return (
    <div className={`${props.className} mini-row`}>
      <MiniSquare className="odd-square square-7" row={props.row} column={1} {...sharedProps} />
      <MiniSquare className="even-square square-6" row={props.row} column={2} {...sharedProps} />
      <MiniSquare className="odd-square square-5" row={props.row} column={3} {...sharedProps} />
      <MiniSquare className="even-square square-4" row={props.row} column={4} {...sharedProps} />
      <MiniSquare className="odd-square square-3" row={props.row} column={5} {...sharedProps} />
      <MiniSquare className="even-square square-2" row={props.row} column={6} {...sharedProps} />
      <MiniSquare className="odd-square square-1" row={props.row} column={7} {...sharedProps} />
      <MiniSquare className="even-square square-0" row={props.row} column={8} {...sharedProps} />
    </div>
  )
}

export default MiniRow
