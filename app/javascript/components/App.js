import React from 'react';
import {Router,browserHistory, Route, IndexRoute} from 'react-router'
import BreedsIndexContainer from '../containers/BreedsIndexContainer';
import BreedShowContainer from '../containers/BreedShowContainer';
import ReviewFormContainer from '../containers/ReviewFormContainer';
import BreedFormContainer from '../containers/BreedFormContainer';


const App = props => {
  return(
    <Router history = {browserHistory}>
      <Route path='/' component={BreedsIndexContainer} />
      <Route path='breeds' component={BreedsIndexContainer} />
      <Route path='breeds/new' component={BreedFormContainer} />
      <Route path='breeds/:id' component={BreedShowContainer} />
    </Router>
  )
}
export default App;
