import { useCommercialActions } from "../actions/commercialActions"

export default function ComReducer(
    state={currentComs: null, allComs:[]},
    action){
    switch (action.type){ 
        case "MY_COM":

            return {...state,currrentComs: action.com}
        case "ADD_COM":
            debugger
            return {...state,currentComs: state.currentComs.append(action.com)}
        case "GET_COMS":
            return {...state,allComs: action.coms}
        default:
                return state

    } 
    }