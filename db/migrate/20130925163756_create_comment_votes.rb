class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.belongs_to :user
      t.belongs_to :comment
    end
    add_index :comment_votes, [:comment_id, :user_id], unique: true
  end
end
