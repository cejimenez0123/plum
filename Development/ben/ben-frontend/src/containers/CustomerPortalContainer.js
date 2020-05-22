import React from 'react'
import CustomerProfile from '../components/Customers/CustomerProfile'
class CustomerPortalContainer extends React.Component{
    render(){
        return(
            <div>
                <CustomerProfile currentUser={this.props.currentUser}/>
            </div>
        )
    }
}
export default CustomerPortalContainer