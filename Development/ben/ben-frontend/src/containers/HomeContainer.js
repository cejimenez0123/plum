import React from 'react'
import "../App.css"
import {Button} from 'react-bootstrap'
import LogInForm from "../components/Customers/LogInForm"
class HomeContainer extends React.Component{



    render(){
        return(<div>
            <div class="square">
                <LogInForm class="LogInForm"/>
            <br/>
                <h4 class="signUpStmt"> <u>Sign up below</u></h4>
            <div class="signIn-Btns">
                 <button href="/signup" class="signUpBtn">Customer</button>
                <button href="/business" class="btn-primary signUpBusinessBtn">Business</button>
            </div>
            </div>
        </div>)
    }
}
export default HomeContainer