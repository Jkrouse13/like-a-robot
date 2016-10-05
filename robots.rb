require 'erb'

class Robot

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hi
    "Hi"
  end

  def say_name
    "My name is #{@name}"
  end


end

class BendingUnit < Robot
  def bend(objecttobend)
    "Bend #{objecttobend.upcase}!"
  end
end

class ActorUnit < Robot
  def change_name(new_name)
    @name = new_name
  end
end

george = Robot.new("George")

greg = BendingUnit.new("Greg")

graham = ActorUnit.new("Graham")

puts graham.change_name("Gerald")

puts greg.bend("Pipe")

puts george.say_name

robot_name = ARGV[0]

object = ARGV[1]

bendunit1 = BendingUnit.new(ARGV[0])


new_file = File.open("./#{robot_name}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
