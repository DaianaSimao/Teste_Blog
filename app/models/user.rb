class User < ApplicationRecord
  has_one :perfil, dependent: :destroy
  has_many :posts
  accepts_nested_attributes_for :perfil

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
