class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  
  def index
    @posts = Post.all
  end

 
  def show
  end

 
  def new
    @post = Post.new
  end

 
  def edit
  end

 
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: '¡Post creado satisfactoriamente!'
    else
      render :new
    end
  end


  def update
    if @post.update(post_params)
      redirect_to @post, notice: '¡Post actualizado satisfactoriamente!'
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

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description)
    end
end
