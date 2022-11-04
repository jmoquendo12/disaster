class WelcomeController < ApplicationController
  # before_action :set_post, only: [:new, :create, :edit, :update]
  #
  # def index
  #   @calamities = Calamity.includes(:user).all
  # end
  #
  # def new
  #   @calamity = Calamity.new
  # end
  #
  # def create
  #   @calamity = Calamity.find(set_post)
  #   @calamity.save
  #   render :new
  # end
  #
  # def edit; end
  #
  # def update
  #   @calamity = Calamity.find(params[:id].permit(:title, :content))
  #   @calamity.update(params[:id])
  #   render :edit
  #
  # end
  #
  # def set_post
  #   @calamity = Calamity.find(params[:post_id].permit(:title, :content))
  # end
end
