class ApplicationController < ActionController::Base
  def redirect_to_default_path
    redirect_to root_path
  end
end
