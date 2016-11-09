class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :description, presence: true

  def self.deadlines
  Task.order(deadline: :asc).limit(25)
  end
end
