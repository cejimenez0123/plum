import React from 'react'
export default class SignUpForm extends React.Component{
    constructor(){
        super()
            this.state={
                name: "",
                email:"",
                password:""    
            }
    }
    handleOnChange = e =>{   
        this.setState({[e.target["name"]]: e.target.value})
    }
    handleOnSubmit = e =>{
        e.preventDefault()
        this.props.signUp(this.state)    
    }
    render(){
        return(<div>
            <NavbarContainer/>
                <form className="SignUpForm" onSubmit={this.handleOnSubmit}> 
                    <label htmlFor="name">Name:</label>
                    <input type="text" name="name" 
                    onChange={this.handleOnChange} />
                    <br/>
                    <label htmlFor="email">Email:</label>
                    <input type="text" name="email"  onChange={this.handleOnChange} />
                    <br />
                    <label htmlFor="password">Password:</label>
                    <input type="password" name="password"  onChange={this.handleOnChange} />
                    <br />
                    < input type="submit" value="Sign Up"/>
                </form>
                
            </div>
        )
    }
}