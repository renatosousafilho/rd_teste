require 'rails_helper'

describe Contact, type: :model do
  it { should validate_presence_of(:email) }
end
