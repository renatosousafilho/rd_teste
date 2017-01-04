class CustomField < ActiveRecord::Base
  belongs_to :user

  enum kind: [:text, :textared, :combobox]

  validates_presence_of :name, :kind, :user
  # validates_inclusion_of :kind, in: %w(1, 2, 3)
end
