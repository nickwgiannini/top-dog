import React from 'react';

const Downvote = props => {
  onClick = props.handleClick(-1)
  return(
      <i class="fas fa-arrow-down" onClick= {onClick}></i>
  )
}

export default Downvote
