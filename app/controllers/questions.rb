get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

post '/questions' do
  p "*" * 30
  p current_user
  p "*" * 30
  @new_question = Question.create(content: params[:content], user_id: current_user.id)
  redirect '/questions'
end
