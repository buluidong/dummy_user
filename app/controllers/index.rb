enable :sessions

get '/' do
  # Look in app/views/index.erb
  
  erb :index
end

post '/' do
  @user = User.create(params[:user])
  redirect to('/registered')
end

get '/registered' do

	erb :registered
end

get '/main' do
	if session[:xxx] == nil
		redirect to('/')
	end
	erb :main
end

post '/check' do
	if @user = User.authenticate(params[:user][:email], params[:user][:password])
	   session[:xxx] = @user.name
	   redirect to('/main')
	 end
	 redirect to('/error')
end

get '/error' do
	erb :error
end

get '/logout' do
	session[:xxx]
	redirect to('/')
end

