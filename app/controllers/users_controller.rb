class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do

    @user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if User.find_by(:email => @user.email)
      @error = "This email already in use."
      erb :'/users/signup'
    else
      if @user.save
        redirect '/login'
      else
        @error = "Must include your name, email and a password."
        erb :'/users/signup'
      end
    end
  end

  post '/login' do
    if params["email"].empty? || params["password"].empty?
      @error = "Email and password cannot be blank."
      erb :'/users/login'
    elsif User.find_by(email: params["email"]) == nil
      @error = "Email not associated with any account."
      erb :'/users/login'
    else
      @user = User.find_by(email: params["email"])
       if @user && @user.authenticate(params["password"])
         session[:user_id] = @user.id

         redirect to "/restaurants"
       else
        @error = "Wrong Password"
        erb :'/users/login'
       end
    end
      
  end

  get '/:user_id/orders' do
    if logged_in?
      @user = current_user
      @orders = @user.orders
      erb :'/users/orders'
    else
      redirect '/failure'
    end
  end

  get '/logout' do
    session.clear
    redirect '/' 
  end




end

