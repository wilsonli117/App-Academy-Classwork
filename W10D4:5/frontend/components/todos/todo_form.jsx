import React from "react";

export default class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: "",
            done: ""
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(field) {
        // debugger
        return (e) => {
            this.setState({[field]: e.target.value});
        }
    }

    handleSubmit(e) {
        // debugger
        e.preventDefault();
        this.props.receiveTodo(this.state);
        // debugger
        this.setState({
            title: "",
            body: "",
            done: ""
        });
    }

    render() {
        return (
            <>
                <h3>Add a Todo!</h3>
                <form onSubmit={e => this.handleSubmit(e)}>
                    <label >Title:</label>
                    <input type="text" name="todo[title]" id="title" value={this.state.title} onChange={this.update("title")}/>
                    <br/>
                    <label >Body:</label>
                    <input type="text" name="todo[body]" id="body" value={this.state.body} onChange={this.update("body")}/>
                    <p>Done?</p>
                    <label >True</label>
                    <input type="radio" name="todo[done]" value={true} id="true" checked={this.state.done === "true"} onChange={this.update("done")}/>
                    <label >False</label>
                    <input type="radio" name="todo[done]" value={false} id="false" checked={this.state.done === "false"} onChange={this.update("done")}/>
                    <br></br>
                    <button>Add Todo</button>
                </form>
            </>
        )
    }
}

