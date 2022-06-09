require 'rails_helper'

RSpec.describe 'Entity#index', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user_id: @user.id)
    @entity = FactoryBot.create(:entity, user_id: @user.id, group_id: @group.id)
    sign_in @user
    visit group_entities_path(group_id: @group.id)
  end

  it 'Check the page title' do
    expect(page).to have_content("#{@entity.name} Entities")
  end

  it 'Check if the page displays entities total amount' do
    expect(page).to have_content('$500')
  end

  it 'Onclick, the user is rediretc to page for creating new Entity' do
    click_link 'Create Entity'
    expect(page).to have_current_path(new_group_entity_path(@group))
  end
end
