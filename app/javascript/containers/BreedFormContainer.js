import React, {Component} from 'react';
import {Router, browserHistory, Route, IndexRoute} from 'react-router'
import BreedsIndexContainer from '../containers/BreedsIndexContainer'
import NameField from '../components/NameField'
import LifeExpectancyField from '../components/LifeExpectancyField'
import PersonalityField from '../components/PersonalityField'
import SheddingField from '../components/SheddingField'
import HeightField from '../components/HeightField'
import WeightField from '../components/WeightField'
import GroomingField from '../components/GroomingField'
import ImgUrlField from '../components/ImgUrlField'

class BreedFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      errors: [],
      name:'',
      life_expectancy:'',
      personality:'',
      shedding:'',
      height:'',
      weight:'',
      grooming:'',
      img_url:''
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleClearForm = this.handleClearForm.bind(this)
    this.handleName = this.handleName.bind(this)
    this.handleLifeExpectancy = this.handleLifeExpectancy.bind(this)
    this.handlePersonality = this.handlePersonality.bind(this)
    this.handleShedding = this.handleShedding.bind(this)
    this.handleHeight = this.handleHeight.bind(this)
    this.handleWeight = this.handleWeight.bind(this)
    this.handleGrooming = this.handleGrooming.bind(this)
    this.handleImgUrl = this.handleImgUrl.bind(this)
    this.addNewBreed = this.addNewBreed.bind(this)
  }

  addNewBreed(submission){
    fetch(`/api/v1/breeds`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(submission),
      headers: {
        'Content-Type': 'application/json',
        'Accept-Type': 'application/json'
       }
    })
    .then (response => {
      if (response.ok || response.status == 422) {
        return response
      } else {
        let errorMessage = `${response.status}`
        error = new Error(errorMessage)
        throw(error)
      }
    })
    .then(response => response.json())
    .then(body => {
      if (body.errors) {
        this.setState({
          errors: body.errors
        });
      } else {
        browserHistory.push('/breeds')
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleClearForm(event){
    event.preventDefault()
    this.setState({
      errors: [],
      name: '',
      life_expectancy: '',
      personality: '',
      shedding: '',
      height: '',
      weight: '',
      grooming: '',
      img_url: ''
    })
  }

  handleName (event){
    this.setState({
      name: event.target.value
    })
  }

  handleLifeExpectancy (event){
    this.setState({
      life_expectancy: event.target.value
    })
  }

  handlePersonality (event){
    this.setState({
      personality: event.target.value
    })
  }

  handleShedding (event){
    this.setState({
      shedding: event.target.value
    })
  }

  handleHeight (event){
    this.setState({
      height: event.target.value
    })
  }

  handleWeight (event){
    this.setState({
      weight: event.target.value
    })
  }

  handleGrooming (event){
    this.setState({
      grooming: event.target.value
    })
  }

  handleImgUrl (event){
    this.setState({
      img_url: event.target.value
    })
  }

  handleSubmit(event) {
    event.preventDefault();
    let formPayload = {
      breed_id: this.props.id,
      name: this.state.name,
      life_expectancy: this.state.life_expectancy,
      personality: this.state.personality,
      shedding: this.state.shedding,
      height: this.state.height,
      weight: this.state.weight,
      grooming: this.state.grooming,
      img_url: this.state.img_url,

    }
    this.addNewBreed(formPayload)
    this.handleClearForm(event)
  }

  render() {
    // let errors = []
    // if (this.state.errors.length > 0){
    //    errors = this.state.errors.map(error => {
    //     <p>{error}</p>
    //   })
    // }
    return(
      <div>
        {this.state.errors}
        <h1>Add a Breed: </h1>
        <form className="new-article-form callout" onSubmit={this.handleSubmit}>
          <NameField
            content={this.state.name}
            label = {"Name of new Breed"}
            handleChange={this.handleName}
          />

          <LifeExpectancyField
            content={this.state.life_expectancy}
            label ={"Life expectancy"}
            handleChange={this.handleLifeExpectancy}
          />

          <PersonalityField
            content={this.state.personality}
            label = {"Personality"}
            handleChange={this.handlePersonality}
          />

          <SheddingField
            content={this.state.shedding}
            label ={"Shedding"}
            handleChange={this.handleShedding}
          />

          <HeightField
            content={this.state.height}
            label ={"Height"}
            handleChange={this.handleHeight}
          />

          <WeightField
            content={this.state.weight}
            label ={"Weight"}
            handleChange={this.handleWeight}
          />

          <GroomingField
            content={this.state.grooming}
            label ={"Grooming"}
            handleChange={this.handleGrooming}
          />

          <ImgUrlField
            content={this.state.img_url}
            label ={"Image url"}
            handleChange={this.handleImgUrl}
          />

          <div className="button-group">
            <button className="button" onClick={this.handleClearForm}>Clear</button>
            <input className="button" onClick={this.handleSubmit} type="submit" value="Submit"  />
          </div>
        </form>
      </div>
    )
  }
}

export default BreedFormContainer
