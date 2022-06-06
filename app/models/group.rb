class Group < ApplicationRecord
  belongs_to :users
  has_many :entities, foreign_key: :group_id, dependent: :delet_all
end
