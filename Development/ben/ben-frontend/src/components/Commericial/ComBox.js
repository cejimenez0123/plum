import React from 'react'

export default function ComBox(props){

    const ifRender=()=>{
        if(props.com){
            debugger
        }
    }
    return(<div>
        {ifRender}
    </div>)
}