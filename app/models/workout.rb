class Workout < ActiveRecord::Base
  belongs_to :user
  validates :title, :date, :user, presence: {message: "не может быть пустым"}
end
