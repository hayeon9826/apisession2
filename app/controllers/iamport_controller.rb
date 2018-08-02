# https://api.iamport.kr/

class IamportController < ApplicationController
    require "net/http"
    require "uri"
    require "json"
    # 변수명으로 params 쓰지 말기!
    
    def new
        
    end
    
    def register
        access_token = getToken
        
        card_num1 = params[:card_num1]
        card_num2 = params[:card_num2]
        card_num3 = params[:card_num3]
        card_num4 = params[:card_num4]
        
        birthday = params[:birthday]
        expiry_month = params[:expiry_month]
        expiry_year = params[:expiry_year]
        password = params[:password]
        
        customer_uid = "123123123123123" # 매 실행마다 바꿔줘야함.
                                         # 
        
        card_num = card_num1 + "-" + card_num2 + "-" + card_num3 + "-" + card_num4
        expiry = "20" + expiry_year + "-" + expiry_month
        
        
        
        params1 = {'customer_uid' => customer_uid, 'card_number' => card_num,
                    'expiry' => expiry, 'birth' => birthday, 'pwd_2digit' => password
        }
        json_headers = {"Content-Type" => "application/json",
                        "Accept" => "application/json",
                        "Authorization" => access_token
        }

        uri = URI.parse("https://api.iamport.kr/subscribe/customers/#{customer_uid}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        
        
        response = http.post(uri.path, params1.to_json, json_headers)
        json = JSON.parse(response.body)
        
        puts json["code"]
        puts json["message"]
        
        redirect_to "/iamport/pay"
        
    end
    
    def pay
        # 결제하기
        
    end
    
    def result
        access_token = getToken
        
        customer_uid = "123123123123123" # register 액션과 같은 값
        
        
        amount = params[:amount].to_i
        merchant_uid = ('a'..'z').to_a.sample(15).join #매 시행마다 고유한 값
        
        params1 = {'customer_uid' => customer_uid,
                'merchant_uid' => merchant_uid,
                'amount' => amount,
                'name' => 'asdfasdf'
        }
        json_headers = {"Content-Type" => "application/json",
                        "Accept" => "application/json",
                        "Authorization" => access_token
        }

        uri = URI.parse("https://api.iamport.kr/subscribe/payments/again")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        
        
        response = http.post(uri.path, params1.to_json, json_headers)
        json = JSON.parse(response.body)
        
        puts json["code"]
        puts json["message"]   # 이상할땐 로그 확인
        
        redirect_to '/iamport/pay'
        
        
    end
    
    def getToken
            
        params = {'imp_key' => 'imp_apikey', 'imp_secret' => 'ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f'}
        json_headers = {"Content-Type" => "application/json",
                        "Accept" => "application/json"}
        
        uri = URI.parse('https://api.iamport.kr/users/getToken')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        
        
        response = http.post(uri.path, params.to_json, json_headers)
        json = JSON.parse(response.body)
        
        puts json["code"]
        puts json["message"]    # 이상할땐 로그 확인
        
        return json["response"]["access_token"]
    end
end
