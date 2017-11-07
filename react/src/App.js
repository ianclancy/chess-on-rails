import React from 'react';
import { Switch, Route } from 'react-router-dom';
import SideBar from './components/SideBar';
import SignInFormContainer from './containers/SignInFormContainer';
import SignUpFormContainer from './containers/SignUpFormContainer';
import GamesIndexContainer from './containers/GamesIndexContainer';
import GameShowContainer from './containers/GameShowContainer';
import UserShowContainer from './containers/UserShowContainer';

const App = props => {
  return(
    <Switch>
      <div className="page-container">
        <SideBar />
        <Route exact path="/" component={GamesIndexContainer} />
        <Route exact path="/sign-in" component={SignInFormContainer} />
        <Route exact path="/sign-up" component={SignUpFormContainer} />
        <Route exact path="/games" component={GamesIndexContainer} />
        <Route exact path="/games/:id" component={GameShowContainer} />
        <Route exact path="/users/:id" component={UserShowContainer} />
      </div>
    </Switch>
  )
}

export default App;
