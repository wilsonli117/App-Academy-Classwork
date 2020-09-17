import {combineReducers} from "redux";
import todosReducers from "./todos_reducer";

const rootReducer = combineReducers(
    {todos: todosReducers}
);

export default rootReducer;