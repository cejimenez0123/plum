import React from 'react'
import { connect } from 'react-redux'
import { Inbox } from '../components/pages/inbox'
import "../App.css"
import {Profile} from '../components/users/profile'
import PageForm from '../components/pages/pageForm'
import UserPages from '../components/users/userPages'
import { getUsers,LOG_IN,getAllUserPages,END_CURRENT_USER, SET_CURRENT_USER} from "../actions/userActions"
import { getAllPages, sharedPages, showPage} from "../actions/pageActions"
import NavbarContainer from "./NavbarContainer"
import { NavBarBrand } from 'reactstrap'
class ProfileContainer extends React.Component{
    
componentDidMount(){
    this.props.getUsers()
    this.props.getUser()
    this.props.GetSharedPages()
    this.props.getMyPages()
    this.props.getAllPages()
    
}
   
   
    
    render(){
       console.log("PROF",this.props)
     
        return(
            <div class="ProfileContainer">
                < Profile request={this.props.request} currentUser={this.props.currentUser} users={this.props.users}/>
                < PageForm />
                < UserPages  request={this.props.request} users={this.props.users} users={this.props.users} currentUser={this.props.currentUser} pages={this.props.pages} getUsers={this.props.getUsers} getAllPages={this.props.getMyPages} />
                < Inbox request={this.props.request} sharedPages={this.props.sharedPages} myPages={this.props.myPages} pages={this.props.pages} users={this.props.users} currentUser={this.props.currentUser} getAllPages={this.props.getAllPages} showPage={this.props.showPage}/>
            </div>
        )
    }
}


const mapDispatchToProps= (dispatch)=>{
  return { getUsers: ()=>{dispatch(getUsers())},
  getAllPages: ()=> dispatch(getAllPages()),
  GetSharedPages: ()=> dispatch(sharedPages()),
  getMyPages: ()=>dispatch(getAllUserPages()),
  showPage: ()=>dispatch(showPage()),
    getUser: ()=>dispatch(SET_CURRENT_USER())
  }
}
const mapStateToProps = (state) => {
    return { users: state.users.users.flat(),
    currentUser: state.users.currentUser,
    sharedPages: state.pages.sharedPages,
    myPages: state.pages.myPages,
    pages: state.pages.pages.flat(),
    request: state.users.requesting};
  };

export default connect(mapStateToProps,mapDispatchToProps)(ProfileContainer)