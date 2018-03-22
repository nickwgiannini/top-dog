import React, {Component} from 'react';
import {Router,browserHistory, Route, IndexRoute, Link} from 'react-router'
import BreedShowTile from '../components/BreedShowTile'
import ReviewTile from '../components/ReviewTile'
import ReviewFormContainer from './ReviewFormContainer';

class BreedShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      breed: {},
      reviews: [],
      messages: [],
      users: [],
      length: 0
    }
    this.next = this.next.bind(this)
    this.getBreedInfo = this.getBreedInfo.bind(this)
    this.addNewReview = this.addNewReview.bind(this)
    this.deleteBreed = this.deleteBreed.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
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
      let users = body.users
      this.setState({
        breed: breed,
        reviews: reviews,
        users: users,
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

  next(x) {
    if (x <= this.state.length) {
      this.setState({
        next: "Next",
      });
    }
  }

  addNewReview(submission){
    fetch(`/api/v1/reviews`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(submission),
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }
    })
    .then (response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status}`
        error = new Error(errorMessage)
        throw(error)
      }
    })
    .then(response => response.json())
    .then(body => {
      this.componentDidMount()
      this.setState({
        messages: body.messages
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleDelete(event) {
    event.preventDefault();
      this.deleteBreed()
  }

  deleteBreed() {
    let id = this.props.params.id
    fetch(`/api/v1/breeds/${id}`, {
      method: 'DELETE',
      credentials: 'same-origin'
    }).then(response => {
        if (response.ok) {
          return response
        } else {
          let errorMessage = `${response.status} (${response.statusText})`
          let error = new Error(errorMessage)
          throw(error)
        }
      }
    )
    .then(body => {
      browserHistory.push('/breeds')
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  render() {
    let email;
    let avatar;
    let message = this.state.messages[0]
    let reviews = this.state.reviews.map(review => {
      let users = this.state.users.map(user => {
        if (review.user_id == user.id) {
          email = user.email
          avatar = user.avatar.url
        }
      })
      return(
        <ReviewTile
         review ={review}
         key={review.id}
         body={review.body}
         avatar={avatar}
         userEmail={email}
         kid_friendly={review.kid_friendly}
         dog_friendly={review.dog_friendly}
         barking_lvl={review.barking_lvl}
         trainability={review.trainability}
         energy_lvl={review.energy_lvl}
       />
      )
    })
    return(
      <div className="columns medium-10">
        <h1>Doggy Details</h1>
        <BreedShowTile
          data={this.state.breed}
          onDeleteClick={this.handleDelete}
        />
        <ul><Link to={`/breeds/${this.state.breed.id-1}`}>Previous</Link> | <Link to={`/breeds/${this.state.breed.id+1}`}>Next</Link></ul>
        <h2> Reviews: </h2>
        {reviews}
        <ReviewFormContainer
          id= {this.props.params.id}
          addNewReview= {this.addNewReview}
        />
        <h3>{message}</h3>
      </div>
    )
  }
}

export default BreedShowContainer;
