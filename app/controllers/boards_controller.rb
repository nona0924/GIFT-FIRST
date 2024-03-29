class BoardsController < ApplicationController
    
     before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
    
  def show
    @type_flag = ""
    @board = Board.find(params[:id])
    @user = User.find(@board.user_id)
    if @board.category == "プレゼント"
        @type_flag = "p"
        @presents = @board.presents
        @comments = @board.comments
        @comment = Comment.new
    else
      @type_flag = "l"
      @lessons = @board.lessons
      @comments = @board.comments
      @comment = Comment.new
      logger.debug("======================== gift  = #{@board.id}")
    end
end

  def index
      @boards = Board.all.order(created_at: :desc)
      @search = Board.ransack(params[:q])
      @products = @search.result
    end
  

  def new
      @board = Board.new
      @lesson = Lesson.new
      @present = Present.new
      @user = User.find(current_user.id)
      logger.debug("======================== gift  = #{@board.id}")
  end
  
  def create
      @user = User.find(current_user.id)
    if @user.user_type == "講師"
      @board = Board.create(params.require(:board).permit(:user_id, :title, :overview, :address, :category, :image).merge(:user_id => current_user.id))
      logger.debug("======================== Lesson  = #{@board.id}")
      if params[:board][:category] == "プレゼント"
        @present = Present.create(params.require(:present).permit(:board_id, :status, :gift_name).merge(:board_id => @board.id))
      else 
         @lesson = Lesson.create(params.require(:lesson).permit(:board_id, :title, :target_age, :lesson_date, :start_time, :end_time).merge(:board_id => @board.id))
      end
      flash[:notice] = "投稿を作成しました"
      redirect_to("/boards")
   else
     @board = Board.create(params.require(:board).permit(:user_id, :title, :overview, :address, :category, :image).merge(:user_id => current_user.id))
     @present = Present.create(params.require(:present).permit(:board_id, :status, :gift_name).merge(:board_id => @board.id))
     flash[:notice] = "投稿を作成しました"
      redirect_to("/boards")
  end
  end

  def edit
      @board = Board.find(params[:id])
      
      @lesson = Lesson.find_by(board_id: @board.id)
      @present = Present.find_by(board_id: @board.id)
      if @board.user_id == current_user.id
    else
      redirect_to("/posts")
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
      @board = Board.find(params[:id])
      @user = User.find(@board.user_id)
      if @board.user_id == current_user.id
          @board = Board.update(params.require(:board).permit(:user_id, :title, :overview, :address, :category, :image).merge(:user_id => current_user.id))
       if params[:board][:category] == "プレゼント"
           @present = Present.update(params.require(:present).permit(:board_id, :status, :gift_name))
      else 
           @lesson = Lesson.update(params.require(:lesson).permit(:board_id, :title, :target_age, :lesson_date, :start_time, :end_time))
      end
      flash[:notice] = "投稿を編集しました"
      redirect_to("/boards")
    else
      redirect_to ("/boards")
      flash[:alert] = "無効なユーザー"
  end
  end

  def destroy
     @board = Board.find(params[:id])
     @user = User.find(@board.user_id)
     if @board.user_id == current_user.id
     @board.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/boards")
    else
      redirect_to ("/boards")
      flash[:alert] = "無効なユーザー"
    end
  end
  
  
  end