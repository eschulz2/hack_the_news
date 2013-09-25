class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.belongs_to :user
      t.timestamps
    end  
  end
end