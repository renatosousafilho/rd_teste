
require 'rails_helper'

describe 'Create a new contact' do
  let(:user) { create_logged_in_user }

  scenario 'fill a form with text field' do
    user.custom_fields.create name: "Phone", kind: 'text'

    visit "/contacts/new"
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: "johndoe@mail.com"
    fill_in 'Phone', with: "(66)77778888"
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end

  scenario 'fill a form with text field' do
    user.custom_fields.create name: "Bio", kind: :textarea

    visit "/contacts/new"
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: "johndoe@mail.com"
    fill_in 'Bio', with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum aliquam velit vel auctor. Nunc non gravida nunc. Ut id enim sed felis laoreet maximus. Curabitur at elit vel odio sodales fermentum sed ut urna. Nulla eget rhoncus nulla. Duis auctor eros nulla, eu dapibus metus faucibus eget. Curabitur dictum mi ac eleifend hendrerit. Integer neque ex, maximus viverra augue sit amet, mollis sollicitudin neque. Aenean id pretium lectus. Sed vestibulum magna nec felis feugiat, ut finibus ante luctus."
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end

  scenario 'fill a form with combobox field' do
    user.custom_fields.create name: "Gender", kind: :combobox, choices: ['masculine', 'female'].join(",")

    visit "/contacts/new"
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: "johndoe@mail.com"
    select 'masculine', from: 'Gender'
    click_button 'Save'
    expect(page).to have_content("Contato cadastrado com sucesso")
  end
end
