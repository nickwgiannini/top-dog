import React, {Component} from 'react';
import {Router, browserHistory, Route, IndexRoute} from 'react-router'
import BackButton from '../components/BackButton'
import BreedIndexTile from '../components/BreedIndexTile'

class BreedsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      breeds: [],
    }
  }
  componentDidMount () {
    fetch('/api/v1/breeds', {
      credentials: 'same-origin'
    })
    .then (response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let breeds = body.breeds
      this.setState({breeds: breeds})
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  render() {
    let breeds = this.state.breeds.map(breed => {
      return(
        <BreedIndexTile
          key = {breed.id}
          id = {breed.id}
          name = {breed.name}
          img_url = {breed.img_url}
        />
      )
    })
    return (

          <div className="featured-image-block-grid">
            <div className="row large-up-4 small-up-2">
              {breeds}
            </div>
          </div>
    )
  }
}

export default BreedsIndexContainer;
