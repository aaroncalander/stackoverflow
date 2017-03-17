get "/questions/:question_id/answers" do
  @question = Question.find(params[:question_id])
  @question_comments = @question.comments
  # @answers = Answer.find_by(question_id: (params[:question_id]))
  @answers = @question.answers
  # @answer_comments = @answers.all.comments
    erb :'/questions/show'
	end

post "/questions/:question_id/answers" do
  @answer = Answer.create(content: params[:content], question_id: params[:question_id], user_id: current_user.id )
  redirect "/questions/#{@answer.question_id}/answers"
end
