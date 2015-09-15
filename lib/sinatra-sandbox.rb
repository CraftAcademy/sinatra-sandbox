require 'sinatra/base'
require 'tilt/erb'
require './lib/students.rb'
require './lib/tweet.rb'
require 'byebug'
require 'dotenv'

class SinatraSandbox < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '29292929292929292'
  Dotenv.load

  before '/*' do
    my_students = Students.new
    session[:list] = my_students.list
  end


  get '/' do
    @my_list = session[:list]
    erb :hello, locals: {header: nil}
  end

  #get '/timeline' do 
  #  @timeline = TweetService.fetch_timeline('makerssweden')
  #  erb :timeline
  #end

  get '/timeline/?:user?' do 
    user = params[:user] ||= 'makerssweden'
    @timeline = TweetService.fetch_timeline(params[:user])
    erb :timeline
  end

  get '/list/:role' do
    @my_list = create_list(params[:role].capitalize)
    erb :hello, locals: {header: params[:role].capitalize}
  end



  def create_list(role)
    list = []
    session[:list].each { |h| list << h if h[:role] == role }
    list
  end
  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
