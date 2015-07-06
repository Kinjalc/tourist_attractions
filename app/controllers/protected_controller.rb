class ProtectedController < ApplicationController
  before_action :authenticate

  private

  attr_reader :current_user

  # Requires http header
  # Authorization: Token token=<token>
  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by token: token
    end
  end
end
