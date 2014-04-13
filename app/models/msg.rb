class Msg < ActiveRecord::Base
  belongs_to :user
  before_create :random_id

  private
  def random_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Msg.where(id: self.id).exists?
  end
end
