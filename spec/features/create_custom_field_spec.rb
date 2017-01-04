require 'rails_helper'

describe 'Create a new custom field' do
  before(:each) { create_logged_in_user }

  it 'should be ok when fill all form' do
    visit new_custom_field_path
    expect(page).to have_content("Create new field")
    fill_in 'Name', with: "Phone"
    select("text", from: 'Kind')
    click_button 'Save'
    expect(page).to have_content("Campo cadastrado com sucesso")
  end
end
