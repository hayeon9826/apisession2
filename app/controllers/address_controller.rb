# https://www.juso.go.kr/CommonPageLink.do?link=/addrlink/devAddrLinkRequestSample
# http://www.juso.go.kr/addrlink/addrLinkApi.do

class AddressController < ApplicationController
    require "net/http"
    require "uri"
    require "json"


    # 변수명으로 params 쓰지 말기!
    
    def search
        
    end
    
    def results
       keyword = params[:search]
       
       uri = URI.parse("http://www.juso.go.kr/addrlink/addrLinkApi.do")

        # Full control
        http = Net::HTTP.new(uri.host, uri.port)
        
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data({"confmKey" => "###", 
                                "keyword" => keyword,
                                "resultType" => "json"
                                })
        
        response = http.request(request)
        
        json = JSON.parse(response.body)
        @arr = json["results"]["juso"]
       
       
    end
end
