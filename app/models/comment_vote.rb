class CommentVote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  # Remember to create a migration!
end
