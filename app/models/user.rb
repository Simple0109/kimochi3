class User < ApplicationRecord

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7 }

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  has_many :request_users, dependent: :destroy
  has_many :requests, through: :request_users

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    # userのproviderがomniauth["provider"]と一致しないもしくは、uidがomniauth["uid"]と一致しない場合return
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    profile = self.profile || build_profile
    profile.name = info["name"]
    profile.save!
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

end
