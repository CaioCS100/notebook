class Contact < ApplicationRecord
  belongs_to :kind

  def to_br
    {
      id: id,
      name: name,
      email: email,
      birthdate: I18n.l(birthdate),
      kind: {
        id: kind.id,
        description: kind.description
      }
    }
  end

#   def name_author
#     'Caio Cesar Silva'
#   end

#   def as_json(options = {})
#     super({
#         root: true,
#         methods: :name_author,
#         include: {kind: { only: [:id, :description] }}
#     })
#   end
end
