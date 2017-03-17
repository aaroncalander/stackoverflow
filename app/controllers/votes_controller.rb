post '/answers/:answer_id/upvote' do
  @new_vote = Vote.create(upvote: true, voteable_id: params[:answer_id], voteable_type: "Answer")
  @answer = Answer.find(params[:answer_id])
  p @new_vote
  redirect "/questions/#{@answer.question_id}/answers"
end


post '/answers/:answer_id/downvote' do
  @new_vote = Vote.create(upvote: false, voteable_id: params[:answer_id], voteable_type: "Answer")
  @answer = Answer.find(params[:answer_id])
  p @new_vote
  redirect "/questions/#{@answer.question_id}/answers"
end


post '/questions/:question_id/upvote' do
  @new_vote = Vote.create(upvote: true, voteable_id: params[:question_id], voteable_type: "Question")
  @question = Question.find(params[:question_id])
  p @new_vote
  redirect "/questions/#{@question.id}/answers"
end


post '/questions/:question_id/downvote' do
  @new_vote = Vote.create(upvote: false, voteable_id: params[:question_id], voteable_type: "Question")
  @question = Question.find(params[:question_id])
  p @new_vote
  redirect "/questions/#{@question.id}/answers"
end
