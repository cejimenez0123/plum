import React from 'react'
import { Route ,Redirect} from 'react-router-dom'
export const PrivateRoute = ({ component: Component, ...rest }) => (
    <Route {...rest} render={(props) => (
      isAuth.isAuthenticated === true
        ? <Component {...props} />
        : <Redirect to='/signin' />
    )} />
  );
  const isAuth = () =>{
    return {
      isAuthenticated: true,
      authenticate: ()=>{
        this.isAuthenticated = true
      },
      logout: ()=>{
        this.isAuthenticated = false
      }
    }
  }