class ManagementsController < ApplicationController
  def index
    @mane = Management.new
  end
  
  def create
    @mane = Management.create(params.require(:management).permit(:image_name, :category))
    flash[:alert] = "photo"
  end
end
