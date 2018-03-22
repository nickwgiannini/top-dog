import React from 'react';
import {Link} from 'react-router';
import VotesContainer from '../containers/VotesContainer'

const ReviewTile = (props) => {
  review = props.review
  kid_friendly = review.kid_friendly
  dog_friendly = review.dog_friendly
  barking_lvl = review.barking_lvl
  trainability = review.trainability
  energy_lvl = review.energy_lvl
  body = review.body
  return(
    <div className="callout">
      <h1>{props.userEmail}</h1>
      <img src="" alt='profile picture'></img>
      <li>Kid-Friendly: {kid_friendly}</li>
      <li>Dog-Friendly: {dog_friendly}</li>
      <li>Barking Level: {barking_lvl}</li>
      <li>Trainability: {trainability}</li>
      <li>Energy Level: {energy_lvl}</li>
      <p>{body}</p>
      <div className="VotesContainer">
        <VotesContainer review= {review}/>
      </div>
    </div>
  )}

  export default ReviewTile;
