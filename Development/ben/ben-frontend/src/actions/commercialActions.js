import React from 'react'
import {signUp }from "./userActions"
import { useDispatch } from 'react-redux'
import PrivateRoute from '../PrivateRoute'
import history from '../history'
let userID = localStorage.getItem("currentUser")
let comPath = "http://127.0.0.1:3000/commercials"


 function useCommercialActions(){
     return{getComs:()=>getComs(),
    myComs: ()=>myComs()}
 }

    function addCom(com){
        
        debugger
        let config = {
            method: 'POST',
            headers: {
                
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            
                },
                body: JSON.stringify({
                  name: com.name,
                  owner: localStorage.getItem("currentUser"),
                  maxOccupancy: com.maxOccupancy,
                  address: com.address,
                  city: com.city,
                  state: com.state,
                 zipcode: com.zipcode
                })}
           return(dispatch)=>{ fetch(comPath,config).then(res=>res.json()).then(com=>{
                debugger
                dispatch({type: "ADD_COM",com})
                history.push(`/users/${localStorage.getItem("currentUser")}/commercial`)
            }).catch()}
    }
   

    function getComs(){
        
        return(dispatch)=>{
            fetch(comPath).then(res=>res.json()).then(coms=>{
                debugger
                coms = coms.data
                dispatch({type: "GET_COMS",coms})

            })
        }
    }
    function myComs(){
        return(dispatch)=>{fetch("/coms/"+userID).then(res=>res.json()).then(obj=>{
            debugger
            dispatch({type: "MY_COMS"})
        })}
    }


    export {useCommercialActions, addCom,getComs}
            
       
