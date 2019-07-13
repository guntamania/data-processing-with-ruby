file = File.open("c01.csv", "r")
file.each do |line|
  puts line
end
file.close
