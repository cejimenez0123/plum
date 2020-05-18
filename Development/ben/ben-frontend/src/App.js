import React from 'react';
import { BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom';
import HomeContainer from "./containers/HomeContainer"
import ComForm from './components/Commericial/ComForm'
import {connect} from 'react-redux'
import  signUp from "./actions/userActions"
import useUserActions from "./actions/userActions"
import SignUpForm from "./components/Customers/SignUpForm"
import ComProfile from "./components/Commericial/ComProfile"
import CustomerProfile from "./components/Customers/CustomerProfile"
import './App.css';

function App(props) {
  let bot = useUserActions()
  return (
    <div className="">
      <Router>
        <Route exact path="/">
          <HomeContainer/>
        </Route>
        <Route path ="/commercial">
              <ComForm/>
        </Route>
        <Route path="/user">
          <SignUpForm signUp={bot.signUp}/>
        </Route>
        <Route path='/user/:id/commericial'>
            <ComProfile/>
        </Route>
        <Route path='/user/:id'>
            <CustomerProfile/>
        </Route>
      </Router>
    </div>
  );
}
const mapDisToProps = (dispatch)=>{
  return {
    signUp: (user)=> dispatch(signUp(user))
  }
}
export default connect(null,mapDisToProps)(App);
