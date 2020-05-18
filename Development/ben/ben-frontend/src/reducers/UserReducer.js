export default function UserReducer(
    state={currentUser: null},
    action){
    switch (action.type){ 

        case "LOG_IN":
            return {state}
        default:
                return state

    } 
    }