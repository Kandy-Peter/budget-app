class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities
  has_and_belongs_to_many :entities

  validates :name, :icon, presence: true
end
