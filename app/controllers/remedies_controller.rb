class RemediesController < ApplicationController
  before_action :user_logged_in

  def index
    @remedies = current_user.remedies
    @remedies = current_user.remedies.search(params[:search])
    binding.pry
    
  end

  def show
    @remedy = Remedy.find_by_id(params[:id])
  end

  def new
    @user = User.find_by_id(session[:user_id])
    @remedy = Remedy.new(user_id: session[:user_id])
    4.times { @remedy.remedy_herbs.build }
  end

  def create
    @user = User.find_by_id(remedy_params[:user_id])
    @remedy = current_user.remedies.create(remedy_params)
    @remedy.user = @user
      if @remedy.persisted?
        @remedy_herb = RemedyHerb.create(remedy_id: remedy.id, herb_id: remedy_params[:remedy_herbs_attributes][:herb_id], quantity: remedy_params[:remedy_herbs_attributes][:quantity])
        redirect_to user_remedies_path
      else
        flash[:empty_field] = "Remedy name and directions can not be blank"
        render :new
      end
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @remedy = Remedy.find_by_id(params[:id])
  end

  def update
    @remedy = Remedy.find_by_id(params[:id])
    if @remedy.update(remedy_params)
      redirect_to user_remedy_path(@remedy.user)
    else
      flash[:empty_edit] = "Remedy name and or directions can not be blank"
      render "edit"
    end 
  end

  def destroy
    @remedy = Remedy.find_by_id(params[:id])
    @remedy.destroy
    flash[:notice] = "Successfully destroyed remedy."
    redirect_to home_path
  end

  private

  def remedy_params
    params.require(:remedy).permit(:title, :directions, :search, :user_id, remedy_herbs_attributes: [
      :id,
      :quantity,
      :herb_id,
      :remedy_id,
    ])
  end
end
