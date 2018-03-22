import React from 'react';
import {Link} from 'react-router';


const ReviewTile = (props) => {
  return(
    <div className="callout">
      <h1>{props.userEmail}</h1>
      <img src={props.avatar} alt='profile picture'></img>
      <li>Kid-Friendly: {props.kid_friendly}</li>
      <li>Dog-Friendly: {props.dog_friendly}</li>
      <li>Barking Level: {props.barking_lvl}</li>
      <li>Trainability: {props.trainability}</li>
      <li>Energy Level: {props.energy_lvl}</li>
      <p>{props.body}</p>
    </div>
  )}

  export default ReviewTile;
