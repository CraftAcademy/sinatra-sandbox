require 'sinatra'
require 'tilt/erb'
require './lib/students.rb'
require './lib/tweet.rb'
require 'byebug'

enable :sessions
set :session_secret, '29292929292929292'

before '/*' do
  my_students = Students.new
  session[:list] = my_students.list
end


get '/' do
  @my_list = session[:list]
  erb :hello, locals: {header: nil}
end

get '/timeline' do 
  @timeline = TweetService.fetch_timeline('makerssweden')
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



