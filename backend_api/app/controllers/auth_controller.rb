class AuthController < ApplicationController
  def login
    credentials = login_params
    user = User.find_by email: credentials[:email]
    if user && user.authenticate(credentials[:password])
      render json: { token: user.token, name: user.name, id: user.id }
    else
      head :bad_request
    end
  end

  def register
    user = User.create(login_params.merge(password_confirmation: nil))

    if user.valid?
      render json: { token: user.token, name: user.name, id: user.id}
    else
      head :bad_request
    end
  end

  private

  def login_params
    params.require(:credentials).permit(:name, :email, :password)
  end
end
