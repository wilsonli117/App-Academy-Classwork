import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from '../actions/session';

const _nullSession = {
    currentUser: null
};

export default (state = _nullSession, action) => {
    Object.freeze(state);

    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return Object.assign({}, { currentUser: action.user }); //why not just return { currentUser: action.user} ?
            //storing entire user object in session slice because no user slice 

        case LOGOUT_CURRENT_USER:
            return _nullSession;

        default:
            return state;
    }
}