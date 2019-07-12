# coding: utf-8
data = [
  {id: "0001", first_name: "Light", last_name: "Yagami"},
  {id: "0002", first_name: "Misa", last_name: "Amane"},
  {id: "0003", first_name: "Sayu", last_name: "Yamgami"},
  {id: "0004", first_name: "Naomi", last_name: "Misora"}
]

# while 文で

i = 0

while (i < data.length) do
  puts "#{data[i][:id]} : #{data[i][:first_name]}"
end

