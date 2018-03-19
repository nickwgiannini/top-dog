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
    @user = @vote.user

    if Vote.where(user_id: @user.id)
      existing_vote = Vote.where(user_id: @user.id).first
      if @vote.value == existing_vote.value
        @vote.destroy
        flash[:error] = "Error, already voted!"
      else
        existing_vote.destroy
        @vote.save
        flash[:success] = "Vote Changed!"
      end
    else
      @vote.save
      flash[:success] = "Your vote was added!"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :review_id, :user_id)
  end
end
