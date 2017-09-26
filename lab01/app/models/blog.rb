class Blog < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  belongs_to :user
  def self.search (name)
      if name
       where(["title LIKE ? and status ='public'","%#{name}%"])
       .order(created_at: :desc)
      else
        where(["status = 'public'"])
        .order(created_at: :desc)

      end
  end
end
