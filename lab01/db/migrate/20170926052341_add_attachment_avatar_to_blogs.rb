class AddAttachmentAvatarToBlogs < ActiveRecord::Migration[5.1]
  def up
      add_attachment :blogs, :avatar
    end

    def down
      remove_attachment :blogs, :avatar
    end
end
