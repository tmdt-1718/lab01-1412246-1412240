class ChangeContentFromStringToText < ActiveRecord::Migration[5.1]
  def up
    change_column :blogs, :content, :text
  end

  def down
    change_column :blogs, :content, :string
  end
end
