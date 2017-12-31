class UsersController < ApplicationController

  def show
    @user = current_user
    @hosting = @user.hosted_events
    @attending = @user.attended_events
  end

end
