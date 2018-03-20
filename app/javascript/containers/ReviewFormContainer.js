import React, {Component} from 'react';
import {Router, browserHistory, Route, IndexRoute} from 'react-router'
import BodyField from '../components/BodyField'
import KidFriendlyField from '../components/KidFriendlyField'
import DogFriendlyField from '../components/DogFriendlyField'
import TrainabilityField from '../components/TrainabilityField'
import EnergyLevelField from '../components/EnergyLevelField'
import BarkingLevelField from '../components/BarkingLevelField'

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      errors: {},
      body: '',
      breed_id: this.props.id,
      kid_friendly: 1,
      dog_friendly: 1,
      barking_lvl: 1,
      trainability: 1,
      energy_lvl: 1
    }
    this.handleBody = this.handleBody.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleClearForm = this.handleClearForm.bind(this)
    this.handleKidFriendly = this.handleKidFriendly.bind(this)
    this.handleDogFriendly = this.handleDogFriendly.bind(this)
    this.handleBarkingLevel = this.handleBarkingLevel.bind(this)
    this.handleTrainability = this.handleTrainability.bind(this)
    this.handleEnergyLevel = this.handleEnergyLevel.bind(this)
  }

  handleClearForm(event){
    event.preventDefault()
    this.setState({
      errors: {},
      body: ''
    })
  }

  handleBody (event){
    this.setState({body: event.target.value})
  }

  handleKidFriendly (event){
    this.setState({
      kid_friendly: event.target.value
    })
  }

  handleDogFriendly (event){
    this.setState({
      dog_friendly: event.target.value
    })
  }

  handleBarkingLevel (event){
    this.setState({
      barking_lvl: event.target.value
    })
  }

  handleTrainability (event){
    this.setState({
      trainability: event.target.value
    })
  }

  handleEnergyLevel (event){
    this.setState({
      energy_lvl: event.target.value
    })
  }

  handleSubmit(event) {
    event.preventDefault();
    let formPayload = {
      breed_id: this.props.id,
      body: this.state.body,
      kid_friendly: this.state.kid_friendly,
      dog_friendly: this.state.dog_friendly,
      barking_lvl: this.state.barking_lvl,
      trainability: this.state.trainability,
      energy_lvl: this.state.energy_lvl
    }

    fetch(`/api/v1/reviews`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(formPayload),
      headers: { 'Content-Type': 'application/json' }
    })
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
        this.setState({
          errors: {},
          body: '',
          breed_id: this.props.id,
          kid_friendly: 1,
          dog_friendly: 1,
          barking_lvl: 1,
          trainability: 1,
          energy_lvl: 1
        });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  render() {
    console.log(this.state)
    return(
      <div>
        <h1>Add a Review: </h1>
        <form className="new-article-form callout" onSubmit={this.handleSubmit}>

          <BodyField
            content={this.state.body}
            label="Review:"
            name="review-body"
            handleBody={this.handleBody}
          />

          <KidFriendlyField
            content={this.state.kid_friendly}
            label = {"Kid Friendliness(1 = dangerous for kids - 10 = perfect with kids):"}
            handleChange={this.handleKidFriendly}
          />

          <DogFriendlyField
            content={this.state.dog_friendly}
            label ={"Dog Friendliness(1 = hates every dog - 10 = sniffs every butt)"}
            handleChange={this.handleDogFriendly}
          />

          <BarkingLevelField
            content={this.state.barking_lvl}
            label = {"Barking Level(1 = inaudible bark - 10 = WW2)"}
            handleChange={this.handleBarkingLevel}
          />

          <TrainabilityField
            content={this.state.trainability}
            label ={"Trainability (1 = rebel without a cause - 10 = does backflips for a pat on the head)"}
            handleChange={this.handleTrainability}
          />

          <EnergyLevelField
            content={this.state.energy_lvl}
            label = {"Energy level (1 = pretty much dead - 10 = ready for insomnia?)"}
            handleChange={this.handleEnergyLevel}
          />


          <div className="button-group">
            <button className="button" onClick={this.handleClearForm}>Clear</button>
            <input className="button" type="submit" value="Submit"  />
          </div>
        </form>
      </div>
    )
  }
}

export default ReviewFormContainer
