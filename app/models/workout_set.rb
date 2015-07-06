class WorkoutSet < ActiveRecord::Base
  belongs_to :excercise
  belongs_to :workout
  attr_accessor :hours, :minutes, :seconds, :has_max_weight, :has_min_time, :has_max_reps
  before_save :update_duration
  after_initialize :parse_duration

  validates :excercise, :workout, presence: { message: "не может быть пустым" }

  private

  def update_duration
    hours = self.hours || 0
    minutes = self.minutes || 0
    seconds = self.seconds || 0
    self.duration = seconds.to_i + minutes.to_i * 60 + hours.to_i * 3600
  end

  private

  def parse_duration
    if self.duration && self.duration > 0
      self.hours = self.duration / 3600
      self.minutes = (self.duration - self.hours * 3600) / 60
      self.seconds = self.duration - self.hours * 3600 - self.minutes * 60
    end
  end
end
