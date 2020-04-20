import React from 'react'
import PageLinkBox from './PageLinkBox'

export class Inbox extends React.Component{

    
    
    renderBox(){
       return this.props.myPages.map((page,i)=>{
            let p = page.attributes
             return < PageLinkBox key={i} id={i} page={p} users={this.props.users} currentUser={this.props.currentUser} getAllPages={this.props.getAllPages} showPage={this.props.showPage}/>
              
         })
    }


    render(){
      
        return(
            <div>
                <h2>Inbox</h2>
            {this.renderBox()}
            </div>
        )
    }
}
