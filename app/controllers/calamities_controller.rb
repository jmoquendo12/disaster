class CalamitiesController < ApplicationController

  # before_action :authenticate_user!
  before_action only: [:new, :create, :show, :edit, :update, :destroy, :show]


  def index
    @calamities = Calamity.includes(:categories, :user)
  end

  def new
    @calamity = Calamity.new
  end

  def show
    @calamity = Calamity.find(params[:id])
  end
  def create
    @calamity = Calamity.new(params[:calamity].permit(:title, :content, :address, category_ids: []))
    @calamity.user = current_user
    if @calamity.save
      redirect_to calamities_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @calamity = Calamity.find(params[:id])
  end

  def update
    @calamity = Calamity.find(params[:id])
    if @calamity.update(params[:calamity].permit(:title, :content, :address))
      redirect_to calamities_path
    else
      render :edit
    end
  end

  def destroy
    @calamity = Calamity.find(params[:id])
    @calamity.destroy
    redirect_to calamities_path
  end

  def validate_post_owner
    unless @calamity.user == current_user
      flash[:notice] = 'the post not belongs to you'
      redirect_to calamities_path
    end
  end
end
