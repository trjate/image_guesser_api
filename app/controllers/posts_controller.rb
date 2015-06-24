class PostsController < ApplicationController

  before_action :authenticate_with_token!

  def index
    render json: Post.all, status: :ok
  end


  def create
    @post = current_user.posts.new(image_url: params[:image_url],
                                   answer: params[:answer].downcase,
                                   user_id: params[:user_id])
    if @post.save
        render json: { post: @post.as_json(only: [:id, :image_url, :answer, :solution, :created_at, :updated_at]) },
          status: :created
    else
        render json: { error: @post.errors.full_messages },
          status: :unprocessable_entity
    end
  end

  def show 
     @post = Post.find(params[:id])
     render json: @post, status: :ok
     #if @post.solution == true
  end

  def available
    available_posts = []
    @user = current_user
    @post = Post.where(solution: false)
    # binding.pry
    @post.each do |item|
      if item.user_id != @user.id
        available_posts.push(item)
      end
    end
    @post = available_posts
    # binding.pry
    # @post = Post.where(:solution => true).where(:user_id != @user.id)
    # @post = Post.where(:solution => true).where.not(:user_id == @user.id)
    render json: @post, status: :ok
  end

end
