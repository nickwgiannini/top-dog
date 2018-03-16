import React from 'react';
import {Link} from 'react-router';

const BreedShowTile = (props) => {
  return(
    <div>
      {props.id}
      {props.name}
      {props.personality}
      {props.shedding}
      {props.height}
      {props.weight}
      {props.grooming}
      {props.img_url}
  </div>
)}

export default BreedShowTile;
