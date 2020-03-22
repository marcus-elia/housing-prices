require 'json'

# =========================
#
#       Read in Data
#
# =========================
houses = {}
field_names = []
first = true # To run code only on the first entry

# Iterate through the lines of the file
File.foreach("house_data.txt") do |line|
  data2value = JSON.load(line)
  houses[data2value["Name"]] = data2value

  # Make a list of the field names on the first time
  if first
    first = false
    data2value.each do |name, value|
      field_names << name
    end
  end
end
# ============================
#
#   Table Making Functions
#
# ============================
def prompt_user_for_character(character_list)
  choice = ""
  while not character_list.include? choice
    print "Enter a character from this list: "
    character_list.each do |c|
      print " #{c} "
    end
    print ": "
    choice = gets.chop
  end
  return choice
end

def prompt_user_for_fields(names_list)
  chosen_list = []
  names_list.each do |name|
    puts "Would you like to include #{name} in the table?"
    choice = prompt_user_for_character(["y", "n"])
    if choice == "y"
      chosen_list << name
    end
  end
  return chosen_list
end


# Returns the longest string in the hashes for the given field
def max_length_of_field(field_name, houses)
  longest = field_name.size
  houses.each do |name, data2value|
    cur_length = "#{data2value[field_name]}".size
    if cur_length > longest
      longest = cur_length
    end
  end
  return longest
end

# Returns a hash mapping each field to its max length
def get_max_length_hash(names_list, houses)
  field2length = {}
  names_list.each do |name|
    field2length[name] = max_length_of_field(name, houses)
  end
  return field2length  
end

def print_headers(names_list, houses)
  field2length = get_max_length_hash(names_list, houses)
  print "|"
  field2length.each do |field_name, max_length|
    print field_name.rjust(max_length)
    print "|"
  end
  puts
end

def print_data(names_list, houses)
  field2length = get_max_length_hash(names_list, houses)
  houses.each do |house_name, data2value|
    print "|"
    data2value.each do |field, value|
      if names_list.include? field
        print "#{value}".rjust(field2length[field])
        print "|"
      end
    end
    puts
  end
end

# ========================
#
#       User Input
#
# ========================

choice = 0
while choice != 1 && choice != 2
  print "What would you like to do? Enter 1 to see a table, or 2 to make a plot: "
  choice = gets.to_i
end

if choice == 1
  chosen_names = prompt_user_for_fields(field_names)
  print_headers(chosen_names, houses)
  print_data(chosen_names, houses)
end

