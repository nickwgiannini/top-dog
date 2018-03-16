import React, {Component} from 'react';
import {Router,browserHistory, Route, IndexRoute} from 'react-router'
import BreedShowTile from '../components/BreedShowTile'
import ReviewTile from '../components/ReviewTile'

class BreedShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      breed: {},
      reviews: []
    }
  }

  componentDidMount() {
    let breedId = this.props.params.id;
    fetch(`/api/v1/breeds/${breedId}`)
    .then(response => {
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
      let breed = body.breed
      let reviews = body.reviews
      this.setState({
        breed: breed,
        reviews: reviews
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div>
        <h1>Breed Show Page </h1>
        <BreedShowTile
          id={this.state.breed.id}
          name={this.state.breed.name}
          personality={this.state.breed.personality}
          shedding={this.state.breed.shedding}
          height={this.state.breed.height}
          weight={this.state.breed.weight}
          grooming={this.state.breed.grooming}
          img_url={this.state.breed.img_url}
        />
        <ReviewTile
        />

      </div>
    )
  }
}



export default BreedShowContainer;
