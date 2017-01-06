
require 'rails_helper'

describe 'Create a new contact' do
  let(:user) { create_logged_in_user }
  let(:contact) { FactoryGirl.build(:contact) }

  scenario 'fill a form with text field' do
    FactoryGirl.create(:custom_field_text, user: user)

    visit "/contacts/new"
    fill_in 'Name', with: contact.name
    fill_in 'Email', with: contact.email
    fill_in 'Phone', with: "(66)77778888"
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end

  scenario 'fill a form with textarea field' do
    FactoryGirl.create(:custom_field_textarea, user: user)

    visit "/contacts/new"
    fill_in 'Name', with: contact.name
    fill_in 'Email', with: contact.email
    fill_in 'Bio', with: "Lorem ipsum..."
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end

  scenario 'fill a form with combobox field' do
    FactoryGirl.create(:custom_field_combobox, user: user)

    visit "/contacts/new"
    fill_in 'Name', with: contact.name
    fill_in 'Email', with: contact.email
    select 'masculine', from: 'Gender'
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end
end
