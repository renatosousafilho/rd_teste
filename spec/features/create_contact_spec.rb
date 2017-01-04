
require 'rails_helper'

describe 'Create a new contact' do
  before(:each) { create_logged_in_user }

  it 'should be ok when fill all form' do
    visit new_contact_path
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: "johndoe@mail.com"
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end
end
