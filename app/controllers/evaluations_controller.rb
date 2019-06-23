class EvaluationsController < ApplicationController
    
    before_action :authenticate_user!
    
    
    def show
        @user = User.find(params[:id])
        @evas = Evaluation.where(evaluated_user_id: params[:id]).order(created_at: :desc)
        @average = Evaluation.average(:point).round(1)
        @eva_count = @evas.count
   end
   
   
    def new
        @eva = Evaluation.new
        @user_id = params[:id]
    end
  
 def create
     @eva = Evaluation.create(params.require(:evaluation).permit(:user_id, :evaluated_user_id, :message, :point).merge(:user_id => current_user.id))
     @user = User.find(@eva.evaluated_user_id)
     @eva.save
    redirect_to("/evaluations/#{@user.id}")
  end
  
end