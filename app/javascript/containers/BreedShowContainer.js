import React, {Component} from 'react';
import {Router,browserHistory, Route, IndexRoute, Link} from 'react-router'
import BreedShowTile from '../components/BreedShowTile'
import ReviewTile from '../components/ReviewTile'

class BreedShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      breed: {},
      reviews: [],
      length: 0,
    }
    this.getBreedInfo = this.getBreedInfo.bind(this)
  }
  getBreedInfo(breedId) {
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
      let length = body.length

      this.setState({
        breed: breed,
        reviews: reviews,
        length: length,

      });

    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount(){
    this.getBreedInfo(this.props.params.id)
  }

  componentWillReceiveProps(nextProps){
    if (nextProps.params.id !== this.props.params.id) {
      this.getBreedInfo(nextProps.params.id)
    }
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
      <ul><Link to={`/breeds/${this.state.breed.id-1}`}>Previous</Link></ul>
      <ul><Link to={`/breeds/${this.state.breed.id+1}`}>Next</Link></ul>
      </div>

    )
  }
}

export default BreedShowContainer;
