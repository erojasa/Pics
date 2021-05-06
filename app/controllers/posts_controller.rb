class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[:index :show]
  before_action :correct_user, only: %i[:edit :update :destroy]

  
  def index
    @posts = Post.all
  end

 
  def show
    @comments = @post.comments
  end

 
  def new
    @post = current_user.posts.build
  end

 
  def edit
  end

 
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post successfully created!'
    else
      render :new
    end
  end


  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully!'
    else
      render :edit
    end
  end



  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "You cannot edit this post!" if @post.nil?
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :image)
    end
end
