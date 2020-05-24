import React from 'react'
import "../App.css"
import {Button} from 'react-bootstrap'
import LogInForm from "../components/Customers/LogInForm"

const HomeContainer =()=> {


   
 
        return(<div>
            <div class="square">
                <LogInForm class="LogInForm"/>
            <br/>
                <h4 class="signUpStmt"> <u>Sign up below</u></h4>
            <div class="signIn-Btns">
                 <a href="http://localhost:3001/signup" class="signUpBtn">Sign Up</a>  
            </div>
            </div>
        </div>)
}

export default HomeContainer