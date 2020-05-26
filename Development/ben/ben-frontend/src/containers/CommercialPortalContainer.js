import React from 'react'
import ProfileCard from '../components/Users/ProfileCard'
import BusinessIndex from "../components/Owner/BusinessIndex"
class CommercialoPrtalContainer extends React.Component{
    componentDidMount(){
        
    }

    render(){
        return(
            <div>
                <ProfileCard/>
                <BusinessIndex comArr={this.props.comArr}/>
            </div>
        )
    }
}
export default CommercialoPrtalContainer