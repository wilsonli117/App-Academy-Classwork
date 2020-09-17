import React from "react";
import {TodoListItem} from "./todo_list_item";
import TodoForm from "./todo_form_container";

class TodoList extends React.Component{
    constructor(props) {
        super(props);
    }
   
    render() {  
        return(
            <>
                <ul>
                    {this.props.todos.map(todo => <TodoListItem todo={todo} key={todo.id} />)}
                </ul>
                
                <TodoForm />
            </>
        )
    }
}

export default TodoList;