require 'rails_helper'

RSpec.describe 'Entity#index', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user_id: @user.id)
    @entity = FactoryBot.create(:entity, user_id: @user.id, group_id: @group.id)
    sign_in @user
    visit new_group_entity_path(@group)
  end

  it 'Check the page title' do
    expect(page).to have_content("New Entity")
  end

  it 'Check inputs fields' do
    find_field 'Transaction name'
    find_field 'Amount'
    find_button 'Add Transaction'
  end

  it 'should create an operation with valid fields' do
    fill_in 'Transaction name', with: 'Dell pavillon'
    fill_in 'Amount', with: '500'

    click_button 'Add Transaction'

    expect(page).to have_current_path(group_entities_path(@entity))
    expect(page).to have_content('Transaction created successfully')
  end
end
