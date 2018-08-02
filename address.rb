require "net/http"
require "uri"

uri = URI.parse("http://www.juso.go.kr/addrlink/addrLinkApi.do")

# Full control
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data({"confmKey" => "#", 
                        "keyword" => "신촌동",
                        "resultType" => "json"
                        })

response = http.request(request)

puts response.body