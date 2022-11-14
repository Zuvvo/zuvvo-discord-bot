require 'rails_helper'

RSpec.describe DiscordUser, type: :model do
  it 'creates example discord user' do
    user = create(:discord_user)
    expect(user.name).to eq('ExampleName')
  end
end
