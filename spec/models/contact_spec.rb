require 'rails_helper'

describe Contact, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:user) }
end
