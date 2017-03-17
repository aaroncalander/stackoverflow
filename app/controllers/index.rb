get '/' do
  @users = User.all
  redirect '/questions'
end
