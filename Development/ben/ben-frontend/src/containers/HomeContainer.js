import React from 'react'
import "../App.css"
import {Button} from 'react-bootstrap'
import LogInForm from "../components/Customers/LogInForm"
import { useHistory, useLocation } from 'react-router-dom'
const HomeContainer =()=> {


   
    let location= useLocation()
        return(<div>
            <div class="square">
                <LogInForm class="LogInForm"/>
            <br/>
                <h4 class="signUpStmt"> <u>Sign up below</u></h4>
            <div class="signIn-Btns">
                 <a href="http://localhost:3001/user" class="signUpBtn" value="Customer">Customer</a>
                <a href= "http://localhost:3001/commercial" class="btn-primary signUpBusinessBtn" value="Business">Business</a>
            </div>
            </div>
        </div>)
}

export default HomeContainer