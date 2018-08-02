


require "net/http"
require "uri"
require "json"

params = {'imp_key' => 'imp_apikey', 'imp_secret' => 'ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f'}
json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json",
                    "Authorization" => access_token
}

uri = URI.parse('https://api.iamport.kr/users/getToken')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true


response = http.post(uri.path, params.to_json, json_headers)

json = JSON.parse(response.body)

puts json["response"]["access_token"]