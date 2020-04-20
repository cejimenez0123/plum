import React from "react"
import { Link } from 'react-router-dom'
import {sharePage} from '../../actions/pageActions'
export default function PageLinkBox(props) {
    const handleLinking=(id)=>{
        debugger
        
        localStorage.setItem("pageLink",id)

    }
    const handleOnSubmit=(e)=>{
        e.preventDefault()
        debugger
         let inputs = Array.from(e.target.getElementsByClassName("userCheckBox"))
     let checkedInputs = inputs.filter(input =>input.checked ===  true
         )
         sharePage(checkedInputs)
     
    }

 const toggleDisplay = (e)=>{
     let obj = document.querySelector(".userShareList-"+e.target.id)
     
     if (obj.style.display === "none"){
         obj.style.display = "block"
     }else{
         obj.style.display= "none"
     }

 }
 console.log(props)

    let p = props.page
    let i = props.id
    return(
        <li key={i}><Link onClick={()=>handleLinking(p.id)} key={i} to={`/pages/${p.id}`}>
                         {p.title}
                     </Link>
                     <button onClick={(e)=>{toggleDisplay(e)}}>Share</button>
                   
                     <div className={`userShareList-${p.id}`}style={{display: "none"}}>
                     <form onSubmit={(e)=>handleOnSubmit(e)}>
                         <ul>
                         {props.users.flat().slice(0,6).map((u,i)=>{   
                            if(u.id !== props.currentUser.id){
                               let user = u.attributes
                            return (<li key={i}>
                                 <label htmlFor="userCheckBox">{user.name}</label>
                                 <input key={i} className="userCheckBox" type="checkbox" id={user.id} data-pageid={p.id} value={user.name}/>
                                 
                             </li>)
                }})}
                         </ul>
                         < input type="submit" id="shareWithBtn" value="Share with"/>
                     </form>
                 </div>
                        
                     </li>)
                    
                 
        
        
}

