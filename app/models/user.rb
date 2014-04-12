class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :wechat]

  has_many :questions

  def self.find_for_facebook_oauth(auth)
    if auth.info.email.present?
      email = auth.info.email
    else
      email = "#{auth.info.nickname}@collegetickr.com"
    end
    u = where(auth.slice(:provider, :uid)).first_or_create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.name = auth.info.nickname
      user.email = email
      user.password = Devise.friendly_token[0,20]

    end
    return u
  end
end
