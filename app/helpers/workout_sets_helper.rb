module WorkoutSetsHelper

  def time_from_duration(set)
    if set.duration && set.duration > 0
      format_time_unit(set.hours) + ":" + format_time_unit(set.minutes) + ":" + format_time_unit(set.seconds)
    end
  end

  def format_time_unit(unit)
    if unit && unit >= 0
      unit_formatted = unit < 10 ? "0" + unit.to_s : unit.to_s
    end
  end
end
