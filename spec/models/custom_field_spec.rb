require 'rails_helper'

describe CustomField, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:kind) }
  it { should define_enum_for(:kind) }
end
