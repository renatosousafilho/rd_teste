
require 'rails_helper'

describe 'Create a new contact' do
  let(:user) { create_logged_in_user }

  it 'should be ok when fill all form' do
    user.custom_fields.create name: "Phone", kind: 'text'

    visit "/contacts/new"
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: "johndoe@mail.com"
    fill_in 'Phone', with: "(66)77778888"
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end
end
