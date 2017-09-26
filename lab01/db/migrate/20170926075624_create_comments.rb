class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.datetime :post_date
      t.integer :user_id
      t.integer :blog_id
      t.timestamps
    end
  end
end
