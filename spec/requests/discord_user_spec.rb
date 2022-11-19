require 'rails_helper'

describe "DiscordUsers", type: :request do
  describe "GET" do
    it "returns http success" do
      DiscordUser.new(name: "Name").save
      get "/discord_users/1"
      expect(response).to have_http_status(:success)
    end
  end

end
