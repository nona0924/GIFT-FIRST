class PostsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
    
  def show
    if user_signed_in?
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      @likes_count = Like.where(post_id: @post.id).count
    else
      redirect_to("/")
      flash[:alert] = "新規登録が必要です"
    end
  end

  def index
      @posts = Post.all.order(created_at: :desc)
  end

  def new
      @post = Post.new
  end
  
  def create
      @post = Post.create(params.require(:post).permit(:content, :post_image, :user_id).merge(:user_id => current_user.id))
      @user = User.find(@post.user_id)
      if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts")
    else
      render("posts/new")
      end
  end

  def edit
      @post = Post.find(params[:id])
      if @post.user_id == current_user.id
    else
      redirect_to("/posts")
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      if @post.user_id == current_user.id
      @post.update(params.require(:post).permit(:content, :post_image))
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts")
    else
      redirect_to ("/posts")
      flash[:alert] = "無効なユーザー"
  end
  end

  def destroy
     @post = Post.find(params[:id])
     @user = User.find(@post.user_id)
     if @post.user_id == current_user.id
     @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts")
    else
      redirect_to ("/posts")
      flash[:alert] = "無効なユーザー"
    end
  end
  
end
