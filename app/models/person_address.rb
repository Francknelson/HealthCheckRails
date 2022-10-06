class PersonAddress < Address
  validates :zipcode,
            :street,
            :number,
            :neighborhood,
            :city,
            :state,
            :person_id,
            presence: true

  belongs_to :person
end

