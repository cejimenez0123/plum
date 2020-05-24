import React from 'react'
import {signUp }from "./userActions"
import { useDispatch } from 'react-redux'
import PrivateRoute from '../PrivateRoute'
import history from '../history'
let comPath = "http://127.0.0.1:3000/commercials"


 function useCommercialActions(){}

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
                  maxOccupancy: com.maxOccupancy,
                  address: com.address,
                  city: com.city,
                  state: com.state,
                 zipcode: com.zipcode
                })}
           return(dispatch)=>{ fetch(comPath,config).then(res=>res.json()).then(com=>{
                debugger
                dispatch({type: "ADD_COM",com})
                
            })}
    }
    function getComs(){
        
        return(dispatch)=>{
            fetch(comPath).then(res=>res.json()).then(coms=>{
                debugger
                dispatch({type: "GET_COMS",coms})

            })
        }
    }


    export {useCommercialActions, addCom}
            
       
