class InvitesController < ApplicationController

  def create
    current_user.invites.create(event_id: params[:invite][:event_id])
    redirect_back(fallback_location: events_path)
  end

  def destroy
    @invite = current_user.invites.find_by(event_id: params[:id])
    current_user.invites.destroy(@invite.id)
    redirect_back(fallback_location: user_path(current_user))
  end
end

