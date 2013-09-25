class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.belongs_to :user
      t.belongs_to :post
    end
    add_index :post_votes, [:post_id, :user_id], unique: true
  end
end
