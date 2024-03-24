class UsersController < ApplicationController
  def show
    @user = current_user
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @tweets = @user.tweets.order(created_at: :desc).page
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end