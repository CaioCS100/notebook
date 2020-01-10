class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  validates :name, presence: { message: 'Name é Obrigátorio' }
  validates :email, uniqueness: { message: 'Este email já está cadastrado' },
                    presence: { message: 'Email é Obrigátorio' }

  validates_presence_of :kind
  # validates_presence_of :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
end
