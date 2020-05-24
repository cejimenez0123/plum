import React from 'react'
import SignUpForm from '../components/Users/SignUpForm'
class FormContainer extends React.Component{

    render(){
        return(
            <div>
                <SignUpForm signUp={this.props.signUp}/>
            </div>
        )
    }
}
export default FormContainer