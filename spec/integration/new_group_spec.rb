require 'rails_helper'

RSpec.describe 'groups#new', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    sign_in @user
    visit new_group_path
  end

  it 'should create a group with valid fields' do
    fill_in 'Enter your name', with: 'Essentials'
    fill_in 'Icon link', with: 'www.image-link.png'
    click_button 'Submit'

    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('Essentials')
    expect(page).to have_content('Succefully added!')
  end

  it 'should not create a group if one of the fields is empty' do
    click_button('Submit')

    expect(page).to_not have_content('Succefully added!')
  end
end