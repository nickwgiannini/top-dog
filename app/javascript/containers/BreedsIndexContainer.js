import React, {Component} from 'react';
import {Router, browserHistory, Route, IndexRoute, Link} from 'react-router'
import BackButton from '../components/BackButton'
import BreedIndexTile from '../components/BreedIndexTile'
import SearchBarContainer from './SearchBarContainer'
import BreedFormContainer from './BreedFormContainer';

class BreedsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      breeds: [],
      searchResults: [],
      breedsPerPage: 4,
      currentPage: 1
    }
    this.searchBreeds = this.searchBreeds.bind(this)
    this.handleClick = this.handleClick.bind(this)

  }
  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
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

  searchBreeds(submission) {
    let breeds = this.state.breeds
    let search = submission
    let results = breeds.filter(breed =>
      breed.name.toLowerCase().includes(search.toLowerCase()) ||
      breed.personality.toLowerCase().includes(search.toLowerCase()) ||
      breed.life_expectancy.toLowerCase().includes(search.toLowerCase()) ||
      breed.height.toLowerCase().includes(search.toLowerCase()) ||
      breed.weight.toLowerCase().includes(search.toLowerCase()) ||
      breed.shedding.toLowerCase().includes(search.toLowerCase()) ||
      breed.grooming.toLowerCase().includes(search.toLowerCase())
    )
    this.setState({breeds: results})
  }


  render() {
    console.log(this.state)
    let breedsPerPage = this.state.breedsPerPage
    let lastIndex = this.state.currentPage * breedsPerPage
    let firstIndex = lastIndex - breedsPerPage
    let displayBreeds = this.state.breeds.slice(firstIndex, lastIndex)

    let breeds = displayBreeds.map(breed => {
      return(
        <BreedIndexTile
          key = {breed.id}
          id = {breed.id}
          name = {breed.name}
          img_url = {breed.img_url}
        />
      )
    })

    let pageNumbers = []
    for (let i = 1; i <= Math.ceil(this.state.breeds.length / breedsPerPage); i++) {
      pageNumbers.push(i);
    }
    let pages = pageNumbers.map(number => {
      return (
        <div>
          <a onClick={this.handleClick}>
            <ul key={number} id={number}>
              || {number} ||
            </ul>

          </a>
        </div>
      );
    })

    return (
      <div className="featured-image-block-grid">
        <div className="row large-up-4 small-up-2">
          <SearchBarContainer
            breeds={this.state.breeds}
            searchBreeds={this.searchBreeds}
          />
          {breeds}
        </div>
        <div id="page-numbers">
          {pages}
        </div>
        <Link id="addbreed" to={'/breeds/new'}>Add a Breed</Link>
      </div>
    )
  }
}

export default BreedsIndexContainer;
