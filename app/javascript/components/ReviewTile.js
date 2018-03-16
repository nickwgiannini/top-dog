import React from 'react';
import {Link} from 'react-router';

const ReviewTile = (props) => {
  return(
    <div>
      <h1> Reviews: </h1>
      {props.body}
  </div>
)}

export default ReviewTile;
