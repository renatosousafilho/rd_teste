require 'rails_helper'

describe ContactField, type: :model do
  it { should validate_presence_of(:contact_id) }
  it { should validate_presence_of(:custom_field_id) }
  it { should validate_presence_of(:value) }
end
