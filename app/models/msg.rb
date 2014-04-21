class Msg < ActiveRecord::Base
  belongs_to :user
  before_create :random_secret

  scope :unread, ->(uid){where(:receiver_uid=>uid, :read=>0)}

  private
  def random_secret
    begin
      self.secret = SecureRandom.random_number(1_000_000)
    end while Msg.where(secret: self.secret).exists?
  end
end
