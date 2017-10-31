import React from 'react';
import { Switch, Route } from 'react-router-dom';
import SideBar from './components/SideBar';
import GamesIndexContainer from './containers/GamesIndexContainer';
import GameShowContainer from './containers/GameShowContainer';

const App = props => {
  return(
    <Switch>
      <div className="page-container">
        <SideBar />
        <Route exact path="/" component={GamesIndexContainer} />
        <Route exact path="/games" component={GamesIndexContainer} />
        <Route exact path="/games/:id" component={GameShowContainer} />
      </div>
    </Switch>
  )
}

export default App
