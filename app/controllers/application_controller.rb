require 'sinatra/base'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "secret"
  end
get '/' do
  erb :index
end
helpers do
  def logged_in?
      !!session[:user_id]
    end
    def current_user

      @user ||=  User.find(session[:user_id])

     end
end
end
