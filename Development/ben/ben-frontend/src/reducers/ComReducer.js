export default function ComReducer(
    state={},
    action){
    switch (action.type){ 

        case "ADD_COM":
            return {state}
        default:
                return state

    } 
    }