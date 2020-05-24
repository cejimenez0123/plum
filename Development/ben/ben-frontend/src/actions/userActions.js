import React from 'react'
import { useDispatch } from "react-redux"
import history from "../history"
let userPath = "http://127.0.0.1:3000/users"

function useUserActions(){
   let dispatch = useDispatch()
return {signUp: (user)=>signUp(user),
           logIn: (user)=>dispatch(logIn(user))
             
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
                tipo: user.tipo 
            })}
       return(dispatch)=>{fetch(userPath,config).then(res=>res.json()).then(user=>{ 
            user = user.data.attributes
            dispatch({type:"LOG_IN",user})
          
            localStorage.setItem("currentUser",user.id)
            switch (user.tipo){
                case "user":
                    history.push(`/users/${user.id}`)
                    break
                case "owner":
                    console.log("hit")
                    history.push(`/users/${user.id}/coms`)
                    break
                default:
                    history.push(window.location.pathname)
                }

           })}
        }
function logIn(user)   {
    let config = {
        method: 'POST',
        headers: {
            
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        
            },
            body: JSON.stringify({       
                email : user.email,
                password: user.password,
            })}
       return(dispatch)=>{fetch("http://localhost:3000/login",config).then(res=>res.json()).then(user=>{ 
        debugger    
        dispatch({type:"LOG_IN",user})
        
            switch (user.tipo){
                case "user":
                    history.push(`/users/${user.id}`)
                case "commercial":
                    history.push(`/users/${user.id}/commerical`)
                default:
                    history.push(window.location.pathname)
            }
           }).catch(error=>{window.alert(error)
        history.push(window.location.pathname)})}
}
            
export { useUserActions,signUp,logIn }