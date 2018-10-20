before '/secret' do 
	if !session[:user_id]
		redirect '/?n=1'
	end
end

get '/' do
	if params['e']
		@error = "Invalid username or password"
	elsif params['n']
		@other_error = "No loggy inny, no secret page!!"
	end
  # Look in app/views/index.erb
  erb :index
end

# BCRYPT
post '/register' do
	@entry = User.create(params)
	# binding.pry
	redirect '/'
end

post '/login' do
	@user = User.find_by(username: params[:username])
	session[:user_id] = @user.id

	# alias (look at bcrypt docs) -> if @user.password.is_password?(params[:password])

	if @user.password == params[:password_hash]
		redirect "/entered"
	else
		redirect '/?e=1'
	end
end

get '/entered' do
	session[:user_id] = rand(1..50)
	erb :entered
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

post '/secret' do
	# if session[:user_id]
		erb :secret
	# else
	# 	redirect '/?n=1'
	# end
end

# NO BCRYPT
# post '/register' do
# 	@entry = User.find_or_create_by({username: params[:username], email: params[:email], password: params[:password]})
# 	# binding.pry
# 	redirect '/'
# end

# post '/login' do
# 	@user = User.find_by({username: params[:username]})
# # binding.pry
# 	if @user.authenticate(params[:password])
# 		redirect "/entered"
# 	else
# 		redirect '/'
# 	end
# end