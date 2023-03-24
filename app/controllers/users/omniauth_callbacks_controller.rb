# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # @route GET /users/auth/google_oauth2/callback (user_google_oauth2_omniauth_callback)
  # @route POST /users/auth/google_oauth2/callback (user_google_oauth2_omniauth_callback)
  def google_oauth2
    handle_auth "Google"
  end

  # @route GET /users/auth/facebook/callback (user_facebook_omniauth_callback)
  # @route POST /users/auth/facebook/callback (user_facebook_omniauth_callback)
  def facebook
    handle_auth "Facebook"
  end

  def handle_auth(kind)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind:) if is_navigational_format?
    else
      flash[:error] = "There was a problem signing you in through #{kind}. Please register or try signing in later."
      redirect_to new_user_registration_url
    end
  end
end
