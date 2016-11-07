get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.avatar = Faker::Avatar.image(Faker::Lorem.word, "80x80")

  if user.save && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/users'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  require_login
  @user = current_user
  @lists = @user.lists
  erb :'users/show'
end
