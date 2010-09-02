#!/usr/bin/env ruby

=begin
It takes 10,000 hours of practice to become truly good at something.
This keeps a running total using a text file.

This needs some kind of file security. I don't know how to do that yet.
Actually, it should probably use cookies and Rails instead of text files.

Modifications: Change the file contents instead of deleting and recreating the file. Add support for multiple activities. Let the user name the activity.
Add a reset.
=end


#has the user input hours to add to the running total
puts "Type the number of hours you spent today."

hours = gets.chomp

#specifies a filename for the text file that will store persistent numbers of hours
filename = 'hrsfile.txt'

if File.file? filename
	#loads the text file if it exists
	#hrsfile = File.open("hrsfile.txt", "r+")
else
	#creates the file if it doesn't already exist and adds 0 to the first line
	hrsfile = File.new("hrsfile.txt", "w+")
	hrsfile.puts("0")
end

#reads the number of hours in the file
hrsfile = File.open("hrsfile.txt", "r+")
hrsContents = hrsfile.gets
hrsfile.close

#uncomment the next two lines to debug
#puts "input: " + hours
#puts "file: " + hrsContents

#adds hours input to hours already in the file
totalHours = String(Integer(hrsContents) + Integer(hours))

#deletes the old file, makes a new one and saves hours to that file, adding the new hours to any existing hours
File.delete("hrsfile.txt")
hrsfile = File.new("hrsfile.txt", "w+")
hrsfile.puts totalHours

puts "You have spent " + totalHours + " hours."

hrsfile.close