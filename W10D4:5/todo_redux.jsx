import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import {receiveTodos, receiveTodo} from "./frontend/actions/todo_actions";
import Root from "./frontend/components/root";
import {allTodos} from "./frontend/reducers/selectors";

document.addEventListener("DOMContentLoaded", ()=>{
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={configureStore}/>, root);
    // TODO REMOVE
    window.store = configureStore;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.allTodos = allTodos;
})

