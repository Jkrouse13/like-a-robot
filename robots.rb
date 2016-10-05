require 'erb'

class Robot

  attr_accessor :name, :height

  def initialize(name, height=10)
    @name = name
    @height = height
  end

  def say_hi
    "Hi!"
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

puts george.height

robot_name = ARGV[0]

object = ARGV[1]

bendunit1 = BendingUnit.new(ARGV[0])

hello = bendunit1.say_hi

name_said = bendunit1.say_name

bending = bendunit1.bend(object)

students = ["Michael", "Luis", "Zachary", "Keith", "Chris", "Brent", "Jon"]

robostudents1 = []

students.each do |roboname|
  robostudents1 << roboname = Robot.new(roboname)
end

robostudents2 = students.collect{|name| Robot.new(name)}

new_file = File.open("./#{robot_name}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
