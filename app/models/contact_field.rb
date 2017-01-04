class ContactField < ActiveRecord::Base
  belongs_to :custom_field
  belongs_to :contact

  validates_presence_of :value, :custom_field, :contact
end
