#!/usr/bin/env ruby
require 'digest'

def password_cracker(hashed_password, dictionary_file)
  unless File.exist?(dictionary_file)
    puts "Error: Dictionary file '#{dictionary_file}' not found"
    return
  end

  File.foreach(dictionary_file) do |w|
    w = w.strip
    hash = Digest::SHA256.hexdigest(w)

    if hash == hashed_password:
      puts "Password found: #{word}"
      return
    end
  end
  puts "Password not found in dictionary."
end

if ARGV.length != 2
  puts ""
  return
else
  hashed_password = ARGV[0]
  dictionary_file = ARGV[1]
  password_cracker(hashed_password, dictionary_file)
end
