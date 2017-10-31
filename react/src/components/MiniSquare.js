import React from 'react'

const MiniSquare = props => {
  let squareId = `${props.row}${props.column}`

  let piecesInRow = props.pieces.filter(piece => piece.row == props.row)
  let piece = piecesInRow.filter(piece => piece.column == props.column)
  piece = piece[0]

  let piece_display

  if (piece) {
    piece_display = piece.symbol
  } else {
    piece_display = ''
  }

  return(
    <div id={squareId} className={`${props.className} mini-square`}>
      {piece_display}
    </div>
  )
}

export default MiniSquare
