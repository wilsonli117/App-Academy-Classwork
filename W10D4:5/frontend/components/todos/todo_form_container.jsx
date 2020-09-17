import {connect} from "react-redux";
import TodoForm from "./todo_form.jsx";
import {receiveTodo} from "../../actions/todo_actions";
import * as todoUtils from "../../util/todo_util";

const mapStateToProps = (state) => {
    return {};
};

const mapDispatchToProps = (dispatch) => {
    return {
        receiveTodo: state => {
            state.done === "true" ? state.done = true : state.done = false;
            state.id = todoUtils.uniqueId();
            dispatch(receiveTodo(state));
        }
    }
};

export default connect(mapStateToProps, mapDispatchToProps)(TodoForm);