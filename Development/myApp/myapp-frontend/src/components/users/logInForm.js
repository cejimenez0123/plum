import React, { Component } from "react"


class LogInForm extends Component{
    constructor(){
        super()
        this.state ={
            username: "",
            password: ""
        }
    }

    handleOnChange = e =>{

        this.setState({[e.target["name"]]: e.target.value})
        console.log("state",this.state)
    }
    handleOnSubmit = e => {
        e.preventDefault()
        this.props.logIn(this.state)
    }
    render(){
        return(
            <div id="LogInForm">
                <form onSubmit={this.handleOnSubmit}> 
                    <label htmlFor="username">Username:</label>
                    <input type="text" name="username" onChange={this.handleOnChange}/>
                    <br />
                    <label htmlFor="password">Password:</label>
                    <input type="password" name="password" onChange={this.handleOnChange}/>
                    <br />
                    < input type="submit" value="Log In"/>
                </form>    
            </div>
        )
    }
}


export default LogInForm