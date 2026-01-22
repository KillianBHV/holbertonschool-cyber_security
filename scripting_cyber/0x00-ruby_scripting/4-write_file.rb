#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
  file1 = JSON.parse(File.read(file1_path))
  file2 = JSON.parse(File.read(file2_path))
  merged = file2 + file1

  File.open(file2_path, 'w') do |file|
    file.write(JSON.pretty_generate(file))
  end

  puts 'File merged successfully'
end
