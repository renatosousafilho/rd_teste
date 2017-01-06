class ContactField < ActiveRecord::Base
  belongs_to :custom_field
  belongs_to :contact, inverse_of: :contact_fields

  validates_presence_of :value, :custom_field_id
  validates_presence_of :contact

end
