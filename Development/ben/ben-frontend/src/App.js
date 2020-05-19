import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom';
import HomeContainer from "./containers/HomeContainer"
import ComForm from './components/Commericial/ComForm'
import useCommercialActions from "./actions/commercialActions"
import {connect, useStore} from 'react-redux'
import { signUp ,useUserActions }from "./actions/userActions"

import SignUpForm from "./components/Customers/SignUpForm"
import ComProfile from "./components/Commericial/ComProfile"
import CustomerProfile from "./components/Customers/CustomerProfile"
import './App.css';
let com
let bot
function App(props) {
  bot = useUserActions()
   com = useCommercialActions()
const loggedIn_=()=>{
  if (props.loggedIn){
   return( <Redirect to={`/users/${props.currentUser.id}`} />)
  }
}
  return (
    <div className="">
      <Router>
        <Route exact path="/">
          <HomeContainer/>
        </Route>
        <Route path ="/commercial">
              <ComForm signUp={props.signUp}/>
        </Route>
        <Route path="/user">
          <SignUpForm signUp={props.signUp}/>
        </Route>
        <Route path='/user/:id/commericial'>
            <ComProfile />
        </Route>
        {loggedIn_()}
        <Route path='/users/:id'>
            <CustomerProfile currentUser={props.currentUser}/>
        </Route>
      </Router>
    </div>
  );
}
const mapDisToProps = (dispatch)=>{
  
  return {
    signUp: (user)=> dispatch(bot.signUp(user))
  }
}
const mapStateToProps = (state)=>{
  return{
    currentUser: state.users.currentUser,
    loggedIn: state.users.loggedIn

  }
}
export default connect(mapStateToProps,mapDisToProps)(App);