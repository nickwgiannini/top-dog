import React from 'react';
import {Link} from 'react-router';
import VotesContainer from '../containers/VotesContainer'

const ReviewTile = (props) => {
  return(
    <div className="callout">
      <h1>{props.userEmail}</h1>
      <img src="" alt='profile picture'></img>
      <li>Kid-Friendly: {props.kid_friendly}</li>
      <li>Dog-Friendly: {props.dog_friendly}</li>
      <li>Barking Level: {props.barking_lvl}</li>
      <li>Trainability: {props.trainability}</li>
      <li>Energy Level: {props.energy_lvl}</li>
      <p>{props.body}</p>
      <div className="VotesContainer">
        <VotesContainer ReviewID= {props.review.id}/>
      </div>
    </div>
  )}

  export default ReviewTile;
