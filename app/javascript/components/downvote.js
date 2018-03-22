import React from 'react';

const Downvote = props => {
  let onClickHandler = props.handleClick(-1)
  return(
      <i class="fas fa-arrow-down" onClick= {onClickHandler}></i>
  )
}

export default Downvote
