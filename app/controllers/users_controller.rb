class UsersController < ApplicationController
  def new
  end
end
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end
end
