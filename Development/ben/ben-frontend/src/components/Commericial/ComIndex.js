import React from 'react'
import ComBox from './ComBox'
class ComIndex extends React.Component{
    renderIf(){
        this.props.allComs.map((com,i)=>{
            return (<ComBox com={com} key={i}/>)  
          })
        
    }
    render(){
        return(
            <div>
                {this.renderIf()}
            </div>
        )
    }
}
export default ComIndex