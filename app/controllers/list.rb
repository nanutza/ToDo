get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

before '/lists*' do
  require_login
end

get '/lists/new' do

  if request.xhr?
    erb :'_new_list', layout: false
  else
  erb :'lists/new'
  end
end

post '/lists' do
    list = List.new(params[:list])
    list[:user_id]=current_user.id
    if list.save
      redirect '/'
    else
      @errors=list.errors.full_messages
      erb :'lists/new'
    end
end

get '/lists/:id' do
  @list = List.find(params[:id])
  erb :'lists/show'
end

get '/lists/:id/edit' do
  require_login
  @list = List.find_by(id: params[:id])
  erb :'lists/edit'
end

put '/lists/:id' do
    # binding.pry
    @list = List.find_by(id: params[:id])
    @list[:user_id]=current_user.id
    if @list.update(params[:list])
      redirect '/users/:id'
    else
      @errors=lists.errors.full_messages
      erb :'lists/edit'
    end
end

delete '/lists/:id' do
  @list = List.find_by(id: params[:id])
  @list.destroy
  redirect '/users/:id'
end
