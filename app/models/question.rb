class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def upvote_total
    upvote_total = 0
    self.votes.each do |vote|
      if vote.upvote == true
        upvote_total += 1
      end
    end
    upvote_total
  end

  def downvote_total
    downvote_total = 0
    self.votes.each do |vote|
      if vote.upvote == false
        downvote_total += 1
      end
    end
    downvote_total
  end

  
end
