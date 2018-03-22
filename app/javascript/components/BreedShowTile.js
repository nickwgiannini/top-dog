import React from 'react';
import {Link} from 'react-router';

const BreedShowTile = (props) => {

return(
  <div className="work-feature-block row">
  <div className="columns medium-7">
    <img className="work-feature-block-image" src={props.data.img_url}/>
  </div>
  <div className="columns medium-5">
    <h2 className="work-feature-block-header">{props.data.name}</h2>
    <p> {props.data.personality} doggo.</p>
    <h2>Stats</h2>
    <ul>
      <li>Shedding: {props.data.shedding}</li>
      <li>Grooming: {props.data.grooming}</li>
      <li>Height: {props.data.height}</li>
      <li>Weight: {props.data.weight}</li>
      <li>Life Expectancy: {props.data.life_expectancy}</li>
    </ul>
    <button onClick={props.onDeleteClick}>Delete  <p>(admin only)</p></button>
  </div>
</div>
)}

export default BreedShowTile;
