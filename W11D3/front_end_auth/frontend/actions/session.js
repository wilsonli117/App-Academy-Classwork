import {postUser, postSession, deleteSession} from '../utils/session';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = user => {
    return {
        type: RECEIVE_CURRENT_USER,
        user
    };
};

const logoutCurrentUser = () => {
    return {
        type: LOGOUT_CURRENT_USER
    };
};

export const createNewUser = user => dispatch => postUser(user)
    .then(user => { return dispatch(receiveCurrentUser(user)); });

export const loginUser = user => dispatch => postSession(user)
    .then(user => { return dispatch(receiveCurrentUser(user)); });

export const logoutUser = () => dispatch => deleteSession()
    .then(() => { return dispatch(logoutCurrentUser()); });