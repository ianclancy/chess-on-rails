import React from 'react'

const Square = props => {
  let squareId = `${props.row}${props.column}`

  let piecesInRow = props.pieces.filter(piece => piece.row == props.row)
  let piece = piecesInRow.filter(piece => piece.column == props.column)
  piece = piece[0]

  let piece_display, selectedClass

  if (piece) {
    piece_display = piece.symbol
  } else {
    piece_display = ''
  }

  if (piece && props.selectedPieceId == piece.id) {
    selectedClass = 'selected'
  } else {
    selectedClass = ''
  }

  return(
    <div id={squareId} className={`${props.className} square ${selectedClass}`} onClick={props.handleClick}>
      {piece_display}
    </div>
  )
}

export default Square
