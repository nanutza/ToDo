get '/users' do
  erb :'users.index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.avatar = Faker::Avatar.image(Faker::Lorem.word, "80x80")

  if user.save
    redirect '/users'
  else
    erb :'users/new'
  end
end
