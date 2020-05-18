import React from 'react'
import {push} from 'react-router-redux'
import { useDispatch } from "react-redux"
let userPath = "http://localhost:3000/users"

export default function useUserActions(){
    
    let dispatch = useDispatch()
return {signUp: (user)=>{
    debugger
    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json; odata=verbose"

            },
            body: JSON.stringify({
                email : user.email,
                password: user.password,
                type: user.type 
            })}
      fetch(userPath,config).then(res=>res.json()).then(obj=>{
           
            dispatch({type: "LOG_IN",obj}) 
            push(`/users/${obj.id}`)
       })}}
}

