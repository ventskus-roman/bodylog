class Excercise < ActiveRecord::Base
  belongs_to :category
  has_many :workout_sets

  validates :name, :category, presence: { message: "не может быть пустым" }
end
