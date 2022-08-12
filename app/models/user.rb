class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  before_create :confirmation_token
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  has_one_attached :avatar, dependent: :destroy
  enum role: [:employee, :admin]
  def user_image_url
    # Get the URL of the associated image
    avatar.attached? ? url_for(avatar) : nil
  end
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
  end

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
  has_many :demande , dependent: :destroy

  #def send_password_reset
   # generate_token(:password_reset_token)
    #self.password_reset_sent_at = Time.zone.now
    #save!
    #UserMailer.forgot_password(self).deliver # This sends an e-mail with a link for the user to reset the password
  #end

  # This generates a random password reset token for the user
  #def generate_token(column)
   # begin
    #  self[column] = SecureRandom.urlsafe_base64
    #end while User.exists?(column => self[column])
 # end
end
