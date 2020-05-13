import {browserHistory} from 'react-router'
let userPath = "http://localhost:3000/users"
const signUp = (user)=>{
    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
            },
            body: JSON.stringify({
                email : user.email,
                password: user.password,
                type: user.type 
            })}
       fetch(userPath,config).then(res=>res.json()).then(obj=>{
           if(obj.type === "owner"){
               
           }
       })
}
export default (signUp)