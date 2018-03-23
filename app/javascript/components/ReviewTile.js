import React from 'react';
import {Link} from 'react-router';


const ReviewTile = (props) => {
  return(
    <div className="callout">
      <h1 id="email">{props.userEmail}</h1>
      <img id="avatar"src={props.avatar} alt='profile picture'></img>
      <li>Kid-Friendly (1 = dangerous for kids - 10 = perfect with kids): {props.kid_friendly}</li>
      <li>Dog-Friendly (1 = hates every dog - 10 = sniffs every butt): {props.dog_friendly}</li>
      <li>Barking Level (1 = inaudible bark - 10 = WW2): {props.barking_lvl}</li>
      <li>Trainability (1 = rebel without a cause - 10 = does backflips for a pat on the head): {props.trainability}</li>
      <li>Energy Level (1 = pretty much dead - 10 = ready for insomnia?): {props.energy_lvl}</li>
      <p>{props.body}</p>
    </div>
  )}

  export default ReviewTile;
