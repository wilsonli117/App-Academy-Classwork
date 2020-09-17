import { connect } from 'react-redux';
import { loginUser } from '../../actions/session';
import SignIn from './signin';

const mapDispatchToProps = dispatch => ({
    loginUser: user => dispatch(loginUser(user))
});

export default connect(null, mapDispatchToProps)(SignIn);