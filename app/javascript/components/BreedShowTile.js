import React from 'react';
import {Link} from 'react-router';

const BreedShowTile = (props) => {
  return(
    <div>
      <li>{props.data.name}</li>
      <li>{props.data.personality}</li>
      <li>{props.data.life_expectancy}</li>
      <li>{props.data.shedding}</li>
      <li>{props.data.height}</li>
      <li>{props.data.weight}</li>
      <li>{props.data.grooming}</li>
      <img src={props.data.img_url}/>
  </div>
)}

export default BreedShowTile;
