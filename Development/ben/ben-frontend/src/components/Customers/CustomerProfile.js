import React from 'react'

const CustomerProfile =(props)=>{

    const user =()=>{
        if(props.currentUser){
            debugger
        }
    }
    
        return(
            <div>
                <h2>CustomerProfile</h2>
                {user()}
            </div>
        )
}

export default CustomerProfile