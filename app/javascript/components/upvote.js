import React from 'react';

const Upvote = props => {
  onClickHandler = props.handleClick(1)
  return(
      <i class="fas fa-arrow-up" onClick={onClick}></i>
  )
}

export default Upvote
