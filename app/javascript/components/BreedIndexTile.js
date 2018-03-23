import React from 'react';
import {Link} from 'react-router';

const BreedIndexTile = (props) => {
  return(
    <div className="featured-image-block column">
      <Link to={`/breeds/${props.id}`}>
        <img src={props.img_url} />
        <p id="doggo" className="text-center featured-image-block-title">{props.name}</p>
      </Link>
  </div>
)}

export default BreedIndexTile;
