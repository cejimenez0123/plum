import React, { Component } from 'react'
import '../App.css'
import {Navbar,NavLink, NavbarBrand} from 'reactstrap'
import {connect} from 'react-redux'
class NavbarContainer extends Component{


    handleOnClick(){
        this.props.endSession()
    }
    renderIf(){
        
        
        if (this.props.currentUser){
            return (<div >
            <NavLink onClick={()=>{this.props.getUser()}} href={`/users/${this.props.currentUser.id}`}> Profile</NavLink> 
            <NavLink onClick={()=>this.handleOnClick} href={'/'}>Log Out</NavLink>
            </div>
            )
    }else{
           return <NavLink href="/signin"> Sign In</NavLink> 
        }
    }

    render(){
        
        return(
            <div class="navBar">
                <Navbar  >
                    <NavbarBrand href="/"> <h2>Pb</h2></NavbarBrand>
                    {this.renderIf()}
                </Navbar>
            </div>
        ) 
        
    }
}
const mapStateToProps = (state)=>{
    return{
        currentUser: state.users.currentUser
    }
}
export default connect(mapStateToProps)(NavbarContainer)