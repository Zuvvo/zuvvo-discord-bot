require 'rails_helper'

describe "DiscordUsers", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/discord_user/show"
      expect(response).to have_http_status(:success)
    end
  end

end
