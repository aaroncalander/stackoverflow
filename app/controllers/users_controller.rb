get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login
    redirect "users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  if logged_in?
    @user = current_user
    erb :'users/show'
  else
    erb :'users/new'
  end
end
