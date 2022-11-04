class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Calamity.includes(:user).all
  end

  def new
    @comment = @calamity.comments.build
  end

  def create
    @comment = @calamity.comments.build(params_comment)
    @comment.user = current_user
    if @comment.save
      redirect_to calamities_path(params[:calamity_id])
    else
      render :new
    end
  end

  def edit ;end

  def update
    if @comment.update(params_comment)
      redirect_to calamity_comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment = @calamity.comments.destroy(params[:calamity_id].permit[ :comment])
    redirect_to calamities_path
  end

  private

  def set_comment
    @comment = @calamity.comments.find(params[:id])
  end

  def set_post
    @calamity = Calamity.find params[:calamity_id]
  end

  def params_comment
    params.require(:comment).permit(:content)
  end
end
