class User < ApplicationRecord
  before_create :confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  validates :email, :encrypted_password, presence: true
  has_many :comments, dependent: :destroy
  has_many :spams
  has_many :lectures, :through  => :spams
  enum gender: {male: 0, female: 1}
  mount_uploader :profile_picture, AvatarUploader
  enum role: {user: 0, instructor: 1}

  # def role?(role_name)
  #   role == role_name
  # end
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url
    end
  end
  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
