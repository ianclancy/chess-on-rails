import React, { Component } from 'react';

class SignUpFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: ''
    }
    this.handleChange = this.handleChange.bind(this)
    this.addNewUser = this.addNewUser.bind(this)
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value })
  }

  addNewUser() {
    event.preventDefault()
    let newUserPayload = {
      name: this.state.name,
      email: this.state.email,
      password: this.state.password,
      password_confirmation: this.state.passwordConfirmation
    }
    fetch('/api/v1/users', {
      method: 'POST',
      body: JSON.stringify(newUserPayload),
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin'
    })
  }

  render() {
    return(
      <form onSubmit={this.addNewUser}>
        <label>Name
          <input
            name="name"
            type="text"
            value={this.state.name}
            onChange={this.handleChange}
          />
        </label>
        <label>Email
          <input
            name="email"
            type="text"
            value={this.state.email}
            onChange={this.handleChange}
          />
        </label>
        <label>Password
          <input
            name="password"
            type="password"
            value={this.state.password}
            onChange={this.handleChange}
          />
        </label>
        <label>Confirmation
          <input
            name="passwordConfirmation"
            type="password"
            value={this.state.passwordConfirmation}
            onChange={this.handleChange}
          />
        </label>
        <input
          type="submit"
        />
      </form>
    )
  }
}

export default SignUpFormContainer;
