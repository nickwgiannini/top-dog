import React from 'react';
import {Router,browserHistory, Route, IndexRoute} from 'react-router'
import BreedsIndexContainer from '../containers/BreedsIndexContainer';
import BreedsShowContainer from '../containers/BreedsShowContainer';


const App = props => {
  return(
    <Router history = {browserHistory}>
      <Route path='breeds' component={BreedsIndexContainer} />
      <Route path='breeds/:id' component={BreedsShowContainer} />
    </Router>
  )
}
export default App;
