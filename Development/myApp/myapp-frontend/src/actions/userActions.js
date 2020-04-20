
let userPath = "http://localhost:3000/users"
let loginPath = "http://localhost:3000/login"
function SIGN_UP (user) { 
    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
          },
          body: JSON.stringify({
              name: user.name,
              username: user.username,
              password: user.password  
          })}
          return ((dispatch) => {
            dispatch(SIGN_UP_START);
            fetch(userPath,config)
                .then(res => res.json())
                .then(obj =>{
                
                    let user =  obj.data.attributes
                    localStorage.setItem("currentUser",user.id)
                    dispatch({ type: 'SIGN_UP', user})
            })
                .catch(err => {
                    console.error(err)
                  });
          })
    
  }

function SIGN_UP_START(){
    return {
    type: "SIGN_UP_START"}
}
function LOG_IN_START(){
    return{
        type: "LOG_IN_START"
    }
}

const LOG_IN = (user)=>{
    let config = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
            },
            body: JSON.stringify({
                username: user.username,
                password: user.password  
            })}
    return ((dispatch)=>{
        dispatch(LOG_IN_START);
       
        fetch(loginPath,config).then(res=>res.json()).then(user =>{ user = user.data.attributes
        dispatch({type: "LOG_IN",user})
        }).catch((error) =>{
            console.error(error)})
    })
}
const SET_CURRENT_USER=()=>{
    let id = localStorage.getItem("currentUser")

  return ((dispatch)=>{
      dispatch({type:"START_SET_CURRENT_USER"})
      fetch(userPath+"/"+id).then(res=>res.json()).then(obj=>{
        let user = obj.data.attributes
        dispatch({ type: "SET_CURRENT_USER",user})})
    
        
    })
}

const END_CURRENT_USER=(dispatch)=>{

    dispatch({type:"END_CURRENT_USER"})
}
const showUser =()=>{

}
function getUsers(){
    
    return ((dispatch)=>{
        dispatch({type: "GET_USERS_START"})
    fetch(userPath).then(res => res.json()).then(obj=>{
       
        let users = obj.data
        dispatch({type: "GET_USERS", users})
    })})
}
function getAllUserPages(){
    let id = localStorage.getItem("currentUser")
    return((dispatch)=>{
        fetch(userPath+"/"+id+"/pages").then(res => res.json()).then(
            obj => {
                let pages = obj.data
                dispatch({type: "GET_MY_PAGES",pages})}
        )
    })
    
}


export { LOG_IN,SIGN_UP, SIGN_UP_START, getUsers, getAllUserPages,SET_CURRENT_USER, END_CURRENT_USER}