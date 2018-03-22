import React from 'react';

const Upvote = props => {
  let onClickHandler = props.handleClick(1)
  return(
      <i class="fas fa-arrow-up" onClick={onClickHandler}></i>
  )
}

export default Upvote
