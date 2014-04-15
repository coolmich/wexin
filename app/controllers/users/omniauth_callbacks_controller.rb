class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user, :event => :authentication
      flash[:notice] = "Successfully loggin..."
    else
      flash[:notice] = "Failed..."
    end
    redirect_to new_question_path and return
  end

  def twitter
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user, :event => :authentication
      flash[:notice] = "Successfully loggin..."
    else
      flash[:notice] = "Failed..."
    end
    redirect_to content_admin_path and return
  end

  def wechat
    @user = User.find_for_wechat_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user, :event => :authentication
      flash[:notice] = "Successfully loggin..."
    else
      flash[:notice] = "Failed..."
    end
    redirect_to content_admin_path and return
  end

  def failure
    render 'home/failure'
  end
end
