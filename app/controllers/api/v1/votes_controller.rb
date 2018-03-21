class Api::V1::VotesController < ApiController

  def index
    votes = Vote.all
    render json: votes
  end

  def show
    render json: Vote.find(params[:id])
  end

  def create
    @vote = Vote.new(vote_params)
    @review = @vote.review
    @vote.user = current_user
    score = 0
    Vote.where(review_id: @vote.review.id).each do |vote|
      score += vote.value
    end

    if Vote.where(user_id: @vote.user.id)
      existing_vote = Vote.where(user_id: @vote.user.id).first
      if @vote.value == existing_vote.value
        @vote.destroy
        flash[:error] = "Error, already voted!"
      else
        existing_vote.destroy
        @vote.save
        flash[:success] = "Vote Changed!"
        render json: { score: score}
      end
    else
        @vote.save
        flash[:success] = "Your vote was added!"
        render json: { score: score}
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :review_id)
  end
end
