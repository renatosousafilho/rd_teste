FactoryGirl.define do
  factory :contact do
    name "John Doe"
    email "johndoe@mail.com"

    factory :contact_with_text do
      contact_fields [ContactField.new(value: '(86) 9999-0000')]
    end

    factory :contact_with_textarea do
      contact_fields [ContactField.new(value: 'Lorem ipsum')]
    end

    factory :contact_with_combobox do
      contact_fields [ContactField.new(value: 'masculine')]
    end
  end
end
