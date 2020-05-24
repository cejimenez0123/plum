import React from 'react'
import CustomerProfile from '../components/Customers/CustomerProfile'
import ProfileCard from "../components/Users/ProfileCard"
class CustomerPortalContainer extends React.Component{
    render(){
        return(
            <div>
                <ProfileCard currentUser={this.props.currentUser}/>
                <CustomerProfile currentUser={this.props.currentUser}/>
            </div>
        )
    }
}
export default CustomerPortalContainer