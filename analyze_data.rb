require 'json'

choice = 0
while choice != 1 && choice != 2
  print "What would you like to do? Enter 1 to see a table, or 2 to make a plot: "
  choice = gets.to_i



houses = {}
File.foreach("house_data.txt") do |line|
  data2value = JSON.load(line)
  houses[data2value["Name"]] = data2value
end


# ============================
#
#   Table Making Functions
#
# ============================

# Returns the longest string in the hashes for the given field
def max_length_of_field(field_name)
  longest = 0
  houses.each do |name, data2value|
    cur_length = "#{data2value[field_name]}".size
    if cur_length > longest
      longest = cur_length
    end
  end
  return longest
end

    
def print_headers
