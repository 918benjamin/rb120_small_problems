# Modify this class so both flip_switch and the setter method switch= are private methods.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  # Further exploration
  def switch_status
    puts "The machine is currently #{switch.to_s}"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

robot = Machine.new
robot.start
robot.switch_status
robot.stop
robot.switch_status