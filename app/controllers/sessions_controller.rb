class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    if @user = User.find_by(provider: auth['provider'], uid: auth["uid"]) || User.create_with_omniauth(auth)

      reset_session

      session[:user_id] = @user.id
      redirect_to root_url, flash: { success: "Signed In!!" }
    else
      render :new
    end
  end

  def destroy
    reset_session root_url, notice: "Logged Out!!Bye!!"
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end
end
