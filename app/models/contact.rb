class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options = {})
    json = super(options)
    json[:birthdate] = I18n.l(self.birthdate)
    json
  end
end
