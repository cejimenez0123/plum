import { useCommercialActions } from "../actions/commercialActions"

export default function ComReducer(
    state={comArr: [], allComs:[]},
    action){
    switch (action.type){ 
        case "MY_COMS":

            return {...state,comArr: action.coms}
        case "ADD_COM":
            debugger
            return {...state,currentComs: state.currentComs.append(action.com)}
        case "GET_COMS":
            return {...state,allComs: action.coms}
        default:
                return state

    } 
    }