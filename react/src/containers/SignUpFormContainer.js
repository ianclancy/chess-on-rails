import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';
import ErrorTile from '../components/ErrorTile';

class SignUpFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      redirect: null,
      errors: []
    }
    this.handleChange = this.handleChange.bind(this)
    this.addNewUser = this.addNewUser.bind(this)
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value })
  }

  addNewUser(event) {
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
      .then(response => response.json())
      .then(json => {
        if (json.errors) {
          this.setState({ errors: json.errors })
        } else {
          this.props.getCurrentUser()
          this.setState({ redirect: <Redirect to="/" /> })
        }
      })
  }

  render() {
    let errors = this.state.errors.map(error => {
      return(
        <ErrorTile
          key={error}
          error={error}
        />
      )
    })

    return(
      <div>
        {this.state.redirect}
        <form onSubmit={this.addNewUser}>
          <h1 className="form-title">Sign Up</h1>
          <label>Username</label>
          <input
            name="name"
            type="text"
            value={this.state.name}
            onChange={this.handleChange}
          />
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
          <label>Confirmation</label>
          <input
            name="passwordConfirmation"
            type="password"
            value={this.state.passwordConfirmation}
            onChange={this.handleChange}
          />
          {errors}
          <input
            className="submit-button"
            type="submit"
            value="Create Account"
          />
        </form>
      </div>
    )
  }
}

export default SignUpFormContainer;
