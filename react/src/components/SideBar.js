import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class SideBar extends Component {
  constructor(props) {
    super(props)
    this.state = {
      user: ''
    }
  }

  render() {
    return(
      <div className="side-bar">
        <h1>Chess on Rails</h1>
        <Link to="/">
          Home
        </Link>
      </div>
    )
  }
}

export default SideBar;
