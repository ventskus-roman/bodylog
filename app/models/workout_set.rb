class WorkoutSet < ActiveRecord::Base
  belongs_to :excercise
  belongs_to :workout

  validates :excercise, :workout, presence: { message: "не может быть пустым" }
end
