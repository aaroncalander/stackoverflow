get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

post '/questions' do
  @new_question = Question.create(content: params[:content], user_id: current_user)
  redirect '/questions'
end
