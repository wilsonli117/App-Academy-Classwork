import React from 'react';

class Signin extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            username: '',
            password: ''
        };

        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(field) {
        return (e) => {
            this.setState({ [field]: e.target.value });
        };
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.loginUser(this.state).then(() => this.props.history.push('/chirps'));
        this.setState({
            username: '',
            password: ''
        });

    }

    render() {
        return (
            <div className="session-form">
                <h2>Sign In!</h2>
                <form onSubmit={this.handleSubmit}>
                    <label>Username:
                        <input type="text" value={this.state.username} onChange={this.handleInput('username')} />
                    </label>
                    <label>Password:
                        <input type="password" value={this.state.password} onChange={this.handleInput('password')} />
                    </label>
                    <button>Sign In</button>
                </form>
            </div>
        )
    }
}

export default Signin