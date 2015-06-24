class GuessesController < ApplicationController
  before_action :authenticate_with_token!

  def create
    @post = Post.find(params[:id])
    score = params[:guess].downcase == @post.answer ? 1 : 0
    @guess = @post.guesses.new(guess: params[:guess].downcase,
                               points: score,
                               user_id: current_user.id)

    if @guess.guess == @post.answer 
       @post.update(solution: true)
    end

    if @guess.save
      # render json: {guess: @guess.as_json(only: [:user_id, :post_id, :guess, :points, :created_at, :updated_at])}, status: :created
    else
      render json: {message: 'bad parameters'},
        status: :unprocessable_entity
    end
  end

  def score
    @user = User.find(params[:id])
    @total_score = @user.guesses.sum(:points)
    @user.update(total_points: @total_score)
    render json: { user: {score: @total_score, email: @user.email}}, status: :ok
    
   
  end

end
