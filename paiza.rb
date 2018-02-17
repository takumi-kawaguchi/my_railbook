require 'pry-byebug'
require 'pry-doc'

class Robot
  @point = []
  @direction = "F"
  @f_stride = 0
  @r_stride = 0
  @b_stride = 0
  @l_stride = 0

  attr_accessor :point, :direction, :f_stride, :r_stride, :b_stride, :l_stride

  def initialize(dir = "F")
    @direction = dir
  end

  def move_f
    binding.pry
    case direction
    when "F"
      point[1] += f_stride
    when "R"
      point[0] += f_stride
    when "B"
      point[1] -= f_stride
    when "L"
      point[0] -= f_stride
    end
  end

  def move_r
    case direction
    when "F"
      point[0] += r_stride
    when "R"
      point[1] -= r_stride
    when "B"
      point[0] -= r_stride
    when "L"
      point[1] += r_stride
    end
  end

  def move_b
    case direction
    when "F"
      point[1] -= b_stride
    when "R"
      point[0] -= b_stride
    when "B"
      point[1] += b_stride
    when "L"
      point[0] += b_stride
    end
  end

  def move_l
    case direction
    when "F"
      point[0] -= l_stride
    when "R"
      point[1] += l_stride
    when "B"
      point[0] += l_stride
    when "L"
      point[1] -= l_stride
    end
  end

  # def turn_f
  #   case self.direction
  #   when "R"
  #     self.direction = "R"
  #   when "B"
  #     self.direction = "B"
  #   when "L"
  #     self.direction = "L"
  #   end
  # end

  def turn_r
    case self.direction
    when "F"
      self.direction = "R"
    when "R"
      self.direction = "B"
    when "B"
      self.direction = "L"
    when "L"
      self.direction = "F"
    end
  end

  def turn_b
    case self.direction
    when "F"
      self.direction = "B"
    when "R"
      self.direction = "L"
    when "B"
      self.direction = "F"
    when "L"
      self.direction = "R"
    end
  end

  def turn_l
    case self.direction
    when "F"
      self.direction = "L"
    when "R"
      self.direction = "F"
    when "B"
      self.direction = "R"
    when "L"
      self.direction = "B"
    end
  end
end

robot = Robot.new

robot.point = gets.split.map{|p| p.to_i}
robot.f_stride, robot.r_stride, robot.b_stride, robot.l_stride = gets.split.map{|s| s.to_i}
move_count = gets.to_i

move_count.times do
  action, dir = gets.split
  case action
  when "m"
    case dir
    when "F"
      robot.move_f
    when "R"
      robot.move_r
    when "B"
      robot.move_b
    when "L"
      robot.move_l
    end
  when "t"
    case dir
    when "F"
      robot.turn_f
    when "R"
      robot.turn_r
    when "B"
      robot.turn_b
    when "L"
      robot.turn_l
    end
  end
end

print robot.point[0], robot.point[1]
