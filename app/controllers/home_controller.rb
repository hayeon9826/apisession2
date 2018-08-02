# http://www.rubyinside.com/nethttp-cheat-sheet-2940.html => cheat sheet
# http://mikeebert.tumblr.com/post/56891815151/posting-json-with-nethttp => post json
# http://ruby-doc.org/stdlib-2.0.0/libdoc/json/rdoc/JSON.html json 파싱하기

# 변수명으로 params 쓰지 말기!

class HomeController < ApplicationController
  def index
    @posts = Post.all
    
    render json: @posts.to_json
  end

  def create
    Post.create(title: params[:title],
                content: params[:content])
    # redirect_to "/home/index"
    render json: {"result": "게시물 작성완료"}.to_json
  end

  def new
  end
end
