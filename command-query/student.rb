require 'pry'
class Student
  attr_accessor :grade, :grade_as_number

  GRADES = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'F' }

  def initialize
    @grade = 3
  end

  def grade
    GRADES[@grade]
  end


  def study
    @grade -= 1 unless @grade == 1
  end

  def slack_off
    @grade +=1 unless @grade == 5
  end



end
