import React from 'react'
import { useStore } from 'react-redux'

const ComProfile=(props)=>{
    let store = useStore()
    const user =()=>{
        if(props.currentUser){
            debugger
        }
    }
   debugger
        return(
            <div>
                Com Profile
                {user()}
            </div>
        )
    }

export default ComProfile
