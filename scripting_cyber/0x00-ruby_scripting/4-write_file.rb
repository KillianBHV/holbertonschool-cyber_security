#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
  file1 = File.read(file1_path)
  data_file1 = JSON.parse(file1)

  file2 = File.read(file2_path)
  data_file2 = JSON.parse(file2)

  merged = data_file2 + data_file1

  File.write(file2_path, JSON.pretty_generate(merged))

  puts 'Merged JSON successful!'
end
