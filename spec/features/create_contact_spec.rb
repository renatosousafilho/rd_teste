
require 'rails_helper'

describe 'Create a new contact' do
  let(:user) { create_logged_in_user }

  scenario 'fill a form with text field' do
    FactoryGirl.create(:custom_field_text, user: user)
    contact = FactoryGirl.build(:contact_with_text)

    visit "/contacts/new"
    fill_in 'Name', with: contact.name
    fill_in 'Email', with: contact.email
    fill_in 'Phone', with: contact.contact_fields.first.value
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end

  scenario 'fill a form with textarea field' do
    FactoryGirl.create(:custom_field_textarea, user: user)
    contact = FactoryGirl.build(:contact_with_textarea)

    visit "/contacts/new"
    fill_in 'Name', with: contact.name
    fill_in 'Email', with: contact.email
    fill_in 'Bio', with: contact.contact_fields.first.value
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end

  scenario 'fill a form with combobox field' do
    FactoryGirl.create(:custom_field_combobox, user: user)
    contact = FactoryGirl.build(:contact_with_combobox)

    visit "/contacts/new"
    fill_in 'Name', with: contact.name
    fill_in 'Email', with: contact.email
    select contact.contact_fields.first.value, from: 'Gender'
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end
end
