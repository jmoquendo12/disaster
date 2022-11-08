class CalamitiesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_categories, [:index, :edit, :update, :create]
  before_action :set_calamity, only: [:show, :update, :edit, :destroy]

  # before_action only: [:new, :create, :show, :destroy, :edit, :update]
  # before_action :set_categories, only: :update

  def index
    @calamities = Calamity.includes(:categories, :user).page(params[:page]).per(5)
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

  def edit; end

  def update
    @calamity.user = current_user
    if @calamity.update(set_categories)
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

  # def validate_post_owner
  #   unless @calamity.user == current_user
  #     flash[:notice] = 'the post not belongs to you'
  #     redirect_to calamities_path
  #   end
  # end

  def set_categories
    params.require(:calamity).permit(:title, :content, :address, category_ids: [])
  end

  def set_calamity
    @calamity = Calamity.find(params[:id])
  end

end
