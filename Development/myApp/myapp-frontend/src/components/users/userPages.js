import React from 'react'
import "../../App.css"
import {Link} from 'react-router-dom'
import {sharePage} from "../../actions/pageActions"

const UserPages = (props)=>{
    const handleLinking=(id)=>{
        props.getAllPages()
        localStorage.setItem("pageLink",id)
    }
    const renderPages = () =>{
        
        
       return( props.pages.map((p,i) =>{
        if(p.attributes){
         p = p.attributes
        } 
        if(p.user_id === localStorage.getItem("currentUser")){
            return( <li key={i} ><Link onClick={()=>handleLinking(p.id)} key={i} to={`/pages/${p.id}`}>
                {p.title}
            </Link>
            <button id={p.id} onClick={(e)=>{toggleDisplay(e)}}>Share</button>
          
            <div className={`userShareList-${p.id}`} id={p.id} style={{display: "none"}}>
            <form onSubmit={(e)=>handleOnSubmit(e)}>
                <ul>
                {props.users.flat().map((u,i)=>{  
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
           
        }})
       )}
    
       const handleOnSubmit=(e)=>{
           
           e.preventDefault()

            let inputs = Array.from(e.target.querySelectorAll(".userCheckBox"))
        let checkedInputs = inputs.filter(input =>input.checked ===  true)
        debugger
        sharePage(checkedInputs)
        
       }

    const toggleDisplay = (e)=>{

        debugger
        let obj = document.querySelector(".userShareList-"+e.target.id)
        
        if (obj.style.display === "none"){
            obj.style.display = "block"
        }else{
            obj.style.display= "none"
        }

    }
   
    return(
    
        <div id="UserPages" >
            <h2>Stored Pages</h2>
            <ul>
            {renderPages()}
            </ul>
        </div>
    )
    
    
}



export default UserPages
