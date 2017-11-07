import React, { Component } from "react";
import { Link } from "react-router-dom";

class SideBar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: {}
    }
    this.addNewGame = this.addNewGame.bind(this);
    this.getCurrentUser = this.getCurrentUser.bind(this);
    this.signOutUser = this.signOutUser.bind(this);
  }

  componentDidMount() {
    this.getCurrentUser();
  }

  addNewGame() {
    let gamePayload = { turn: "white", user_id: 9 }
    fetch("/api/v1/games", {
      method: "POST",
      body: JSON.stringify(gamePayload),
      headers: {
        "Content-Type": "application/json"
      },
      credentials: "same-origin"
    });
  }

  getCurrentUser() {
    fetch("/api/v1/users/current", {
      headers: {
        "Content-Type": "application/json"
      },
      credentials: "same-origin"
    })
      .then(response => response.json())
      .then(json => {
        this.setState({ currentUser: json });
      });
  }

  signOutUser() {
    console.log("sign out user here")
    fetch(`/api/v1/sessions/${this.state.currentUser.id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
      .then(() => {
        this.getCurrentUser()
      })
  }

  render() {
    let currentUserName;
    if (this.state.currentUser) {
      currentUserName = this.state.currentUser.name;
    } else {
      currentUserName = "Guest";
    }

    return(
      <div className="side-bar">
        <h1>Chess on Rails</h1>
        <h3>Hello {currentUserName}.</h3>
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
          <Link to="/sign-in">
            <div className="side-bar-link">
              Sign In
            </div>
          </Link>
          <Link to="/">
            <div className="side-bar-link" onClick={this.signOutUser}>
              Sign Out
            </div>
          </Link>
          <Link to="/sign-up">
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
