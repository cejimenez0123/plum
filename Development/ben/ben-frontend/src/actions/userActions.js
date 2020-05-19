import React from 'react'
import { useDispatch } from "react-redux"
import history from "../history"
let userPath = "http://127.0.0.1:3000/users"

function useUserActions(){
   
return {signUp: (user)=>signUp(user)
            
             
    }
}

function signUp(user){
   
    let config = {
        method: 'POST',
        headers: {
            
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        
            },
            body: JSON.stringify({
                name: user.name,
                email : user.email,
                password: user.password,
                type: user.tipo 
            })}
       return(dispatch)=>{fetch(userPath,config).then(res=>res.json()).then(user=>{ 
            dispatch({type:"LOG_IN",user})
            history.push(`/users/${user.id}`)
           })}
        }    
            
export { useUserActions,signUp }