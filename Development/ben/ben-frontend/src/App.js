import React from 'react';
import { BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom';
import HomeContainer from "./containers/HomeContainer"
import ComForm from './components/Commericial/ComForm'
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
        <Route>

        </Route>

      </Router>
    </div>
  );
}

export default App;
