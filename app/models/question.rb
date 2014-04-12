class Question < ActiveRecord::Base
  belongs_to :user
  before_create :randomize_id

  has_many :answers

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Question.where(id: self.id).exists?
  end
end
