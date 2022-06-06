class Entity < ApplicationRecord
  belongs_to :users
  has_many :group_id
end
