class Excercise < ActiveRecord::Base
  belongs_to :category

  validates :name, :category, presence: { message: "не может быть пустым" }
end
