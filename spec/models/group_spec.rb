require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to :user }
  it { should have_many :group_entities }
  it { should validate_presence_of :name }
  it { should validate_presence_of :icon }
end
