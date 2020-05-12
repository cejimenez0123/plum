import React from 'react'

class ComForm extends React.Component{
    constructor(){
        super()
        this.state={
            name:"",
            owner: "",
            maxOccupancy:"",
            address:"",
            city:"",
            state:"",
            zipcode:"",
            email: "",
            password:""
            
        }
    }
    handleOnChange = e =>{   
        this.setState({[e.target["name"]]: e.target.value})
    }
    handleOnSubmit = e =>{
        e.preventDefault()
        this.props.comSignUp(this.state)    
    }
    render(){
        return(
            <div>
            <form handleOnSubmit={this.handleOnSubmit(e)}>
                <label htmlFor="name">Name of Enterprise:</label>
                <input type="text" onChange={this.handleOnChange(e)} name="name"/>
                <label htmlFor="owner">Name of Owner:</label>
                <input type="text" onChange={this.handleOnChange(e)}  name="owner"/>
                <label htmlFor="email">Email:</label>
                <input type="text" onChange={this.handleOnChange(e)}  name="email"/>
                <label htmlFor="address">Address:</label>
                <label htmlFor="maxOccupancy">City:</label>
                <input type="text" onChange={this.handleOnChange(e)}  name="macOccupancy"/>
                <input type="text" onChange={this.handleOnChange(e)}  name="address"/>
                <label htmlFor="city">City:</label>
                <input type="text" onChange={this.handleOnChange(e)}  name="city"/>
                <label htmlFor="state">State</label>
                <input type="text"  onChange={this.handleOnChange(e)} name="state"/>
                <label htmlFor="password">Password:</label>
                <input type="text"onChange={this.handleOnChange(e)}  name="password" />
                <input type="submit"/>
            </form>
            </div>
        )
    }
}