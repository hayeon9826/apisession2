# https://api.iamport.kr/

class IamportController < ApplicationController
    require "net/http"
    require "uri"
    require "json"
    def new
        
    end
    
    def register
        access_token = getToken
        
        #카드정보 등록하기
        #customer_uid = "12341234"
        
        
        redirect_to "/iamport/pay"
        
    end
    
    def pay
        # 결제하기
        
        redirect_to "/iamport/result"
    end
    
    def result
        
        
    end
    
    def getToken

        
        return ""
    end
end
