import React from 'react';

const ErrorTile = props => {
  return(
    <div className="error-tile">
      {props.error}
    </div>
  )
}

export default ErrorTile
