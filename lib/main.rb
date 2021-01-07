$LOAD_PATH.unshift File.dirname(__FILE__)

require "ruby-preflight"

preflight = Preflight::Profiles::PDFX1A_2003.new

if ARGV.length == 0
  puts "ERROR: filepath required"
  exit
end

filename = ARGV[0]

File.open(filename, "rb") do |file|
  puts preflight.check(file).inspect
end