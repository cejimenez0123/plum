const pageUrl = "http://127.0.0.1:3000/pages"
const shareUrl = "http://127.0.0.1:3000/page_users"
const addPage = (text,title) =>{ 
    let userId = localStorage.getItem("currentUser")
    let config = {    
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
          },
          body: JSON.stringify({
            title: title,
            text: text, 
            userid: userId
          })}
          console.log("ADDPAGE")
          return ((dispatch) => {
              dispatch(addPageStart())
              fetch(pageUrl,config).then(res =>res.json())
              .then(obj=>{
                 debugger
                  let page = obj.data.attributes
                  dispatch({type: "ADD_PAGE", page})
              })
              
          } )}

const addPageStart = ()=>{
    return {
        type: "ADD_PAGE_START"
    }
}
const getPage = (id) =>{
    return((dispatch)=>{
        dispatch(getPageStart())
        fetch(pageUrl+"/"+id+"/edit").then(res=>res.json()).then(obj =>{
                debugger
            }
        )
    })

}

const getAllPages =() =>{
    return((dispatch)=>{
        fetch(pageUrl).then(res => res.json()).then(
            obj => {
                let pages = obj.data
                dispatch({type: "GET_ALL_PAGES",pages })}
        )
    })
    
}
const sharedPages= ()=>{
    return((dispatch)=>{
        fetch(shareUrl).then(res => res.json()).then(sharedPages => 
            dispatch({type: "GET_SHARED_PAGES", sharedPages})
        )
    })
}
const getPageStart = ()=>{
    return{
        type: "GET_PAGE_START"
    }
}
const showPage =()=>{
    let id = localStorage.getItem("pageLink")
    return((dispatch)=>{
        dispatch(showPageStart)
        fetch(pageUrl+"/"+id).then(res=>res.json()).then(page =>{
         
            page = page.data
            dispatch({type: "SHOW_PAGE", page})
        })
    })
}
const updatePage = (text,title) => {
 
    let id = localStorage.getItem("pageLink")
    const config = {    
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
          },
          body: JSON.stringify({
              id: id,
            text: text,
            title: title
          })}
     fetch(pageUrl+"/"+id,config).then(res => res.json()).then(obj=>{
         return((dispatch)=>{dispatch({type: "UPDATE_PAGE",obj})})
         
     })
}
const DELETE_PAGE=(id)=>{
    const config = {    
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
          },
          body: JSON.stringify({
              id: id
          })}
    fetch(pageUrl+"/"+id,config).then(res => res.json()).then(obj=>{
         debugger 
    })
}
const showPageStart ={
    type: "SHOW_PAGE_START"
}
const sharePage= (page)=>{

     page.map(p=>{
       let config = {    
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: "application/json"
          },
          body: JSON.stringify({
            page_id: p.dataset.pageid,
            user_id: p.id
          })}
    fetch(shareUrl,config).then(res=>res.json()).then(obj=>{
        alert("Sent")
    })
   
})}

export {addPage,sharePage,getAllPages,sharedPages,showPage,updatePage}