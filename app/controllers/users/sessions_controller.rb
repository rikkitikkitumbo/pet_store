class Users::SessionsController < Devise::SessionsController

  def destroy
    super and return
    redirect_to '/pets/new'

  end
end