#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

def get_request(uri)
  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')
  response = http.get(uri.request_uri)

  puts "Response status: #{response.code} #{response.message}"
  puts "\nResponse body:"

  begin
    json_data = JSON.parse(response.body)
    puts JSON.pretty_generate(json_data)
  rescue JSON::ParseError
    puts response.body
  end
end
