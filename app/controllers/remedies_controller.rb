class RemediesController < ApplicationController
  def index
    @remedies = Remedy.all
  end

  def show
    @remedy = Remedy.find_by_id(params[:id])
  end

  def new
    @user = User.find_by_id(session[:user_id])
    @remedy = Remedy.new(user_id: session[:user_id])
    4.times { @remedy.remedy_herbs.build }
    binding.pry
  end

  def create
    user = User.find_by_id(remedy_params[:user_id])
    remedy = Remedy.create(remedy_params)
    remedy.user = user
      if remedy.persisted?
        remedy_herb = RemedyHerb.create(remedy_id: remedy.id, herb_id: remedy_params[:remedy_herbs_attributes][:herb_id], quantity: remedy_params[:remedy_herbs_attributes][:quantity])
        redirect_to home_path
      end
  end

  def edit
    @user = User.find_by_id(params[:id])
    @remedy = Remedy.find_by(user_id: session[:user_id])
    binding.pry
  end

  def update
    @remedy = Remedy.find_by_id(params[:id])
    if @remedy.update(remedy_params)
      redirect to user_remedy_path(@remedy)
    else
      render "edit"
    end 
  end

  def destroy
    @remedy = Remedy.find_by_id(params[:id])
    @remedy.destroy
    flash[:notice] = "Successfully destroyed remedy."
    redirect_to root_path
  end

  private

  def remedy_params
    params.require(:remedy).permit(:title, :directions, :user_id, remedy_herbs_attributes: [
                                                                    :quantity,
                                                                    :herb_id,
                                                                    :remedy_id,
                                                                  ])
  end
end
