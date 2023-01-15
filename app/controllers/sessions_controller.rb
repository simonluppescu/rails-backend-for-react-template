class SessionsController < ApplicationController
  def create
    username_or_email = session_params[:username_or_email]
    @user = User.find_by(username: username_or_email) || User.find_by(email: username_or_email)

    if @user && login(@user.email, session_params[:password])
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: {
        status: 401,
        errors: ['no such user, please try again']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  def destroy
    logout

    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.require(:user).permit(:username_or_email, :password)
  end
end
