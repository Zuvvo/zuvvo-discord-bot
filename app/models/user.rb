class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:discord]

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    puts "USER nil: #{user.nil?}"
    puts auth
    unless user
      user = User.create(
        email: 'zxc@gmail.com',
        password: Devise.friendly_token[0,20],
        full_name: auth.info.name,
        avatar_url: auth.info.image
      )
    end
    user
  end
end