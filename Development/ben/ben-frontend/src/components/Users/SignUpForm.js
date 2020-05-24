import React from 'react'


export default class SignUpForm extends React.Component{
    constructor(){
        super()
            this.state={
                name: "",
                email:"",
                password:"",
                tipo: ""    
            }
    }
    
    handleOnChange = e =>{   
        this.setState({[e.target["name"]]: e.target.value})
        console.log(this.state)
    }
 
    handleOnSubmit = e =>{
        e.preventDefault()
     
        let user = this.state
       this.props.signUp(user) 
        

    }
    render(){
        return(<div>
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
                    <br/>
                    <div onChange={(e)=>this.handleOnChange(e)}>
                        <h6> Sign Up As</h6>
                         
                        <input type="radio"  name="tipo" value="user"/>
                        <label htmlFor="user">User</label>
                        <br/>
                        <input type="radio" name="tipo" value="owner"/>
                        <label htmlFor="owner">Owner</label>
                    </div>
                         
                        
                    
                    < input type="submit" value="Sign Up"/>
                </form>     
            </div>
        )
    }
}