require "net/http"
require "uri"
require "json"

uri = URI.parse("https://apisession-hellokiii.c9users.io/home/index")


# Full
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.request(Net::HTTP::Get.new(uri.request_uri))



arr = JSON.parse(response.body)

arr.each do |a|
    puts a["title"]
end


