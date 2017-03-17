post '/answers/:answer_id/upvote' do
  @answer = Answer.find(params[:answer_id])

  already_voted = false

  @answer.votes.each do |vote|
    if vote.user_id == current_user.id
      already_voted = true
    end
  end

  if already_voted == false
    @new_vote = Vote.create(upvote: true, voteable_id: params[:answer_id], voteable_type: "Answer", user_id: current_user.id)
  end

  p @new_vote
  redirect "/questions/#{@answer.question_id}/answers"
end


post '/answers/:answer_id/downvote' do

  @answer = Answer.find(params[:answer_id])

  already_voted = false

  @answer.votes.each do |vote|
    if vote.user_id == current_user.id
      already_voted = true
    end
  end

  if already_voted == false
    @new_vote = Vote.create(upvote: false, voteable_id: params[:answer_id], voteable_type: "Answer", user_id: current_user.id)
  end

  p @new_vote
  redirect "/questions/#{@answer.question_id}/answers"
end


post '/questions/:question_id/upvote' do
  @question = Question.find(params[:question_id])

  already_voted = false

  @question.votes.each do |vote|
    if vote.user_id == current_user.id
      already_voted = true
    end
  end

  if already_voted == false
    @new_vote = Vote.create(upvote: true, voteable_id: params[:question_id], voteable_type: "Question", user_id: current_user.id)
  end

  p @new_vote
  redirect "/questions/#{@question.id}/answers"
end


post '/questions/:question_id/downvote' do

  @question = Question.find(params[:question_id])

  already_voted = false

  @question.votes.each do |vote|
    if vote.user_id == current_user.id
      already_voted = true
    end
  end

  if already_voted == false
    @new_vote = Vote.create(upvote: false, voteable_id: params[:question_id], voteable_type: "Question", user_id: current_user.id)
  end

  p @new_vote
  redirect "/questions/#{@question.id}/answers"
end
