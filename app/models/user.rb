class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, class_name: 'Group', foreign_key: :user_id, dependent: :destroy
  has_many :entities, class_name: 'Entity', foreign_key: :user_id, dependent: :destroy

  validates :name, :email, :password, presence: true
end
