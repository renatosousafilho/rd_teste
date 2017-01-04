class Contact < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email, :user

  has_many :contact_fields

  accepts_nested_attributes_for :contact_fields
end
