class BoardsController < ApplicationController
    
     before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
    
  def show
    @board = Board.find(params[:id])
    if @board.id == Lesson.find_by(board_id: params[:@board])
      @board1 = Lesson.find_by(board_id: params[:@board])
    else
      @board2 = Present.find_by(board_id: params[:@board])
  end
end

  def index
      @boards = Board.all
  end

  def new
      @board = Board.new
      @lesson = Lesson.new
      @present = Present.new
      @user = User.find(current_user.id)
  end
  
  def create
      @user = User.find(current_user.id)
    if @user.user_type == "講師"
      @board = Board.create(params.require(:board).permit(:user_id, :title, :overview, :address).merge(:user_id => current_user.id))
      @lesson = Lesson.create(params.require(:lesson).permit(:board_id, :title, :image, :target_age, :lesson_date, :start_time, :end_time).merge(:board_id => @board.id)) or  @present = Present.create(params.require(:present).permit(:board_id, :status, :image, :gift_name).merge(:board_id => @board.id))
      flash[:notice] = "投稿を作成しました"
      redirect_to("/boards/index")
    elsif @user.user_type  "講師"
     @board = Board.create(params.require(:board).permit(:user_id, :title, :overview, :address).merge(:user_id => current_user.id))
     @present = Present.create(params.require(:present).permit(:board_id, :status, :image, :gift_name).merge(:board_id => @board.id))
     flash[:notice] = "投稿を作成しました"
      redirect_to("/boards/index")
   else
     @board = Board.create(params.require(:board).permit(:user_id, :title, :overview, :address).merge(:user_id => current_user.id))
     @present = Present.create(params.require(:present).permit(:board_id, :status, :image, :gift_name).merge(:board_id => @board.id))
  end
  end

  def edit
      @board = Board.find(params[:id])
      if @board.user_id == current_user.id
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
