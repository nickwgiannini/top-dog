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
    let reviews = this.state.reviews.map(review => {
      return(
        <ReviewTile
          key={review.id}
          body={review.body}
          kid_friendly={review.kid_friendly}
          dog_friendly={review.dog_friendly}
          barking_lvl={review.barking_lvl}
          trainability={review.trainability}
          energy_lvl={review.energy_lvl}
        />
      )
    })

    return(
      <div>
        <h1>Breed Show Page </h1>
        <BreedShowTile
          data={this.state.breed}
        />
        <h2> Reviews: </h2>
        {reviews}
      </div>
    )
  }
}

export default BreedShowContainer;
