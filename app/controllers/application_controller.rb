class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "secret" #does it matter what this is called here?
  end
get '/' do
  erb :index
end
helpers do
  def logged_in?
      !!session[:user_id]
    end
    def current_user
       User.find(session[:user_id])
     end
end
end
