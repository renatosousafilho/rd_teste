FactoryGirl.define do
  factory :custom_field do
    factory :custom_field_text do
      name "Phone"
      kind :text
      user
    end

    factory :custom_field_textarea do
      name "Bio"
      kind :textarea
    end

    factory :custom_field_combobox do
      name "Gender"
      kind :combobox
      choices ["masculine, feminine"].join(",")
    end
  end
end
