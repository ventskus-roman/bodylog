class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_sets
  validates :title, :date, :user, presence: {message: "не может быть пустым"}
end
