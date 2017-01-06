require 'rails_helper'

describe 'Create a new custom field' do
  before(:each) { create_logged_in_user }

  scenario 'should be ok when fill all form' do
    visit new_custom_field_path
    fill_in 'Name', with: "Phone"
    select("text", from: 'Kind')
    click_button 'Save'
    expect(page).to have_content("Campo cadastrado com sucesso")
  end

  scenario 'should show error message when field is not filled' do
    visit new_custom_field_path

    fill_in 'Name', with: ""
    click_button 'Save'
    expect(page).to have_content("There's something wrong!")
  end

  scenario 'add a field of kind combobox', js: true do
    visit new_custom_field_path

    fill_in "Name", with: "Sample select field"

    expect(page).to_not have_content('new option')

    select "combobox", from: 'Kind'

    expect(page).to have_content('new option')

    expect(page).to have_css('.option-field', :count=>1)

    5.times { click_button '+' }

    expect(page).to have_css('.option-field', :count=>6)

    choices = []
    (1..6).each do |i|
      new_option = "option #{i}"
      new_option_xpath = "#text-option-#{i}"
      choices << new_option
      find(new_option_xpath).set(new_option)
    end

    click_button 'Save'

    expect(page).to have_content("Campo cadastrado com sucesso")
    expect(page).to have_content(choices.join(","))

  end
end
