import React, { Component } from 'react';

class UserShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      userData: {},
      userId: this.props.match.params.id
    };
    this.getUserData = this.getUserData.bind(this);
  }

  componentDidMount() {
    this.getUserData();
  }

  getUserData() {
    fetch(`/api/v1/users/${this.state.userId}`)
      .then(response => response.json())
      .then(json => {
        if (this.state.userData != json) {
          this.setState({
            userData: json
          });
        }
      });
  }

  render() {
    return(
      <div>
        Hello {this.state.userData.name}. Your email is {this.state.userData.email}.
      </div>
    )
  }
}

export default UserShowContainer;
