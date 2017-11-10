import React from 'react'
import Row from './Row'

const Board = props => {
  let sharedProps = {
    pieces: props.pieces,
    recentMoveData: props.recentMoveData,
    selectedPieceId: props.selectedPieceId,
    handleClick: props.handleClick
  }

  return (
    <div className="board">
      <Row className="even-row" row={8} {...sharedProps} />
      <Row className="odd-row" row={7} {...sharedProps} />
      <Row className="even-row" row={6} {...sharedProps} />
      <Row className="odd-row" row={5} {...sharedProps} />
      <Row className="even-row" row={4} {...sharedProps} />
      <Row className="odd-row" row={3} {...sharedProps} />
      <Row className="even-row" row={2} {...sharedProps} />
      <Row className="odd-row" row={1} {...sharedProps} />
    </div>
  )
}

export default Board
