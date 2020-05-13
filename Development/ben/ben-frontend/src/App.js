import React from 'react';
import { BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom';
import HomeContainer from "./containers/HomeContainer"
import ComForm from './components/Commericial/ComForm'
import SignUpForm from "./components/Customers/SignUpForm"
import ComProfile from "./components/Commericial/ComProfile"
import CustomerProfile from "./components/Customers/CustomerProfile"
import './App.css';

function App() {
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
          <SignUpForm/>
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

export default App;
