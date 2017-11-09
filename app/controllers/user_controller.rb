class UserController < ApplicationController
  def index
    if session[1]
      @email = User.find(1).email
    end
  end

  def new
  end

  def create
    require 'digest'
    @email=params[:email]
    @password=params[:password]
    encrypted_password=Digest::MD5.hexdigest(@password)
    User.create(
      email: @email,
      password: encrypted_password)
  end
  def login
    
  end
  
  def login_process
    require 'digest'
    
  #로그인으로 받아온 정보의 유저가 DB에 있는지 확인?
  #params[:email]
  #User.find(@email)
  if User.exists?(email: params[:email])
    user=User.find_by email: params[:email]
    if user.password ==Digest::MD5.hexdigest( params[:password])
      session[:user_id]=user.id
      p "로그인이 되었습니다"
      redirect_to '/user/index'
    end
  end
  #1. 만약에 있다면, 비밀번호가 맞는지 확인?
  #2. 그것도 만약에 맞다면, 로그인 시키기
  
  end
  
  def modifiy
  end

  def destroy
  end
end
