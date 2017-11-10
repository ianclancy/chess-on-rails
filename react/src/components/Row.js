import React from 'react'
import Square from './Square'

const Row = props => {
  let sharedProps = {
    pieces: props.pieces,
    recentMoveData: props.recentMoveData,
    selectedPieceId: props.selectedPieceId,
    handleClick: props.handleClick
  }
  return (
    <div className={`${props.className} row`}>
      <div className="label-square">{props.row}</div>
      <Square className="odd-square square-7" row={props.row} column={1} {...sharedProps} />
      <Square className="even-square square-6" row={props.row} column={2} {...sharedProps} />
      <Square className="odd-square square-5" row={props.row} column={3} {...sharedProps} />
      <Square className="even-square square-4" row={props.row} column={4} {...sharedProps} />
      <Square className="odd-square square-3" row={props.row} column={5} {...sharedProps} />
      <Square className="even-square square-2" row={props.row} column={6} {...sharedProps} />
      <Square className="odd-square square-1" row={props.row} column={7} {...sharedProps} />
      <Square className="even-square square-0" row={props.row} column={8} {...sharedProps} />
    </div>
  )
}

export default Row
