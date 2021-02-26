class BackofficeController < ApplicationController

    before_action :authenticate_user!

private

  def authenticate_user
    unless current_user.admin
      redirect_to '/home'
    end
  end

end
