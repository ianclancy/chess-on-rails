import React from 'react';
import { Link } from "react-router-dom";

const SideBarButton = props => {
  return (
    <div className="side-bar-links">
      {props.redirect}
      <Link to={props.path}>
        <div className="side-bar-link" onClick={props.handleClick}>
          &nbsp;
          &nbsp;
          <i className={`fa fa-${props.icon}`} />
          &nbsp;
          &nbsp;
          {props.label}
        </div>
      </Link>
    </div>
  )
}

export default SideBarButton;
