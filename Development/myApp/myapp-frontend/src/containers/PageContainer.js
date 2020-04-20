import React from 'react'
import {connect} from 'react-redux'
import Page from '../components/pages/page'
import NavbarContainer from './NavbarContainer'
let pageUrl = "http://localhost/pages/"

class PageContainer extends React.Component{
    componentDidMount(){
        this.props.getAllPages()
        this.props.showPage()
    }
    renderPage(){
       return this.props.pages.flat().map((p,i)=>{
            if(p.id === localStorage.getItem("pageLink")){
                if(p.attributes){
            return (<Page key={i} page={p.attributes} currentPage={this.props.currentPage} pages={this.props.pages}/>)
       }else{
           return(<Page key={i} page={p} currentPage={this.props.currentPage} pages={this.props.pages}/>)

       }}})
    }
    

    render(){
        console.log(this.props)
        return( 
            <div className="pageContainer">
            
               {this.renderPage()}
            </div>
        )
    }

}
const mapStateToProps = state =>{
    return {
       pages: state.pages.pages.flat(),
       currentPage: state.pages.currentPage
    }
}

export default connect(mapStateToProps)(PageContainer)