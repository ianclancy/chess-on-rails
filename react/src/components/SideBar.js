import React, { Component } from "react";
import { Redirect } from 'react-router-dom';
import SideBarButton from "./SideBarButton";

class SideBar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      newGameId: null,
      redirect: null
    }
    this.addNewGame = this.addNewGame.bind(this)
    this.handleSignOutClick = this.handleSignOutClick.bind(this)
  }

  addNewGame(event) {
    event.preventDefault()
    let gamePayload = { turn: "white", user_id: this.props.currentUser.id }
    fetch("/api/v1/games", {
      method: "POST",
      body: JSON.stringify(gamePayload),
      headers: {
        "Content-Type": "application/json"
      },
      credentials: "same-origin"
    })
      .then(response => response.json())
      .then(json => {
        this.setState({ redirect: <Redirect to={`/games/${json}`} /> })
      })
  }

  handleSignOutClick() {
    this.setState({ redirect: null })
    this.props.signOutUser()
  }

  render() {
    let currentUserName;
    if (this.props.currentUser) {
      currentUserName = this.props.currentUser.name;
    } else {
      currentUserName = "Guest";
    }

    let links;
    if (this.props.currentUser) {
      links = [
        { label: "Home", path: "/", icon: "home" },
        { label: "New Game", path: `/games`, icon: "plus-square", handleClick: this.addNewGame },
        { label: "Sign Out", path: "/", icon: "sign-out", handleClick: this.handleSignOutClick }
      ]
    } else {
      links = [
        { label: "Home", path: "/", icon: "home" },
        { label: "Sign In", path: "/sign-in", icon: "sign-in" },
        { label: "Sign Up", path: "/sign-up", icon: "user-plus" }
      ]
    }

    let buttons = links.map(link => {
      return(
        <SideBarButton
          key={link.label}
          label={link.label}
          path={link.path}
          icon={link.icon}
          handleClick={link.handleClick}
          redirect={this.state.redirect}
        />
      )
    })

    return(
      <div className="side-bar">
        <p></p>
        <h1 className="app-title">Chess on Rails</h1>
        <h3 className="user-greeting">Hello {currentUserName}.</h3>
        {buttons}
      </div>
    )
  }
}

export default SideBar;
