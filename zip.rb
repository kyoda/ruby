require 'rubygems'
require 'zip'
require 'pathname'

Zip::File.open('tmp/091220141028066892.zip') do |zip_file|
  # Handle entries one by one
  #zip_file.each do |entry|
  #  # Extract to file/directory/symlink
  #  puts "Extracting #{entry.name}"
  #  #entry.extract(entry.name)
  #  # Read into memory
  #  content = entry.get_input_stream.read
  #  #p content
  #end

  # Find specific entry
  entry = zip_file.glob('*.htm').first
  p entry.get_input_stream.read

end

