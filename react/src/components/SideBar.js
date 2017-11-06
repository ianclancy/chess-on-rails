import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class SideBar extends Component {
  constructor(props) {
    super(props)
    this.state = {
      user: ''
    }
    this.addNewGame = this.addNewGame.bind(this)
  }

  addNewGame() {
    let gamePayload = { turn: "white", user_id: 1 }
    fetch('/api/v1/games', {
      method: 'POST',
      body: JSON.stringify(gamePayload),
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
  }

  render() {
    return(
      <div className="side-bar">
        <h1>Chess on Rails</h1>
        <div className="side-bar-links">
          <Link to="/">
            <div className="side-bar-link">
              Home
            </div>
          </Link>
          <Link to="/games">
            <div className="side-bar-link" onClick={this.addNewGame}>
              New Game
            </div>
          </Link>
          <Link to="/signup">
            <div className="side-bar-link">
              Sign Up
            </div>
          </Link>
        </div>
      </div>
    )
  }
}

export default SideBar;
