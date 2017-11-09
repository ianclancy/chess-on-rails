import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom';
import SideBar from './components/SideBar';
import SignInFormContainer from './containers/SignInFormContainer';
import SignUpFormContainer from './containers/SignUpFormContainer';
import GamesIndexContainer from './containers/GamesIndexContainer';
import GameShowContainer from './containers/GameShowContainer';
import UserShowContainer from './containers/UserShowContainer';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: {},
      games: [],
      newGameId: null
    }
    this.getCurrentUser = this.getCurrentUser.bind(this)
    this.getGames = this.getGames.bind(this)
    this.signOutUser = this.signOutUser.bind(this)
  }

  componentDidMount() {
    this.getCurrentUser();
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
        this.setState({ currentUser: json })
      })
  }

  getGames() {
    fetch('/api/v1/users/current', {
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
      .then(response => response.json())
      .then(json => {
        if (json) {
          this.setState({ games: json.games })
        } else {
          this.setState({ games: [] })
        }
      })
  }

  signOutUser() {
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
      .then(() => {
        this.getGames()
      })
  }

  render() {
    return(
      <Switch>
        <div className="page-container">
          <SideBar currentUser={this.state.currentUser} newGameId={this.state.newGameId} addNewGame={this.addNewGame} getCurrentUser={this.getCurrentUser} signOutUser={this.signOutUser} />
          <Route exact path="/" render={props => (
            <GamesIndexContainer {...props} currentUser={this.state.currentUser} games={this.state.games} getGames={this.getGames} />
          )}/>
          <Route exact path="/games" render={props => (
            <GamesIndexContainer {...props} currentUser={this.state.currentUser} games={this.state.games} getGames={this.getGames} />
          )}/>
          <Route exact path="/sign-in" render={props => (
            <SignInFormContainer {...props} currentUser={this.state.currentUser} getCurrentUser={this.getCurrentUser} />
          )}/>
          <Route exact path="/sign-up" component={SignUpFormContainer} />
          <Route exact path="/games/:id" component={GameShowContainer} />
          <Route exact path="/users/:id" component={UserShowContainer} />
        </div>
      </Switch>
    )
  }
}

export default App;
