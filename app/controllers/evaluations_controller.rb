class EvaluationsController < ApplicationController
    
    before_action :authenticate_user!
    
    def new
        @eva = Evaluation.new
        @user_id = params[:id]
        @evas = Evaluation.all
    end
  
 def create
     @eva = Evaluation.create(params.require(:evaluation).permit(:user_id, :evaluated_user_id, :message, :point).merge(:user_id => current_user.id))
     @user = User.find(@eva.evaluated_user_id)
     @eva.save
    redirect_to("/evaluations/new/#{@user.id}")
  end
  
end