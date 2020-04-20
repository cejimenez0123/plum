import React, {Component} from 'react'
import { addPage } from '../../actions/pageActions'
import { connect } from 'react-redux'
class PageForm extends React.Component{
    hanldeOnClick(){
    
        let text = document.getElementById("text")
        debugger
        if (text.style.display === "none"){
            text.style.display = "block"
        }else{
            text.style.display = "none"
        }
        
    }
    handleOnSubmit(e){
        e.preventDefault()
       let text = e.target.querySelector("textarea").value
       let title = e.target.querySelector("input#title").value
   
        this.props.addPage(text,title)
            if(this.props.docSaved){
            alert("Document Saved")          
            } else {
            alert("Not saved yet")
        }
    }
       render(){
        return(
            <div id="pageForm">
                < button onClick={()=> this.hanldeOnClick()}> Make a Page</button>
               < form onSubmit={(e)=>this.handleOnSubmit(e)}>
                   <input type="text" id="title"/>
               <textarea id="text" style={{display: "block"}}
                rows="5" cols="50"></textarea>
                < input type="submit" value="save"/>
            </form>
                
            
            </div>
        )}
}

 



const mapStateToProps = state =>{
    return{
        docSaved: state.pages.docSaved
    }
}
const mapDispatchToProps = dispatch =>{
    return {
        addPage: (text,title) => dispatch(addPage(text,title))
    }
} 
export default connect(mapStateToProps,mapDispatchToProps)(PageForm)