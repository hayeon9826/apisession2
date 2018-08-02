require "net/http"
require "uri"
require "json"

params = {'title' => '루비로', 'content' => 'post 요청 보내기'}
json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}

uri = URI.parse('https://apisession-hellokiii.c9users.io/home/create')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true


response = http.post(uri.path, params.to_json, json_headers)

puts response.body