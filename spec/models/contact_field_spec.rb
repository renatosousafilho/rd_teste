require 'rails_helper'

describe ContactField, type: :model do
  it { should validate_presence_of(:contact) }
  it { should validate_presence_of(:custom_field) }
  it { should validate_presence_of(:value) }
end
