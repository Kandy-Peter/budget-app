require 'rails_helper'

RSpec.describe Entity, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_numericality_of :amount }
end
