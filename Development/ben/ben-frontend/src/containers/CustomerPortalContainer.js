import React from 'react'
import CustomerProfile from '../components/Customers/CustomerProfile'
import ProfileCard from "../components/Users/ProfileCard"
import ComIndex from "../components/Commericial/ComIndex"
class CustomerPortalContainer extends React.Component{
    componentDidMount(){
        this.props.getComs()
    }
    render(){
        return(
            <div>
                <ProfileCard currentUser={this.props.currentUser}/>
                <CustomerProfile currentUser={this.props.currentUser}/>
                <ComIndex allComs={this.props.allComs}/>
            </div>
        )
    }
}
export default CustomerPortalContainer