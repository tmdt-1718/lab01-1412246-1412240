class AddAvatarColumnToAlbum < ActiveRecord::Migration[5.1]
  def up
   add_attachment :albums, :avatar
 end

 def down
   remove_attachment :albums, :avatar
 end
end
