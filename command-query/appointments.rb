require 'pry'

class Appointments
  attr_accessor :appointments

  def initialize
    @appointments = []
  end

  def at(time)
    @appointments << time
    time
  end

  def earliest
    @appointments.min_by(&:hour)
    # maybe not by date, but just the earliest by time, ignoring date
  end


end
