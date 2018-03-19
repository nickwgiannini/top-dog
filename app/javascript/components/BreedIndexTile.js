import React from 'react';
import {Link} from 'react-router';

const BreedIndexTile = (props) => {
  return(
    <div className="featured-image-block column">
      <a href={`/breeds/${props.id}`}>
      <img src={props.img_url} />
      <p className="text-center featured-image-block-title">{props.name}</p>
    </a>
  </div>
)}

export default BreedIndexTile;
