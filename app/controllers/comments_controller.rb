post "/questions/:question_id/comments" do
  @new_question_comment = Comment.create(content: params[:content], commentable_id: params[:question_id], commentable_type: "Question", user_id: current_user.id)
  p @new_comment
  @question = Question.find(params[:question_id])
  p @question
  @question_comments = @question.comments
  redirect "/questions/#{@question.id}/answers"
end

post "/answers/:answer_id/comments" do
  @new_answer_comment = Comment.create(content: params[:content], commentable_id: params[:answer_id], commentable_type: "Answer", user_id: current_user.id)
  p @new_comment
  @answer = Answer.find(params[:answer_id])
  p @answer
  @answer_comments = @answer.comments
  redirect "/questions/#{@answer.question_id}/answers"
end
