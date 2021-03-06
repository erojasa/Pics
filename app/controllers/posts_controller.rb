class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show pages]
  before_action :correct_user, only: %i[edit update destroy]

  
  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 12)
    @grafico = Comment.group(:post_id).count
    @graphic = Like.group(:post_id).count
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


  def pages
    current_page = params[:number].to_i
    per_page = 12
    @posts = Post.all.order("created_at DESC").offset(per_page * current_page).limit(per_page)

    respond_to do |format|
      if user_signed_in?
        format.html { render partial: 'pages' }
      else
        format.html { render partial: '404' }
      end
    end
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
