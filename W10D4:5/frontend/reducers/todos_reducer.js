import {RECEIVE_TODOS} from "../actions/todo_actions";
import {RECEIVE_TODO} from "../actions/todo_actions";

const initialState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
  };

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let newState; 
    switch (action.type) { 

        case RECEIVE_TODOS: 
            const {todos} = action;
            newState = Object.assign({}, state);
            for (let i = 0; i < todos.length; i++) {
                newState[todos[i].id] = todos[i];
            }
            return newState;

        case RECEIVE_TODO:
            const {todo} = action;
            newState = Object.assign({}, state);
            newState[todo.id] = todo;
            return newState;
            // return Object.assign({}, state, { [todo.id]: todo });

        default:
            return state;
    }

};

export default todosReducer;