import React from 'react'
import SideCapturedBox from './SideCapturedBox'

const CapturedBox = props => {
  let capturedSymbols = props.capturedPieces.map(piece => {
    return(
      piece.symbol
    )
  })

  return(
    <div>
      <SideCapturedBox
        side={"black"}
        capturedPieces={props.capturedPieces}
      />
      <SideCapturedBox
        side={"white"}
        capturedPieces={props.capturedPieces}
      />
    </div>
  )
}

export default CapturedBox
