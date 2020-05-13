import signUp from "./userActions"
let comPath = "http://localhost:3000/com"
const comSignUp=(com)=>{
    
            
        signUp(com)

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
       fetch(comPath,config) 
}
export default {comSignUp}