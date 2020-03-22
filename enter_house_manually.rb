require 'json'

# Formats a road name by replacing the end with an
# abbreviation, if applicable. For example, "Main Street"
# becomes "Main St".
# Returns the result
def format_road_name(road_name)
  if road_name.end_with?("Road")
    road_name.gsub!(/Road/, "Rd")
  elsif road_name.end_with?("Avenue")
    road_name.gsub!(/Avenue/, "Ave")
  elsif road_name.end_with?("Street")
    road_name.gsub!(/Street/, "St")
  elsif road_name.end_with?("Lane")
    road_name.gsub!(/Lane/, "Ln")
  elsif road_name.end_with?("Drive")
    road_name.gsub!(/Drive/, "Dr")
  elsif road_name.end_with?("Circle")
    road_name.gsub!(/Circle/, "Cir")
  elsif road_name.end_with?("Crescent")
    road_name.gsub!(/Crescent/, "Cres")
  elsif road_name.end_with?("Boulevard")
    road_name.gsub!(/Boulevard/, "Blvd")
  elsif road_name.end_with?("Court")
    road_name.gsub!(/Court/, "Ct")
  elsif road_name.end_with?("Terrace")
    road_name.gsub!(/Terrace/, "Ter")
  elsif road_name.end_with?("Trail")
    road_name.gsub!(/Trail/, "Trl")
  end
  return road_name
end

def string_to_boolean(s)
  return s.downcase == "true"
end
  
# =======================
#
#       User Input
#
# =======================


# A hash that will store the house's data
data2value = {}

# Get the name of the house in 3 parts
house_name = ""
print "Enter the house number: "
house_number = gets.chop 
print "Enter the road name: "
road_name = format_road_name(gets.chop)
print "Enter the ZIP code: "
zip_code = gets.chop
house_name = house_number + " " + road_name + " " + zip_code
data2value["Name"] = house_name

# Prompt for each thing, and add them to the hash
print "How much does this house cost? "
data2value["Price"] = gets.chop.to_i
print "How many bedrooms? "
data2value["Bedrooms"] = gets.chop.to_i
print "How many square feet? "
data2value["Square Feet"] = gets.chop.to_i
print "How many bathrooms? "
data2value["Bathrooms"] = gets.chop.to_f
print "How many cars fit in the garage? "
data2value["Garage"] = gets.chop.to_i
print "What year is it from? "
data2value["Year"] = gets.chop.to_i
print "How many acres is the lot? "
data2value["Lot"] = gets.chop.to_f
print "Is it in a neighborhood? Enter true or false: "
data2value["Neighborhood"] = string_to_boolean(gets.chop)
print "Rate the kitchen from 1 to 5: "
data2value["Kitchen"] = gets.chop.to_i
print "Rate the yard from 0 to 2: "
data2value["Yard"] = gets.chop.to_i
print "Is the house on a lake? Enter true or false: "
data2value["Lake"] = string_to_boolean(gets.chop)
print "Rate the outside appearance of the house from 1 to 5: "
data2value["Outside Appearance"] = gets.chop.to_i
print "Rate the inside appearance of the house from 1 to 5: "
data2value["Inside Appearance"] = gets.chop.to_i

# Get the month and year
time = Time.new
data2value["Month"] = "#{time.month}/#{time.year}"

# Write the data to a JSON file
hash_string = "\n" + JSON.dump(data2value)
File.write("house_data.txt", hash_string, mode:"a")