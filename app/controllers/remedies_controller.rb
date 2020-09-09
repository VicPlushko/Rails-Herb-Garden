class RemediesController < ApplicationController

    def index
        @remedies = Remedy.all
    end

    def show
        @remedy = Remedy.find_by_id(params[:id])
    end

    def new
      @user = User.find_by_id(params[:user_id]) 
      @remedy = Remedy.new
      4.times {@remedy.remedy_herbs.build}
    end

    def create
        user = User.find_by_id(params[:user_id])
        remedy = user.remedies.create(remedy_params)
        redirect_to new_user_remedy_path(remedy, user_id)
    end

    def edit
        @remedy = Remedy.find_by_id[params[:id]]
    end 

    def update
        
    end

    def destroy
      @remedy = Remedy.find_by_id(params[:id])
      @remedy.destroy
      flash[:notice] = "Successfully destroyed remedy."
      redirect_to root_path
    end

  private

  def remedy_params
    params.require(:remedy).permit(:title, :directions, :user_id, :remedy_herbs_attributes[
      :quantity,
      :herb_id,
      :remedy_id
    ])
  end
end
