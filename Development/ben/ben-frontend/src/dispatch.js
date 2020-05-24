import React from 'react'
import { useDispatch } from 'react-redux'
let dispatch
function GetDispatch(props){
    dispatch = useDispatch()
    return(<div></div>)
}
export {GetDispatch,dispatch}