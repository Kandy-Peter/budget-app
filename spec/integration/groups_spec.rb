require 'rails_helper'

RSpec.describe 'Group#index', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user_id: @user.id)
    sign_in @user
    visit groups_path
  end

  it 'Check the page title' do
    expect(page).to have_content('Transactions')
  end

  it 'Check if the page displays the group name' do
    expect(page).to have_content(@group.name)
  end

  it 'Check if the page displays entities total amount' do
    expect(page).to have_content('0$')
  end

  it 'When user click the group name, he s redirected to the entity page' do
    click_link @group.name
    expect(page).to have_current_path(group_entities_path(group_id: @group.id))
  end

  it 'Onclick, the user is rediretc to page for creating new category' do
    click_link 'Create Category'
    expect(page).to have_current_path(new_group_path)
  end
end
