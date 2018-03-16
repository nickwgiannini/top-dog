import React from 'react';
import {Link} from 'react-router';

const BreedShowTile = (props) => {
  return(
    <div>
      {props.data.id}
      {props.data.name}
      {props.data.personality}
      {props.data.shedding}
      {props.data.height}
      {props.data.weight}
      {props.data.grooming}
      {props.data.img_url}
  </div>
)}

export default BreedShowTile;
