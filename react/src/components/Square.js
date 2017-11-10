import React from 'react'

const Square = props => {
  let squareId = `${props.row}${props.column}`;

  let piecesInRow = props.pieces.filter(piece => piece.row == props.row);
  let piece = piecesInRow.filter(piece => piece.column == props.column);
  piece = piece[0]

  let moveOldRow = null
  let moveOldColumn = null
  let moveNewRow = null
  let moveNewColumn = null

  if (props.recentMoveData.move) {
    moveOldRow = props.recentMoveData.piece_old_row
    moveOldColumn = props.recentMoveData.piece_old_column
    moveNewRow = props.recentMoveData.move.to_row
    moveNewColumn =props.recentMoveData.move.to_column
  }

  let movedClass

  if (props.recentMoveData.move && (moveOldRow == props.row && moveOldColumn == props.column) || (moveNewRow == props.row && moveNewColumn == props.column)) {
    movedClass = 'moved';
  } else {
    movedClass = '';
  }

  let piece_display, selectedClass;

  if (piece) {
    piece_display = piece.symbol;
  } else {
    piece_display = '';
  }

  if (piece && props.selectedPieceId == piece.id) {
    selectedClass = 'selected';
  } else {
    selectedClass = '';
  }

  return(
    <div id={squareId} className={`${props.className} square ${selectedClass} ${movedClass}`} onClick={props.handleClick}>
      {piece_display}
    </div>
  )
}

export default Square
