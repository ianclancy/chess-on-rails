import React from 'react'

const SidePieceCapturedBox = props => {
  let pieces = props.sideCapturedPieces.filter(piece => piece.type == props.pieceType)

  let symbols = pieces.map(piece => {
    return(
      piece.symbol
    )
  })

  return(
    <div className="side-piece-captured-box">
      {symbols}
    </div>
  )
}

export default SidePieceCapturedBox
