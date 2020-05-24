import React from 'react'
import comSignUp from "../../actions/commercialActions"

import "../../App.css"
class ComForm extends React.Component{
    constructor(){
        super()
        this.state={
            name:"",
            maxOccupancy:"",
            address:"",
            city:"",
            state:"",
            zipcode:""
            
        }
    }
    handleOnChange = e =>{   
        this.setState({[e.target["name"]]: e.target.value})
    }
    handleOnSubmit = e =>{
        e.preventDefault()
        this.props.addCom(this.state)
       
    }
    render(){
        return(
            <div className="ComSquare">
            <form onSubmit={(e)=>this.handleOnSubmit(e)}>
                <h3><u>Commercial Form</u></h3>
                <label htmlFor="name">Name of Enterprise:</label>
                <input type="text" onChange={(e)=>this.handleOnChange(e)} name="name"/>
                <br/>
                <label htmlFor="maxOccupancy">Max Occupany:</label>
                <input type="text" onChange={(e)=>this.handleOnChange(e)}  name="maxOccupancy"/>
                <br/>
                <label htmlFor="address">Address:</label>
                <input type="text" onChange={(e)=>this.handleOnChange(e)} name="address"/>
                <label htmlFor="city">City:</label>
                <input type="text" onChange={(e)=>this.handleOnChange(e)}  name="city"/>
                <br/>
                <label htmlFor="state">State</label>
                <input type="text"  onChange={(e)=>this.handleOnChange(e)} name="state"/>
                <label htmlFor="zipCode">Zip Code:</label>
                <input type="text" onChange={(e)=>this.handleOnChange(e)}  name="zipcode"/> 
                <br/>
                <input type="submit"/>
              
                
            </form>
            </div>
        )
    }
}
export default ComForm