class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    #@user = User.from_vkontakte(request.env["omniauth.auth"])
    auth = request.env["omniauth.auth"]

    # Check if user exists
    @user = User.where(provider: auth[:provider], uid: auth[:uid].to_s).first_or_initialize

    if @user.persisted?
      complete(@user)
    else
      @user.name = auth[:info][:name]
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      complete(@user)
    else
      render 'vkontakte'
    end
  end

protected

  def user_params
    params.require(:user).permit(:email, :name, :provider, :uid, :password, :password_confirmation)
  end

  def complete(user)
    sign_in_and_redirect user
    set_flash_message(:notice, :success, :kind => 'Vkontakte') if is_navigational_format?
  end

end
