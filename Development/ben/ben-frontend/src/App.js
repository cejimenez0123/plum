import React, { useState } from 'react';
import { Router, Route, Switch, Redirect} from 'react-router-dom';
import HomeContainer from "./containers/HomeContainer"
import ComForm from './components/Commericial/ComForm'
import {useCommercialActions, addCom} from "./actions/commercialActions"
import {connect, useStore} from 'react-redux'
import { signUp ,useUserActions }from "./actions/userActions"
import history from './history'
import CustomerPortalContainer from "./containers/CustomerPortalContainer"
import CommercialPortalContainer from "./containers/CommercialPortalContainer"
import SignUpForm from "./components/Users/SignUpForm"
import ComProfile from "./components/Commericial/ComProfile"
import CustomerProfile from "./components/Customers/CustomerProfile"
import PrivateRoute from "./PrivateRoute"
import FormContainer from "./containers/FormContainer"
import './App.css';
let com
let bot
function App(props) {
  bot = useUserActions()
   com = useCommercialActions()

  return (
    <div className="">
      <Router history={history}>
        <Route exact path="/">
          <HomeContainer/>
        </Route>
        <Route path ="/commercial">
              <ComForm signUp={props.comSignUp}/>
        </Route>
        <Route path="/user">
          <SignUpForm signUp={props.signUp}/>
        </Route>
        <Route path="/users/:id/commercial">
          <CommercialPortalContainer/>
        </Route>
        <Route path="/signup">
          <FormContainer signUp={props.signUp}/>
        </Route>
        <Route exact path='/users/:id/coms'>
            <ComForm addCom={props.addCom} />
        </Route>
    
        <PrivateRoute exact path='/users/:id'>
        <CustomerPortalContainer currentUser={props.currentUser}/>
        </PrivateRoute>
      </Router>
    </div>
  );
}
const mapDisToProps = (dispatch)=>{
  
  return {
    signUp: (user)=> dispatch(bot.signUp(user)),
    addCom: (com)=>dispatch(addCom(com))
  }
}
const mapStateToProps = (state)=>{
  return{
    currentUser: state.users.currentUser,
    loggedIn: state.users.loggedIn

  }
}
export default connect(mapStateToProps,mapDisToProps)(App);
