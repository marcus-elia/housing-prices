require 'json'

# Formats a road name by replacing the end with an
# abbreviation, if applicable. For example, "Main Street"
# becomes "Main St".
# Returns the result
def format_road_name(road_name)
  if road_name.end_with?("Road")
    road_name.gsub!(/Road/, "Rd")
  elsif road_name.end_with("Avenue")
    road_name.gsub!(/Avenue/, "Ave")
  elsif road_name.end_with("Street")
    road_name.gsub!(/Street/, "St")
  elsif road_name.end_with("Lane")
    road_name.gsub!(/Lane/, "Ln")
  elsif road_name.end_with("Drive")
    road_name.gsub!(/Drive/, "Dr")
  elsif road_name.end_with("Circle")
    road_name.gsub!(/Circle/, "Cir")
  elsif road_name.end_with("Crescent")
    road_name.gsub!(/Crescent/, "Cres")
  elsif road_name.end_with("Boulevard")
    road_name.gsub!(/Boulevard/, "Blvd")
  elsif road_name.end_with("Court")
    road_name.gsub!(/Court/, "Ct")
  elsif road_name.end_with("Terrace")
    road_name.gsub!(/Terrace/, "Ter")
  elsif road_name.end_with("Trail")
    road_name.gsub!(/Trail/, "Trl")
  return road_name
  

# Get the data from the house through user input
house_name = ""
print "Enter the house number: "
house_number = gets.chop 
print "Enter the road name: "
road_name = gets.chop
print "Enter the ZIP code: "
zip_code = gets.chop
puts house_number + " " + road_name + " " + zip_code