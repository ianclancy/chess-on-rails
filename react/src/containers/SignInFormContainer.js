import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

class SignInFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: '',
      password: '',
      redirect: null,
      error: null
    }
    this.addSession = this.addSession.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  addSession(event) {
    event.preventDefault();
    let sessionPayload = {
      email: this.state.email,
      password: this.state.password
    }
    fetch('/api/v1/sessions', {
      method: 'POST',
      body: JSON.stringify(sessionPayload),
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
      .then(response => response.json())
      .then(json => {
        if (json.error) {
          this.setState({ error: json.error })
        } else {
          this.props.getCurrentUser()
          this.setState({ redirect: <Redirect to="/" /> })
        }
      })
  }

  render() {
    return(
      <div>
        {this.state.redirect}
        <form onSubmit={this.addSession}>
          <h1 className="form-title">Sign In</h1>
          <label>Email</label>
          <input
            name="email"
            type="text"
            value={this.state.email}
            onChange={this.handleChange}
          />
          <label>Password</label>
          <input
            name="password"
            type="password"
            value={this.state.password}
            onChange={this.handleChange}
          />
          <div className="error-tile">
            {this.state.error}
          </div>
          <input
            className="submit-button"
            type="submit"
          />
        </form>
      </div>
    )
  }
}

export default SignInFormContainer;
