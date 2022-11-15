class DiscordUserController < ApplicationController
  def show
    @discord_user = DiscordUser.find_by(id: params[:id])
    redirect_to root_path, alert: "Can't find user with given id" if @discord_user.nil?
  end

end
