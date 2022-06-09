class Entity < ApplicationRecord
  belongs_to :user
  has_many :group_entities
  has_and_belongs_to_many :groups

  validates :name, :amount, :user_id, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.total_amount(entity)
    sum = 0
    entity.each do |e|
      sum += e.amount
    end
    sum
  end
end
