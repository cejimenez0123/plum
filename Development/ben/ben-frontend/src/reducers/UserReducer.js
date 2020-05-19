export default function UserReducer(
    state={currentUser: null,loggedIn: false, users: []},
    action){
    switch (action.type){ 

        case "LOG_IN":
            debugger
            return {state,currentUser: action.user,loggedIn: true}
        default:
                return state

    } 
    }