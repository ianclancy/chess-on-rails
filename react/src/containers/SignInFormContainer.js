import React, { Component } from 'react';

class SignInFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: '',
      password: ''
    }
    this.handleChange = this.handleChange.bind(this)
    this.addSession = this.addSession.bind(this)
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value })
  }

  addSession(event) {
    event.preventDefault()
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
  }

  render() {
    return(
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
        <input
          className="submt-button"
          type="submit"
        />
      </form>
    )
  }
}

export default SignInFormContainer;
