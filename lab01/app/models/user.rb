class User < ApplicationRecord
  has_many :blogs , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :albums , dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
