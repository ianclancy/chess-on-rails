import React from 'react'
import SidePieceCapturedBox from './SidePieceCapturedBox'

const SideCapturedBox = props => {
  let sideCapturedPieces = props.capturedPieces.filter(piece => piece.side == props.side)
  // console.log(sideCapturedPieces)
  return(
    <div className="side-captured-box">
      <SidePieceCapturedBox
        pieceType="Pawn"
        sideCapturedPieces={sideCapturedPieces}
      />
      <SidePieceCapturedBox
        pieceType="Bishop"
        sideCapturedPieces={sideCapturedPieces}
      />
      <SidePieceCapturedBox
        pieceType="Knight"
        sideCapturedPieces={sideCapturedPieces}
      />
      <SidePieceCapturedBox
        pieceType="Rook"
        sideCapturedPieces={sideCapturedPieces}
      />
      <SidePieceCapturedBox
        pieceType="Queen"
        sideCapturedPieces={sideCapturedPieces}
      />
    </div>
  )
}

export default SideCapturedBox
