#!/usr/bin/env ruby

=begin
It takes 10,000 hours of practice to become truly good at something.
This keeps a running total using a text file.

This needs some kind of file security. I don't know how to do that yet.
Actually, it should probably use cookies (or a database) and Rails instead of text files.

Modifications: Add support for multiple activities. Let the user name the activity. Add a reset.

Problems: With this version, the first time the program is used, it doesn't add properly. - Fixed.
		  With all versions, it tries to access the file before it actually exists. - Seems to also be fixed.

I was making it harder than it needed to be.
I need to make it shorter, add validation, and figure out tests and debugging.
=end


#has the user input hours to add to the running total
puts "Type the number of hours you spent today."

hours = gets.chomp

#reads the file if it exists already, creates it if it doesn't
#(http://codeidol.com/other/rubyckbk/Files-and-Directories/Checking-to-See-If-a-File-Exists/)
#(http://www.abbeyworkshop.com/howto/ruby/rb-readfile/index.html)

if File.file?('hrsfile.txt')
	hrsfile = File.open("hrsfile.txt", "r")
	hrsContents = hrsfile.gets
else
	#creates a file if it doesn't already exist and adds 0 to that file (as a string)
	hrsfile = File.open("hrsfile.txt", "w")
	hrsfile.puts("0")
	hrsContents = "0"
end

#this may not be necessary, but seems like good accounting, especially since it gives an error if I don't
#reopen the file
hrsfile.close

#assigns the file contents to a variable
#hrsContents = hrsfile.gets

#uncomment the next two lines to debug
#puts "input: " + hours
#puts "file: " + hrsContents

#adds hours input to hours already in the file
totalHours = String(Integer(hrsContents) + Integer(hours))

hrsfile = File.open("hrsfile.txt", "w+")
hrsfile.puts totalHours

#hrsfile = File.new("hrsfile.txt", "w+")


puts "You have spent " + totalHours + " hours."

hrsfile.close