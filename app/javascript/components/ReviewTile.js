import React from 'react';
import {Link} from 'react-router';

const ReviewTile = (props) => {
  return(
    <div>
      <li>{props.body}</li>
      <li>{props.kid_friendly}</li>
      <li>{props.dog_friendly}</li>
      <li>{props.barking_lvl}</li>
      <li>{props.trainability}</li>
      <li>{props.energy_lvl}</li>
    </div>
  )}

  export default ReviewTile;
