import React from 'react'
import {signUp }from "./userActions"
let comPath = "http://127.0.0.1:3000/commercials"

export default function useCommercialActions(){


    return {
        signUp:(com)=>{
            signUp({name: com.owner,email: com.email,password: com.password})

            let config = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    Accept: "application/json"
                    },
                    body: JSON.stringify({
                        name:  com.name,
                        owner: com.owner,
                        maxOccupancy: com.maxOccupancy,
                        address: com.address,
                        city: com.city,
                        state: com.state,
                        zipcode: com.zipcode
                    })}
               return (dispatch)=>{fetch(comPath,config).then(res=>res.json()).then(
                   obj=>{
                       debugger
                   }
               )
        }}
        }
    }

    
            
       
