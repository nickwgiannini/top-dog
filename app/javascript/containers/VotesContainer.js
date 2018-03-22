import React, { Component } from 'react';
import Upvote from '../components/upvote'
import Downvote from '../components/downvote'

class VotesContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      voted: false,
      selectedVote: null,
      score: 0
    }
    this.handleVoteSelect = this.handleVoteSelect.bind(this)
  }
  handleVoteSelect(voteValue) {
    let votePayload = {vote: {value: voteValue, review_id: this.props.reviewID}}
    fetch('/api/v1/votes', {
    method: 'post',
    body: JSON.stringify(votePayload)
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => {
      this.setState({selectedVote: voteValue, voted: true, score: response.body.score})
    })
  }
  render() {
    let upvote = ""
    let downvote = ""
  if (this.state.selectedVote == 1) {
    upvote = "selected"
    downvote = "already-voted"
  } else if (this.state.selectedVote == -1) {
    downvote = "selected"
    upvote = "already-voted"
  }
    return (
      <div className= "vote-options">
        <div className={upvote}><Upvote handleClick = {this.handleVoteSelect}/></div>
        <div className={downvote}><Downvote handleClick = {this.handleVoteSelect}/></div>
      </div>
    );
  }
}

export default VotesContainer;
