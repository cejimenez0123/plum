import React from 'react'
import { Redirect} from 'react-router-dom'
import {connect} from 'react-redux'
import {logIn} from '../../actions/userActions'
import "../../App.css"
class LogInForm extends React.Component{
    constructor(){
        super()
        this.state ={
            username: "",
            password: ""
        }
    }

    handleOnChange = e =>{
        this.setState({[e.target["name"]]: e.target.value})
    }
    handleOnSubmit = e => {
        e.preventDefault()
       
        this.props.logIn(this.state)
    }
    render(){
        return(
            <div className="LogIn">
                <form class="LogInForm" onSubmit={this.handleOnSubmit}> 
                <div class="logInInputs">
                    <label htmlFor="email">Email:</label>
                    <input type="text" name="email" onChange={this.handleOnChange}/>
                    <br />
                    <label htmlFor="password">Password:</label>
                    <input type="password" name="password" onChange={this.handleOnChange}/>
                </div>
                    <br />

                    < input type="submit" class="logInBtn" value="Log In"/>
                </form>    
            </div>
        )
    }
}
function mapDispatchToProps(dispatch){
    return{
        logIn: (user)=>dispatch(logIn(user))
    }
}
export default connect(null,mapDispatchToProps)(LogInForm)